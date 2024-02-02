
simple_client:     file format elf32-littlearm


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
    804c:	00011a34 	.word	0x00011a34
    8050:	00000000 	.word	0x00000000
    8054:	0001105c 	.word	0x0001105c

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
    80c4:	0001105c 	.word	0x0001105c
    80c8:	00011a38 	.word	0x00011a38
    80cc:	00011068 	.word	0x00011068
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
    8164:	eb000f6c 	bl	bf1c <memset>
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
    81b4:	eb000ea1 	bl	bc40 <__libc_init_array>
    81b8:	e1b00004 	movs	r0, r4
    81bc:	e1b01005 	movs	r1, r5
    81c0:	eb0000db 	bl	8534 <main>
    81c4:	eb000cfd 	bl	b5c0 <exit>
    81c8:	00080000 	.word	0x00080000
	...
    81d8:	00011a34 	.word	0x00011a34
    81dc:	00011ae0 	.word	0x00011ae0
	...

000081e8 <string_to_integer>:
#include "libserial.h"
#include "simple_service.h"
#include "usyscall.h"

int string_to_integer(const char* str)
{
    81e8:	e92d4830 	push	{r4, r5, fp, lr}
    81ec:	e28db00c 	add	fp, sp, #12
    81f0:	e24dd018 	sub	sp, sp, #24
    81f4:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    assert(str);
    81f8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    81fc:	e3530000 	cmp	r3, #0
    8200:	1a00000a 	bne	8230 <string_to_integer+0x48>
    8204:	e3003a48 	movw	r3, #2632	; 0xa48
    8208:	e3403001 	movt	r3, #1
    820c:	e3002b48 	movw	r2, #2888	; 0xb48
    8210:	e3402001 	movt	r2, #1
    8214:	e3a01017 	mov	r1, #23
    8218:	e3000a4c 	movw	r0, #2636	; 0xa4c
    821c:	e3400001 	movt	r0, #1
    8220:	eb000e52 	bl	bb70 <__assert_func>
    while (*str == ' ') {
        str++;
    8224:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8228:	e2833001 	add	r3, r3, #1
    822c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    while (*str == ' ') {
    8230:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8234:	e5d33000 	ldrb	r3, [r3]
    8238:	e3530020 	cmp	r3, #32
    823c:	0afffff8 	beq	8224 <string_to_integer+0x3c>
    }
    int is_positive = 1; // 默认是正
    8240:	e3a03001 	mov	r3, #1
    8244:	e50b3010 	str	r3, [fp, #-16]
    if (*str - '+' == 0) {
    8248:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    824c:	e5d33000 	ldrb	r3, [r3]
    8250:	e353002b 	cmp	r3, #43	; 0x2b
    8254:	1a000004 	bne	826c <string_to_integer+0x84>
        is_positive = 1;
    8258:	e3a03001 	mov	r3, #1
    825c:	e50b3010 	str	r3, [fp, #-16]
        str++;
    8260:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8264:	e2833001 	add	r3, r3, #1
    8268:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    }
    if (*str - '-' == 0) {
    826c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8270:	e5d33000 	ldrb	r3, [r3]
    8274:	e353002d 	cmp	r3, #45	; 0x2d
    8278:	1a000004 	bne	8290 <string_to_integer+0xa8>
        is_positive = 0;
    827c:	e3a03000 	mov	r3, #0
    8280:	e50b3010 	str	r3, [fp, #-16]
        str++;
    8284:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8288:	e2833001 	add	r3, r3, #1
    828c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    }
    long long result = 0; // int可能存不下 改为long long较为合适虽然返回值会丢失精度但感觉不要紧
    8290:	e3a02000 	mov	r2, #0
    8294:	e3a03000 	mov	r3, #0
    8298:	e14b21fc 	strd	r2, [fp, #-28]	; 0xffffffe4
    while ('0' <= *str && *str <= '9') {
    829c:	ea00002e 	b	835c <string_to_integer+0x174>
        result *= 10;
    82a0:	e14b01dc 	ldrd	r0, [fp, #-28]	; 0xffffffe4
    82a4:	e1a02000 	mov	r2, r0
    82a8:	e1a03001 	mov	r3, r1
    82ac:	e1a05103 	lsl	r5, r3, #2
    82b0:	e1855f22 	orr	r5, r5, r2, lsr #30
    82b4:	e1a04102 	lsl	r4, r2, #2
    82b8:	e1a02004 	mov	r2, r4
    82bc:	e1a03005 	mov	r3, r5
    82c0:	e0922000 	adds	r2, r2, r0
    82c4:	e0a33001 	adc	r3, r3, r1
    82c8:	e0922002 	adds	r2, r2, r2
    82cc:	e0a33003 	adc	r3, r3, r3
    82d0:	e14b21fc 	strd	r2, [fp, #-28]	; 0xffffffe4
        result += *str - '0'; // 如'1' ascii的值为 49 '0'的ascii的值为48 相减得到1
    82d4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    82d8:	e5d33000 	ldrb	r3, [r3]
    82dc:	e2433030 	sub	r3, r3, #48	; 0x30
    82e0:	e1a02003 	mov	r2, r3
    82e4:	e1a03fc2 	asr	r3, r2, #31
    82e8:	e14b01dc 	ldrd	r0, [fp, #-28]	; 0xffffffe4
    82ec:	e0922000 	adds	r2, r2, r0
    82f0:	e0a33001 	adc	r3, r3, r1
    82f4:	e14b21fc 	strd	r2, [fp, #-28]	; 0xffffffe4

        if (result > INT32_MAX || result < INT32_MIN) // 可能出现的溢出问题
    82f8:	e14b21dc 	ldrd	r2, [fp, #-28]	; 0xffffffe4
    82fc:	e3e00102 	mvn	r0, #-2147483648	; 0x80000000
    8300:	e3a01000 	mov	r1, #0
    8304:	e1500002 	cmp	r0, r2
    8308:	e0d13003 	sbcs	r3, r1, r3
    830c:	ba000005 	blt	8328 <string_to_integer+0x140>
    8310:	e14b21dc 	ldrd	r2, [fp, #-28]	; 0xffffffe4
    8314:	e3a00102 	mov	r0, #-2147483648	; 0x80000000
    8318:	e3e01000 	mvn	r1, #0
    831c:	e1520000 	cmp	r2, r0
    8320:	e0d33001 	sbcs	r3, r3, r1
    8324:	aa000009 	bge	8350 <string_to_integer+0x168>
        {
            return result > INT32_MAX ? INT32_MAX : INT32_MIN;
    8328:	e14b21dc 	ldrd	r2, [fp, #-28]	; 0xffffffe4
    832c:	e3e00102 	mvn	r0, #-2147483648	; 0x80000000
    8330:	e3a01000 	mov	r1, #0
    8334:	e1500002 	cmp	r0, r2
    8338:	e0d13003 	sbcs	r3, r1, r3
    833c:	aa000001 	bge	8348 <string_to_integer+0x160>
    8340:	e3e03102 	mvn	r3, #-2147483648	; 0x80000000
    8344:	ea000013 	b	8398 <string_to_integer+0x1b0>
    8348:	e3a03102 	mov	r3, #-2147483648	; 0x80000000
    834c:	ea000011 	b	8398 <string_to_integer+0x1b0>
        }

        str++;
    8350:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8354:	e2833001 	add	r3, r3, #1
    8358:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    while ('0' <= *str && *str <= '9') {
    835c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8360:	e5d33000 	ldrb	r3, [r3]
    8364:	e353002f 	cmp	r3, #47	; 0x2f
    8368:	9a000003 	bls	837c <string_to_integer+0x194>
    836c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8370:	e5d33000 	ldrb	r3, [r3]
    8374:	e3530039 	cmp	r3, #57	; 0x39
    8378:	9affffc8 	bls	82a0 <string_to_integer+0xb8>
    }
    return is_positive ? (result) : -result;
    837c:	e51b3010 	ldr	r3, [fp, #-16]
    8380:	e3530000 	cmp	r3, #0
    8384:	1a000002 	bne	8394 <string_to_integer+0x1ac>
    8388:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    838c:	e2633000 	rsb	r3, r3, #0
    8390:	ea000000 	b	8398 <string_to_integer+0x1b0>
    8394:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
}
    8398:	e1a00003 	mov	r0, r3
    839c:	e24bd00c 	sub	sp, fp, #12
    83a0:	e8bd8830 	pop	{r4, r5, fp, pc}

000083a4 <itoa>:

void itoa(int num, char* str, int radix)
{
    83a4:	e92d4800 	push	{fp, lr}
    83a8:	e28db004 	add	fp, sp, #4
    83ac:	e24dd048 	sub	sp, sp, #72	; 0x48
    83b0:	e50b0040 	str	r0, [fp, #-64]	; 0xffffffc0
    83b4:	e50b1044 	str	r1, [fp, #-68]	; 0xffffffbc
    83b8:	e50b2048 	str	r2, [fp, #-72]	; 0xffffffb8
    int i = 0;
    83bc:	e3a03000 	mov	r3, #0
    83c0:	e50b3008 	str	r3, [fp, #-8]
    int sum;
    unsigned int num1 = num; // 如果是负数求补码，必须将他的绝对值放在无符号位中在进行求反码
    83c4:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    83c8:	e50b300c 	str	r3, [fp, #-12]
    char str1[33] = { 0 };
    83cc:	e24b3038 	sub	r3, fp, #56	; 0x38
    83d0:	e3a02021 	mov	r2, #33	; 0x21
    83d4:	e3a01000 	mov	r1, #0
    83d8:	e1a00003 	mov	r0, r3
    83dc:	eb000ece 	bl	bf1c <memset>
    if (num < 0) { // 求出负数的补码
    83e0:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    83e4:	e3530000 	cmp	r3, #0
    83e8:	aa000008 	bge	8410 <itoa+0x6c>
        num = -num;
    83ec:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    83f0:	e2633000 	rsb	r3, r3, #0
    83f4:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
        num1 = ~num;
    83f8:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    83fc:	e1e03003 	mvn	r3, r3
    8400:	e50b300c 	str	r3, [fp, #-12]
        num1 += 1;
    8404:	e51b300c 	ldr	r3, [fp, #-12]
    8408:	e2833001 	add	r3, r3, #1
    840c:	e50b300c 	str	r3, [fp, #-12]
    }
    if (num == 0) {
    8410:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    8414:	e3530000 	cmp	r3, #0
    8418:	1a000028 	bne	84c0 <itoa+0x11c>
        str1[i] = '0';
    841c:	e24b2038 	sub	r2, fp, #56	; 0x38
    8420:	e51b3008 	ldr	r3, [fp, #-8]
    8424:	e0823003 	add	r3, r2, r3
    8428:	e3a02030 	mov	r2, #48	; 0x30
    842c:	e5c32000 	strb	r2, [r3]

        i++;
    8430:	e51b3008 	ldr	r3, [fp, #-8]
    8434:	e2833001 	add	r3, r3, #1
    8438:	e50b3008 	str	r3, [fp, #-8]
    }
    while (num1 != 0) { // 进行进制运算
    843c:	ea00001f 	b	84c0 <itoa+0x11c>
        sum = num1 % radix;
    8440:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
    8444:	e51b300c 	ldr	r3, [fp, #-12]
    8448:	e1a01002 	mov	r1, r2
    844c:	e1a00003 	mov	r0, r3
    8450:	eb000d6b 	bl	ba04 <__aeabi_uidivmod>
    8454:	e1a03001 	mov	r3, r1
    8458:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        str1[i] = (sum > 9) ? (sum - 10) + 'a' : sum + '0';
    845c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8460:	e3530009 	cmp	r3, #9
    8464:	da000004 	ble	847c <itoa+0xd8>
    8468:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    846c:	e6ef3073 	uxtb	r3, r3
    8470:	e2833057 	add	r3, r3, #87	; 0x57
    8474:	e6ef3073 	uxtb	r3, r3
    8478:	ea000003 	b	848c <itoa+0xe8>
    847c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8480:	e6ef3073 	uxtb	r3, r3
    8484:	e2833030 	add	r3, r3, #48	; 0x30
    8488:	e6ef3073 	uxtb	r3, r3
    848c:	e24b1038 	sub	r1, fp, #56	; 0x38
    8490:	e51b2008 	ldr	r2, [fp, #-8]
    8494:	e0812002 	add	r2, r1, r2
    8498:	e5c23000 	strb	r3, [r2]
        num1 = num1 / radix;
    849c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    84a0:	e1a01003 	mov	r1, r3
    84a4:	e51b000c 	ldr	r0, [fp, #-12]
    84a8:	eb000d18 	bl	b910 <__udivsi3>
    84ac:	e1a03000 	mov	r3, r0
    84b0:	e50b300c 	str	r3, [fp, #-12]
        i++;
    84b4:	e51b3008 	ldr	r3, [fp, #-8]
    84b8:	e2833001 	add	r3, r3, #1
    84bc:	e50b3008 	str	r3, [fp, #-8]
    while (num1 != 0) { // 进行进制运算
    84c0:	e51b300c 	ldr	r3, [fp, #-12]
    84c4:	e3530000 	cmp	r3, #0
    84c8:	1affffdc 	bne	8440 <itoa+0x9c>
    }
    i--;
    84cc:	e51b3008 	ldr	r3, [fp, #-8]
    84d0:	e2433001 	sub	r3, r3, #1
    84d4:	e50b3008 	str	r3, [fp, #-8]
    int j = 0;
    84d8:	e3a03000 	mov	r3, #0
    84dc:	e50b3010 	str	r3, [fp, #-16]
    for (i; i >= 0; i--) { // 逆序输出
    84e0:	ea00000d 	b	851c <itoa+0x178>
        str[i] = str1[j];
    84e4:	e51b3008 	ldr	r3, [fp, #-8]
    84e8:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
    84ec:	e0823003 	add	r3, r2, r3
    84f0:	e24b1038 	sub	r1, fp, #56	; 0x38
    84f4:	e51b2010 	ldr	r2, [fp, #-16]
    84f8:	e0812002 	add	r2, r1, r2
    84fc:	e5d22000 	ldrb	r2, [r2]
    8500:	e5c32000 	strb	r2, [r3]
        j++;
    8504:	e51b3010 	ldr	r3, [fp, #-16]
    8508:	e2833001 	add	r3, r3, #1
    850c:	e50b3010 	str	r3, [fp, #-16]
    for (i; i >= 0; i--) { // 逆序输出
    8510:	e51b3008 	ldr	r3, [fp, #-8]
    8514:	e2433001 	sub	r3, r3, #1
    8518:	e50b3008 	str	r3, [fp, #-8]
    851c:	e51b3008 	ldr	r3, [fp, #-8]
    8520:	e3530000 	cmp	r3, #0
    8524:	aaffffee 	bge	84e4 <itoa+0x140>
    }
}
    8528:	e320f000 	nop	{0}
    852c:	e24bd004 	sub	sp, fp, #4
    8530:	e8bd8800 	pop	{fp, pc}

00008534 <main>:

int main(int argc, char** argv)
{
    8534:	e92d4800 	push	{fp, lr}
    8538:	e28db004 	add	fp, sp, #4
    853c:	e24dd0a8 	sub	sp, sp, #168	; 0xa8
    8540:	e50b00a0 	str	r0, [fp, #-160]	; 0xffffff60
    8544:	e50b10a4 	str	r1, [fp, #-164]	; 0xffffff5c
    int id = 1;
    8548:	e3a03001 	mov	r3, #1
    854c:	e50b3008 	str	r3, [fp, #-8]
    if (argc >= 2) {
    8550:	e51b30a0 	ldr	r3, [fp, #-160]	; 0xffffff60
    8554:	e3530001 	cmp	r3, #1
    8558:	da000005 	ble	8574 <main+0x40>
        id = string_to_integer(argv[1]);
    855c:	e51b30a4 	ldr	r3, [fp, #-164]	; 0xffffff5c
    8560:	e2833004 	add	r3, r3, #4
    8564:	e5933000 	ldr	r3, [r3]
    8568:	e1a00003 	mov	r0, r3
    856c:	ebffff1d 	bl	81e8 <string_to_integer>
    8570:	e50b0008 	str	r0, [fp, #-8]
    }
    printf("This is Simple Client %d, size is 0x%x\n", id, task_heap_base());
    8574:	eb000c8b 	bl	b7a8 <task_heap_base>
    8578:	e1a03000 	mov	r3, r0
    857c:	e1a02003 	mov	r2, r3
    8580:	e51b1008 	ldr	r1, [fp, #-8]
    8584:	e3000a5c 	movw	r0, #2652	; 0xa5c
    8588:	e3400001 	movt	r0, #1
    858c:	eb000176 	bl	8b6c <printf>

    struct Session session_wait;
    struct Session session_nowait;
    if (connect_session(&session_wait, "SimpleServer", 4096) < 0 || connect_session(&session_nowait, "SimpleServer", 4096) < 0) {
    8590:	e24b303c 	sub	r3, fp, #60	; 0x3c
    8594:	e3a02a01 	mov	r2, #4096	; 0x1000
    8598:	e3001a84 	movw	r1, #2692	; 0xa84
    859c:	e3401001 	movt	r1, #1
    85a0:	e1a00003 	mov	r0, r3
    85a4:	eb000477 	bl	9788 <connect_session>
    85a8:	e1a03000 	mov	r3, r0
    85ac:	e3530000 	cmp	r3, #0
    85b0:	ba000008 	blt	85d8 <main+0xa4>
    85b4:	e24b3050 	sub	r3, fp, #80	; 0x50
    85b8:	e3a02a01 	mov	r2, #4096	; 0x1000
    85bc:	e3001a84 	movw	r1, #2692	; 0xa84
    85c0:	e3401001 	movt	r1, #1
    85c4:	e1a00003 	mov	r0, r3
    85c8:	eb00046e 	bl	9788 <connect_session>
    85cc:	e1a03000 	mov	r3, r0
    85d0:	e3530000 	cmp	r3, #0
    85d4:	aa000003 	bge	85e8 <main+0xb4>
        printf("connect session failed\n");
    85d8:	e3000a94 	movw	r0, #2708	; 0xa94
    85dc:	e3400001 	movt	r0, #1
    85e0:	eb000161 	bl	8b6c <printf>
        exit();
    85e4:	eb000bf5 	bl	b5c0 <exit>
    }

    char *buf1 = NULL, *buf2 = NULL;
    85e8:	e3a03000 	mov	r3, #0
    85ec:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    85f0:	e3a03000 	mov	r3, #0
    85f4:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    struct IpcMsg* msg1 = hello_string_nowait(&session_nowait, &buf1, 32);
    85f8:	e24b1054 	sub	r1, fp, #84	; 0x54
    85fc:	e24b3050 	sub	r3, fp, #80	; 0x50
    8600:	e3a02020 	mov	r2, #32
    8604:	e1a00003 	mov	r0, r3
    8608:	eb00064d 	bl	9f44 <hello_string_nowait>
    860c:	e50b000c 	str	r0, [fp, #-12]
    struct IpcMsg* msg2 = hello_string_nowait(&session_nowait, &buf2, 128);
    8610:	e24b1058 	sub	r1, fp, #88	; 0x58
    8614:	e24b3050 	sub	r3, fp, #80	; 0x50
    8618:	e3a02080 	mov	r2, #128	; 0x80
    861c:	e1a00003 	mov	r0, r3
    8620:	eb000647 	bl	9f44 <hello_string_nowait>
    8624:	e50b0010 	str	r0, [fp, #-16]

    int ret = add(&session_wait, 17, 22);
    8628:	e24b303c 	sub	r3, fp, #60	; 0x3c
    862c:	e3a02016 	mov	r2, #22
    8630:	e3a01011 	mov	r1, #17
    8634:	e1a00003 	mov	r0, r3
    8638:	eb00059b 	bl	9cac <add>
    863c:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    printf("ipc_add 17 + 22 = %d\n", ret);
    8640:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    8644:	e3000aac 	movw	r0, #2732	; 0xaac
    8648:	e3400001 	movt	r0, #1
    864c:	eb000146 	bl	8b6c <printf>
    char buf[32];
    ret = add(&session_wait, 9, 9);
    8650:	e24b303c 	sub	r3, fp, #60	; 0x3c
    8654:	e3a02009 	mov	r2, #9
    8658:	e3a01009 	mov	r1, #9
    865c:	e1a00003 	mov	r0, r3
    8660:	eb000591 	bl	9cac <add>
    8664:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    printf("ipc_add 9 + 9 = %d\n", ret);
    8668:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    866c:	e3000ac4 	movw	r0, #2756	; 0xac4
    8670:	e3400001 	movt	r0, #1
    8674:	eb00013c 	bl	8b6c <printf>

    struct Session session;
    static char id_buf[33] = { 0 };
    if (id > 1) {
    8678:	e51b3008 	ldr	r3, [fp, #-8]
    867c:	e3530001 	cmp	r3, #1
    8680:	da00004c 	ble	87b8 <main+0x284>
        if (connect_session(&session, "MemFS", 8092) < 0) {
    8684:	e24b308c 	sub	r3, fp, #140	; 0x8c
    8688:	e3012f9c 	movw	r2, #8092	; 0x1f9c
    868c:	e3001ad8 	movw	r1, #2776	; 0xad8
    8690:	e3401001 	movt	r1, #1
    8694:	e1a00003 	mov	r0, r3
    8698:	eb00043a 	bl	9788 <connect_session>
    869c:	e1a03000 	mov	r3, r0
    86a0:	e3530000 	cmp	r3, #0
    86a4:	aa000003 	bge	86b8 <main+0x184>
            printf("connect session failed\n");
    86a8:	e3000a94 	movw	r0, #2708	; 0xa94
    86ac:	e3400001 	movt	r0, #1
    86b0:	eb00012d 	bl	8b6c <printf>
    86b4:	ea00003f 	b	87b8 <main+0x284>
        } else {
            int fd;
            itoa(id - 1, id_buf, 10);
    86b8:	e51b3008 	ldr	r3, [fp, #-8]
    86bc:	e2433001 	sub	r3, r3, #1
    86c0:	e3a0200a 	mov	r2, #10
    86c4:	e3011a50 	movw	r1, #6736	; 0x1a50
    86c8:	e3401001 	movt	r1, #1
    86cc:	e1a00003 	mov	r0, r3
    86d0:	ebffff33 	bl	83a4 <itoa>
            char* shell_task_param[3] = { "/simple_client", id_buf, 0 };
    86d4:	e3003b3c 	movw	r3, #2876	; 0xb3c
    86d8:	e3403001 	movt	r3, #1
    86dc:	e24bc098 	sub	ip, fp, #152	; 0x98
    86e0:	e8930007 	ldm	r3, {r0, r1, r2}
    86e4:	e88c0007 	stm	ip, {r0, r1, r2}
            if ((fd = open(&session, shell_task_param[0])) >= 0) {
    86e8:	e51b2098 	ldr	r2, [fp, #-152]	; 0xffffff68
    86ec:	e24b308c 	sub	r3, fp, #140	; 0x8c
    86f0:	e1a01002 	mov	r1, r2
    86f4:	e1a00003 	mov	r0, r3
    86f8:	eb000970 	bl	acc0 <open>
    86fc:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    8700:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8704:	e3530000 	cmp	r3, #0
    8708:	ba000022 	blt	8798 <main+0x264>
                if (spawn(&session, fd, read, shell_task_param[0], shell_task_param) < 0) {
    870c:	e51b2098 	ldr	r2, [fp, #-152]	; 0xffffff68
    8710:	e24b008c 	sub	r0, fp, #140	; 0x8c
    8714:	e24b3098 	sub	r3, fp, #152	; 0x98
    8718:	e58d3000 	str	r3, [sp]
    871c:	e1a03002 	mov	r3, r2
    8720:	e30b21a0 	movw	r2, #45472	; 0xb1a0
    8724:	e3402000 	movt	r2, #0
    8728:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    872c:	eb000b8a 	bl	b55c <spawn>
    8730:	e1a03000 	mov	r3, r0
    8734:	e3530000 	cmp	r3, #0
    8738:	aa000002 	bge	8748 <main+0x214>
                    printf("Syscall Spawn simple_client failed\n");
    873c:	e3000ae0 	movw	r0, #2784	; 0xae0
    8740:	e3400001 	movt	r0, #1
    8744:	eb000108 	bl	8b6c <printf>
                }
                if (spawn(&session, fd, read, shell_task_param[0], shell_task_param) < 0) {
    8748:	e51b2098 	ldr	r2, [fp, #-152]	; 0xffffff68
    874c:	e24b008c 	sub	r0, fp, #140	; 0x8c
    8750:	e24b3098 	sub	r3, fp, #152	; 0x98
    8754:	e58d3000 	str	r3, [sp]
    8758:	e1a03002 	mov	r3, r2
    875c:	e30b21a0 	movw	r2, #45472	; 0xb1a0
    8760:	e3402000 	movt	r2, #0
    8764:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    8768:	eb000b7b 	bl	b55c <spawn>
    876c:	e1a03000 	mov	r3, r0
    8770:	e3530000 	cmp	r3, #0
    8774:	aa000002 	bge	8784 <main+0x250>
                    printf("Syscall Spawn simple_client failed\n");
    8778:	e3000ae0 	movw	r0, #2784	; 0xae0
    877c:	e3400001 	movt	r0, #1
    8780:	eb0000f9 	bl	8b6c <printf>
                }
                close(&session, fd);
    8784:	e24b308c 	sub	r3, fp, #140	; 0x8c
    8788:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    878c:	e1a00003 	mov	r0, r3
    8790:	eb0009c8 	bl	aeb8 <close>
    8794:	ea000004 	b	87ac <main+0x278>
            } else {
                printf("Open %s failed\n", shell_task_param[0]);
    8798:	e51b3098 	ldr	r3, [fp, #-152]	; 0xffffff68
    879c:	e1a01003 	mov	r1, r3
    87a0:	e3000b04 	movw	r0, #2820	; 0xb04
    87a4:	e3400001 	movt	r0, #1
    87a8:	eb0000ef 	bl	8b6c <printf>
            }
            free_session(&session);
    87ac:	e24b308c 	sub	r3, fp, #140	; 0x8c
    87b0:	e1a00003 	mov	r0, r3
    87b4:	eb000401 	bl	97c0 <free_session>
        }
    }

    ipc_session_wait(&session_nowait);
    87b8:	e24b3050 	sub	r3, fp, #80	; 0x50
    87bc:	e1a00003 	mov	r0, r3
    87c0:	eb0002a6 	bl	9260 <ipc_session_wait>
    printf("buf1: %s\n", buf1);
    87c4:	e51b3054 	ldr	r3, [fp, #-84]	; 0xffffffac
    87c8:	e1a01003 	mov	r1, r3
    87cc:	e3000b14 	movw	r0, #2836	; 0xb14
    87d0:	e3400001 	movt	r0, #1
    87d4:	eb0000e4 	bl	8b6c <printf>
    87d8:	e24b3050 	sub	r3, fp, #80	; 0x50
    87dc:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    87e0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    87e4:	e5933010 	ldr	r3, [r3, #16]
    87e8:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    87ec:	e5922008 	ldr	r2, [r2, #8]
    87f0:	e0833002 	add	r3, r3, r2
    87f4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    if (msg->header.init != 1) {
    87f8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    87fc:	e5d33000 	ldrb	r3, [r3]
    8800:	e2033004 	and	r3, r3, #4
    8804:	e6ef3073 	uxtb	r3, r3
    8808:	e3530000 	cmp	r3, #0
    880c:	0a000004 	beq	8824 <main+0x2f0>
        return false;
    }
    return session_free_buf(session, msg->header.len);
    8810:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8814:	e1d330b2 	ldrh	r3, [r3, #2]
    8818:	e1a01003 	mov	r1, r3
    881c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    8820:	eb00044b 	bl	9954 <session_free_buf>
    ipc_session_forward(&session_nowait);

    ipc_session_wait(&session_nowait);
    8824:	e24b3050 	sub	r3, fp, #80	; 0x50
    8828:	e1a00003 	mov	r0, r3
    882c:	eb00028b 	bl	9260 <ipc_session_wait>
    printf("buf2: %s\n", buf2);
    8830:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    8834:	e1a01003 	mov	r1, r3
    8838:	e3000b20 	movw	r0, #2848	; 0xb20
    883c:	e3400001 	movt	r0, #1
    8840:	eb0000c9 	bl	8b6c <printf>
    8844:	e24b3050 	sub	r3, fp, #80	; 0x50
    8848:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    884c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8850:	e5933010 	ldr	r3, [r3, #16]
    8854:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8858:	e5922008 	ldr	r2, [r2, #8]
    885c:	e0833002 	add	r3, r3, r2
    8860:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    if (msg->header.init != 1) {
    8864:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8868:	e5d33000 	ldrb	r3, [r3]
    886c:	e2033004 	and	r3, r3, #4
    8870:	e6ef3073 	uxtb	r3, r3
    8874:	e3530000 	cmp	r3, #0
    8878:	0a000004 	beq	8890 <main+0x35c>
    return session_free_buf(session, msg->header.len);
    887c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8880:	e1d330b2 	ldrh	r3, [r3, #2]
    8884:	e1a01003 	mov	r1, r3
    8888:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    888c:	eb000430 	bl	9954 <session_free_buf>
    ipc_session_forward(&session_nowait);

    free_session(&session_wait);
    8890:	e24b303c 	sub	r3, fp, #60	; 0x3c
    8894:	e1a00003 	mov	r0, r3
    8898:	eb0003c8 	bl	97c0 <free_session>
    free_session(&session_nowait);
    889c:	e24b3050 	sub	r3, fp, #80	; 0x50
    88a0:	e1a00003 	mov	r0, r3
    88a4:	eb0003c5 	bl	97c0 <free_session>

    exit();
    88a8:	eb000b44 	bl	b5c0 <exit>
    88ac:	e3a03000 	mov	r3, #0
}
    88b0:	e1a00003 	mov	r0, r3
    88b4:	e24bd004 	sub	sp, fp, #4
    88b8:	e8bd8800 	pop	{fp, pc}

000088bc <init_uart_mmio>:

#define USER_UART_BASE 0x6FFFF000
// #define USER_UART_BASE 0x621e8000

static bool init_uart_mmio()
{
    88bc:	e92d4800 	push	{fp, lr}
    88c0:	e28db004 	add	fp, sp, #4
    static int mapped = 0;
    if (mapped == 0) {
    88c4:	e3013a74 	movw	r3, #6772	; 0x1a74
    88c8:	e3403001 	movt	r3, #1
    88cc:	e5933000 	ldr	r3, [r3]
    88d0:	e3530000 	cmp	r3, #0
    88d4:	1a00000f 	bne	8918 <init_uart_mmio+0x5c>
        if (-1 == mmap(USER_UART_BASE, 0x021e8000, 4096, true)) {
    88d8:	e3a03001 	mov	r3, #1
    88dc:	e3a02a01 	mov	r2, #4096	; 0x1000
    88e0:	e3a01902 	mov	r1, #32768	; 0x8000
    88e4:	e340121e 	movt	r1, #542	; 0x21e
    88e8:	e3a00a0f 	mov	r0, #61440	; 0xf000
    88ec:	e3460fff 	movt	r0, #28671	; 0x6fff
    88f0:	eb000be4 	bl	b888 <mmap>
    88f4:	e1a03000 	mov	r3, r0
    88f8:	e3730001 	cmn	r3, #1
    88fc:	1a000001 	bne	8908 <init_uart_mmio+0x4c>
            return false;
    8900:	e3a03000 	mov	r3, #0
    8904:	ea000004 	b	891c <init_uart_mmio+0x60>
        }
        mapped = 1;
    8908:	e3013a74 	movw	r3, #6772	; 0x1a74
    890c:	e3403001 	movt	r3, #1
    8910:	e3a02001 	mov	r2, #1
    8914:	e5832000 	str	r2, [r3]
    }
    return true;
    8918:	e3a03001 	mov	r3, #1
}
    891c:	e1a00003 	mov	r0, r3
    8920:	e8bd8800 	pop	{fp, pc}

00008924 <putc>:

static void putc(char c)
{
    8924:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8928:	e28db000 	add	fp, sp, #0
    892c:	e24dd00c 	sub	sp, sp, #12
    8930:	e1a03000 	mov	r3, r0
    8934:	e54b3005 	strb	r3, [fp, #-5]
    while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    8938:	e320f000 	nop	{0}
    893c:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    8940:	e3463fff 	movt	r3, #28671	; 0x6fff
    8944:	e5933000 	ldr	r3, [r3]
    8948:	e7e03253 	ubfx	r3, r3, #4, #1
    894c:	e6ef3073 	uxtb	r3, r3
    8950:	e3530000 	cmp	r3, #0
    8954:	1afffff8 	bne	893c <putc+0x18>
        ;

    if (c == '\n') {
    8958:	e55b3005 	ldrb	r3, [fp, #-5]
    895c:	e353000a 	cmp	r3, #10
    8960:	1a00000b 	bne	8994 <putc+0x70>
        ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = ('\r'));
    8964:	e30f3040 	movw	r3, #61504	; 0xf040
    8968:	e3463fff 	movt	r3, #28671	; 0x6fff
    896c:	e3a0200d 	mov	r2, #13
    8970:	e5832000 	str	r2, [r3]
        while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    8974:	e320f000 	nop	{0}
    8978:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    897c:	e3463fff 	movt	r3, #28671	; 0x6fff
    8980:	e5933000 	ldr	r3, [r3]
    8984:	e7e03253 	ubfx	r3, r3, #4, #1
    8988:	e6ef3073 	uxtb	r3, r3
    898c:	e3530000 	cmp	r3, #0
    8990:	1afffff8 	bne	8978 <putc+0x54>
            ;
    }
    ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = (c));
    8994:	e30f3040 	movw	r3, #61504	; 0xf040
    8998:	e3463fff 	movt	r3, #28671	; 0x6fff
    899c:	e55b2005 	ldrb	r2, [fp, #-5]
    89a0:	e5832000 	str	r2, [r3]
}
    89a4:	e320f000 	nop	{0}
    89a8:	e28bd000 	add	sp, fp, #0
    89ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    89b0:	e12fff1e 	bx	lr

000089b4 <getc>:

char getc(void)
{
    89b4:	e92d4800 	push	{fp, lr}
    89b8:	e28db004 	add	fp, sp, #4
    89bc:	e24dd008 	sub	sp, sp, #8
    if (!init_uart_mmio()) {
    89c0:	ebffffbd 	bl	88bc <init_uart_mmio>
    89c4:	e1a03000 	mov	r3, r0
    89c8:	e2233001 	eor	r3, r3, #1
    89cc:	e6ef3073 	uxtb	r3, r3
    89d0:	e3530000 	cmp	r3, #0
    89d4:	0a000001 	beq	89e0 <getc+0x2c>
        return 0xFF;
    89d8:	e3a030ff 	mov	r3, #255	; 0xff
    89dc:	ea000014 	b	8a34 <getc+0x80>
    }
    uint32_t read_data;

    /* If Rx FIFO has no data ready */
    if (!(*(volatile hw_uart_usr2_t*)(USER_UART_BASE + 0x98)).B.RDR) {
    89e0:	e30f3098 	movw	r3, #61592	; 0xf098
    89e4:	e3463fff 	movt	r3, #28671	; 0x6fff
    89e8:	e5933000 	ldr	r3, [r3]
    89ec:	e7e03053 	ubfx	r3, r3, #0, #1
    89f0:	e6ef3073 	uxtb	r3, r3
    89f4:	e3530000 	cmp	r3, #0
    89f8:	1a000001 	bne	8a04 <getc+0x50>
        return 0xFF;
    89fc:	e3a030ff 	mov	r3, #255	; 0xff
    8a00:	ea00000b 	b	8a34 <getc+0x80>
    }

    read_data = ((*(volatile hw_uart_urxd_t*)(USER_UART_BASE + 0x0)).U);
    8a04:	e3a03a0f 	mov	r3, #61440	; 0xf000
    8a08:	e3463fff 	movt	r3, #28671	; 0x6fff
    8a0c:	e5933000 	ldr	r3, [r3]
    8a10:	e50b3008 	str	r3, [fp, #-8]

    /* If error are detected */
    if (read_data & 0x7C00)
    8a14:	e51b3008 	ldr	r3, [fp, #-8]
    8a18:	e2033b1f 	and	r3, r3, #31744	; 0x7c00
    8a1c:	e3530000 	cmp	r3, #0
    8a20:	0a000001 	beq	8a2c <getc+0x78>
        return 0xFF;
    8a24:	e3a030ff 	mov	r3, #255	; 0xff
    8a28:	ea000001 	b	8a34 <getc+0x80>

    return (char)read_data;
    8a2c:	e51b3008 	ldr	r3, [fp, #-8]
    8a30:	e6ef3073 	uxtb	r3, r3
}
    8a34:	e1a00003 	mov	r0, r3
    8a38:	e24bd004 	sub	sp, fp, #4
    8a3c:	e8bd8800 	pop	{fp, pc}

00008a40 <printint>:

static void printint(int xx, int base, int sgn)
{
    8a40:	e92d4810 	push	{r4, fp, lr}
    8a44:	e28db008 	add	fp, sp, #8
    8a48:	e24dd034 	sub	sp, sp, #52	; 0x34
    8a4c:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    8a50:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    8a54:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint32_t x;

    neg = 0;
    8a58:	e3a03000 	mov	r3, #0
    8a5c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (sgn && xx < 0) {
    8a60:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    8a64:	e3530000 	cmp	r3, #0
    8a68:	0a000008 	beq	8a90 <printint+0x50>
    8a6c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8a70:	e3530000 	cmp	r3, #0
    8a74:	aa000005 	bge	8a90 <printint+0x50>
        neg = 1;
    8a78:	e3a03001 	mov	r3, #1
    8a7c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        x = -xx;
    8a80:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8a84:	e2633000 	rsb	r3, r3, #0
    8a88:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8a8c:	ea000001 	b	8a98 <printint+0x58>
    } else {
        x = xx;
    8a90:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8a94:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    }

    i = 0;
    8a98:	e3a03000 	mov	r3, #0
    8a9c:	e50b3010 	str	r3, [fp, #-16]
    do {
        buf[i++] = digits[x % base];
    8aa0:	e51b4010 	ldr	r4, [fp, #-16]
    8aa4:	e2843001 	add	r3, r4, #1
    8aa8:	e50b3010 	str	r3, [fp, #-16]
    8aac:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    8ab0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8ab4:	e1a01002 	mov	r1, r2
    8ab8:	e1a00003 	mov	r0, r3
    8abc:	eb000bd0 	bl	ba04 <__aeabi_uidivmod>
    8ac0:	e1a03001 	mov	r3, r1
    8ac4:	e1a02003 	mov	r2, r3
    8ac8:	e3013074 	movw	r3, #4212	; 0x1074
    8acc:	e3403001 	movt	r3, #1
    8ad0:	e7d32002 	ldrb	r2, [r3, r2]
    8ad4:	e24b300c 	sub	r3, fp, #12
    8ad8:	e0833004 	add	r3, r3, r4
    8adc:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4
    } while ((x /= base) != 0);
    8ae0:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    8ae4:	e1a01003 	mov	r1, r3
    8ae8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    8aec:	eb000b87 	bl	b910 <__udivsi3>
    8af0:	e1a03000 	mov	r3, r0
    8af4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8af8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8afc:	e3530000 	cmp	r3, #0
    8b00:	1affffe6 	bne	8aa0 <printint+0x60>
    if (neg)
    8b04:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8b08:	e3530000 	cmp	r3, #0
    8b0c:	0a00000d 	beq	8b48 <printint+0x108>
        buf[i++] = '-';
    8b10:	e51b3010 	ldr	r3, [fp, #-16]
    8b14:	e2832001 	add	r2, r3, #1
    8b18:	e50b2010 	str	r2, [fp, #-16]
    8b1c:	e24b200c 	sub	r2, fp, #12
    8b20:	e0823003 	add	r3, r2, r3
    8b24:	e3a0202d 	mov	r2, #45	; 0x2d
    8b28:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4

    while (--i >= 0)
    8b2c:	ea000005 	b	8b48 <printint+0x108>
        putc(buf[i]);
    8b30:	e24b2028 	sub	r2, fp, #40	; 0x28
    8b34:	e51b3010 	ldr	r3, [fp, #-16]
    8b38:	e0823003 	add	r3, r2, r3
    8b3c:	e5d33000 	ldrb	r3, [r3]
    8b40:	e1a00003 	mov	r0, r3
    8b44:	ebffff76 	bl	8924 <putc>
    while (--i >= 0)
    8b48:	e51b3010 	ldr	r3, [fp, #-16]
    8b4c:	e2433001 	sub	r3, r3, #1
    8b50:	e50b3010 	str	r3, [fp, #-16]
    8b54:	e51b3010 	ldr	r3, [fp, #-16]
    8b58:	e3530000 	cmp	r3, #0
    8b5c:	aafffff3 	bge	8b30 <printint+0xf0>
}
    8b60:	e320f000 	nop	{0}
    8b64:	e24bd008 	sub	sp, fp, #8
    8b68:	e8bd8810 	pop	{r4, fp, pc}

00008b6c <printf>:

// Print to usart. Only understands %d, %x, %p, %s.
void printf(char* fmt, ...)
{
    8b6c:	e92d000f 	push	{r0, r1, r2, r3}
    8b70:	e92d4800 	push	{fp, lr}
    8b74:	e28db004 	add	fp, sp, #4
    8b78:	e24dd018 	sub	sp, sp, #24
    if (!init_uart_mmio()) {
    8b7c:	ebffff4e 	bl	88bc <init_uart_mmio>
    8b80:	e1a03000 	mov	r3, r0
    8b84:	e2233001 	eor	r3, r3, #1
    8b88:	e6ef3073 	uxtb	r3, r3
    8b8c:	e3530000 	cmp	r3, #0
    8b90:	1a00007b 	bne	8d84 <printf+0x218>
    }
    char* s;
    int c, i, state;
    uint32_t* ap;

    state = 0;
    8b94:	e3a03000 	mov	r3, #0
    8b98:	e50b3010 	str	r3, [fp, #-16]
    ap = (uint32_t*)(void*)&fmt + 1;
    8b9c:	e28b3008 	add	r3, fp, #8
    8ba0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    for (i = 0; fmt[i]; i++) {
    8ba4:	e3a03000 	mov	r3, #0
    8ba8:	e50b300c 	str	r3, [fp, #-12]
    8bac:	ea00006d 	b	8d68 <printf+0x1fc>
        c = fmt[i] & 0xff;
    8bb0:	e59b2004 	ldr	r2, [fp, #4]
    8bb4:	e51b300c 	ldr	r3, [fp, #-12]
    8bb8:	e0823003 	add	r3, r2, r3
    8bbc:	e5d33000 	ldrb	r3, [r3]
    8bc0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        if (state == 0) {
    8bc4:	e51b3010 	ldr	r3, [fp, #-16]
    8bc8:	e3530000 	cmp	r3, #0
    8bcc:	1a00000a 	bne	8bfc <printf+0x90>
            if (c == '%') {
    8bd0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8bd4:	e3530025 	cmp	r3, #37	; 0x25
    8bd8:	1a000002 	bne	8be8 <printf+0x7c>
                state = '%';
    8bdc:	e3a03025 	mov	r3, #37	; 0x25
    8be0:	e50b3010 	str	r3, [fp, #-16]
    8be4:	ea00005c 	b	8d5c <printf+0x1f0>
            } else {
                putc(c);
    8be8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8bec:	e6ef3073 	uxtb	r3, r3
    8bf0:	e1a00003 	mov	r0, r3
    8bf4:	ebffff4a 	bl	8924 <putc>
    8bf8:	ea000057 	b	8d5c <printf+0x1f0>
            }
        } else if (state == '%') {
    8bfc:	e51b3010 	ldr	r3, [fp, #-16]
    8c00:	e3530025 	cmp	r3, #37	; 0x25
    8c04:	1a000054 	bne	8d5c <printf+0x1f0>
            if (c == 'd') {
    8c08:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8c0c:	e3530064 	cmp	r3, #100	; 0x64
    8c10:	1a000009 	bne	8c3c <printf+0xd0>
                printint(*ap, 10, 1);
    8c14:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c18:	e5933000 	ldr	r3, [r3]
    8c1c:	e3a02001 	mov	r2, #1
    8c20:	e3a0100a 	mov	r1, #10
    8c24:	e1a00003 	mov	r0, r3
    8c28:	ebffff84 	bl	8a40 <printint>
                ap++;
    8c2c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c30:	e2833004 	add	r3, r3, #4
    8c34:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8c38:	ea000045 	b	8d54 <printf+0x1e8>
            } else if (c == 'x' || c == 'p') {
    8c3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8c40:	e3530078 	cmp	r3, #120	; 0x78
    8c44:	0a000002 	beq	8c54 <printf+0xe8>
    8c48:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8c4c:	e3530070 	cmp	r3, #112	; 0x70
    8c50:	1a000009 	bne	8c7c <printf+0x110>
                printint(*ap, 16, 0);
    8c54:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c58:	e5933000 	ldr	r3, [r3]
    8c5c:	e3a02000 	mov	r2, #0
    8c60:	e3a01010 	mov	r1, #16
    8c64:	e1a00003 	mov	r0, r3
    8c68:	ebffff74 	bl	8a40 <printint>
                ap++;
    8c6c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c70:	e2833004 	add	r3, r3, #4
    8c74:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8c78:	ea000035 	b	8d54 <printf+0x1e8>
            } else if (c == 's') {
    8c7c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8c80:	e3530073 	cmp	r3, #115	; 0x73
    8c84:	1a000018 	bne	8cec <printf+0x180>
                s = (char*)*ap;
    8c88:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c8c:	e5933000 	ldr	r3, [r3]
    8c90:	e50b3008 	str	r3, [fp, #-8]
                ap++;
    8c94:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c98:	e2833004 	add	r3, r3, #4
    8c9c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
                if (s == 0)
    8ca0:	e51b3008 	ldr	r3, [fp, #-8]
    8ca4:	e3530000 	cmp	r3, #0
    8ca8:	1a00000a 	bne	8cd8 <printf+0x16c>
                    s = "(null)";
    8cac:	e3003b5c 	movw	r3, #2908	; 0xb5c
    8cb0:	e3403001 	movt	r3, #1
    8cb4:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    8cb8:	ea000006 	b	8cd8 <printf+0x16c>
                    putc(*s);
    8cbc:	e51b3008 	ldr	r3, [fp, #-8]
    8cc0:	e5d33000 	ldrb	r3, [r3]
    8cc4:	e1a00003 	mov	r0, r3
    8cc8:	ebffff15 	bl	8924 <putc>
                    s++;
    8ccc:	e51b3008 	ldr	r3, [fp, #-8]
    8cd0:	e2833001 	add	r3, r3, #1
    8cd4:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    8cd8:	e51b3008 	ldr	r3, [fp, #-8]
    8cdc:	e5d33000 	ldrb	r3, [r3]
    8ce0:	e3530000 	cmp	r3, #0
    8ce4:	1afffff4 	bne	8cbc <printf+0x150>
    8ce8:	ea000019 	b	8d54 <printf+0x1e8>
                }
            } else if (c == 'c') {
    8cec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8cf0:	e3530063 	cmp	r3, #99	; 0x63
    8cf4:	1a000008 	bne	8d1c <printf+0x1b0>
                putc(*ap);
    8cf8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8cfc:	e5933000 	ldr	r3, [r3]
    8d00:	e6ef3073 	uxtb	r3, r3
    8d04:	e1a00003 	mov	r0, r3
    8d08:	ebffff05 	bl	8924 <putc>
                ap++;
    8d0c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8d10:	e2833004 	add	r3, r3, #4
    8d14:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8d18:	ea00000d 	b	8d54 <printf+0x1e8>
            } else if (c == '%') {
    8d1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8d20:	e3530025 	cmp	r3, #37	; 0x25
    8d24:	1a000004 	bne	8d3c <printf+0x1d0>
                putc(c);
    8d28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8d2c:	e6ef3073 	uxtb	r3, r3
    8d30:	e1a00003 	mov	r0, r3
    8d34:	ebfffefa 	bl	8924 <putc>
    8d38:	ea000005 	b	8d54 <printf+0x1e8>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc('%');
    8d3c:	e3a00025 	mov	r0, #37	; 0x25
    8d40:	ebfffef7 	bl	8924 <putc>
                putc(c);
    8d44:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8d48:	e6ef3073 	uxtb	r3, r3
    8d4c:	e1a00003 	mov	r0, r3
    8d50:	ebfffef3 	bl	8924 <putc>
            }
            state = 0;
    8d54:	e3a03000 	mov	r3, #0
    8d58:	e50b3010 	str	r3, [fp, #-16]
    for (i = 0; fmt[i]; i++) {
    8d5c:	e51b300c 	ldr	r3, [fp, #-12]
    8d60:	e2833001 	add	r3, r3, #1
    8d64:	e50b300c 	str	r3, [fp, #-12]
    8d68:	e59b2004 	ldr	r2, [fp, #4]
    8d6c:	e51b300c 	ldr	r3, [fp, #-12]
    8d70:	e0823003 	add	r3, r2, r3
    8d74:	e5d33000 	ldrb	r3, [r3]
    8d78:	e3530000 	cmp	r3, #0
    8d7c:	1affff8b 	bne	8bb0 <printf+0x44>
    8d80:	ea000000 	b	8d88 <printf+0x21c>
        return;
    8d84:	e320f000 	nop	{0}
        }
    }
    8d88:	e24bd004 	sub	sp, fp, #4
    8d8c:	e8bd4800 	pop	{fp, lr}
    8d90:	e28dd010 	add	sp, sp, #16
    8d94:	e12fff1e 	bx	lr

00008d98 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    8d98:	e92d4800 	push	{fp, lr}
    8d9c:	e28db004 	add	fp, sp, #4
    8da0:	e24dd030 	sub	sp, sp, #48	; 0x30
    8da4:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    8da8:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    8dac:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    int len = IPC_ARG_INFO_BASE_OFFSET;
    8db0:	e3a0300c 	mov	r3, #12
    8db4:	e50b3008 	str	r3, [fp, #-8]

    int arg_info_offset = len; // start of arg info
    8db8:	e51b3008 	ldr	r3, [fp, #-8]
    8dbc:	e50b300c 	str	r3, [fp, #-12]
    len += argc * sizeof(struct IpcArgInfo);
    8dc0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8dc4:	e1a02103 	lsl	r2, r3, #2
    8dc8:	e51b3008 	ldr	r3, [fp, #-8]
    8dcc:	e0823003 	add	r3, r2, r3
    8dd0:	e50b3008 	str	r3, [fp, #-8]

    int arg_buf_offset = len; // start of arg buffer
    8dd4:	e51b3008 	ldr	r3, [fp, #-8]
    8dd8:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < argc; i++) {
    8ddc:	e3a03000 	mov	r3, #0
    8de0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8de4:	ea00000a 	b	8e14 <new_ipc_msg+0x7c>
        len += arg_size[i];
    8de8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8dec:	e1a03103 	lsl	r3, r3, #2
    8df0:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    8df4:	e0823003 	add	r3, r2, r3
    8df8:	e5933000 	ldr	r3, [r3]
    8dfc:	e51b2008 	ldr	r2, [fp, #-8]
    8e00:	e0823003 	add	r3, r2, r3
    8e04:	e50b3008 	str	r3, [fp, #-8]
    for (int i = 0; i < argc; i++) {
    8e08:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8e0c:	e2833001 	add	r3, r3, #1
    8e10:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8e14:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    8e18:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8e1c:	e1520003 	cmp	r2, r3
    8e20:	bafffff0 	blt	8de8 <new_ipc_msg+0x50>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    8e24:	e51b1008 	ldr	r1, [fp, #-8]
    8e28:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
    8e2c:	eb00026d 	bl	97e8 <session_alloc_buf>
    8e30:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    if (buf == NULL) {
    8e34:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8e38:	e3530000 	cmp	r3, #0
    8e3c:	1a000001 	bne	8e48 <new_ipc_msg+0xb0>
        return NULL;
    8e40:	e3a03000 	mov	r3, #0
    8e44:	ea00003d 	b	8f40 <new_ipc_msg+0x1a8>
    }
    buf->header.len = len;
    8e48:	e51b3008 	ldr	r3, [fp, #-8]
    8e4c:	e6ff2073 	uxth	r2, r3
    8e50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8e54:	e1c320b2 	strh	r2, [r3, #2]
    buf->header.done = 0;
    8e58:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8e5c:	e5d23000 	ldrb	r3, [r2]
    8e60:	e7c1309f 	bfc	r3, #1, #1
    8e64:	e5c23000 	strb	r3, [r2]
    buf->header.valid = 0;
    8e68:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8e6c:	e5d23000 	ldrb	r3, [r2]
    8e70:	e7c0301f 	bfc	r3, #0, #1
    8e74:	e5c23000 	strb	r3, [r2]

    for (int i = 0; i < argc; i++) {
    8e78:	e3a03000 	mov	r3, #0
    8e7c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8e80:	ea00001d 	b	8efc <new_ipc_msg+0x164>
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    8e84:	e51b300c 	ldr	r3, [fp, #-12]
    8e88:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8e8c:	e0823003 	add	r3, r2, r3
    8e90:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        arg_info->len = arg_size[i];
    8e94:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8e98:	e1a03103 	lsl	r3, r3, #2
    8e9c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    8ea0:	e0823003 	add	r3, r2, r3
    8ea4:	e5933000 	ldr	r3, [r3]
    8ea8:	e6ff2073 	uxth	r2, r3
    8eac:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8eb0:	e1c320b2 	strh	r2, [r3, #2]
        arg_info->offset = arg_buf_offset;
    8eb4:	e51b3010 	ldr	r3, [fp, #-16]
    8eb8:	e6ff2073 	uxth	r2, r3
    8ebc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8ec0:	e1c320b0 	strh	r2, [r3]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    8ec4:	e51b300c 	ldr	r3, [fp, #-12]
    8ec8:	e2833004 	add	r3, r3, #4
    8ecc:	e50b300c 	str	r3, [fp, #-12]
        arg_buf_offset += arg_size[i];
    8ed0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8ed4:	e1a03103 	lsl	r3, r3, #2
    8ed8:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    8edc:	e0823003 	add	r3, r2, r3
    8ee0:	e5933000 	ldr	r3, [r3]
    8ee4:	e51b2010 	ldr	r2, [fp, #-16]
    8ee8:	e0823003 	add	r3, r2, r3
    8eec:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < argc; i++) {
    8ef0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8ef4:	e2833001 	add	r3, r3, #1
    8ef8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8efc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    8f00:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8f04:	e1520003 	cmp	r2, r3
    8f08:	baffffdd 	blt	8e84 <new_ipc_msg+0xec>
    }
    buf->header.nr_args = argc;
    8f0c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8f10:	e6ef3073 	uxtb	r3, r3
    8f14:	e203300f 	and	r3, r3, #15
    8f18:	e6ef1073 	uxtb	r1, r3
    8f1c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8f20:	e5d23000 	ldrb	r3, [r2]
    8f24:	e7c73211 	bfi	r3, r1, #4, #4
    8f28:	e5c23000 	strb	r3, [r2]
    buf->header.init = 1;
    8f2c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8f30:	e5d23000 	ldrb	r3, [r2]
    8f34:	e3833004 	orr	r3, r3, #4
    8f38:	e5c23000 	strb	r3, [r2]
    return buf;
    8f3c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
}
    8f40:	e1a00003 	mov	r0, r3
    8f44:	e24bd004 	sub	sp, fp, #4
    8f48:	e8bd8800 	pop	{fp, pc}

00008f4c <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    8f4c:	e92d4800 	push	{fp, lr}
    8f50:	e28db004 	add	fp, sp, #4
    8f54:	e24dd020 	sub	sp, sp, #32
    8f58:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    8f5c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    8f60:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    8f64:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (arg_num >= msg->header.nr_args) {
    8f68:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8f6c:	e5d33000 	ldrb	r3, [r3]
    8f70:	e7e33253 	ubfx	r3, r3, #4, #4
    8f74:	e6ef3073 	uxtb	r3, r3
    8f78:	e1a02003 	mov	r2, r3
    8f7c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8f80:	e1520003 	cmp	r2, r3
    8f84:	ca00000b 	bgt	8fb8 <ipc_msg_set_nth_arg+0x6c>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %d\n", __func__, arg_num, msg->header.nr_args);
    8f88:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8f8c:	e5d33000 	ldrb	r3, [r3]
    8f90:	e7e33253 	ubfx	r3, r3, #4, #4
    8f94:	e6ef3073 	uxtb	r3, r3
    8f98:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8f9c:	e3001ccc 	movw	r1, #3276	; 0xccc
    8fa0:	e3401001 	movt	r1, #1
    8fa4:	e3000b64 	movw	r0, #2916	; 0xb64
    8fa8:	e3400001 	movt	r0, #1
    8fac:	ebfffeee 	bl	8b6c <printf>
        return false;
    8fb0:	e3a03000 	mov	r3, #0
    8fb4:	ea000029 	b	9060 <ipc_msg_set_nth_arg+0x114>
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    8fb8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8fbc:	e2833003 	add	r3, r3, #3
    8fc0:	e1a03103 	lsl	r3, r3, #2
    8fc4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    8fc8:	e0823003 	add	r3, r2, r3
    8fcc:	e50b3008 	str	r3, [fp, #-8]
    if (len > nth_arg_info->len) {
    8fd0:	e51b3008 	ldr	r3, [fp, #-8]
    8fd4:	e1d330b2 	ldrh	r3, [r3, #2]
    8fd8:	e1a02003 	mov	r2, r3
    8fdc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8fe0:	e1520003 	cmp	r2, r3
    8fe4:	aa000009 	bge	9010 <ipc_msg_set_nth_arg+0xc4>
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %d\n", __func__, len, nth_arg_info->len);
    8fe8:	e51b3008 	ldr	r3, [fp, #-8]
    8fec:	e1d330b2 	ldrh	r3, [r3, #2]
    8ff0:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    8ff4:	e3001ccc 	movw	r1, #3276	; 0xccc
    8ff8:	e3401001 	movt	r1, #1
    8ffc:	e3000ba4 	movw	r0, #2980	; 0xba4
    9000:	e3400001 	movt	r0, #1
    9004:	ebfffed8 	bl	8b6c <printf>
        return false;
    9008:	e3a03000 	mov	r3, #0
    900c:	ea000013 	b	9060 <ipc_msg_set_nth_arg+0x114>
    9010:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9014:	e50b3010 	str	r3, [fp, #-16]
    9018:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    901c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    9020:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9024:	e2833003 	add	r3, r3, #3
    9028:	e1a03103 	lsl	r3, r3, #2
    902c:	e51b2010 	ldr	r2, [fp, #-16]
    9030:	e0823003 	add	r3, r2, r3
    9034:	e1d330b0 	ldrh	r3, [r3]
    9038:	e1a02003 	mov	r2, r3
    903c:	e51b3010 	ldr	r3, [fp, #-16]
    9040:	e0833002 	add	r3, r3, r2
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    9044:	e50b300c 	str	r3, [fp, #-12]
    memmove(buf, data, len);
    9048:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    904c:	e1a02003 	mov	r2, r3
    9050:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
    9054:	e51b000c 	ldr	r0, [fp, #-12]
    9058:	eb000b5d 	bl	bdd4 <memmove>
    return true;
    905c:	e3a03001 	mov	r3, #1
}
    9060:	e1a00003 	mov	r0, r3
    9064:	e24bd004 	sub	sp, fp, #4
    9068:	e8bd8800 	pop	{fp, pc}

0000906c <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    906c:	e92d4800 	push	{fp, lr}
    9070:	e28db004 	add	fp, sp, #4
    9074:	e24dd020 	sub	sp, sp, #32
    9078:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    907c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    9080:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    9084:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (arg_num >= msg->header.nr_args) {
    9088:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    908c:	e5d33000 	ldrb	r3, [r3]
    9090:	e7e33253 	ubfx	r3, r3, #4, #4
    9094:	e6ef3073 	uxtb	r3, r3
    9098:	e1a02003 	mov	r2, r3
    909c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    90a0:	e1520003 	cmp	r2, r3
    90a4:	ca000006 	bgt	90c4 <ipc_msg_get_nth_arg+0x58>
        printf("[%s] IPC: arg_num out of msg range", __func__);
    90a8:	e3001ce0 	movw	r1, #3296	; 0xce0
    90ac:	e3401001 	movt	r1, #1
    90b0:	e3000be8 	movw	r0, #3048	; 0xbe8
    90b4:	e3400001 	movt	r0, #1
    90b8:	ebfffeab 	bl	8b6c <printf>
        return false;
    90bc:	e3a03000 	mov	r3, #0
    90c0:	ea000026 	b	9160 <ipc_msg_get_nth_arg+0xf4>
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    90c4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    90c8:	e2833003 	add	r3, r3, #3
    90cc:	e1a03103 	lsl	r3, r3, #2
    90d0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    90d4:	e0823003 	add	r3, r2, r3
    90d8:	e50b3008 	str	r3, [fp, #-8]
    if (len > nth_arg_info->len) {
    90dc:	e51b3008 	ldr	r3, [fp, #-8]
    90e0:	e1d330b2 	ldrh	r3, [r3, #2]
    90e4:	e1a02003 	mov	r2, r3
    90e8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    90ec:	e1520003 	cmp	r2, r3
    90f0:	aa000006 	bge	9110 <ipc_msg_get_nth_arg+0xa4>
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    90f4:	e3001ce0 	movw	r1, #3296	; 0xce0
    90f8:	e3401001 	movt	r1, #1
    90fc:	e3000c0c 	movw	r0, #3084	; 0xc0c
    9100:	e3400001 	movt	r0, #1
    9104:	ebfffe98 	bl	8b6c <printf>
        return false;
    9108:	e3a03000 	mov	r3, #0
    910c:	ea000013 	b	9160 <ipc_msg_get_nth_arg+0xf4>
    9110:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9114:	e50b3010 	str	r3, [fp, #-16]
    9118:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    911c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    9120:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9124:	e2833003 	add	r3, r3, #3
    9128:	e1a03103 	lsl	r3, r3, #2
    912c:	e51b2010 	ldr	r2, [fp, #-16]
    9130:	e0823003 	add	r3, r2, r3
    9134:	e1d330b0 	ldrh	r3, [r3]
    9138:	e1a02003 	mov	r2, r3
    913c:	e51b3010 	ldr	r3, [fp, #-16]
    9140:	e0833002 	add	r3, r3, r2
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    9144:	e50b300c 	str	r3, [fp, #-12]
    memmove(data, buf, len);
    9148:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    914c:	e1a02003 	mov	r2, r3
    9150:	e51b100c 	ldr	r1, [fp, #-12]
    9154:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9158:	eb000b1d 	bl	bdd4 <memmove>
    return true;
    915c:	e3a03001 	mov	r3, #1
}
    9160:	e1a00003 	mov	r0, r3
    9164:	e24bd004 	sub	sp, fp, #4
    9168:	e8bd8800 	pop	{fp, pc}

0000916c <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    916c:	e92d4800 	push	{fp, lr}
    9170:	e28db004 	add	fp, sp, #4
    9174:	e24dd008 	sub	sp, sp, #8
    9178:	e50b0008 	str	r0, [fp, #-8]
    msg->header.magic = IPC_MSG_MAGIC;
    917c:	e51b2008 	ldr	r2, [fp, #-8]
    9180:	e30d3cba 	movw	r3, #56506	; 0xdcba
    9184:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    9188:	e5823004 	str	r3, [r2, #4]
    msg->header.valid = 1;
    918c:	e51b2008 	ldr	r2, [fp, #-8]
    9190:	e5d23000 	ldrb	r3, [r2]
    9194:	e3833001 	orr	r3, r3, #1
    9198:	e5c23000 	strb	r3, [r2]
    msg->header.done = 0;
    919c:	e51b2008 	ldr	r2, [fp, #-8]
    91a0:	e5d23000 	ldrb	r3, [r2]
    91a4:	e7c1309f 	bfc	r3, #1, #1
    91a8:	e5c23000 	strb	r3, [r2]
    while (msg->header.done == 0) {
    91ac:	ea000000 	b	91b4 <ipc_msg_send_wait+0x48>
        /// @todo syscall yield with prio decrease
        yield();
    91b0:	eb000910 	bl	b5f8 <yield>
    while (msg->header.done == 0) {
    91b4:	e51b3008 	ldr	r3, [fp, #-8]
    91b8:	e5d33000 	ldrb	r3, [r3]
    91bc:	e2033002 	and	r3, r3, #2
    91c0:	e6ef3073 	uxtb	r3, r3
    91c4:	e3530000 	cmp	r3, #0
    91c8:	0afffff8 	beq	91b0 <ipc_msg_send_wait+0x44>
    }
    assert(msg->header.done == 1);
    91cc:	e51b3008 	ldr	r3, [fp, #-8]
    91d0:	e5d33000 	ldrb	r3, [r3]
    91d4:	e2033002 	and	r3, r3, #2
    91d8:	e6ef3073 	uxtb	r3, r3
    91dc:	e3530000 	cmp	r3, #0
    91e0:	1a000007 	bne	9204 <ipc_msg_send_wait+0x98>
    91e4:	e3003c38 	movw	r3, #3128	; 0xc38
    91e8:	e3403001 	movt	r3, #1
    91ec:	e3002cf4 	movw	r2, #3316	; 0xcf4
    91f0:	e3402001 	movt	r2, #1
    91f4:	e3a0107e 	mov	r1, #126	; 0x7e
    91f8:	e3000c50 	movw	r0, #3152	; 0xc50
    91fc:	e3400001 	movt	r0, #1
    9200:	eb000a5a 	bl	bb70 <__assert_func>
}
    9204:	e320f000 	nop	{0}
    9208:	e24bd004 	sub	sp, fp, #4
    920c:	e8bd8800 	pop	{fp, pc}

00009210 <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    9210:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9214:	e28db000 	add	fp, sp, #0
    9218:	e24dd00c 	sub	sp, sp, #12
    921c:	e50b0008 	str	r0, [fp, #-8]
    msg->header.magic = IPC_MSG_MAGIC;
    9220:	e51b2008 	ldr	r2, [fp, #-8]
    9224:	e30d3cba 	movw	r3, #56506	; 0xdcba
    9228:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    922c:	e5823004 	str	r3, [r2, #4]
    msg->header.valid = 1;
    9230:	e51b2008 	ldr	r2, [fp, #-8]
    9234:	e5d23000 	ldrb	r3, [r2]
    9238:	e3833001 	orr	r3, r3, #1
    923c:	e5c23000 	strb	r3, [r2]
    msg->header.done = 0;
    9240:	e51b2008 	ldr	r2, [fp, #-8]
    9244:	e5d23000 	ldrb	r3, [r2]
    9248:	e7c1309f 	bfc	r3, #1, #1
    924c:	e5c23000 	strb	r3, [r2]
}
    9250:	e320f000 	nop	{0}
    9254:	e28bd000 	add	sp, fp, #0
    9258:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    925c:	e12fff1e 	bx	lr

00009260 <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    9260:	e92d4800 	push	{fp, lr}
    9264:	e28db004 	add	fp, sp, #4
    9268:	e24dd010 	sub	sp, sp, #16
    926c:	e50b0010 	str	r0, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    9270:	e51b3010 	ldr	r3, [fp, #-16]
    9274:	e5933010 	ldr	r3, [r3, #16]
    9278:	e51b2010 	ldr	r2, [fp, #-16]
    927c:	e5922008 	ldr	r2, [r2, #8]
    9280:	e0833002 	add	r3, r3, r2
    9284:	e50b3008 	str	r3, [fp, #-8]
    while (msg->header.done == 0) {
    9288:	ea000000 	b	9290 <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield();
    928c:	eb0008d9 	bl	b5f8 <yield>
    while (msg->header.done == 0) {
    9290:	e51b3008 	ldr	r3, [fp, #-8]
    9294:	e5d33000 	ldrb	r3, [r3]
    9298:	e2033002 	and	r3, r3, #2
    929c:	e6ef3073 	uxtb	r3, r3
    92a0:	e3530000 	cmp	r3, #0
    92a4:	0afffff8 	beq	928c <ipc_session_wait+0x2c>
    }
    assert(msg->header.done == 1);
    92a8:	e51b3008 	ldr	r3, [fp, #-8]
    92ac:	e5d33000 	ldrb	r3, [r3]
    92b0:	e2033002 	and	r3, r3, #2
    92b4:	e6ef3073 	uxtb	r3, r3
    92b8:	e3530000 	cmp	r3, #0
    92bc:	1a000007 	bne	92e0 <ipc_session_wait+0x80>
    92c0:	e3003c38 	movw	r3, #3128	; 0xc38
    92c4:	e3403001 	movt	r3, #1
    92c8:	e3002d08 	movw	r2, #3336	; 0xd08
    92cc:	e3402001 	movt	r2, #1
    92d0:	e3a0108f 	mov	r1, #143	; 0x8f
    92d4:	e3000c50 	movw	r0, #3152	; 0xc50
    92d8:	e3400001 	movt	r0, #1
    92dc:	eb000a23 	bl	bb70 <__assert_func>
    return msg->header.ret_val;
    92e0:	e51b3008 	ldr	r3, [fp, #-8]
    92e4:	e5933008 	ldr	r3, [r3, #8]
}
    92e8:	e1a00003 	mov	r0, r3
    92ec:	e24bd004 	sub	sp, fp, #4
    92f0:	e8bd8800 	pop	{fp, pc}

000092f4 <cur_session_id>:

static int cur_sess_id = -1;
int cur_session_id(void)
{
    92f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    92f8:	e28db000 	add	fp, sp, #0
    return cur_sess_id;
    92fc:	e3013088 	movw	r3, #4232	; 0x1088
    9300:	e3403001 	movt	r3, #1
    9304:	e5933000 	ldr	r3, [r3]
}
    9308:	e1a00003 	mov	r0, r3
    930c:	e28bd000 	add	sp, fp, #0
    9310:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9314:	e12fff1e 	bx	lr

00009318 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    9318:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    931c:	e28db000 	add	fp, sp, #0
    session_delayed = true;
    9320:	e3013a78 	movw	r3, #6776	; 0x1a78
    9324:	e3403001 	movt	r3, #1
    9328:	e3a02001 	mov	r2, #1
    932c:	e5c32000 	strb	r2, [r3]
}
    9330:	e320f000 	nop	{0}
    9334:	e28bd000 	add	sp, fp, #0
    9338:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    933c:	e12fff1e 	bx	lr

00009340 <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    9340:	e92d4810 	push	{r4, fp, lr}
    9344:	e28db008 	add	fp, sp, #8
    9348:	e24ddf5d 	sub	sp, sp, #372	; 0x174
    934c:	e50b0178 	str	r0, [fp, #-376]	; 0xfffffe88
        /* if connect sessions are greater than NR_MAX_SESSION,
            a full round will require multiple polls.
            Eg.(3 polls to with 6 sessions and NR_MAX_SESSION = 4):
                [0, 1, 2, 3], [4, 5, 0, 1], [2, 3, 4, 5]
        */
        poll_session(session_list, NR_MAX_SESSION);
    9350:	e24b3e17 	sub	r3, fp, #368	; 0x170
    9354:	e3a01010 	mov	r1, #16
    9358:	e1a00003 	mov	r0, r3
    935c:	eb0008d4 	bl	b6b4 <poll_session>
        /* handle each session */
        for (int i = 0; i < NR_MAX_SESSION; i++) {
    9360:	e3a03000 	mov	r3, #0
    9364:	e50b3010 	str	r3, [fp, #-16]
    9368:	ea000102 	b	9778 <ipc_server_loop+0x438>
            if (session_list[i].buf == NULL) {
    936c:	e51b2010 	ldr	r2, [fp, #-16]
    9370:	e1a03002 	mov	r3, r2
    9374:	e1a03103 	lsl	r3, r3, #2
    9378:	e0833002 	add	r3, r3, r2
    937c:	e1a03103 	lsl	r3, r3, #2
    9380:	e24b200c 	sub	r2, fp, #12
    9384:	e0823003 	add	r3, r2, r3
    9388:	e2433f55 	sub	r3, r3, #340	; 0x154
    938c:	e5933000 	ldr	r3, [r3]
    9390:	e3530000 	cmp	r3, #0
    9394:	1a000001 	bne	93a0 <ipc_server_loop+0x60>
                yield();
    9398:	eb000896 	bl	b5f8 <yield>
                break;
    939c:	ea0000f8 	b	9784 <ipc_server_loop+0x444>
            }
            cur_sess_id = session_list[i].id;
    93a0:	e51b2010 	ldr	r2, [fp, #-16]
    93a4:	e1a03002 	mov	r3, r2
    93a8:	e1a03103 	lsl	r3, r3, #2
    93ac:	e0833002 	add	r3, r3, r2
    93b0:	e1a03103 	lsl	r3, r3, #2
    93b4:	e24b200c 	sub	r2, fp, #12
    93b8:	e0823003 	add	r3, r2, r3
    93bc:	e2433f59 	sub	r3, r3, #356	; 0x164
    93c0:	e5932000 	ldr	r2, [r3]
    93c4:	e3013088 	movw	r3, #4232	; 0x1088
    93c8:	e3403001 	movt	r3, #1
    93cc:	e5832000 	str	r2, [r3]
            struct IpcMsg* msg = IPCSESSION_MSG(&session_list[i]);
    93d0:	e51b2010 	ldr	r2, [fp, #-16]
    93d4:	e1a03002 	mov	r3, r2
    93d8:	e1a03103 	lsl	r3, r3, #2
    93dc:	e0833002 	add	r3, r3, r2
    93e0:	e1a03103 	lsl	r3, r3, #2
    93e4:	e24b200c 	sub	r2, fp, #12
    93e8:	e0823003 	add	r3, r2, r3
    93ec:	e2433f55 	sub	r3, r3, #340	; 0x154
    93f0:	e5931000 	ldr	r1, [r3]
    93f4:	e51b2010 	ldr	r2, [fp, #-16]
    93f8:	e1a03002 	mov	r3, r2
    93fc:	e1a03103 	lsl	r3, r3, #2
    9400:	e0833002 	add	r3, r3, r2
    9404:	e1a03103 	lsl	r3, r3, #2
    9408:	e24b200c 	sub	r2, fp, #12
    940c:	e0823003 	add	r3, r2, r3
    9410:	e2433f57 	sub	r3, r3, #348	; 0x15c
    9414:	e5933000 	ldr	r3, [r3]
    9418:	e0813003 	add	r3, r1, r3
    941c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            /* handle every message in current session
                a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                interfaces[opcode] should explicitly call delay_session() and return to delay this session
            */
            while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done != 1) {
    9420:	ea0000b9 	b	970c <ipc_server_loop+0x3cc>
                // printf("session %d [%d, %d]\n", session_list[i].id, session_list[i].head, session_list[i].tail);
                if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], msg->header.len) < 0) {
    9424:	e24b1e17 	sub	r1, fp, #368	; 0x170
    9428:	e51b2010 	ldr	r2, [fp, #-16]
    942c:	e1a03002 	mov	r3, r2
    9430:	e1a03103 	lsl	r3, r3, #2
    9434:	e0833002 	add	r3, r3, r2
    9438:	e1a03103 	lsl	r3, r3, #2
    943c:	e0813003 	add	r3, r1, r3
    9440:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    9444:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9448:	e593200c 	ldr	r2, [r3, #12]
    944c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9450:	e5933004 	ldr	r3, [r3, #4]
    9454:	e0822003 	add	r2, r2, r3
    9458:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    945c:	e5933008 	ldr	r3, [r3, #8]
    9460:	e0422003 	sub	r2, r2, r3
    9464:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9468:	e5933004 	ldr	r3, [r3, #4]
    946c:	e1a01003 	mov	r1, r3
    9470:	e1a00002 	mov	r0, r2
    9474:	eb0009b4 	bl	bb4c <__aeabi_idivmod>
    9478:	e1a03001 	mov	r3, r1
    947c:	e3530000 	cmp	r3, #0
    9480:	1a000038 	bne	9568 <ipc_server_loop+0x228>
    9484:	e24b1e17 	sub	r1, fp, #368	; 0x170
    9488:	e51b2010 	ldr	r2, [fp, #-16]
    948c:	e1a03002 	mov	r3, r2
    9490:	e1a03103 	lsl	r3, r3, #2
    9494:	e0833002 	add	r3, r3, r2
    9498:	e1a03103 	lsl	r3, r3, #2
    949c:	e0813003 	add	r3, r1, r3
    94a0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    94a4:	e1d220b2 	ldrh	r2, [r2, #2]
    94a8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    94ac:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    94b0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    94b4:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
}

__attribute__((__always_inline__)) static inline int session_remain_capacity(struct Session* session)
{
    return session->capacity - session_used_size(session);
    94b8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    94bc:	e5934004 	ldr	r4, [r3, #4]
    94c0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    94c4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    94c8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    94cc:	e593200c 	ldr	r2, [r3, #12]
    94d0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    94d4:	e5933004 	ldr	r3, [r3, #4]
    94d8:	e0822003 	add	r2, r2, r3
    94dc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    94e0:	e5933008 	ldr	r3, [r3, #8]
    94e4:	e0422003 	sub	r2, r2, r3
    94e8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    94ec:	e5933004 	ldr	r3, [r3, #4]
    94f0:	e1a01003 	mov	r1, r3
    94f4:	e1a00002 	mov	r0, r2
    94f8:	eb000993 	bl	bb4c <__aeabi_idivmod>
    94fc:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    9500:	e0443003 	sub	r3, r4, r3
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    9504:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    9508:	e1520003 	cmp	r2, r3
    950c:	da000004 	ble	9524 <ipc_server_loop+0x1e4>
        printf("forward tail with too much size\n");
    9510:	e3000c5c 	movw	r0, #3164	; 0xc5c
    9514:	e3400001 	movt	r0, #1
    9518:	ebfffd93 	bl	8b6c <printf>
        return -1;
    951c:	e3e03000 	mvn	r3, #0
    9520:	ea00000e 	b	9560 <ipc_server_loop+0x220>
    }
    session->tail = (session->tail + len) % session->capacity;
    9524:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9528:	e593200c 	ldr	r2, [r3, #12]
    952c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    9530:	e0822003 	add	r2, r2, r3
    9534:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9538:	e5933004 	ldr	r3, [r3, #4]
    953c:	e1a01003 	mov	r1, r3
    9540:	e1a00002 	mov	r0, r2
    9544:	eb000980 	bl	bb4c <__aeabi_idivmod>
    9548:	e1a03001 	mov	r3, r1
    954c:	e1a02003 	mov	r2, r3
    9550:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9554:	e583200c 	str	r2, [r3, #12]
    return session->tail;
    9558:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    955c:	e593300c 	ldr	r3, [r3, #12]
    9560:	e3530000 	cmp	r3, #0
    9564:	ba00007b 	blt	9758 <ipc_server_loop+0x418>
                    break;
                }
                if (ipc_node->interfaces[msg->header.opcode]) {
    9568:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    956c:	e5d33001 	ldrb	r3, [r3, #1]
    9570:	e51b2178 	ldr	r2, [fp, #-376]	; 0xfffffe88
    9574:	e1a03103 	lsl	r3, r3, #2
    9578:	e0823003 	add	r3, r2, r3
    957c:	e5933004 	ldr	r3, [r3, #4]
    9580:	e3530000 	cmp	r3, #0
    9584:	0a000011 	beq	95d0 <ipc_server_loop+0x290>
                    ipc_node->interfaces[msg->header.opcode](msg);
    9588:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    958c:	e5d33001 	ldrb	r3, [r3, #1]
    9590:	e51b2178 	ldr	r2, [fp, #-376]	; 0xfffffe88
    9594:	e1a03103 	lsl	r3, r3, #2
    9598:	e0823003 	add	r3, r2, r3
    959c:	e5933004 	ldr	r3, [r3, #4]
    95a0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    95a4:	e12fff33 	blx	r3
                    // check if this session is delayed by op handler, all messages after the delayed message in current session is blocked.
                    if (session_delayed) {
    95a8:	e3013a78 	movw	r3, #6776	; 0x1a78
    95ac:	e3403001 	movt	r3, #1
    95b0:	e5d33000 	ldrb	r3, [r3]
    95b4:	e3530000 	cmp	r3, #0
    95b8:	0a00000f 	beq	95fc <ipc_server_loop+0x2bc>
                        session_delayed = false;
    95bc:	e3013a78 	movw	r3, #6776	; 0x1a78
    95c0:	e3403001 	movt	r3, #1
    95c4:	e3a02000 	mov	r2, #0
    95c8:	e5c32000 	strb	r2, [r3]
                        break;
    95cc:	ea000062 	b	975c <ipc_server_loop+0x41c>
                    }
                } else {
                    printf("Unsupport opcode(%d) for server: %s\n", msg->header.opcode, ipc_node->name);
    95d0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    95d4:	e5d33001 	ldrb	r3, [r3, #1]
    95d8:	e1a01003 	mov	r1, r3
    95dc:	e51b3178 	ldr	r3, [fp, #-376]	; 0xfffffe88
    95e0:	e5933000 	ldr	r3, [r3]
    95e4:	e1a02003 	mov	r2, r3
    95e8:	e3000c80 	movw	r0, #3200	; 0xc80
    95ec:	e3400001 	movt	r0, #1
    95f0:	ebfffd5d 	bl	8b6c <printf>
                }
                // finish this message in server's perspective
                while (session_forward_head(&session_list[i], msg->header.len) < 0) {
    95f4:	ea000000 	b	95fc <ipc_server_loop+0x2bc>
                    yield();
    95f8:	eb0007fe 	bl	b5f8 <yield>
                while (session_forward_head(&session_list[i], msg->header.len) < 0) {
    95fc:	e24b1e17 	sub	r1, fp, #368	; 0x170
    9600:	e51b2010 	ldr	r2, [fp, #-16]
    9604:	e1a03002 	mov	r3, r2
    9608:	e1a03103 	lsl	r3, r3, #2
    960c:	e0833002 	add	r3, r3, r2
    9610:	e1a03103 	lsl	r3, r3, #2
    9614:	e0813003 	add	r3, r1, r3
    9618:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    961c:	e1d220b2 	ldrh	r2, [r2, #2]
    9620:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    9624:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    if (((session->head + len) % session->capacity) > session->tail) {
    9628:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    962c:	e5932008 	ldr	r2, [r3, #8]
    9630:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9634:	e0822003 	add	r2, r2, r3
    9638:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    963c:	e5933004 	ldr	r3, [r3, #4]
    9640:	e1a01003 	mov	r1, r3
    9644:	e1a00002 	mov	r0, r2
    9648:	eb00093f 	bl	bb4c <__aeabi_idivmod>
    964c:	e1a03001 	mov	r3, r1
    9650:	e1a02003 	mov	r2, r3
    9654:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9658:	e593300c 	ldr	r3, [r3, #12]
    965c:	e1520003 	cmp	r2, r3
    9660:	da000004 	ble	9678 <ipc_server_loop+0x338>
        printf("forward head with too much size\n");
    9664:	e3000ca8 	movw	r0, #3240	; 0xca8
    9668:	e3400001 	movt	r0, #1
    966c:	ebfffd3e 	bl	8b6c <printf>
        return -1;
    9670:	e3e03000 	mvn	r3, #0
    9674:	ea00000e 	b	96b4 <ipc_server_loop+0x374>
    session->head = (session->head + len) % session->capacity;
    9678:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    967c:	e5932008 	ldr	r2, [r3, #8]
    9680:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9684:	e0822003 	add	r2, r2, r3
    9688:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    968c:	e5933004 	ldr	r3, [r3, #4]
    9690:	e1a01003 	mov	r1, r3
    9694:	e1a00002 	mov	r0, r2
    9698:	eb00092b 	bl	bb4c <__aeabi_idivmod>
    969c:	e1a03001 	mov	r3, r1
    96a0:	e1a02003 	mov	r2, r3
    96a4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    96a8:	e5832008 	str	r2, [r3, #8]
    return session->head;
    96ac:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    96b0:	e5933008 	ldr	r3, [r3, #8]
    96b4:	e3530000 	cmp	r3, #0
    96b8:	baffffce 	blt	95f8 <ipc_server_loop+0x2b8>
                }
                msg = IPCSESSION_MSG(&session_list[i]);
    96bc:	e51b2010 	ldr	r2, [fp, #-16]
    96c0:	e1a03002 	mov	r3, r2
    96c4:	e1a03103 	lsl	r3, r3, #2
    96c8:	e0833002 	add	r3, r3, r2
    96cc:	e1a03103 	lsl	r3, r3, #2
    96d0:	e24b200c 	sub	r2, fp, #12
    96d4:	e0823003 	add	r3, r2, r3
    96d8:	e2433f55 	sub	r3, r3, #340	; 0x154
    96dc:	e5931000 	ldr	r1, [r3]
    96e0:	e51b2010 	ldr	r2, [fp, #-16]
    96e4:	e1a03002 	mov	r3, r2
    96e8:	e1a03103 	lsl	r3, r3, #2
    96ec:	e0833002 	add	r3, r3, r2
    96f0:	e1a03103 	lsl	r3, r3, #2
    96f4:	e24b200c 	sub	r2, fp, #12
    96f8:	e0823003 	add	r3, r2, r3
    96fc:	e2433f57 	sub	r3, r3, #348	; 0x15c
    9700:	e5933000 	ldr	r3, [r3]
    9704:	e0813003 	add	r3, r1, r3
    9708:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done != 1) {
    970c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9710:	e5932004 	ldr	r2, [r3, #4]
    9714:	e30d3cba 	movw	r3, #56506	; 0xdcba
    9718:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    971c:	e1520003 	cmp	r2, r3
    9720:	1a00000d 	bne	975c <ipc_server_loop+0x41c>
    9724:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9728:	e5d33000 	ldrb	r3, [r3]
    972c:	e2033001 	and	r3, r3, #1
    9730:	e6ef3073 	uxtb	r3, r3
    9734:	e3530000 	cmp	r3, #0
    9738:	0a000007 	beq	975c <ipc_server_loop+0x41c>
    973c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9740:	e5d33000 	ldrb	r3, [r3]
    9744:	e2033002 	and	r3, r3, #2
    9748:	e6ef3073 	uxtb	r3, r3
    974c:	e3530000 	cmp	r3, #0
    9750:	0affff33 	beq	9424 <ipc_server_loop+0xe4>
    9754:	ea000000 	b	975c <ipc_server_loop+0x41c>
                    break;
    9758:	e320f000 	nop	{0}
            }
            // stop handle this session
            cur_sess_id = -1;
    975c:	e3013088 	movw	r3, #4232	; 0x1088
    9760:	e3403001 	movt	r3, #1
    9764:	e3e02000 	mvn	r2, #0
    9768:	e5832000 	str	r2, [r3]
        for (int i = 0; i < NR_MAX_SESSION; i++) {
    976c:	e51b3010 	ldr	r3, [fp, #-16]
    9770:	e2833001 	add	r3, r3, #1
    9774:	e50b3010 	str	r3, [fp, #-16]
    9778:	e51b3010 	ldr	r3, [fp, #-16]
    977c:	e353000f 	cmp	r3, #15
    9780:	dafffef9 	ble	936c <ipc_server_loop+0x2c>
        poll_session(session_list, NR_MAX_SESSION);
    9784:	eafffef1 	b	9350 <ipc_server_loop+0x10>

00009788 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    9788:	e92d4800 	push	{fp, lr}
    978c:	e28db004 	add	fp, sp, #4
    9790:	e24dd010 	sub	sp, sp, #16
    9794:	e50b0008 	str	r0, [fp, #-8]
    9798:	e50b100c 	str	r1, [fp, #-12]
    979c:	e50b2010 	str	r2, [fp, #-16]
    return session(_path, _capacity, _session);
    97a0:	e51b2008 	ldr	r2, [fp, #-8]
    97a4:	e51b1010 	ldr	r1, [fp, #-16]
    97a8:	e51b000c 	ldr	r0, [fp, #-12]
    97ac:	eb0007ae 	bl	b66c <session>
    97b0:	e1a03000 	mov	r3, r0
}
    97b4:	e1a00003 	mov	r0, r3
    97b8:	e24bd004 	sub	sp, fp, #4
    97bc:	e8bd8800 	pop	{fp, pc}

000097c0 <free_session>:

int free_session(struct Session* session)
{
    97c0:	e92d4800 	push	{fp, lr}
    97c4:	e28db004 	add	fp, sp, #4
    97c8:	e24dd008 	sub	sp, sp, #8
    97cc:	e50b0008 	str	r0, [fp, #-8]
    return close_session(session);
    97d0:	e51b0008 	ldr	r0, [fp, #-8]
    97d4:	eb0007c6 	bl	b6f4 <close_session>
    97d8:	e1a03000 	mov	r3, r0
}
    97dc:	e1a00003 	mov	r0, r3
    97e0:	e24bd004 	sub	sp, fp, #4
    97e4:	e8bd8800 	pop	{fp, pc}

000097e8 <session_alloc_buf>:

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    97e8:	e92d4810 	push	{r4, fp, lr}
    97ec:	e28db008 	add	fp, sp, #8
    97f0:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    97f4:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    97f8:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    97fc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9800:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return session->capacity - session_used_size(session);
    9804:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9808:	e5934004 	ldr	r4, [r3, #4]
    980c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9810:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    9814:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9818:	e593200c 	ldr	r2, [r3, #12]
    981c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9820:	e5933004 	ldr	r3, [r3, #4]
    9824:	e0822003 	add	r2, r2, r3
    9828:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    982c:	e5933008 	ldr	r3, [r3, #8]
    9830:	e0422003 	sub	r2, r2, r3
    9834:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9838:	e5933004 	ldr	r3, [r3, #4]
    983c:	e1a01003 	mov	r1, r3
    9840:	e1a00002 	mov	r0, r2
    9844:	eb0008c0 	bl	bb4c <__aeabi_idivmod>
    9848:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    984c:	e0442003 	sub	r2, r4, r3
    if (len > session_remain_capacity(session)) {
    9850:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    9854:	e1520003 	cmp	r2, r3
    9858:	aa000001 	bge	9864 <session_alloc_buf+0x7c>
        return NULL;
    985c:	e3a03000 	mov	r3, #0
    9860:	ea000038 	b	9948 <session_alloc_buf+0x160>
    }
    void* buf = session->buf + session->tail;
    9864:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9868:	e5933010 	ldr	r3, [r3, #16]
    986c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    9870:	e592200c 	ldr	r2, [r2, #12]
    9874:	e0833002 	add	r3, r3, r2
    9878:	e50b3010 	str	r3, [fp, #-16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    987c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    9880:	e1a02003 	mov	r2, r3
    9884:	e3a01000 	mov	r1, #0
    9888:	e51b0010 	ldr	r0, [fp, #-16]
    988c:	eb0009a2 	bl	bf1c <memset>
    9890:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9894:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    9898:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    989c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    98a0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    98a4:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    98a8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    98ac:	e5934004 	ldr	r4, [r3, #4]
    98b0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    98b4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    98b8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    98bc:	e593200c 	ldr	r2, [r3, #12]
    98c0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    98c4:	e5933004 	ldr	r3, [r3, #4]
    98c8:	e0822003 	add	r2, r2, r3
    98cc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    98d0:	e5933008 	ldr	r3, [r3, #8]
    98d4:	e0422003 	sub	r2, r2, r3
    98d8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    98dc:	e5933004 	ldr	r3, [r3, #4]
    98e0:	e1a01003 	mov	r1, r3
    98e4:	e1a00002 	mov	r0, r2
    98e8:	eb000897 	bl	bb4c <__aeabi_idivmod>
    98ec:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    98f0:	e0443003 	sub	r3, r4, r3
    if (len > session_remain_capacity(session)) {
    98f4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    98f8:	e1520003 	cmp	r2, r3
    98fc:	da000003 	ble	9910 <session_alloc_buf+0x128>
        printf("forward tail with too much size\n");
    9900:	e3000d1c 	movw	r0, #3356	; 0xd1c
    9904:	e3400001 	movt	r0, #1
    9908:	ebfffc97 	bl	8b6c <printf>
    990c:	ea00000c 	b	9944 <session_alloc_buf+0x15c>
    session->tail = (session->tail + len) % session->capacity;
    9910:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9914:	e593200c 	ldr	r2, [r3, #12]
    9918:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    991c:	e0822003 	add	r2, r2, r3
    9920:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9924:	e5933004 	ldr	r3, [r3, #4]
    9928:	e1a01003 	mov	r1, r3
    992c:	e1a00002 	mov	r0, r2
    9930:	eb000885 	bl	bb4c <__aeabi_idivmod>
    9934:	e1a03001 	mov	r3, r1
    9938:	e1a02003 	mov	r2, r3
    993c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9940:	e583200c 	str	r2, [r3, #12]
    session_forward_tail(session, len);
    return buf;
    9944:	e51b3010 	ldr	r3, [fp, #-16]
}
    9948:	e1a00003 	mov	r0, r3
    994c:	e24bd008 	sub	sp, fp, #8
    9950:	e8bd8810 	pop	{r4, fp, pc}

00009954 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    9954:	e92d4800 	push	{fp, lr}
    9958:	e28db004 	add	fp, sp, #4
    995c:	e24dd018 	sub	sp, sp, #24
    9960:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    9964:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    9968:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    996c:	e50b3008 	str	r3, [fp, #-8]
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    9970:	e51b3008 	ldr	r3, [fp, #-8]
    9974:	e593200c 	ldr	r2, [r3, #12]
    9978:	e51b3008 	ldr	r3, [fp, #-8]
    997c:	e5933004 	ldr	r3, [r3, #4]
    9980:	e0822003 	add	r2, r2, r3
    9984:	e51b3008 	ldr	r3, [fp, #-8]
    9988:	e5933008 	ldr	r3, [r3, #8]
    998c:	e0422003 	sub	r2, r2, r3
    9990:	e51b3008 	ldr	r3, [fp, #-8]
    9994:	e5933004 	ldr	r3, [r3, #4]
    9998:	e1a01003 	mov	r1, r3
    999c:	e1a00002 	mov	r0, r2
    99a0:	eb000869 	bl	bb4c <__aeabi_idivmod>
    99a4:	e1a03001 	mov	r3, r1
    99a8:	e1a02003 	mov	r2, r3
    if (len > session_used_size(session)) {
    99ac:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    99b0:	e1520003 	cmp	r2, r3
    99b4:	aa000001 	bge	99c0 <session_free_buf+0x6c>
        return false;
    99b8:	e3a03000 	mov	r3, #0
    99bc:	ea000031 	b	9a88 <session_free_buf+0x134>
    99c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    99c4:	e50b300c 	str	r3, [fp, #-12]
    99c8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    99cc:	e50b3010 	str	r3, [fp, #-16]
    if (((session->head + len) % session->capacity) > session->tail) {
    99d0:	e51b300c 	ldr	r3, [fp, #-12]
    99d4:	e5932008 	ldr	r2, [r3, #8]
    99d8:	e51b3010 	ldr	r3, [fp, #-16]
    99dc:	e0822003 	add	r2, r2, r3
    99e0:	e51b300c 	ldr	r3, [fp, #-12]
    99e4:	e5933004 	ldr	r3, [r3, #4]
    99e8:	e1a01003 	mov	r1, r3
    99ec:	e1a00002 	mov	r0, r2
    99f0:	eb000855 	bl	bb4c <__aeabi_idivmod>
    99f4:	e1a03001 	mov	r3, r1
    99f8:	e1a02003 	mov	r2, r3
    99fc:	e51b300c 	ldr	r3, [fp, #-12]
    9a00:	e593300c 	ldr	r3, [r3, #12]
    9a04:	e1520003 	cmp	r2, r3
    9a08:	da000004 	ble	9a20 <session_free_buf+0xcc>
        printf("forward head with too much size\n");
    9a0c:	e3000d40 	movw	r0, #3392	; 0xd40
    9a10:	e3400001 	movt	r0, #1
    9a14:	ebfffc54 	bl	8b6c <printf>
        return -1;
    9a18:	e3e03000 	mvn	r3, #0
    9a1c:	ea00000e 	b	9a5c <session_free_buf+0x108>
    session->head = (session->head + len) % session->capacity;
    9a20:	e51b300c 	ldr	r3, [fp, #-12]
    9a24:	e5932008 	ldr	r2, [r3, #8]
    9a28:	e51b3010 	ldr	r3, [fp, #-16]
    9a2c:	e0822003 	add	r2, r2, r3
    9a30:	e51b300c 	ldr	r3, [fp, #-12]
    9a34:	e5933004 	ldr	r3, [r3, #4]
    9a38:	e1a01003 	mov	r1, r3
    9a3c:	e1a00002 	mov	r0, r2
    9a40:	eb000841 	bl	bb4c <__aeabi_idivmod>
    9a44:	e1a03001 	mov	r3, r1
    9a48:	e1a02003 	mov	r2, r3
    9a4c:	e51b300c 	ldr	r3, [fp, #-12]
    9a50:	e5832008 	str	r2, [r3, #8]
    return session->head;
    9a54:	e51b300c 	ldr	r3, [fp, #-12]
    9a58:	e5933008 	ldr	r3, [r3, #8]
    }
    assert(session_forward_head(session, len) != 1);
    9a5c:	e3530001 	cmp	r3, #1
    9a60:	1a000007 	bne	9a84 <session_free_buf+0x130>
    9a64:	e3003d64 	movw	r3, #3428	; 0xd64
    9a68:	e3403001 	movt	r3, #1
    9a6c:	e3002d98 	movw	r2, #3480	; 0xd98
    9a70:	e3402001 	movt	r2, #1
    9a74:	e3a01040 	mov	r1, #64	; 0x40
    9a78:	e3000d8c 	movw	r0, #3468	; 0xd8c
    9a7c:	e3400001 	movt	r0, #1
    9a80:	eb00083a 	bl	bb70 <__assert_func>
    return true;
    9a84:	e3a03001 	mov	r3, #1
}
    9a88:	e1a00003 	mov	r0, r3
    9a8c:	e24bd004 	sub	sp, fp, #4
    9a90:	e8bd8800 	pop	{fp, pc}

00009a94 <ipc_call_copy_args_Ipc_add>:
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
#include "simple_service.h"

IPC_INTERFACE(Ipc_add, 2, a, b, sizeof(int), sizeof(int));
    9a94:	e92d4800 	push	{fp, lr}
    9a98:	e28db004 	add	fp, sp, #4
    9a9c:	e24dd060 	sub	sp, sp, #96	; 0x60
    9aa0:	e50b0058 	str	r0, [fp, #-88]	; 0xffffffa8
    9aa4:	e50b105c 	str	r1, [fp, #-92]	; 0xffffffa4
    9aa8:	e50b2060 	str	r2, [fp, #-96]	; 0xffffffa0
    9aac:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    9ab0:	e3530000 	cmp	r3, #0
    9ab4:	1a000001 	bne	9ac0 <ipc_call_copy_args_Ipc_add+0x2c>
    9ab8:	e3e03000 	mvn	r3, #0
    9abc:	ea000077 	b	9ca0 <ipc_call_copy_args_Ipc_add+0x20c>
    9ac0:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    9ac4:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9ac8:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    9acc:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    9ad0:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9ad4:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    9ad8:	e3003e14 	movw	r3, #3604	; 0xe14
    9adc:	e3403001 	movt	r3, #1
    9ae0:	e24b2054 	sub	r2, fp, #84	; 0x54
    9ae4:	e8930003 	ldm	r3, {r0, r1}
    9ae8:	e8820003 	stm	r2, {r0, r1}
    9aec:	e24b3054 	sub	r3, fp, #84	; 0x54
    9af0:	e1a02003 	mov	r2, r3
    9af4:	e3a01002 	mov	r1, #2
    9af8:	e51b0040 	ldr	r0, [fp, #-64]	; 0xffffffc0
    9afc:	ebfffca5 	bl	8d98 <new_ipc_msg>
    9b00:	e1a03000 	mov	r3, r0
    9b04:	e50b3008 	str	r3, [fp, #-8]
    9b08:	e51b3008 	ldr	r3, [fp, #-8]
    9b0c:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    9b10:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    9b14:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    9b18:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9b1c:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    9b20:	e3a03004 	mov	r3, #4
    9b24:	e51b2038 	ldr	r2, [fp, #-56]	; 0xffffffc8
    9b28:	e3a01000 	mov	r1, #0
    9b2c:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    9b30:	ebfffd05 	bl	8f4c <ipc_msg_set_nth_arg>
    9b34:	e3a03004 	mov	r3, #4
    9b38:	e51b203c 	ldr	r2, [fp, #-60]	; 0xffffffc4
    9b3c:	e3a01001 	mov	r1, #1
    9b40:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    9b44:	ebfffd00 	bl	8f4c <ipc_msg_set_nth_arg>
    9b48:	e3a03001 	mov	r3, #1
    9b4c:	e50b300c 	str	r3, [fp, #-12]
    9b50:	e51b3008 	ldr	r3, [fp, #-8]
    9b54:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    9b58:	e3a03001 	mov	r3, #1
    9b5c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    if (opcode < 0 || opcode > UINT8_MAX) {
    9b60:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9b64:	e3530000 	cmp	r3, #0
    9b68:	ba000002 	blt	9b78 <ipc_call_copy_args_Ipc_add+0xe4>
    9b6c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9b70:	e35300ff 	cmp	r3, #255	; 0xff
    9b74:	da000001 	ble	9b80 <ipc_call_copy_args_Ipc_add+0xec>
        return false;
    9b78:	e3a03000 	mov	r3, #0
    9b7c:	ea000004 	b	9b94 <ipc_call_copy_args_Ipc_add+0x100>
    msg->header.opcode = opcode;
    9b80:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9b84:	e6ef2073 	uxtb	r2, r3
    9b88:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9b8c:	e5c32001 	strb	r2, [r3, #1]
    return true;
    9b90:	e3a03001 	mov	r3, #1
    9b94:	e50b300c 	str	r3, [fp, #-12]
    9b98:	e51b0008 	ldr	r0, [fp, #-8]
    9b9c:	ebfffd72 	bl	916c <ipc_msg_send_wait>
    9ba0:	e51b3008 	ldr	r3, [fp, #-8]
    9ba4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    9ba8:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    9bac:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    9bb0:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9bb4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    9bb8:	e3a03004 	mov	r3, #4
    9bbc:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9bc0:	e3a01000 	mov	r1, #0
    9bc4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9bc8:	ebfffd27 	bl	906c <ipc_msg_get_nth_arg>
    9bcc:	e3a03004 	mov	r3, #4
    9bd0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    9bd4:	e3a01001 	mov	r1, #1
    9bd8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9bdc:	ebfffd22 	bl	906c <ipc_msg_get_nth_arg>
    9be0:	e3a03001 	mov	r3, #1
    9be4:	e50b300c 	str	r3, [fp, #-12]
    9be8:	e3a03000 	mov	r3, #0
    9bec:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    9bf0:	e51b3008 	ldr	r3, [fp, #-8]
    9bf4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9bf8:	e24b304c 	sub	r3, fp, #76	; 0x4c
    9bfc:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9c00:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9c04:	e5d33000 	ldrb	r3, [r3]
    9c08:	e2033002 	and	r3, r3, #2
    9c0c:	e6ef3073 	uxtb	r3, r3
    9c10:	e3530000 	cmp	r3, #0
    9c14:	1a000007 	bne	9c38 <ipc_call_copy_args_Ipc_add+0x1a4>
    9c18:	e3003dac 	movw	r3, #3500	; 0xdac
    9c1c:	e3403001 	movt	r3, #1
    9c20:	e3002e1c 	movw	r2, #3612	; 0xe1c
    9c24:	e3402001 	movt	r2, #1
    9c28:	e3a01074 	mov	r1, #116	; 0x74
    9c2c:	e3000dc4 	movw	r0, #3524	; 0xdc4
    9c30:	e3400001 	movt	r0, #1
    9c34:	eb0007cd 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    9c38:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9c3c:	e2833008 	add	r3, r3, #8
    9c40:	e3a02004 	mov	r2, #4
    9c44:	e1a01003 	mov	r1, r3
    9c48:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    9c4c:	eb00081b 	bl	bcc0 <memcpy>
    9c50:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    9c54:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    9c58:	e51b3010 	ldr	r3, [fp, #-16]
    9c5c:	e5933010 	ldr	r3, [r3, #16]
    9c60:	e51b2010 	ldr	r2, [fp, #-16]
    9c64:	e5922008 	ldr	r2, [r2, #8]
    9c68:	e0833002 	add	r3, r3, r2
    9c6c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    9c70:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9c74:	e5d33000 	ldrb	r3, [r3]
    9c78:	e2033004 	and	r3, r3, #4
    9c7c:	e6ef3073 	uxtb	r3, r3
    9c80:	e3530000 	cmp	r3, #0
    9c84:	0a000004 	beq	9c9c <ipc_call_copy_args_Ipc_add+0x208>
    return session_free_buf(session, msg->header.len);
    9c88:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9c8c:	e1d330b2 	ldrh	r3, [r3, #2]
    9c90:	e1a01003 	mov	r1, r3
    9c94:	e51b0010 	ldr	r0, [fp, #-16]
    9c98:	ebffff2d 	bl	9954 <session_free_buf>
    9c9c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9ca0:	e1a00003 	mov	r0, r3
    9ca4:	e24bd004 	sub	sp, fp, #4
    9ca8:	e8bd8800 	pop	{fp, pc}

00009cac <add>:
int add(struct Session* session, int a, int b)
{
    9cac:	e92d4800 	push	{fp, lr}
    9cb0:	e28db004 	add	fp, sp, #4
    9cb4:	e24dd010 	sub	sp, sp, #16
    9cb8:	e50b0008 	str	r0, [fp, #-8]
    9cbc:	e50b100c 	str	r1, [fp, #-12]
    9cc0:	e50b2010 	str	r2, [fp, #-16]
    return IPC_CALL(Ipc_add)(session, &a, &b);
    9cc4:	e24b2010 	sub	r2, fp, #16
    9cc8:	e24b300c 	sub	r3, fp, #12
    9ccc:	e1a01003 	mov	r1, r3
    9cd0:	e51b0008 	ldr	r0, [fp, #-8]
    9cd4:	ebffff6e 	bl	9a94 <ipc_call_copy_args_Ipc_add>
    9cd8:	e1a03000 	mov	r3, r0
}
    9cdc:	e1a00003 	mov	r0, r3
    9ce0:	e24bd004 	sub	sp, fp, #4
    9ce4:	e8bd8800 	pop	{fp, pc}

00009ce8 <ipc_call_copy_args_Ipc_hello_string>:

IPC_INTERFACE(Ipc_hello_string, 2, buf, len, *(int*)len, sizeof(int));
    9ce8:	e92d4800 	push	{fp, lr}
    9cec:	e28db004 	add	fp, sp, #4
    9cf0:	e24dd060 	sub	sp, sp, #96	; 0x60
    9cf4:	e50b0058 	str	r0, [fp, #-88]	; 0xffffffa8
    9cf8:	e50b105c 	str	r1, [fp, #-92]	; 0xffffffa4
    9cfc:	e50b2060 	str	r2, [fp, #-96]	; 0xffffffa0
    9d00:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    9d04:	e3530000 	cmp	r3, #0
    9d08:	1a000001 	bne	9d14 <ipc_call_copy_args_Ipc_hello_string+0x2c>
    9d0c:	e3e03000 	mvn	r3, #0
    9d10:	ea000079 	b	9efc <ipc_call_copy_args_Ipc_hello_string+0x214>
    9d14:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    9d18:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9d1c:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    9d20:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    9d24:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9d28:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    9d2c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9d30:	e5933000 	ldr	r3, [r3]
    9d34:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    9d38:	e3a03004 	mov	r3, #4
    9d3c:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    9d40:	e24b3054 	sub	r3, fp, #84	; 0x54
    9d44:	e1a02003 	mov	r2, r3
    9d48:	e3a01002 	mov	r1, #2
    9d4c:	e51b0040 	ldr	r0, [fp, #-64]	; 0xffffffc0
    9d50:	ebfffc10 	bl	8d98 <new_ipc_msg>
    9d54:	e1a03000 	mov	r3, r0
    9d58:	e50b3008 	str	r3, [fp, #-8]
    9d5c:	e51b3008 	ldr	r3, [fp, #-8]
    9d60:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    9d64:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    9d68:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    9d6c:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9d70:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    9d74:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    9d78:	e5933000 	ldr	r3, [r3]
    9d7c:	e51b2038 	ldr	r2, [fp, #-56]	; 0xffffffc8
    9d80:	e3a01000 	mov	r1, #0
    9d84:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    9d88:	ebfffc6f 	bl	8f4c <ipc_msg_set_nth_arg>
    9d8c:	e3a03004 	mov	r3, #4
    9d90:	e51b203c 	ldr	r2, [fp, #-60]	; 0xffffffc4
    9d94:	e3a01001 	mov	r1, #1
    9d98:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    9d9c:	ebfffc6a 	bl	8f4c <ipc_msg_set_nth_arg>
    9da0:	e3a03001 	mov	r3, #1
    9da4:	e50b300c 	str	r3, [fp, #-12]
    9da8:	e51b3008 	ldr	r3, [fp, #-8]
    9dac:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    9db0:	e3a03002 	mov	r3, #2
    9db4:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    if (opcode < 0 || opcode > UINT8_MAX) {
    9db8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9dbc:	e3530000 	cmp	r3, #0
    9dc0:	ba000002 	blt	9dd0 <ipc_call_copy_args_Ipc_hello_string+0xe8>
    9dc4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9dc8:	e35300ff 	cmp	r3, #255	; 0xff
    9dcc:	da000001 	ble	9dd8 <ipc_call_copy_args_Ipc_hello_string+0xf0>
        return false;
    9dd0:	e3a03000 	mov	r3, #0
    9dd4:	ea000004 	b	9dec <ipc_call_copy_args_Ipc_hello_string+0x104>
    msg->header.opcode = opcode;
    9dd8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9ddc:	e6ef2073 	uxtb	r2, r3
    9de0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9de4:	e5c32001 	strb	r2, [r3, #1]
    return true;
    9de8:	e3a03001 	mov	r3, #1
    9dec:	e50b300c 	str	r3, [fp, #-12]
    9df0:	e51b0008 	ldr	r0, [fp, #-8]
    9df4:	ebfffcdc 	bl	916c <ipc_msg_send_wait>
    9df8:	e51b3008 	ldr	r3, [fp, #-8]
    9dfc:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    9e00:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    9e04:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    9e08:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9e0c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    9e10:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9e14:	e5933000 	ldr	r3, [r3]
    9e18:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9e1c:	e3a01000 	mov	r1, #0
    9e20:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9e24:	ebfffc90 	bl	906c <ipc_msg_get_nth_arg>
    9e28:	e3a03004 	mov	r3, #4
    9e2c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    9e30:	e3a01001 	mov	r1, #1
    9e34:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9e38:	ebfffc8b 	bl	906c <ipc_msg_get_nth_arg>
    9e3c:	e3a03001 	mov	r3, #1
    9e40:	e50b300c 	str	r3, [fp, #-12]
    9e44:	e3a03000 	mov	r3, #0
    9e48:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    9e4c:	e51b3008 	ldr	r3, [fp, #-8]
    9e50:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9e54:	e24b304c 	sub	r3, fp, #76	; 0x4c
    9e58:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9e5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9e60:	e5d33000 	ldrb	r3, [r3]
    9e64:	e2033002 	and	r3, r3, #2
    9e68:	e6ef3073 	uxtb	r3, r3
    9e6c:	e3530000 	cmp	r3, #0
    9e70:	1a000007 	bne	9e94 <ipc_call_copy_args_Ipc_hello_string+0x1ac>
    9e74:	e3003dac 	movw	r3, #3500	; 0xdac
    9e78:	e3403001 	movt	r3, #1
    9e7c:	e3002e1c 	movw	r2, #3612	; 0xe1c
    9e80:	e3402001 	movt	r2, #1
    9e84:	e3a01074 	mov	r1, #116	; 0x74
    9e88:	e3000dc4 	movw	r0, #3524	; 0xdc4
    9e8c:	e3400001 	movt	r0, #1
    9e90:	eb000736 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    9e94:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9e98:	e2833008 	add	r3, r3, #8
    9e9c:	e3a02004 	mov	r2, #4
    9ea0:	e1a01003 	mov	r1, r3
    9ea4:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    9ea8:	eb000784 	bl	bcc0 <memcpy>
    9eac:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    9eb0:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    9eb4:	e51b3010 	ldr	r3, [fp, #-16]
    9eb8:	e5933010 	ldr	r3, [r3, #16]
    9ebc:	e51b2010 	ldr	r2, [fp, #-16]
    9ec0:	e5922008 	ldr	r2, [r2, #8]
    9ec4:	e0833002 	add	r3, r3, r2
    9ec8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    9ecc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9ed0:	e5d33000 	ldrb	r3, [r3]
    9ed4:	e2033004 	and	r3, r3, #4
    9ed8:	e6ef3073 	uxtb	r3, r3
    9edc:	e3530000 	cmp	r3, #0
    9ee0:	0a000004 	beq	9ef8 <ipc_call_copy_args_Ipc_hello_string+0x210>
    return session_free_buf(session, msg->header.len);
    9ee4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9ee8:	e1d330b2 	ldrh	r3, [r3, #2]
    9eec:	e1a01003 	mov	r1, r3
    9ef0:	e51b0010 	ldr	r0, [fp, #-16]
    9ef4:	ebfffe96 	bl	9954 <session_free_buf>
    9ef8:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9efc:	e1a00003 	mov	r0, r3
    9f00:	e24bd004 	sub	sp, fp, #4
    9f04:	e8bd8800 	pop	{fp, pc}

00009f08 <hello_string>:
int hello_string(struct Session* session, char* buf, int len)
{
    9f08:	e92d4800 	push	{fp, lr}
    9f0c:	e28db004 	add	fp, sp, #4
    9f10:	e24dd010 	sub	sp, sp, #16
    9f14:	e50b0008 	str	r0, [fp, #-8]
    9f18:	e50b100c 	str	r1, [fp, #-12]
    9f1c:	e50b2010 	str	r2, [fp, #-16]
    return IPC_CALL(Ipc_hello_string)(session, buf, &len);
    9f20:	e24b3010 	sub	r3, fp, #16
    9f24:	e1a02003 	mov	r2, r3
    9f28:	e51b100c 	ldr	r1, [fp, #-12]
    9f2c:	e51b0008 	ldr	r0, [fp, #-8]
    9f30:	ebffff6c 	bl	9ce8 <ipc_call_copy_args_Ipc_hello_string>
    9f34:	e1a03000 	mov	r3, r0
}
    9f38:	e1a00003 	mov	r0, r3
    9f3c:	e24bd004 	sub	sp, fp, #4
    9f40:	e8bd8800 	pop	{fp, pc}

00009f44 <hello_string_nowait>:

struct IpcMsg* hello_string_nowait(struct Session* session, char** buf, int len)
{
    9f44:	e92d4800 	push	{fp, lr}
    9f48:	e28db004 	add	fp, sp, #4
    9f4c:	e24dd038 	sub	sp, sp, #56	; 0x38
    9f50:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    9f54:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    9f58:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
    struct IpcMsg* msg = IPC_CREATE_MSG_FUNC(Ipc_hello_string)(session, *buf, &len);
    9f5c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    9f60:	e5933000 	ldr	r3, [r3]
    9f64:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    9f68:	e50b201c 	str	r2, [fp, #-28]	; 0xffffffe4
    9f6c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    9f70:	e24b3038 	sub	r3, fp, #56	; 0x38
    9f74:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
IPC_INTERFACE(Ipc_hello_string, 2, buf, len, *(int*)len, sizeof(int));
    9f78:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    9f7c:	e5933000 	ldr	r3, [r3]
    9f80:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    9f84:	e3a03004 	mov	r3, #4
    9f88:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    9f8c:	e24b302c 	sub	r3, fp, #44	; 0x2c
    9f90:	e1a02003 	mov	r2, r3
    9f94:	e3a01002 	mov	r1, #2
    9f98:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    9f9c:	ebfffb7d 	bl	8d98 <new_ipc_msg>
    9fa0:	e1a03000 	mov	r3, r0
    struct IpcMsg* msg = IPC_CREATE_MSG_FUNC(Ipc_hello_string)(session, *buf, &len);
    9fa4:	e50b3008 	str	r3, [fp, #-8]
    9fa8:	e51b3008 	ldr	r3, [fp, #-8]
    9fac:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    9fb0:	e3a03000 	mov	r3, #0
    9fb4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    9fb8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9fbc:	e2833003 	add	r3, r3, #3
    9fc0:	e1a03103 	lsl	r3, r3, #2
    9fc4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    9fc8:	e0823003 	add	r3, r2, r3
    9fcc:	e1d330b0 	ldrh	r3, [r3]
    9fd0:	e1a02003 	mov	r2, r3
    9fd4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9fd8:	e0832002 	add	r2, r3, r2
    *buf = ipc_msg_get_nth_arg_buf(msg, 0);
    9fdc:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    9fe0:	e5832000 	str	r2, [r3]
    ipc_msg_set_nth_arg(msg, 1, &len, sizeof(int));
    9fe4:	e24b2038 	sub	r2, fp, #56	; 0x38
    9fe8:	e3a03004 	mov	r3, #4
    9fec:	e3a01001 	mov	r1, #1
    9ff0:	e51b0008 	ldr	r0, [fp, #-8]
    9ff4:	ebfffbd4 	bl	8f4c <ipc_msg_set_nth_arg>
    9ff8:	e51b3008 	ldr	r3, [fp, #-8]
    9ffc:	e50b300c 	str	r3, [fp, #-12]
    a000:	e3a03002 	mov	r3, #2
    a004:	e50b3010 	str	r3, [fp, #-16]
    if (opcode < 0 || opcode > UINT8_MAX) {
    a008:	e51b3010 	ldr	r3, [fp, #-16]
    a00c:	e3530000 	cmp	r3, #0
    a010:	ba000006 	blt	a030 <hello_string_nowait+0xec>
    a014:	e51b3010 	ldr	r3, [fp, #-16]
    a018:	e35300ff 	cmp	r3, #255	; 0xff
    a01c:	ca000003 	bgt	a030 <hello_string_nowait+0xec>
    msg->header.opcode = opcode;
    a020:	e51b3010 	ldr	r3, [fp, #-16]
    a024:	e6ef2073 	uxtb	r2, r3
    a028:	e51b300c 	ldr	r3, [fp, #-12]
    a02c:	e5c32001 	strb	r2, [r3, #1]
    ipc_msg_set_opcode(msg, Ipc_hello_string);
    ipc_msg_send_nowait(msg);
    a030:	e51b0008 	ldr	r0, [fp, #-8]
    a034:	ebfffc75 	bl	9210 <ipc_msg_send_nowait>
    return msg;
    a038:	e51b3008 	ldr	r3, [fp, #-8]
}
    a03c:	e1a00003 	mov	r0, r3
    a040:	e24bd004 	sub	sp, fp, #4
    a044:	e8bd8800 	pop	{fp, pc}

0000a048 <ipc_call_copy_args_Ipc_ls>:
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
#include "libfs_to_client.h"

IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    a048:	e92d4800 	push	{fp, lr}
    a04c:	e28db004 	add	fp, sp, #4
    a050:	e24dd048 	sub	sp, sp, #72	; 0x48
    a054:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    a058:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    a05c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a060:	e3530000 	cmp	r3, #0
    a064:	1a000001 	bne	a070 <ipc_call_copy_args_Ipc_ls+0x28>
    a068:	e3e03000 	mvn	r3, #0
    a06c:	ea00006d 	b	a228 <ipc_call_copy_args_Ipc_ls+0x1e0>
    a070:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a074:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    a078:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a07c:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    a080:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a084:	eb0007e9 	bl	c030 <strlen>
    a088:	e1a03000 	mov	r3, r0
    a08c:	e2833001 	add	r3, r3, #1
    a090:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    a094:	e24b3044 	sub	r3, fp, #68	; 0x44
    a098:	e1a02003 	mov	r2, r3
    a09c:	e3a01001 	mov	r1, #1
    a0a0:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    a0a4:	ebfffb3b 	bl	8d98 <new_ipc_msg>
    a0a8:	e1a03000 	mov	r3, r0
    a0ac:	e50b3008 	str	r3, [fp, #-8]
    a0b0:	e51b3008 	ldr	r3, [fp, #-8]
    a0b4:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    a0b8:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a0bc:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    a0c0:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    a0c4:	eb0007d9 	bl	c030 <strlen>
    a0c8:	e1a03000 	mov	r3, r0
    a0cc:	e2833001 	add	r3, r3, #1
    a0d0:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    a0d4:	e3a01000 	mov	r1, #0
    a0d8:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    a0dc:	ebfffb9a 	bl	8f4c <ipc_msg_set_nth_arg>
    a0e0:	e3a03001 	mov	r3, #1
    a0e4:	e50b300c 	str	r3, [fp, #-12]
    a0e8:	e51b3008 	ldr	r3, [fp, #-8]
    a0ec:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    a0f0:	e3a03001 	mov	r3, #1
    a0f4:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    a0f8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a0fc:	e3530000 	cmp	r3, #0
    a100:	ba000002 	blt	a110 <ipc_call_copy_args_Ipc_ls+0xc8>
    a104:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a108:	e35300ff 	cmp	r3, #255	; 0xff
    a10c:	da000001 	ble	a118 <ipc_call_copy_args_Ipc_ls+0xd0>
        return false;
    a110:	e3a03000 	mov	r3, #0
    a114:	ea000004 	b	a12c <ipc_call_copy_args_Ipc_ls+0xe4>
    msg->header.opcode = opcode;
    a118:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a11c:	e6ef2073 	uxtb	r2, r3
    a120:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a124:	e5c32001 	strb	r2, [r3, #1]
    return true;
    a128:	e3a03001 	mov	r3, #1
    a12c:	e50b300c 	str	r3, [fp, #-12]
    a130:	e51b0008 	ldr	r0, [fp, #-8]
    a134:	ebfffc0c 	bl	916c <ipc_msg_send_wait>
    a138:	e51b3008 	ldr	r3, [fp, #-8]
    a13c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    a140:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a144:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    a148:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    a14c:	eb0007b7 	bl	c030 <strlen>
    a150:	e1a03000 	mov	r3, r0
    a154:	e2833001 	add	r3, r3, #1
    a158:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    a15c:	e3a01000 	mov	r1, #0
    a160:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a164:	ebfffbc0 	bl	906c <ipc_msg_get_nth_arg>
    a168:	e3a03001 	mov	r3, #1
    a16c:	e50b300c 	str	r3, [fp, #-12]
    a170:	e3a03000 	mov	r3, #0
    a174:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    a178:	e51b3008 	ldr	r3, [fp, #-8]
    a17c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a180:	e24b3040 	sub	r3, fp, #64	; 0x40
    a184:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    a188:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a18c:	e5d33000 	ldrb	r3, [r3]
    a190:	e2033002 	and	r3, r3, #2
    a194:	e6ef3073 	uxtb	r3, r3
    a198:	e3530000 	cmp	r3, #0
    a19c:	1a000007 	bne	a1c0 <ipc_call_copy_args_Ipc_ls+0x178>
    a1a0:	e3003e30 	movw	r3, #3632	; 0xe30
    a1a4:	e3403001 	movt	r3, #1
    a1a8:	e3002e98 	movw	r2, #3736	; 0xe98
    a1ac:	e3402001 	movt	r2, #1
    a1b0:	e3a01074 	mov	r1, #116	; 0x74
    a1b4:	e3000e48 	movw	r0, #3656	; 0xe48
    a1b8:	e3400001 	movt	r0, #1
    a1bc:	eb00066b 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    a1c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a1c4:	e2833008 	add	r3, r3, #8
    a1c8:	e3a02004 	mov	r2, #4
    a1cc:	e1a01003 	mov	r1, r3
    a1d0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    a1d4:	eb0006b9 	bl	bcc0 <memcpy>
    a1d8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a1dc:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    a1e0:	e51b3010 	ldr	r3, [fp, #-16]
    a1e4:	e5933010 	ldr	r3, [r3, #16]
    a1e8:	e51b2010 	ldr	r2, [fp, #-16]
    a1ec:	e5922008 	ldr	r2, [r2, #8]
    a1f0:	e0833002 	add	r3, r3, r2
    a1f4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    a1f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a1fc:	e5d33000 	ldrb	r3, [r3]
    a200:	e2033004 	and	r3, r3, #4
    a204:	e6ef3073 	uxtb	r3, r3
    a208:	e3530000 	cmp	r3, #0
    a20c:	0a000004 	beq	a224 <ipc_call_copy_args_Ipc_ls+0x1dc>
    return session_free_buf(session, msg->header.len);
    a210:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a214:	e1d330b2 	ldrh	r3, [r3, #2]
    a218:	e1a01003 	mov	r1, r3
    a21c:	e51b0010 	ldr	r0, [fp, #-16]
    a220:	ebfffdcb 	bl	9954 <session_free_buf>
    a224:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    a228:	e1a00003 	mov	r0, r3
    a22c:	e24bd004 	sub	sp, fp, #4
    a230:	e8bd8800 	pop	{fp, pc}

0000a234 <ls>:
int ls(struct Session* session, char* path)
{
    a234:	e92d4800 	push	{fp, lr}
    a238:	e28db004 	add	fp, sp, #4
    a23c:	e24dd008 	sub	sp, sp, #8
    a240:	e50b0008 	str	r0, [fp, #-8]
    a244:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_ls)(session, path);
    a248:	e51b100c 	ldr	r1, [fp, #-12]
    a24c:	e51b0008 	ldr	r0, [fp, #-8]
    a250:	ebffff7c 	bl	a048 <ipc_call_copy_args_Ipc_ls>
    a254:	e1a03000 	mov	r3, r0
}
    a258:	e1a00003 	mov	r0, r3
    a25c:	e24bd004 	sub	sp, fp, #4
    a260:	e8bd8800 	pop	{fp, pc}

0000a264 <ipc_call_copy_args_Ipc_cd>:

IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    a264:	e92d4800 	push	{fp, lr}
    a268:	e28db004 	add	fp, sp, #4
    a26c:	e24dd048 	sub	sp, sp, #72	; 0x48
    a270:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    a274:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    a278:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a27c:	e3530000 	cmp	r3, #0
    a280:	1a000001 	bne	a28c <ipc_call_copy_args_Ipc_cd+0x28>
    a284:	e3e03000 	mvn	r3, #0
    a288:	ea00006d 	b	a444 <ipc_call_copy_args_Ipc_cd+0x1e0>
    a28c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a290:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    a294:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a298:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    a29c:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a2a0:	eb000762 	bl	c030 <strlen>
    a2a4:	e1a03000 	mov	r3, r0
    a2a8:	e2833001 	add	r3, r3, #1
    a2ac:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    a2b0:	e24b3044 	sub	r3, fp, #68	; 0x44
    a2b4:	e1a02003 	mov	r2, r3
    a2b8:	e3a01001 	mov	r1, #1
    a2bc:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    a2c0:	ebfffab4 	bl	8d98 <new_ipc_msg>
    a2c4:	e1a03000 	mov	r3, r0
    a2c8:	e50b3008 	str	r3, [fp, #-8]
    a2cc:	e51b3008 	ldr	r3, [fp, #-8]
    a2d0:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    a2d4:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a2d8:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    a2dc:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    a2e0:	eb000752 	bl	c030 <strlen>
    a2e4:	e1a03000 	mov	r3, r0
    a2e8:	e2833001 	add	r3, r3, #1
    a2ec:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    a2f0:	e3a01000 	mov	r1, #0
    a2f4:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    a2f8:	ebfffb13 	bl	8f4c <ipc_msg_set_nth_arg>
    a2fc:	e3a03001 	mov	r3, #1
    a300:	e50b300c 	str	r3, [fp, #-12]
    a304:	e51b3008 	ldr	r3, [fp, #-8]
    a308:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    a30c:	e3a03002 	mov	r3, #2
    a310:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    a314:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a318:	e3530000 	cmp	r3, #0
    a31c:	ba000002 	blt	a32c <ipc_call_copy_args_Ipc_cd+0xc8>
    a320:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a324:	e35300ff 	cmp	r3, #255	; 0xff
    a328:	da000001 	ble	a334 <ipc_call_copy_args_Ipc_cd+0xd0>
        return false;
    a32c:	e3a03000 	mov	r3, #0
    a330:	ea000004 	b	a348 <ipc_call_copy_args_Ipc_cd+0xe4>
    msg->header.opcode = opcode;
    a334:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a338:	e6ef2073 	uxtb	r2, r3
    a33c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a340:	e5c32001 	strb	r2, [r3, #1]
    return true;
    a344:	e3a03001 	mov	r3, #1
    a348:	e50b300c 	str	r3, [fp, #-12]
    a34c:	e51b0008 	ldr	r0, [fp, #-8]
    a350:	ebfffb85 	bl	916c <ipc_msg_send_wait>
    a354:	e51b3008 	ldr	r3, [fp, #-8]
    a358:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    a35c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a360:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    a364:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    a368:	eb000730 	bl	c030 <strlen>
    a36c:	e1a03000 	mov	r3, r0
    a370:	e2833001 	add	r3, r3, #1
    a374:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    a378:	e3a01000 	mov	r1, #0
    a37c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a380:	ebfffb39 	bl	906c <ipc_msg_get_nth_arg>
    a384:	e3a03001 	mov	r3, #1
    a388:	e50b300c 	str	r3, [fp, #-12]
    a38c:	e3a03000 	mov	r3, #0
    a390:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    a394:	e51b3008 	ldr	r3, [fp, #-8]
    a398:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a39c:	e24b3040 	sub	r3, fp, #64	; 0x40
    a3a0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    a3a4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a3a8:	e5d33000 	ldrb	r3, [r3]
    a3ac:	e2033002 	and	r3, r3, #2
    a3b0:	e6ef3073 	uxtb	r3, r3
    a3b4:	e3530000 	cmp	r3, #0
    a3b8:	1a000007 	bne	a3dc <ipc_call_copy_args_Ipc_cd+0x178>
    a3bc:	e3003e30 	movw	r3, #3632	; 0xe30
    a3c0:	e3403001 	movt	r3, #1
    a3c4:	e3002e98 	movw	r2, #3736	; 0xe98
    a3c8:	e3402001 	movt	r2, #1
    a3cc:	e3a01074 	mov	r1, #116	; 0x74
    a3d0:	e3000e48 	movw	r0, #3656	; 0xe48
    a3d4:	e3400001 	movt	r0, #1
    a3d8:	eb0005e4 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    a3dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a3e0:	e2833008 	add	r3, r3, #8
    a3e4:	e3a02004 	mov	r2, #4
    a3e8:	e1a01003 	mov	r1, r3
    a3ec:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    a3f0:	eb000632 	bl	bcc0 <memcpy>
    a3f4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a3f8:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    a3fc:	e51b3010 	ldr	r3, [fp, #-16]
    a400:	e5933010 	ldr	r3, [r3, #16]
    a404:	e51b2010 	ldr	r2, [fp, #-16]
    a408:	e5922008 	ldr	r2, [r2, #8]
    a40c:	e0833002 	add	r3, r3, r2
    a410:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    a414:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a418:	e5d33000 	ldrb	r3, [r3]
    a41c:	e2033004 	and	r3, r3, #4
    a420:	e6ef3073 	uxtb	r3, r3
    a424:	e3530000 	cmp	r3, #0
    a428:	0a000004 	beq	a440 <ipc_call_copy_args_Ipc_cd+0x1dc>
    return session_free_buf(session, msg->header.len);
    a42c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a430:	e1d330b2 	ldrh	r3, [r3, #2]
    a434:	e1a01003 	mov	r1, r3
    a438:	e51b0010 	ldr	r0, [fp, #-16]
    a43c:	ebfffd44 	bl	9954 <session_free_buf>
    a440:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    a444:	e1a00003 	mov	r0, r3
    a448:	e24bd004 	sub	sp, fp, #4
    a44c:	e8bd8800 	pop	{fp, pc}

0000a450 <cd>:
int cd(struct Session* session, char* path)
{
    a450:	e92d4800 	push	{fp, lr}
    a454:	e28db004 	add	fp, sp, #4
    a458:	e24dd008 	sub	sp, sp, #8
    a45c:	e50b0008 	str	r0, [fp, #-8]
    a460:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_cd)(session, path);
    a464:	e51b100c 	ldr	r1, [fp, #-12]
    a468:	e51b0008 	ldr	r0, [fp, #-8]
    a46c:	ebffff7c 	bl	a264 <ipc_call_copy_args_Ipc_cd>
    a470:	e1a03000 	mov	r3, r0
}
    a474:	e1a00003 	mov	r0, r3
    a478:	e24bd004 	sub	sp, fp, #4
    a47c:	e8bd8800 	pop	{fp, pc}

0000a480 <ipc_call_copy_args_Ipc_mkdir>:

IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    a480:	e92d4800 	push	{fp, lr}
    a484:	e28db004 	add	fp, sp, #4
    a488:	e24dd048 	sub	sp, sp, #72	; 0x48
    a48c:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    a490:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    a494:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a498:	e3530000 	cmp	r3, #0
    a49c:	1a000001 	bne	a4a8 <ipc_call_copy_args_Ipc_mkdir+0x28>
    a4a0:	e3e03000 	mvn	r3, #0
    a4a4:	ea00006d 	b	a660 <ipc_call_copy_args_Ipc_mkdir+0x1e0>
    a4a8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a4ac:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    a4b0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a4b4:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    a4b8:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a4bc:	eb0006db 	bl	c030 <strlen>
    a4c0:	e1a03000 	mov	r3, r0
    a4c4:	e2833001 	add	r3, r3, #1
    a4c8:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    a4cc:	e24b3044 	sub	r3, fp, #68	; 0x44
    a4d0:	e1a02003 	mov	r2, r3
    a4d4:	e3a01001 	mov	r1, #1
    a4d8:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    a4dc:	ebfffa2d 	bl	8d98 <new_ipc_msg>
    a4e0:	e1a03000 	mov	r3, r0
    a4e4:	e50b3008 	str	r3, [fp, #-8]
    a4e8:	e51b3008 	ldr	r3, [fp, #-8]
    a4ec:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    a4f0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a4f4:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    a4f8:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    a4fc:	eb0006cb 	bl	c030 <strlen>
    a500:	e1a03000 	mov	r3, r0
    a504:	e2833001 	add	r3, r3, #1
    a508:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    a50c:	e3a01000 	mov	r1, #0
    a510:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    a514:	ebfffa8c 	bl	8f4c <ipc_msg_set_nth_arg>
    a518:	e3a03001 	mov	r3, #1
    a51c:	e50b300c 	str	r3, [fp, #-12]
    a520:	e51b3008 	ldr	r3, [fp, #-8]
    a524:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    a528:	e3a03003 	mov	r3, #3
    a52c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    a530:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a534:	e3530000 	cmp	r3, #0
    a538:	ba000002 	blt	a548 <ipc_call_copy_args_Ipc_mkdir+0xc8>
    a53c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a540:	e35300ff 	cmp	r3, #255	; 0xff
    a544:	da000001 	ble	a550 <ipc_call_copy_args_Ipc_mkdir+0xd0>
        return false;
    a548:	e3a03000 	mov	r3, #0
    a54c:	ea000004 	b	a564 <ipc_call_copy_args_Ipc_mkdir+0xe4>
    msg->header.opcode = opcode;
    a550:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a554:	e6ef2073 	uxtb	r2, r3
    a558:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a55c:	e5c32001 	strb	r2, [r3, #1]
    return true;
    a560:	e3a03001 	mov	r3, #1
    a564:	e50b300c 	str	r3, [fp, #-12]
    a568:	e51b0008 	ldr	r0, [fp, #-8]
    a56c:	ebfffafe 	bl	916c <ipc_msg_send_wait>
    a570:	e51b3008 	ldr	r3, [fp, #-8]
    a574:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    a578:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a57c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    a580:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    a584:	eb0006a9 	bl	c030 <strlen>
    a588:	e1a03000 	mov	r3, r0
    a58c:	e2833001 	add	r3, r3, #1
    a590:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    a594:	e3a01000 	mov	r1, #0
    a598:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a59c:	ebfffab2 	bl	906c <ipc_msg_get_nth_arg>
    a5a0:	e3a03001 	mov	r3, #1
    a5a4:	e50b300c 	str	r3, [fp, #-12]
    a5a8:	e3a03000 	mov	r3, #0
    a5ac:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    a5b0:	e51b3008 	ldr	r3, [fp, #-8]
    a5b4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a5b8:	e24b3040 	sub	r3, fp, #64	; 0x40
    a5bc:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    a5c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a5c4:	e5d33000 	ldrb	r3, [r3]
    a5c8:	e2033002 	and	r3, r3, #2
    a5cc:	e6ef3073 	uxtb	r3, r3
    a5d0:	e3530000 	cmp	r3, #0
    a5d4:	1a000007 	bne	a5f8 <ipc_call_copy_args_Ipc_mkdir+0x178>
    a5d8:	e3003e30 	movw	r3, #3632	; 0xe30
    a5dc:	e3403001 	movt	r3, #1
    a5e0:	e3002e98 	movw	r2, #3736	; 0xe98
    a5e4:	e3402001 	movt	r2, #1
    a5e8:	e3a01074 	mov	r1, #116	; 0x74
    a5ec:	e3000e48 	movw	r0, #3656	; 0xe48
    a5f0:	e3400001 	movt	r0, #1
    a5f4:	eb00055d 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    a5f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a5fc:	e2833008 	add	r3, r3, #8
    a600:	e3a02004 	mov	r2, #4
    a604:	e1a01003 	mov	r1, r3
    a608:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    a60c:	eb0005ab 	bl	bcc0 <memcpy>
    a610:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a614:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    a618:	e51b3010 	ldr	r3, [fp, #-16]
    a61c:	e5933010 	ldr	r3, [r3, #16]
    a620:	e51b2010 	ldr	r2, [fp, #-16]
    a624:	e5922008 	ldr	r2, [r2, #8]
    a628:	e0833002 	add	r3, r3, r2
    a62c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    a630:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a634:	e5d33000 	ldrb	r3, [r3]
    a638:	e2033004 	and	r3, r3, #4
    a63c:	e6ef3073 	uxtb	r3, r3
    a640:	e3530000 	cmp	r3, #0
    a644:	0a000004 	beq	a65c <ipc_call_copy_args_Ipc_mkdir+0x1dc>
    return session_free_buf(session, msg->header.len);
    a648:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a64c:	e1d330b2 	ldrh	r3, [r3, #2]
    a650:	e1a01003 	mov	r1, r3
    a654:	e51b0010 	ldr	r0, [fp, #-16]
    a658:	ebfffcbd 	bl	9954 <session_free_buf>
    a65c:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    a660:	e1a00003 	mov	r0, r3
    a664:	e24bd004 	sub	sp, fp, #4
    a668:	e8bd8800 	pop	{fp, pc}

0000a66c <mkdir>:
int mkdir(struct Session* session, char* path)
{
    a66c:	e92d4800 	push	{fp, lr}
    a670:	e28db004 	add	fp, sp, #4
    a674:	e24dd008 	sub	sp, sp, #8
    a678:	e50b0008 	str	r0, [fp, #-8]
    a67c:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_mkdir)(session, path);
    a680:	e51b100c 	ldr	r1, [fp, #-12]
    a684:	e51b0008 	ldr	r0, [fp, #-8]
    a688:	ebffff7c 	bl	a480 <ipc_call_copy_args_Ipc_mkdir>
    a68c:	e1a03000 	mov	r3, r0
}
    a690:	e1a00003 	mov	r0, r3
    a694:	e24bd004 	sub	sp, fp, #4
    a698:	e8bd8800 	pop	{fp, pc}

0000a69c <ipc_call_copy_args_Ipc_delete>:

IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    a69c:	e92d4800 	push	{fp, lr}
    a6a0:	e28db004 	add	fp, sp, #4
    a6a4:	e24dd048 	sub	sp, sp, #72	; 0x48
    a6a8:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    a6ac:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    a6b0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a6b4:	e3530000 	cmp	r3, #0
    a6b8:	1a000001 	bne	a6c4 <ipc_call_copy_args_Ipc_delete+0x28>
    a6bc:	e3e03000 	mvn	r3, #0
    a6c0:	ea00006d 	b	a87c <ipc_call_copy_args_Ipc_delete+0x1e0>
    a6c4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a6c8:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    a6cc:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a6d0:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    a6d4:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a6d8:	eb000654 	bl	c030 <strlen>
    a6dc:	e1a03000 	mov	r3, r0
    a6e0:	e2833001 	add	r3, r3, #1
    a6e4:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    a6e8:	e24b3044 	sub	r3, fp, #68	; 0x44
    a6ec:	e1a02003 	mov	r2, r3
    a6f0:	e3a01001 	mov	r1, #1
    a6f4:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    a6f8:	ebfff9a6 	bl	8d98 <new_ipc_msg>
    a6fc:	e1a03000 	mov	r3, r0
    a700:	e50b3008 	str	r3, [fp, #-8]
    a704:	e51b3008 	ldr	r3, [fp, #-8]
    a708:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    a70c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a710:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    a714:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    a718:	eb000644 	bl	c030 <strlen>
    a71c:	e1a03000 	mov	r3, r0
    a720:	e2833001 	add	r3, r3, #1
    a724:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    a728:	e3a01000 	mov	r1, #0
    a72c:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    a730:	ebfffa05 	bl	8f4c <ipc_msg_set_nth_arg>
    a734:	e3a03001 	mov	r3, #1
    a738:	e50b300c 	str	r3, [fp, #-12]
    a73c:	e51b3008 	ldr	r3, [fp, #-8]
    a740:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    a744:	e3a03004 	mov	r3, #4
    a748:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    a74c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a750:	e3530000 	cmp	r3, #0
    a754:	ba000002 	blt	a764 <ipc_call_copy_args_Ipc_delete+0xc8>
    a758:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a75c:	e35300ff 	cmp	r3, #255	; 0xff
    a760:	da000001 	ble	a76c <ipc_call_copy_args_Ipc_delete+0xd0>
        return false;
    a764:	e3a03000 	mov	r3, #0
    a768:	ea000004 	b	a780 <ipc_call_copy_args_Ipc_delete+0xe4>
    msg->header.opcode = opcode;
    a76c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a770:	e6ef2073 	uxtb	r2, r3
    a774:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a778:	e5c32001 	strb	r2, [r3, #1]
    return true;
    a77c:	e3a03001 	mov	r3, #1
    a780:	e50b300c 	str	r3, [fp, #-12]
    a784:	e51b0008 	ldr	r0, [fp, #-8]
    a788:	ebfffa77 	bl	916c <ipc_msg_send_wait>
    a78c:	e51b3008 	ldr	r3, [fp, #-8]
    a790:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    a794:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a798:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    a79c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    a7a0:	eb000622 	bl	c030 <strlen>
    a7a4:	e1a03000 	mov	r3, r0
    a7a8:	e2833001 	add	r3, r3, #1
    a7ac:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    a7b0:	e3a01000 	mov	r1, #0
    a7b4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a7b8:	ebfffa2b 	bl	906c <ipc_msg_get_nth_arg>
    a7bc:	e3a03001 	mov	r3, #1
    a7c0:	e50b300c 	str	r3, [fp, #-12]
    a7c4:	e3a03000 	mov	r3, #0
    a7c8:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    a7cc:	e51b3008 	ldr	r3, [fp, #-8]
    a7d0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a7d4:	e24b3040 	sub	r3, fp, #64	; 0x40
    a7d8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    a7dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a7e0:	e5d33000 	ldrb	r3, [r3]
    a7e4:	e2033002 	and	r3, r3, #2
    a7e8:	e6ef3073 	uxtb	r3, r3
    a7ec:	e3530000 	cmp	r3, #0
    a7f0:	1a000007 	bne	a814 <ipc_call_copy_args_Ipc_delete+0x178>
    a7f4:	e3003e30 	movw	r3, #3632	; 0xe30
    a7f8:	e3403001 	movt	r3, #1
    a7fc:	e3002e98 	movw	r2, #3736	; 0xe98
    a800:	e3402001 	movt	r2, #1
    a804:	e3a01074 	mov	r1, #116	; 0x74
    a808:	e3000e48 	movw	r0, #3656	; 0xe48
    a80c:	e3400001 	movt	r0, #1
    a810:	eb0004d6 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    a814:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a818:	e2833008 	add	r3, r3, #8
    a81c:	e3a02004 	mov	r2, #4
    a820:	e1a01003 	mov	r1, r3
    a824:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    a828:	eb000524 	bl	bcc0 <memcpy>
    a82c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a830:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    a834:	e51b3010 	ldr	r3, [fp, #-16]
    a838:	e5933010 	ldr	r3, [r3, #16]
    a83c:	e51b2010 	ldr	r2, [fp, #-16]
    a840:	e5922008 	ldr	r2, [r2, #8]
    a844:	e0833002 	add	r3, r3, r2
    a848:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    a84c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a850:	e5d33000 	ldrb	r3, [r3]
    a854:	e2033004 	and	r3, r3, #4
    a858:	e6ef3073 	uxtb	r3, r3
    a85c:	e3530000 	cmp	r3, #0
    a860:	0a000004 	beq	a878 <ipc_call_copy_args_Ipc_delete+0x1dc>
    return session_free_buf(session, msg->header.len);
    a864:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a868:	e1d330b2 	ldrh	r3, [r3, #2]
    a86c:	e1a01003 	mov	r1, r3
    a870:	e51b0010 	ldr	r0, [fp, #-16]
    a874:	ebfffc36 	bl	9954 <session_free_buf>
    a878:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    a87c:	e1a00003 	mov	r0, r3
    a880:	e24bd004 	sub	sp, fp, #4
    a884:	e8bd8800 	pop	{fp, pc}

0000a888 <rm>:
int rm(struct Session* session, char* path)
{
    a888:	e92d4800 	push	{fp, lr}
    a88c:	e28db004 	add	fp, sp, #4
    a890:	e24dd008 	sub	sp, sp, #8
    a894:	e50b0008 	str	r0, [fp, #-8]
    a898:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_delete)(session, path);
    a89c:	e51b100c 	ldr	r1, [fp, #-12]
    a8a0:	e51b0008 	ldr	r0, [fp, #-8]
    a8a4:	ebffff7c 	bl	a69c <ipc_call_copy_args_Ipc_delete>
    a8a8:	e1a03000 	mov	r3, r0
}
    a8ac:	e1a00003 	mov	r0, r3
    a8b0:	e24bd004 	sub	sp, fp, #4
    a8b4:	e8bd8800 	pop	{fp, pc}

0000a8b8 <ipc_call_copy_args_Ipc_cat>:

IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    a8b8:	e92d4800 	push	{fp, lr}
    a8bc:	e28db004 	add	fp, sp, #4
    a8c0:	e24dd048 	sub	sp, sp, #72	; 0x48
    a8c4:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    a8c8:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    a8cc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a8d0:	e3530000 	cmp	r3, #0
    a8d4:	1a000001 	bne	a8e0 <ipc_call_copy_args_Ipc_cat+0x28>
    a8d8:	e3e03000 	mvn	r3, #0
    a8dc:	ea00006d 	b	aa98 <ipc_call_copy_args_Ipc_cat+0x1e0>
    a8e0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a8e4:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    a8e8:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a8ec:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    a8f0:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a8f4:	eb0005cd 	bl	c030 <strlen>
    a8f8:	e1a03000 	mov	r3, r0
    a8fc:	e2833001 	add	r3, r3, #1
    a900:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    a904:	e24b3044 	sub	r3, fp, #68	; 0x44
    a908:	e1a02003 	mov	r2, r3
    a90c:	e3a01001 	mov	r1, #1
    a910:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    a914:	ebfff91f 	bl	8d98 <new_ipc_msg>
    a918:	e1a03000 	mov	r3, r0
    a91c:	e50b3008 	str	r3, [fp, #-8]
    a920:	e51b3008 	ldr	r3, [fp, #-8]
    a924:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    a928:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a92c:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    a930:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    a934:	eb0005bd 	bl	c030 <strlen>
    a938:	e1a03000 	mov	r3, r0
    a93c:	e2833001 	add	r3, r3, #1
    a940:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    a944:	e3a01000 	mov	r1, #0
    a948:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    a94c:	ebfff97e 	bl	8f4c <ipc_msg_set_nth_arg>
    a950:	e3a03001 	mov	r3, #1
    a954:	e50b300c 	str	r3, [fp, #-12]
    a958:	e51b3008 	ldr	r3, [fp, #-8]
    a95c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    a960:	e3a03005 	mov	r3, #5
    a964:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    a968:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a96c:	e3530000 	cmp	r3, #0
    a970:	ba000002 	blt	a980 <ipc_call_copy_args_Ipc_cat+0xc8>
    a974:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a978:	e35300ff 	cmp	r3, #255	; 0xff
    a97c:	da000001 	ble	a988 <ipc_call_copy_args_Ipc_cat+0xd0>
        return false;
    a980:	e3a03000 	mov	r3, #0
    a984:	ea000004 	b	a99c <ipc_call_copy_args_Ipc_cat+0xe4>
    msg->header.opcode = opcode;
    a988:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a98c:	e6ef2073 	uxtb	r2, r3
    a990:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a994:	e5c32001 	strb	r2, [r3, #1]
    return true;
    a998:	e3a03001 	mov	r3, #1
    a99c:	e50b300c 	str	r3, [fp, #-12]
    a9a0:	e51b0008 	ldr	r0, [fp, #-8]
    a9a4:	ebfff9f0 	bl	916c <ipc_msg_send_wait>
    a9a8:	e51b3008 	ldr	r3, [fp, #-8]
    a9ac:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    a9b0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a9b4:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    a9b8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    a9bc:	eb00059b 	bl	c030 <strlen>
    a9c0:	e1a03000 	mov	r3, r0
    a9c4:	e2833001 	add	r3, r3, #1
    a9c8:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    a9cc:	e3a01000 	mov	r1, #0
    a9d0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a9d4:	ebfff9a4 	bl	906c <ipc_msg_get_nth_arg>
    a9d8:	e3a03001 	mov	r3, #1
    a9dc:	e50b300c 	str	r3, [fp, #-12]
    a9e0:	e3a03000 	mov	r3, #0
    a9e4:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    a9e8:	e51b3008 	ldr	r3, [fp, #-8]
    a9ec:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a9f0:	e24b3040 	sub	r3, fp, #64	; 0x40
    a9f4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    a9f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a9fc:	e5d33000 	ldrb	r3, [r3]
    aa00:	e2033002 	and	r3, r3, #2
    aa04:	e6ef3073 	uxtb	r3, r3
    aa08:	e3530000 	cmp	r3, #0
    aa0c:	1a000007 	bne	aa30 <ipc_call_copy_args_Ipc_cat+0x178>
    aa10:	e3003e30 	movw	r3, #3632	; 0xe30
    aa14:	e3403001 	movt	r3, #1
    aa18:	e3002e98 	movw	r2, #3736	; 0xe98
    aa1c:	e3402001 	movt	r2, #1
    aa20:	e3a01074 	mov	r1, #116	; 0x74
    aa24:	e3000e48 	movw	r0, #3656	; 0xe48
    aa28:	e3400001 	movt	r0, #1
    aa2c:	eb00044f 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    aa30:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    aa34:	e2833008 	add	r3, r3, #8
    aa38:	e3a02004 	mov	r2, #4
    aa3c:	e1a01003 	mov	r1, r3
    aa40:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    aa44:	eb00049d 	bl	bcc0 <memcpy>
    aa48:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    aa4c:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    aa50:	e51b3010 	ldr	r3, [fp, #-16]
    aa54:	e5933010 	ldr	r3, [r3, #16]
    aa58:	e51b2010 	ldr	r2, [fp, #-16]
    aa5c:	e5922008 	ldr	r2, [r2, #8]
    aa60:	e0833002 	add	r3, r3, r2
    aa64:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    aa68:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    aa6c:	e5d33000 	ldrb	r3, [r3]
    aa70:	e2033004 	and	r3, r3, #4
    aa74:	e6ef3073 	uxtb	r3, r3
    aa78:	e3530000 	cmp	r3, #0
    aa7c:	0a000004 	beq	aa94 <ipc_call_copy_args_Ipc_cat+0x1dc>
    return session_free_buf(session, msg->header.len);
    aa80:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    aa84:	e1d330b2 	ldrh	r3, [r3, #2]
    aa88:	e1a01003 	mov	r1, r3
    aa8c:	e51b0010 	ldr	r0, [fp, #-16]
    aa90:	ebfffbaf 	bl	9954 <session_free_buf>
    aa94:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    aa98:	e1a00003 	mov	r0, r3
    aa9c:	e24bd004 	sub	sp, fp, #4
    aaa0:	e8bd8800 	pop	{fp, pc}

0000aaa4 <cat>:
int cat(struct Session* session, char* path)
{
    aaa4:	e92d4800 	push	{fp, lr}
    aaa8:	e28db004 	add	fp, sp, #4
    aaac:	e24dd008 	sub	sp, sp, #8
    aab0:	e50b0008 	str	r0, [fp, #-8]
    aab4:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_cat)(session, path);
    aab8:	e51b100c 	ldr	r1, [fp, #-12]
    aabc:	e51b0008 	ldr	r0, [fp, #-8]
    aac0:	ebffff7c 	bl	a8b8 <ipc_call_copy_args_Ipc_cat>
    aac4:	e1a03000 	mov	r3, r0
}
    aac8:	e1a00003 	mov	r0, r3
    aacc:	e24bd004 	sub	sp, fp, #4
    aad0:	e8bd8800 	pop	{fp, pc}

0000aad4 <ipc_call_copy_args_Ipc_open>:

IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    aad4:	e92d4800 	push	{fp, lr}
    aad8:	e28db004 	add	fp, sp, #4
    aadc:	e24dd048 	sub	sp, sp, #72	; 0x48
    aae0:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    aae4:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    aae8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    aaec:	e3530000 	cmp	r3, #0
    aaf0:	1a000001 	bne	aafc <ipc_call_copy_args_Ipc_open+0x28>
    aaf4:	e3e03000 	mvn	r3, #0
    aaf8:	ea00006d 	b	acb4 <ipc_call_copy_args_Ipc_open+0x1e0>
    aafc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    ab00:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    ab04:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    ab08:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    ab0c:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    ab10:	eb000546 	bl	c030 <strlen>
    ab14:	e1a03000 	mov	r3, r0
    ab18:	e2833001 	add	r3, r3, #1
    ab1c:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    ab20:	e24b3044 	sub	r3, fp, #68	; 0x44
    ab24:	e1a02003 	mov	r2, r3
    ab28:	e3a01001 	mov	r1, #1
    ab2c:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    ab30:	ebfff898 	bl	8d98 <new_ipc_msg>
    ab34:	e1a03000 	mov	r3, r0
    ab38:	e50b3008 	str	r3, [fp, #-8]
    ab3c:	e51b3008 	ldr	r3, [fp, #-8]
    ab40:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    ab44:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    ab48:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    ab4c:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    ab50:	eb000536 	bl	c030 <strlen>
    ab54:	e1a03000 	mov	r3, r0
    ab58:	e2833001 	add	r3, r3, #1
    ab5c:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    ab60:	e3a01000 	mov	r1, #0
    ab64:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    ab68:	ebfff8f7 	bl	8f4c <ipc_msg_set_nth_arg>
    ab6c:	e3a03001 	mov	r3, #1
    ab70:	e50b300c 	str	r3, [fp, #-12]
    ab74:	e51b3008 	ldr	r3, [fp, #-8]
    ab78:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    ab7c:	e3a03006 	mov	r3, #6
    ab80:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    ab84:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    ab88:	e3530000 	cmp	r3, #0
    ab8c:	ba000002 	blt	ab9c <ipc_call_copy_args_Ipc_open+0xc8>
    ab90:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    ab94:	e35300ff 	cmp	r3, #255	; 0xff
    ab98:	da000001 	ble	aba4 <ipc_call_copy_args_Ipc_open+0xd0>
        return false;
    ab9c:	e3a03000 	mov	r3, #0
    aba0:	ea000004 	b	abb8 <ipc_call_copy_args_Ipc_open+0xe4>
    msg->header.opcode = opcode;
    aba4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    aba8:	e6ef2073 	uxtb	r2, r3
    abac:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    abb0:	e5c32001 	strb	r2, [r3, #1]
    return true;
    abb4:	e3a03001 	mov	r3, #1
    abb8:	e50b300c 	str	r3, [fp, #-12]
    abbc:	e51b0008 	ldr	r0, [fp, #-8]
    abc0:	ebfff969 	bl	916c <ipc_msg_send_wait>
    abc4:	e51b3008 	ldr	r3, [fp, #-8]
    abc8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    abcc:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    abd0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    abd4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    abd8:	eb000514 	bl	c030 <strlen>
    abdc:	e1a03000 	mov	r3, r0
    abe0:	e2833001 	add	r3, r3, #1
    abe4:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    abe8:	e3a01000 	mov	r1, #0
    abec:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    abf0:	ebfff91d 	bl	906c <ipc_msg_get_nth_arg>
    abf4:	e3a03001 	mov	r3, #1
    abf8:	e50b300c 	str	r3, [fp, #-12]
    abfc:	e3a03000 	mov	r3, #0
    ac00:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    ac04:	e51b3008 	ldr	r3, [fp, #-8]
    ac08:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    ac0c:	e24b3040 	sub	r3, fp, #64	; 0x40
    ac10:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    ac14:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ac18:	e5d33000 	ldrb	r3, [r3]
    ac1c:	e2033002 	and	r3, r3, #2
    ac20:	e6ef3073 	uxtb	r3, r3
    ac24:	e3530000 	cmp	r3, #0
    ac28:	1a000007 	bne	ac4c <ipc_call_copy_args_Ipc_open+0x178>
    ac2c:	e3003e30 	movw	r3, #3632	; 0xe30
    ac30:	e3403001 	movt	r3, #1
    ac34:	e3002e98 	movw	r2, #3736	; 0xe98
    ac38:	e3402001 	movt	r2, #1
    ac3c:	e3a01074 	mov	r1, #116	; 0x74
    ac40:	e3000e48 	movw	r0, #3656	; 0xe48
    ac44:	e3400001 	movt	r0, #1
    ac48:	eb0003c8 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    ac4c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ac50:	e2833008 	add	r3, r3, #8
    ac54:	e3a02004 	mov	r2, #4
    ac58:	e1a01003 	mov	r1, r3
    ac5c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    ac60:	eb000416 	bl	bcc0 <memcpy>
    ac64:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    ac68:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    ac6c:	e51b3010 	ldr	r3, [fp, #-16]
    ac70:	e5933010 	ldr	r3, [r3, #16]
    ac74:	e51b2010 	ldr	r2, [fp, #-16]
    ac78:	e5922008 	ldr	r2, [r2, #8]
    ac7c:	e0833002 	add	r3, r3, r2
    ac80:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    ac84:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ac88:	e5d33000 	ldrb	r3, [r3]
    ac8c:	e2033004 	and	r3, r3, #4
    ac90:	e6ef3073 	uxtb	r3, r3
    ac94:	e3530000 	cmp	r3, #0
    ac98:	0a000004 	beq	acb0 <ipc_call_copy_args_Ipc_open+0x1dc>
    return session_free_buf(session, msg->header.len);
    ac9c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    aca0:	e1d330b2 	ldrh	r3, [r3, #2]
    aca4:	e1a01003 	mov	r1, r3
    aca8:	e51b0010 	ldr	r0, [fp, #-16]
    acac:	ebfffb28 	bl	9954 <session_free_buf>
    acb0:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    acb4:	e1a00003 	mov	r0, r3
    acb8:	e24bd004 	sub	sp, fp, #4
    acbc:	e8bd8800 	pop	{fp, pc}

0000acc0 <open>:
int open(struct Session* session, char* path)
{
    acc0:	e92d4800 	push	{fp, lr}
    acc4:	e28db004 	add	fp, sp, #4
    acc8:	e24dd008 	sub	sp, sp, #8
    accc:	e50b0008 	str	r0, [fp, #-8]
    acd0:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_open)(session, path);
    acd4:	e51b100c 	ldr	r1, [fp, #-12]
    acd8:	e51b0008 	ldr	r0, [fp, #-8]
    acdc:	ebffff7c 	bl	aad4 <ipc_call_copy_args_Ipc_open>
    ace0:	e1a03000 	mov	r3, r0
}
    ace4:	e1a00003 	mov	r0, r3
    ace8:	e24bd004 	sub	sp, fp, #4
    acec:	e8bd8800 	pop	{fp, pc}

0000acf0 <ipc_call_copy_args_Ipc_close>:

IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
    acf0:	e92d4800 	push	{fp, lr}
    acf4:	e28db004 	add	fp, sp, #4
    acf8:	e24dd048 	sub	sp, sp, #72	; 0x48
    acfc:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    ad00:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    ad04:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    ad08:	e3530000 	cmp	r3, #0
    ad0c:	1a000001 	bne	ad18 <ipc_call_copy_args_Ipc_close+0x28>
    ad10:	e3e03000 	mvn	r3, #0
    ad14:	ea000064 	b	aeac <ipc_call_copy_args_Ipc_close+0x1bc>
    ad18:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    ad1c:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    ad20:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    ad24:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    ad28:	e3a03004 	mov	r3, #4
    ad2c:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    ad30:	e24b3044 	sub	r3, fp, #68	; 0x44
    ad34:	e1a02003 	mov	r2, r3
    ad38:	e3a01001 	mov	r1, #1
    ad3c:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    ad40:	ebfff814 	bl	8d98 <new_ipc_msg>
    ad44:	e1a03000 	mov	r3, r0
    ad48:	e50b3008 	str	r3, [fp, #-8]
    ad4c:	e51b3008 	ldr	r3, [fp, #-8]
    ad50:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    ad54:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    ad58:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    ad5c:	e3a03004 	mov	r3, #4
    ad60:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    ad64:	e3a01000 	mov	r1, #0
    ad68:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    ad6c:	ebfff876 	bl	8f4c <ipc_msg_set_nth_arg>
    ad70:	e3a03001 	mov	r3, #1
    ad74:	e50b300c 	str	r3, [fp, #-12]
    ad78:	e51b3008 	ldr	r3, [fp, #-8]
    ad7c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    ad80:	e3a03007 	mov	r3, #7
    ad84:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    ad88:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    ad8c:	e3530000 	cmp	r3, #0
    ad90:	ba000002 	blt	ada0 <ipc_call_copy_args_Ipc_close+0xb0>
    ad94:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    ad98:	e35300ff 	cmp	r3, #255	; 0xff
    ad9c:	da000001 	ble	ada8 <ipc_call_copy_args_Ipc_close+0xb8>
        return false;
    ada0:	e3a03000 	mov	r3, #0
    ada4:	ea000004 	b	adbc <ipc_call_copy_args_Ipc_close+0xcc>
    msg->header.opcode = opcode;
    ada8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    adac:	e6ef2073 	uxtb	r2, r3
    adb0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    adb4:	e5c32001 	strb	r2, [r3, #1]
    return true;
    adb8:	e3a03001 	mov	r3, #1
    adbc:	e50b300c 	str	r3, [fp, #-12]
    adc0:	e51b0008 	ldr	r0, [fp, #-8]
    adc4:	ebfff8e8 	bl	916c <ipc_msg_send_wait>
    adc8:	e51b3008 	ldr	r3, [fp, #-8]
    adcc:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    add0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    add4:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    add8:	e3a03004 	mov	r3, #4
    addc:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    ade0:	e3a01000 	mov	r1, #0
    ade4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    ade8:	ebfff89f 	bl	906c <ipc_msg_get_nth_arg>
    adec:	e3a03001 	mov	r3, #1
    adf0:	e50b300c 	str	r3, [fp, #-12]
    adf4:	e3a03000 	mov	r3, #0
    adf8:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    adfc:	e51b3008 	ldr	r3, [fp, #-8]
    ae00:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    ae04:	e24b3040 	sub	r3, fp, #64	; 0x40
    ae08:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    ae0c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ae10:	e5d33000 	ldrb	r3, [r3]
    ae14:	e2033002 	and	r3, r3, #2
    ae18:	e6ef3073 	uxtb	r3, r3
    ae1c:	e3530000 	cmp	r3, #0
    ae20:	1a000007 	bne	ae44 <ipc_call_copy_args_Ipc_close+0x154>
    ae24:	e3003e30 	movw	r3, #3632	; 0xe30
    ae28:	e3403001 	movt	r3, #1
    ae2c:	e3002e98 	movw	r2, #3736	; 0xe98
    ae30:	e3402001 	movt	r2, #1
    ae34:	e3a01074 	mov	r1, #116	; 0x74
    ae38:	e3000e48 	movw	r0, #3656	; 0xe48
    ae3c:	e3400001 	movt	r0, #1
    ae40:	eb00034a 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    ae44:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ae48:	e2833008 	add	r3, r3, #8
    ae4c:	e3a02004 	mov	r2, #4
    ae50:	e1a01003 	mov	r1, r3
    ae54:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    ae58:	eb000398 	bl	bcc0 <memcpy>
    ae5c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    ae60:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    ae64:	e51b3010 	ldr	r3, [fp, #-16]
    ae68:	e5933010 	ldr	r3, [r3, #16]
    ae6c:	e51b2010 	ldr	r2, [fp, #-16]
    ae70:	e5922008 	ldr	r2, [r2, #8]
    ae74:	e0833002 	add	r3, r3, r2
    ae78:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    ae7c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ae80:	e5d33000 	ldrb	r3, [r3]
    ae84:	e2033004 	and	r3, r3, #4
    ae88:	e6ef3073 	uxtb	r3, r3
    ae8c:	e3530000 	cmp	r3, #0
    ae90:	0a000004 	beq	aea8 <ipc_call_copy_args_Ipc_close+0x1b8>
    return session_free_buf(session, msg->header.len);
    ae94:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ae98:	e1d330b2 	ldrh	r3, [r3, #2]
    ae9c:	e1a01003 	mov	r1, r3
    aea0:	e51b0010 	ldr	r0, [fp, #-16]
    aea4:	ebfffaaa 	bl	9954 <session_free_buf>
    aea8:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    aeac:	e1a00003 	mov	r0, r3
    aeb0:	e24bd004 	sub	sp, fp, #4
    aeb4:	e8bd8800 	pop	{fp, pc}

0000aeb8 <close>:
int close(struct Session* session, int fd)
{
    aeb8:	e92d4800 	push	{fp, lr}
    aebc:	e28db004 	add	fp, sp, #4
    aec0:	e24dd008 	sub	sp, sp, #8
    aec4:	e50b0008 	str	r0, [fp, #-8]
    aec8:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_close)(session, &fd);
    aecc:	e24b300c 	sub	r3, fp, #12
    aed0:	e1a01003 	mov	r1, r3
    aed4:	e51b0008 	ldr	r0, [fp, #-8]
    aed8:	ebffff84 	bl	acf0 <ipc_call_copy_args_Ipc_close>
    aedc:	e1a03000 	mov	r3, r0
}
    aee0:	e1a00003 	mov	r0, r3
    aee4:	e24bd004 	sub	sp, fp, #4
    aee8:	e8bd8800 	pop	{fp, pc}

0000aeec <ipc_call_copy_args_Ipc_read>:

IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    aeec:	e92d4800 	push	{fp, lr}
    aef0:	e28db004 	add	fp, sp, #4
    aef4:	e24dd080 	sub	sp, sp, #128	; 0x80
    aef8:	e50b0078 	str	r0, [fp, #-120]	; 0xffffff88
    aefc:	e50b107c 	str	r1, [fp, #-124]	; 0xffffff84
    af00:	e50b2080 	str	r2, [fp, #-128]	; 0xffffff80
    af04:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
    af08:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    af0c:	e3530000 	cmp	r3, #0
    af10:	1a000001 	bne	af1c <ipc_call_copy_args_Ipc_read+0x30>
    af14:	e3e03000 	mvn	r3, #0
    af18:	ea00009d 	b	b194 <ipc_call_copy_args_Ipc_read+0x2a8>
    af1c:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    af20:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    af24:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    af28:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    af2c:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    af30:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    af34:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    af38:	e50b305c 	str	r3, [fp, #-92]	; 0xffffffa4
    af3c:	e59b3004 	ldr	r3, [fp, #4]
    af40:	e50b3060 	str	r3, [fp, #-96]	; 0xffffffa0
    af44:	e3a03004 	mov	r3, #4
    af48:	e50b3074 	str	r3, [fp, #-116]	; 0xffffff8c
    af4c:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    af50:	e5933000 	ldr	r3, [r3]
    af54:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    af58:	e3a03004 	mov	r3, #4
    af5c:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    af60:	e3a03004 	mov	r3, #4
    af64:	e50b3068 	str	r3, [fp, #-104]	; 0xffffff98
    af68:	e24b3074 	sub	r3, fp, #116	; 0x74
    af6c:	e1a02003 	mov	r2, r3
    af70:	e3a01004 	mov	r1, #4
    af74:	e51b0050 	ldr	r0, [fp, #-80]	; 0xffffffb0
    af78:	ebfff786 	bl	8d98 <new_ipc_msg>
    af7c:	e1a03000 	mov	r3, r0
    af80:	e50b3008 	str	r3, [fp, #-8]
    af84:	e51b3008 	ldr	r3, [fp, #-8]
    af88:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    af8c:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    af90:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    af94:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    af98:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    af9c:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    afa0:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    afa4:	e59b3004 	ldr	r3, [fp, #4]
    afa8:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    afac:	e3a03004 	mov	r3, #4
    afb0:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
    afb4:	e3a01000 	mov	r1, #0
    afb8:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    afbc:	ebfff7e2 	bl	8f4c <ipc_msg_set_nth_arg>
    afc0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    afc4:	e5933000 	ldr	r3, [r3]
    afc8:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
    afcc:	e3a01001 	mov	r1, #1
    afd0:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    afd4:	ebfff7dc 	bl	8f4c <ipc_msg_set_nth_arg>
    afd8:	e3a03004 	mov	r3, #4
    afdc:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
    afe0:	e3a01002 	mov	r1, #2
    afe4:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    afe8:	ebfff7d7 	bl	8f4c <ipc_msg_set_nth_arg>
    afec:	e3a03004 	mov	r3, #4
    aff0:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
    aff4:	e3a01003 	mov	r1, #3
    aff8:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    affc:	ebfff7d2 	bl	8f4c <ipc_msg_set_nth_arg>
    b000:	e3a03001 	mov	r3, #1
    b004:	e50b300c 	str	r3, [fp, #-12]
    b008:	e51b3008 	ldr	r3, [fp, #-8]
    b00c:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    b010:	e3a03008 	mov	r3, #8
    b014:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    if (opcode < 0 || opcode > UINT8_MAX) {
    b018:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    b01c:	e3530000 	cmp	r3, #0
    b020:	ba000002 	blt	b030 <ipc_call_copy_args_Ipc_read+0x144>
    b024:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    b028:	e35300ff 	cmp	r3, #255	; 0xff
    b02c:	da000001 	ble	b038 <ipc_call_copy_args_Ipc_read+0x14c>
        return false;
    b030:	e3a03000 	mov	r3, #0
    b034:	ea000004 	b	b04c <ipc_call_copy_args_Ipc_read+0x160>
    msg->header.opcode = opcode;
    b038:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    b03c:	e6ef2073 	uxtb	r2, r3
    b040:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    b044:	e5c32001 	strb	r2, [r3, #1]
    return true;
    b048:	e3a03001 	mov	r3, #1
    b04c:	e50b300c 	str	r3, [fp, #-12]
    b050:	e51b0008 	ldr	r0, [fp, #-8]
    b054:	ebfff844 	bl	916c <ipc_msg_send_wait>
    b058:	e51b3008 	ldr	r3, [fp, #-8]
    b05c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    b060:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    b064:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    b068:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    b06c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    b070:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    b074:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    b078:	e59b3004 	ldr	r3, [fp, #4]
    b07c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    b080:	e3a03004 	mov	r3, #4
    b084:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    b088:	e3a01000 	mov	r1, #0
    b08c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b090:	ebfff7f5 	bl	906c <ipc_msg_get_nth_arg>
    b094:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    b098:	e5933000 	ldr	r3, [r3]
    b09c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    b0a0:	e3a01001 	mov	r1, #1
    b0a4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b0a8:	ebfff7ef 	bl	906c <ipc_msg_get_nth_arg>
    b0ac:	e3a03004 	mov	r3, #4
    b0b0:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    b0b4:	e3a01002 	mov	r1, #2
    b0b8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b0bc:	ebfff7ea 	bl	906c <ipc_msg_get_nth_arg>
    b0c0:	e3a03004 	mov	r3, #4
    b0c4:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    b0c8:	e3a01003 	mov	r1, #3
    b0cc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b0d0:	ebfff7e5 	bl	906c <ipc_msg_get_nth_arg>
    b0d4:	e3a03001 	mov	r3, #1
    b0d8:	e50b300c 	str	r3, [fp, #-12]
    b0dc:	e3a03000 	mov	r3, #0
    b0e0:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
    b0e4:	e51b3008 	ldr	r3, [fp, #-8]
    b0e8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    b0ec:	e24b3064 	sub	r3, fp, #100	; 0x64
    b0f0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    b0f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b0f8:	e5d33000 	ldrb	r3, [r3]
    b0fc:	e2033002 	and	r3, r3, #2
    b100:	e6ef3073 	uxtb	r3, r3
    b104:	e3530000 	cmp	r3, #0
    b108:	1a000007 	bne	b12c <ipc_call_copy_args_Ipc_read+0x240>
    b10c:	e3003e30 	movw	r3, #3632	; 0xe30
    b110:	e3403001 	movt	r3, #1
    b114:	e3002e98 	movw	r2, #3736	; 0xe98
    b118:	e3402001 	movt	r2, #1
    b11c:	e3a01074 	mov	r1, #116	; 0x74
    b120:	e3000e48 	movw	r0, #3656	; 0xe48
    b124:	e3400001 	movt	r0, #1
    b128:	eb000290 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    b12c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b130:	e2833008 	add	r3, r3, #8
    b134:	e3a02004 	mov	r2, #4
    b138:	e1a01003 	mov	r1, r3
    b13c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    b140:	eb0002de 	bl	bcc0 <memcpy>
    b144:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    b148:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    b14c:	e51b3010 	ldr	r3, [fp, #-16]
    b150:	e5933010 	ldr	r3, [r3, #16]
    b154:	e51b2010 	ldr	r2, [fp, #-16]
    b158:	e5922008 	ldr	r2, [r2, #8]
    b15c:	e0833002 	add	r3, r3, r2
    b160:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    b164:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    b168:	e5d33000 	ldrb	r3, [r3]
    b16c:	e2033004 	and	r3, r3, #4
    b170:	e6ef3073 	uxtb	r3, r3
    b174:	e3530000 	cmp	r3, #0
    b178:	0a000004 	beq	b190 <ipc_call_copy_args_Ipc_read+0x2a4>
    return session_free_buf(session, msg->header.len);
    b17c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    b180:	e1d330b2 	ldrh	r3, [r3, #2]
    b184:	e1a01003 	mov	r1, r3
    b188:	e51b0010 	ldr	r0, [fp, #-16]
    b18c:	ebfff9f0 	bl	9954 <session_free_buf>
    b190:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
    b194:	e1a00003 	mov	r0, r3
    b198:	e24bd004 	sub	sp, fp, #4
    b19c:	e8bd8800 	pop	{fp, pc}

0000b1a0 <read>:
int read(struct Session* session, int fd, char* dst, int offset, int len)
{
    b1a0:	e92d4800 	push	{fp, lr}
    b1a4:	e28db004 	add	fp, sp, #4
    b1a8:	e24dd018 	sub	sp, sp, #24
    b1ac:	e50b0008 	str	r0, [fp, #-8]
    b1b0:	e50b100c 	str	r1, [fp, #-12]
    b1b4:	e50b2010 	str	r2, [fp, #-16]
    b1b8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
    b1bc:	e24b2014 	sub	r2, fp, #20
    b1c0:	e24b100c 	sub	r1, fp, #12
    b1c4:	e28b3004 	add	r3, fp, #4
    b1c8:	e58d3000 	str	r3, [sp]
    b1cc:	e1a03002 	mov	r3, r2
    b1d0:	e51b2010 	ldr	r2, [fp, #-16]
    b1d4:	e51b0008 	ldr	r0, [fp, #-8]
    b1d8:	ebffff43 	bl	aeec <ipc_call_copy_args_Ipc_read>
    b1dc:	e1a03000 	mov	r3, r0
}
    b1e0:	e1a00003 	mov	r0, r3
    b1e4:	e24bd004 	sub	sp, fp, #4
    b1e8:	e8bd8800 	pop	{fp, pc}

0000b1ec <ipc_call_copy_args_Ipc_write>:

IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    b1ec:	e92d4800 	push	{fp, lr}
    b1f0:	e28db004 	add	fp, sp, #4
    b1f4:	e24dd080 	sub	sp, sp, #128	; 0x80
    b1f8:	e50b0078 	str	r0, [fp, #-120]	; 0xffffff88
    b1fc:	e50b107c 	str	r1, [fp, #-124]	; 0xffffff84
    b200:	e50b2080 	str	r2, [fp, #-128]	; 0xffffff80
    b204:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
    b208:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    b20c:	e3530000 	cmp	r3, #0
    b210:	1a000001 	bne	b21c <ipc_call_copy_args_Ipc_write+0x30>
    b214:	e3e03000 	mvn	r3, #0
    b218:	ea00009d 	b	b494 <ipc_call_copy_args_Ipc_write+0x2a8>
    b21c:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    b220:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    b224:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    b228:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    b22c:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    b230:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    b234:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    b238:	e50b305c 	str	r3, [fp, #-92]	; 0xffffffa4
    b23c:	e59b3004 	ldr	r3, [fp, #4]
    b240:	e50b3060 	str	r3, [fp, #-96]	; 0xffffffa0
    b244:	e3a03004 	mov	r3, #4
    b248:	e50b3074 	str	r3, [fp, #-116]	; 0xffffff8c
    b24c:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    b250:	e5933000 	ldr	r3, [r3]
    b254:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    b258:	e3a03004 	mov	r3, #4
    b25c:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    b260:	e3a03004 	mov	r3, #4
    b264:	e50b3068 	str	r3, [fp, #-104]	; 0xffffff98
    b268:	e24b3074 	sub	r3, fp, #116	; 0x74
    b26c:	e1a02003 	mov	r2, r3
    b270:	e3a01004 	mov	r1, #4
    b274:	e51b0050 	ldr	r0, [fp, #-80]	; 0xffffffb0
    b278:	ebfff6c6 	bl	8d98 <new_ipc_msg>
    b27c:	e1a03000 	mov	r3, r0
    b280:	e50b3008 	str	r3, [fp, #-8]
    b284:	e51b3008 	ldr	r3, [fp, #-8]
    b288:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    b28c:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    b290:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    b294:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    b298:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    b29c:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    b2a0:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    b2a4:	e59b3004 	ldr	r3, [fp, #4]
    b2a8:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    b2ac:	e3a03004 	mov	r3, #4
    b2b0:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
    b2b4:	e3a01000 	mov	r1, #0
    b2b8:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    b2bc:	ebfff722 	bl	8f4c <ipc_msg_set_nth_arg>
    b2c0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    b2c4:	e5933000 	ldr	r3, [r3]
    b2c8:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
    b2cc:	e3a01001 	mov	r1, #1
    b2d0:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    b2d4:	ebfff71c 	bl	8f4c <ipc_msg_set_nth_arg>
    b2d8:	e3a03004 	mov	r3, #4
    b2dc:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
    b2e0:	e3a01002 	mov	r1, #2
    b2e4:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    b2e8:	ebfff717 	bl	8f4c <ipc_msg_set_nth_arg>
    b2ec:	e3a03004 	mov	r3, #4
    b2f0:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
    b2f4:	e3a01003 	mov	r1, #3
    b2f8:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    b2fc:	ebfff712 	bl	8f4c <ipc_msg_set_nth_arg>
    b300:	e3a03001 	mov	r3, #1
    b304:	e50b300c 	str	r3, [fp, #-12]
    b308:	e51b3008 	ldr	r3, [fp, #-8]
    b30c:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    b310:	e3a03009 	mov	r3, #9
    b314:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    if (opcode < 0 || opcode > UINT8_MAX) {
    b318:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    b31c:	e3530000 	cmp	r3, #0
    b320:	ba000002 	blt	b330 <ipc_call_copy_args_Ipc_write+0x144>
    b324:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    b328:	e35300ff 	cmp	r3, #255	; 0xff
    b32c:	da000001 	ble	b338 <ipc_call_copy_args_Ipc_write+0x14c>
        return false;
    b330:	e3a03000 	mov	r3, #0
    b334:	ea000004 	b	b34c <ipc_call_copy_args_Ipc_write+0x160>
    msg->header.opcode = opcode;
    b338:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    b33c:	e6ef2073 	uxtb	r2, r3
    b340:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    b344:	e5c32001 	strb	r2, [r3, #1]
    return true;
    b348:	e3a03001 	mov	r3, #1
    b34c:	e50b300c 	str	r3, [fp, #-12]
    b350:	e51b0008 	ldr	r0, [fp, #-8]
    b354:	ebfff784 	bl	916c <ipc_msg_send_wait>
    b358:	e51b3008 	ldr	r3, [fp, #-8]
    b35c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    b360:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    b364:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    b368:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    b36c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    b370:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    b374:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    b378:	e59b3004 	ldr	r3, [fp, #4]
    b37c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    b380:	e3a03004 	mov	r3, #4
    b384:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    b388:	e3a01000 	mov	r1, #0
    b38c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b390:	ebfff735 	bl	906c <ipc_msg_get_nth_arg>
    b394:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    b398:	e5933000 	ldr	r3, [r3]
    b39c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    b3a0:	e3a01001 	mov	r1, #1
    b3a4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b3a8:	ebfff72f 	bl	906c <ipc_msg_get_nth_arg>
    b3ac:	e3a03004 	mov	r3, #4
    b3b0:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    b3b4:	e3a01002 	mov	r1, #2
    b3b8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b3bc:	ebfff72a 	bl	906c <ipc_msg_get_nth_arg>
    b3c0:	e3a03004 	mov	r3, #4
    b3c4:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    b3c8:	e3a01003 	mov	r1, #3
    b3cc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b3d0:	ebfff725 	bl	906c <ipc_msg_get_nth_arg>
    b3d4:	e3a03001 	mov	r3, #1
    b3d8:	e50b300c 	str	r3, [fp, #-12]
    b3dc:	e3a03000 	mov	r3, #0
    b3e0:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
    b3e4:	e51b3008 	ldr	r3, [fp, #-8]
    b3e8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    b3ec:	e24b3064 	sub	r3, fp, #100	; 0x64
    b3f0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    b3f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b3f8:	e5d33000 	ldrb	r3, [r3]
    b3fc:	e2033002 	and	r3, r3, #2
    b400:	e6ef3073 	uxtb	r3, r3
    b404:	e3530000 	cmp	r3, #0
    b408:	1a000007 	bne	b42c <ipc_call_copy_args_Ipc_write+0x240>
    b40c:	e3003e30 	movw	r3, #3632	; 0xe30
    b410:	e3403001 	movt	r3, #1
    b414:	e3002e98 	movw	r2, #3736	; 0xe98
    b418:	e3402001 	movt	r2, #1
    b41c:	e3a01074 	mov	r1, #116	; 0x74
    b420:	e3000e48 	movw	r0, #3656	; 0xe48
    b424:	e3400001 	movt	r0, #1
    b428:	eb0001d0 	bl	bb70 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    b42c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b430:	e2833008 	add	r3, r3, #8
    b434:	e3a02004 	mov	r2, #4
    b438:	e1a01003 	mov	r1, r3
    b43c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    b440:	eb00021e 	bl	bcc0 <memcpy>
    b444:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    b448:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    b44c:	e51b3010 	ldr	r3, [fp, #-16]
    b450:	e5933010 	ldr	r3, [r3, #16]
    b454:	e51b2010 	ldr	r2, [fp, #-16]
    b458:	e5922008 	ldr	r2, [r2, #8]
    b45c:	e0833002 	add	r3, r3, r2
    b460:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    b464:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    b468:	e5d33000 	ldrb	r3, [r3]
    b46c:	e2033004 	and	r3, r3, #4
    b470:	e6ef3073 	uxtb	r3, r3
    b474:	e3530000 	cmp	r3, #0
    b478:	0a000004 	beq	b490 <ipc_call_copy_args_Ipc_write+0x2a4>
    return session_free_buf(session, msg->header.len);
    b47c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    b480:	e1d330b2 	ldrh	r3, [r3, #2]
    b484:	e1a01003 	mov	r1, r3
    b488:	e51b0010 	ldr	r0, [fp, #-16]
    b48c:	ebfff930 	bl	9954 <session_free_buf>
    b490:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
    b494:	e1a00003 	mov	r0, r3
    b498:	e24bd004 	sub	sp, fp, #4
    b49c:	e8bd8800 	pop	{fp, pc}

0000b4a0 <write>:
int write(struct Session* session, int fd, char* src, int offset, int len)
{
    b4a0:	e92d4800 	push	{fp, lr}
    b4a4:	e28db004 	add	fp, sp, #4
    b4a8:	e24dd018 	sub	sp, sp, #24
    b4ac:	e50b0008 	str	r0, [fp, #-8]
    b4b0:	e50b100c 	str	r1, [fp, #-12]
    b4b4:	e50b2010 	str	r2, [fp, #-16]
    b4b8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
    b4bc:	e24b2014 	sub	r2, fp, #20
    b4c0:	e24b100c 	sub	r1, fp, #12
    b4c4:	e28b3004 	add	r3, fp, #4
    b4c8:	e58d3000 	str	r3, [sp]
    b4cc:	e1a03002 	mov	r3, r2
    b4d0:	e51b2010 	ldr	r2, [fp, #-16]
    b4d4:	e51b0008 	ldr	r0, [fp, #-8]
    b4d8:	ebffff43 	bl	b1ec <ipc_call_copy_args_Ipc_write>
    b4dc:	e1a03000 	mov	r3, r0
    b4e0:	e1a00003 	mov	r0, r3
    b4e4:	e24bd004 	sub	sp, fp, #4
    b4e8:	e8bd8800 	pop	{fp, pc}

0000b4ec <syscall>:
 */
#include "usyscall.h"

static int
syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    b4ec:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    b4f0:	e28db014 	add	fp, sp, #20
    b4f4:	e24dd018 	sub	sp, sp, #24
    b4f8:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    b4fc:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    b500:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    b504:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    int ret = -1;
    b508:	e3e03000 	mvn	r3, #0
    b50c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    __asm__ volatile(
    b510:	e51bc020 	ldr	ip, [fp, #-32]	; 0xffffffe0
    b514:	e51be024 	ldr	lr, [fp, #-36]	; 0xffffffdc
    b518:	e51b5028 	ldr	r5, [fp, #-40]	; 0xffffffd8
    b51c:	e51b602c 	ldr	r6, [fp, #-44]	; 0xffffffd4
    b520:	e59b7004 	ldr	r7, [fp, #4]
    b524:	e1a0000c 	mov	r0, ip
    b528:	e1a0100e 	mov	r1, lr
    b52c:	e1a02005 	mov	r2, r5
    b530:	e1a03006 	mov	r3, r6
    b534:	e1a04007 	mov	r4, r7
    b538:	ef000000 	svc	0x00000000
    b53c:	f57ff04f 	dsb	sy
    b540:	f57ff06f 	isb	sy
    b544:	e1a0c000 	mov	ip, r0
    b548:	e50bc018 	str	ip, [fp, #-24]	; 0xffffffe8
        mov %0, r0"
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    b54c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    b550:	e1a00003 	mov	r0, r3
    b554:	e24bd014 	sub	sp, fp, #20
    b558:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

0000b55c <spawn>:

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, char* name, char** argv)
{
    b55c:	e92d4800 	push	{fp, lr}
    b560:	e28db004 	add	fp, sp, #4
    b564:	e24dd028 	sub	sp, sp, #40	; 0x28
    b568:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    b56c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    b570:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    b574:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    struct KernReadTool read_tool = {
    b578:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b57c:	e50b3010 	str	r3, [fp, #-16]
    b580:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    b584:	e50b300c 	str	r3, [fp, #-12]
    b588:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b58c:	e50b3008 	str	r3, [fp, #-8]
        .session = session,
        .fd = fd,
        .ipc_read = ipc_read,
    };
    return syscall(SYSCALL_SPAWN, (intptr_t)&read_tool, (intptr_t)name, (intptr_t)argv, 0);
    b590:	e24b1010 	sub	r1, fp, #16
    b594:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    b598:	e59b0004 	ldr	r0, [fp, #4]
    b59c:	e3a03000 	mov	r3, #0
    b5a0:	e58d3000 	str	r3, [sp]
    b5a4:	e1a03000 	mov	r3, r0
    b5a8:	e3a00001 	mov	r0, #1
    b5ac:	ebffffce 	bl	b4ec <syscall>
    b5b0:	e1a03000 	mov	r3, r0
}
    b5b4:	e1a00003 	mov	r0, r3
    b5b8:	e24bd004 	sub	sp, fp, #4
    b5bc:	e8bd8800 	pop	{fp, pc}

0000b5c0 <exit>:

int exit()
{
    b5c0:	e92d4800 	push	{fp, lr}
    b5c4:	e28db004 	add	fp, sp, #4
    b5c8:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_EXIT, 0, 0, 0, 0);
    b5cc:	e3a03000 	mov	r3, #0
    b5d0:	e58d3000 	str	r3, [sp]
    b5d4:	e3a03000 	mov	r3, #0
    b5d8:	e3a02000 	mov	r2, #0
    b5dc:	e3a01000 	mov	r1, #0
    b5e0:	e3a00002 	mov	r0, #2
    b5e4:	ebffffc0 	bl	b4ec <syscall>
    b5e8:	e1a03000 	mov	r3, r0
}
    b5ec:	e1a00003 	mov	r0, r3
    b5f0:	e24bd004 	sub	sp, fp, #4
    b5f4:	e8bd8800 	pop	{fp, pc}

0000b5f8 <yield>:

int yield()
{
    b5f8:	e92d4800 	push	{fp, lr}
    b5fc:	e28db004 	add	fp, sp, #4
    b600:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_YIELD, 0, 0, 0, 0);
    b604:	e3a03000 	mov	r3, #0
    b608:	e58d3000 	str	r3, [sp]
    b60c:	e3a03000 	mov	r3, #0
    b610:	e3a02000 	mov	r2, #0
    b614:	e3a01000 	mov	r1, #0
    b618:	e3a00003 	mov	r0, #3
    b61c:	ebffffb2 	bl	b4ec <syscall>
    b620:	e1a03000 	mov	r3, r0
}
    b624:	e1a00003 	mov	r0, r3
    b628:	e24bd004 	sub	sp, fp, #4
    b62c:	e8bd8800 	pop	{fp, pc}

0000b630 <register_server>:

int register_server(char* name)
{
    b630:	e92d4800 	push	{fp, lr}
    b634:	e28db004 	add	fp, sp, #4
    b638:	e24dd010 	sub	sp, sp, #16
    b63c:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    b640:	e51b1008 	ldr	r1, [fp, #-8]
    b644:	e3a03000 	mov	r3, #0
    b648:	e58d3000 	str	r3, [sp]
    b64c:	e3a03000 	mov	r3, #0
    b650:	e3a02000 	mov	r2, #0
    b654:	e3a00005 	mov	r0, #5
    b658:	ebffffa3 	bl	b4ec <syscall>
    b65c:	e1a03000 	mov	r3, r0
}
    b660:	e1a00003 	mov	r0, r3
    b664:	e24bd004 	sub	sp, fp, #4
    b668:	e8bd8800 	pop	{fp, pc}

0000b66c <session>:

int session(char* path, int capacity, struct Session* user_session)
{
    b66c:	e92d4800 	push	{fp, lr}
    b670:	e28db004 	add	fp, sp, #4
    b674:	e24dd018 	sub	sp, sp, #24
    b678:	e50b0008 	str	r0, [fp, #-8]
    b67c:	e50b100c 	str	r1, [fp, #-12]
    b680:	e50b2010 	str	r2, [fp, #-16]
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    b684:	e51b1008 	ldr	r1, [fp, #-8]
    b688:	e51b2010 	ldr	r2, [fp, #-16]
    b68c:	e3a03000 	mov	r3, #0
    b690:	e58d3000 	str	r3, [sp]
    b694:	e1a03002 	mov	r3, r2
    b698:	e51b200c 	ldr	r2, [fp, #-12]
    b69c:	e3a00006 	mov	r0, #6
    b6a0:	ebffff91 	bl	b4ec <syscall>
    b6a4:	e1a03000 	mov	r3, r0
}
    b6a8:	e1a00003 	mov	r0, r3
    b6ac:	e24bd004 	sub	sp, fp, #4
    b6b0:	e8bd8800 	pop	{fp, pc}

0000b6b4 <poll_session>:

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    b6b4:	e92d4800 	push	{fp, lr}
    b6b8:	e28db004 	add	fp, sp, #4
    b6bc:	e24dd010 	sub	sp, sp, #16
    b6c0:	e50b0008 	str	r0, [fp, #-8]
    b6c4:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    b6c8:	e51b1008 	ldr	r1, [fp, #-8]
    b6cc:	e3a03000 	mov	r3, #0
    b6d0:	e58d3000 	str	r3, [sp]
    b6d4:	e3a03000 	mov	r3, #0
    b6d8:	e51b200c 	ldr	r2, [fp, #-12]
    b6dc:	e3a00007 	mov	r0, #7
    b6e0:	ebffff81 	bl	b4ec <syscall>
    b6e4:	e1a03000 	mov	r3, r0
}
    b6e8:	e1a00003 	mov	r0, r3
    b6ec:	e24bd004 	sub	sp, fp, #4
    b6f0:	e8bd8800 	pop	{fp, pc}

0000b6f4 <close_session>:

int close_session(struct Session* session)
{
    b6f4:	e92d4800 	push	{fp, lr}
    b6f8:	e28db004 	add	fp, sp, #4
    b6fc:	e24dd010 	sub	sp, sp, #16
    b700:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    b704:	e51b1008 	ldr	r1, [fp, #-8]
    b708:	e3a03000 	mov	r3, #0
    b70c:	e58d3000 	str	r3, [sp]
    b710:	e3a03000 	mov	r3, #0
    b714:	e3a02000 	mov	r2, #0
    b718:	e3a00008 	mov	r0, #8
    b71c:	ebffff72 	bl	b4ec <syscall>
    b720:	e1a03000 	mov	r3, r0
}
    b724:	e1a00003 	mov	r0, r3
    b728:	e24bd004 	sub	sp, fp, #4
    b72c:	e8bd8800 	pop	{fp, pc}

0000b730 <get_memblock_info>:

int get_memblock_info(sys_state_info* info)
{
    b730:	e92d4800 	push	{fp, lr}
    b734:	e28db004 	add	fp, sp, #4
    b738:	e24dd010 	sub	sp, sp, #16
    b73c:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    b740:	e51b2008 	ldr	r2, [fp, #-8]
    b744:	e3a03000 	mov	r3, #0
    b748:	e58d3000 	str	r3, [sp]
    b74c:	e3a03000 	mov	r3, #0
    b750:	e3a01003 	mov	r1, #3
    b754:	e3a0000a 	mov	r0, #10
    b758:	ebffff63 	bl	b4ec <syscall>
    b75c:	e1a03000 	mov	r3, r0
}
    b760:	e1a00003 	mov	r0, r3
    b764:	e24bd004 	sub	sp, fp, #4
    b768:	e8bd8800 	pop	{fp, pc}

0000b76c <set_priority>:

int set_priority(sys_state_info* info)
{
    b76c:	e92d4800 	push	{fp, lr}
    b770:	e28db004 	add	fp, sp, #4
    b774:	e24dd010 	sub	sp, sp, #16
    b778:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    b77c:	e51b2008 	ldr	r2, [fp, #-8]
    b780:	e3a03000 	mov	r3, #0
    b784:	e58d3000 	str	r3, [sp]
    b788:	e3a03000 	mov	r3, #0
    b78c:	e3a01001 	mov	r1, #1
    b790:	e3a0000a 	mov	r0, #10
    b794:	ebffff54 	bl	b4ec <syscall>
    b798:	e1a03000 	mov	r3, r0
}
    b79c:	e1a00003 	mov	r0, r3
    b7a0:	e24bd004 	sub	sp, fp, #4
    b7a4:	e8bd8800 	pop	{fp, pc}

0000b7a8 <task_heap_base>:

int task_heap_base()
{
    b7a8:	e92d4800 	push	{fp, lr}
    b7ac:	e28db004 	add	fp, sp, #4
    b7b0:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    b7b4:	e3a03000 	mov	r3, #0
    b7b8:	e58d3000 	str	r3, [sp]
    b7bc:	e3a03000 	mov	r3, #0
    b7c0:	e3a02000 	mov	r2, #0
    b7c4:	e3a01002 	mov	r1, #2
    b7c8:	e3a0000a 	mov	r0, #10
    b7cc:	ebffff46 	bl	b4ec <syscall>
    b7d0:	e1a03000 	mov	r3, r0
}
    b7d4:	e1a00003 	mov	r0, r3
    b7d8:	e24bd004 	sub	sp, fp, #4
    b7dc:	e8bd8800 	pop	{fp, pc}

0000b7e0 <show_task>:

int show_task()
{
    b7e0:	e92d4800 	push	{fp, lr}
    b7e4:	e28db004 	add	fp, sp, #4
    b7e8:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    b7ec:	e3a03000 	mov	r3, #0
    b7f0:	e58d3000 	str	r3, [sp]
    b7f4:	e3a03000 	mov	r3, #0
    b7f8:	e3a02000 	mov	r2, #0
    b7fc:	e3a01004 	mov	r1, #4
    b800:	e3a0000a 	mov	r0, #10
    b804:	ebffff38 	bl	b4ec <syscall>
    b808:	e1a03000 	mov	r3, r0
}
    b80c:	e1a00003 	mov	r0, r3
    b810:	e24bd004 	sub	sp, fp, #4
    b814:	e8bd8800 	pop	{fp, pc}

0000b818 <show_mem>:

int show_mem()
{
    b818:	e92d4800 	push	{fp, lr}
    b81c:	e28db004 	add	fp, sp, #4
    b820:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    b824:	e3a03000 	mov	r3, #0
    b828:	e58d3000 	str	r3, [sp]
    b82c:	e3a03000 	mov	r3, #0
    b830:	e3a02000 	mov	r2, #0
    b834:	e3a01005 	mov	r1, #5
    b838:	e3a0000a 	mov	r0, #10
    b83c:	ebffff2a 	bl	b4ec <syscall>
    b840:	e1a03000 	mov	r3, r0
}
    b844:	e1a00003 	mov	r0, r3
    b848:	e24bd004 	sub	sp, fp, #4
    b84c:	e8bd8800 	pop	{fp, pc}

0000b850 <show_cpu>:

int show_cpu()
{
    b850:	e92d4800 	push	{fp, lr}
    b854:	e28db004 	add	fp, sp, #4
    b858:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    b85c:	e3a03000 	mov	r3, #0
    b860:	e58d3000 	str	r3, [sp]
    b864:	e3a03000 	mov	r3, #0
    b868:	e3a02000 	mov	r2, #0
    b86c:	e3a01006 	mov	r1, #6
    b870:	e3a0000a 	mov	r0, #10
    b874:	ebffff1c 	bl	b4ec <syscall>
    b878:	e1a03000 	mov	r3, r0
}
    b87c:	e1a00003 	mov	r0, r3
    b880:	e24bd004 	sub	sp, fp, #4
    b884:	e8bd8800 	pop	{fp, pc}

0000b888 <mmap>:

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    b888:	e92d4800 	push	{fp, lr}
    b88c:	e28db004 	add	fp, sp, #4
    b890:	e24dd018 	sub	sp, sp, #24
    b894:	e50b0008 	str	r0, [fp, #-8]
    b898:	e50b100c 	str	r1, [fp, #-12]
    b89c:	e50b2010 	str	r2, [fp, #-16]
    b8a0:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    b8a4:	e51b1008 	ldr	r1, [fp, #-8]
    b8a8:	e51b200c 	ldr	r2, [fp, #-12]
    b8ac:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
    b8b0:	e58d3000 	str	r3, [sp]
    b8b4:	e51b3010 	ldr	r3, [fp, #-16]
    b8b8:	e3a00004 	mov	r0, #4
    b8bc:	ebffff0a 	bl	b4ec <syscall>
    b8c0:	e1a03000 	mov	r3, r0
}
    b8c4:	e1a00003 	mov	r0, r3
    b8c8:	e24bd004 	sub	sp, fp, #4
    b8cc:	e8bd8800 	pop	{fp, pc}

0000b8d0 <register_irq>:

int register_irq(int irq, int opcode)
{
    b8d0:	e92d4800 	push	{fp, lr}
    b8d4:	e28db004 	add	fp, sp, #4
    b8d8:	e24dd010 	sub	sp, sp, #16
    b8dc:	e50b0008 	str	r0, [fp, #-8]
    b8e0:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    b8e4:	e3a03000 	mov	r3, #0
    b8e8:	e58d3000 	str	r3, [sp]
    b8ec:	e3a03000 	mov	r3, #0
    b8f0:	e51b200c 	ldr	r2, [fp, #-12]
    b8f4:	e51b1008 	ldr	r1, [fp, #-8]
    b8f8:	e3a0000b 	mov	r0, #11
    b8fc:	ebfffefa 	bl	b4ec <syscall>
    b900:	e1a03000 	mov	r3, r0
    b904:	e1a00003 	mov	r0, r3
    b908:	e24bd004 	sub	sp, fp, #4
    b90c:	e8bd8800 	pop	{fp, pc}

0000b910 <__udivsi3>:
    b910:	e2512001 	subs	r2, r1, #1
    b914:	012fff1e 	bxeq	lr
    b918:	3a000036 	bcc	b9f8 <__udivsi3+0xe8>
    b91c:	e1500001 	cmp	r0, r1
    b920:	9a000022 	bls	b9b0 <__udivsi3+0xa0>
    b924:	e1110002 	tst	r1, r2
    b928:	0a000023 	beq	b9bc <__udivsi3+0xac>
    b92c:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    b930:	01a01181 	lsleq	r1, r1, #3
    b934:	03a03008 	moveq	r3, #8
    b938:	13a03001 	movne	r3, #1
    b93c:	e3510201 	cmp	r1, #268435456	; 0x10000000
    b940:	31510000 	cmpcc	r1, r0
    b944:	31a01201 	lslcc	r1, r1, #4
    b948:	31a03203 	lslcc	r3, r3, #4
    b94c:	3afffffa 	bcc	b93c <__udivsi3+0x2c>
    b950:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    b954:	31510000 	cmpcc	r1, r0
    b958:	31a01081 	lslcc	r1, r1, #1
    b95c:	31a03083 	lslcc	r3, r3, #1
    b960:	3afffffa 	bcc	b950 <__udivsi3+0x40>
    b964:	e3a02000 	mov	r2, #0
    b968:	e1500001 	cmp	r0, r1
    b96c:	20400001 	subcs	r0, r0, r1
    b970:	21822003 	orrcs	r2, r2, r3
    b974:	e15000a1 	cmp	r0, r1, lsr #1
    b978:	204000a1 	subcs	r0, r0, r1, lsr #1
    b97c:	218220a3 	orrcs	r2, r2, r3, lsr #1
    b980:	e1500121 	cmp	r0, r1, lsr #2
    b984:	20400121 	subcs	r0, r0, r1, lsr #2
    b988:	21822123 	orrcs	r2, r2, r3, lsr #2
    b98c:	e15001a1 	cmp	r0, r1, lsr #3
    b990:	204001a1 	subcs	r0, r0, r1, lsr #3
    b994:	218221a3 	orrcs	r2, r2, r3, lsr #3
    b998:	e3500000 	cmp	r0, #0
    b99c:	11b03223 	lsrsne	r3, r3, #4
    b9a0:	11a01221 	lsrne	r1, r1, #4
    b9a4:	1affffef 	bne	b968 <__udivsi3+0x58>
    b9a8:	e1a00002 	mov	r0, r2
    b9ac:	e12fff1e 	bx	lr
    b9b0:	03a00001 	moveq	r0, #1
    b9b4:	13a00000 	movne	r0, #0
    b9b8:	e12fff1e 	bx	lr
    b9bc:	e3510801 	cmp	r1, #65536	; 0x10000
    b9c0:	21a01821 	lsrcs	r1, r1, #16
    b9c4:	23a02010 	movcs	r2, #16
    b9c8:	33a02000 	movcc	r2, #0
    b9cc:	e3510c01 	cmp	r1, #256	; 0x100
    b9d0:	21a01421 	lsrcs	r1, r1, #8
    b9d4:	22822008 	addcs	r2, r2, #8
    b9d8:	e3510010 	cmp	r1, #16
    b9dc:	21a01221 	lsrcs	r1, r1, #4
    b9e0:	22822004 	addcs	r2, r2, #4
    b9e4:	e3510004 	cmp	r1, #4
    b9e8:	82822003 	addhi	r2, r2, #3
    b9ec:	908220a1 	addls	r2, r2, r1, lsr #1
    b9f0:	e1a00230 	lsr	r0, r0, r2
    b9f4:	e12fff1e 	bx	lr
    b9f8:	e3500000 	cmp	r0, #0
    b9fc:	13e00000 	mvnne	r0, #0
    ba00:	ea000059 	b	bb6c <__aeabi_idiv0>

0000ba04 <__aeabi_uidivmod>:
    ba04:	e3510000 	cmp	r1, #0
    ba08:	0afffffa 	beq	b9f8 <__udivsi3+0xe8>
    ba0c:	e92d4003 	push	{r0, r1, lr}
    ba10:	ebffffbe 	bl	b910 <__udivsi3>
    ba14:	e8bd4006 	pop	{r1, r2, lr}
    ba18:	e0030092 	mul	r3, r2, r0
    ba1c:	e0411003 	sub	r1, r1, r3
    ba20:	e12fff1e 	bx	lr

0000ba24 <__divsi3>:
    ba24:	e3510000 	cmp	r1, #0
    ba28:	0a000043 	beq	bb3c <.divsi3_skip_div0_test+0x110>

0000ba2c <.divsi3_skip_div0_test>:
    ba2c:	e020c001 	eor	ip, r0, r1
    ba30:	42611000 	rsbmi	r1, r1, #0
    ba34:	e2512001 	subs	r2, r1, #1
    ba38:	0a000027 	beq	badc <.divsi3_skip_div0_test+0xb0>
    ba3c:	e1b03000 	movs	r3, r0
    ba40:	42603000 	rsbmi	r3, r0, #0
    ba44:	e1530001 	cmp	r3, r1
    ba48:	9a000026 	bls	bae8 <.divsi3_skip_div0_test+0xbc>
    ba4c:	e1110002 	tst	r1, r2
    ba50:	0a000028 	beq	baf8 <.divsi3_skip_div0_test+0xcc>
    ba54:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    ba58:	01a01181 	lsleq	r1, r1, #3
    ba5c:	03a02008 	moveq	r2, #8
    ba60:	13a02001 	movne	r2, #1
    ba64:	e3510201 	cmp	r1, #268435456	; 0x10000000
    ba68:	31510003 	cmpcc	r1, r3
    ba6c:	31a01201 	lslcc	r1, r1, #4
    ba70:	31a02202 	lslcc	r2, r2, #4
    ba74:	3afffffa 	bcc	ba64 <.divsi3_skip_div0_test+0x38>
    ba78:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    ba7c:	31510003 	cmpcc	r1, r3
    ba80:	31a01081 	lslcc	r1, r1, #1
    ba84:	31a02082 	lslcc	r2, r2, #1
    ba88:	3afffffa 	bcc	ba78 <.divsi3_skip_div0_test+0x4c>
    ba8c:	e3a00000 	mov	r0, #0
    ba90:	e1530001 	cmp	r3, r1
    ba94:	20433001 	subcs	r3, r3, r1
    ba98:	21800002 	orrcs	r0, r0, r2
    ba9c:	e15300a1 	cmp	r3, r1, lsr #1
    baa0:	204330a1 	subcs	r3, r3, r1, lsr #1
    baa4:	218000a2 	orrcs	r0, r0, r2, lsr #1
    baa8:	e1530121 	cmp	r3, r1, lsr #2
    baac:	20433121 	subcs	r3, r3, r1, lsr #2
    bab0:	21800122 	orrcs	r0, r0, r2, lsr #2
    bab4:	e15301a1 	cmp	r3, r1, lsr #3
    bab8:	204331a1 	subcs	r3, r3, r1, lsr #3
    babc:	218001a2 	orrcs	r0, r0, r2, lsr #3
    bac0:	e3530000 	cmp	r3, #0
    bac4:	11b02222 	lsrsne	r2, r2, #4
    bac8:	11a01221 	lsrne	r1, r1, #4
    bacc:	1affffef 	bne	ba90 <.divsi3_skip_div0_test+0x64>
    bad0:	e35c0000 	cmp	ip, #0
    bad4:	42600000 	rsbmi	r0, r0, #0
    bad8:	e12fff1e 	bx	lr
    badc:	e13c0000 	teq	ip, r0
    bae0:	42600000 	rsbmi	r0, r0, #0
    bae4:	e12fff1e 	bx	lr
    bae8:	33a00000 	movcc	r0, #0
    baec:	01a00fcc 	asreq	r0, ip, #31
    baf0:	03800001 	orreq	r0, r0, #1
    baf4:	e12fff1e 	bx	lr
    baf8:	e3510801 	cmp	r1, #65536	; 0x10000
    bafc:	21a01821 	lsrcs	r1, r1, #16
    bb00:	23a02010 	movcs	r2, #16
    bb04:	33a02000 	movcc	r2, #0
    bb08:	e3510c01 	cmp	r1, #256	; 0x100
    bb0c:	21a01421 	lsrcs	r1, r1, #8
    bb10:	22822008 	addcs	r2, r2, #8
    bb14:	e3510010 	cmp	r1, #16
    bb18:	21a01221 	lsrcs	r1, r1, #4
    bb1c:	22822004 	addcs	r2, r2, #4
    bb20:	e3510004 	cmp	r1, #4
    bb24:	82822003 	addhi	r2, r2, #3
    bb28:	908220a1 	addls	r2, r2, r1, lsr #1
    bb2c:	e35c0000 	cmp	ip, #0
    bb30:	e1a00233 	lsr	r0, r3, r2
    bb34:	42600000 	rsbmi	r0, r0, #0
    bb38:	e12fff1e 	bx	lr
    bb3c:	e3500000 	cmp	r0, #0
    bb40:	c3e00102 	mvngt	r0, #-2147483648	; 0x80000000
    bb44:	b3a00102 	movlt	r0, #-2147483648	; 0x80000000
    bb48:	ea000007 	b	bb6c <__aeabi_idiv0>

0000bb4c <__aeabi_idivmod>:
    bb4c:	e3510000 	cmp	r1, #0
    bb50:	0afffff9 	beq	bb3c <.divsi3_skip_div0_test+0x110>
    bb54:	e92d4003 	push	{r0, r1, lr}
    bb58:	ebffffb3 	bl	ba2c <.divsi3_skip_div0_test>
    bb5c:	e8bd4006 	pop	{r1, r2, lr}
    bb60:	e0030092 	mul	r3, r2, r0
    bb64:	e0411003 	sub	r1, r1, r3
    bb68:	e12fff1e 	bx	lr

0000bb6c <__aeabi_idiv0>:
    bb6c:	e12fff1e 	bx	lr

0000bb70 <__assert_func>:
    bb70:	e59fc038 	ldr	ip, [pc, #56]	; bbb0 <__assert_func+0x40>
    bb74:	e59c4000 	ldr	r4, [ip]
    bb78:	e252c000 	subs	ip, r2, #0
    bb7c:	e1a02003 	mov	r2, r3
    bb80:	059f302c 	ldreq	r3, [pc, #44]	; bbb4 <__assert_func+0x44>
    bb84:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    bb88:	01a0c003 	moveq	ip, r3
    bb8c:	e1a0e000 	mov	lr, r0
    bb90:	159f3020 	ldrne	r3, [pc, #32]	; bbb8 <__assert_func+0x48>
    bb94:	e24dd014 	sub	sp, sp, #20
    bb98:	e594000c 	ldr	r0, [r4, #12]
    bb9c:	e88d100a 	stm	sp, {r1, r3, ip}
    bba0:	e1a0300e 	mov	r3, lr
    bba4:	e59f1010 	ldr	r1, [pc, #16]	; bbbc <__assert_func+0x4c>
    bba8:	eb000014 	bl	bc00 <fiprintf>
    bbac:	eb0006be 	bl	d6ac <abort>
    bbb0:	0001108c 	.word	0x0001108c
    bbb4:	00010eb8 	.word	0x00010eb8
    bbb8:	00010eac 	.word	0x00010eac
    bbbc:	00010ebc 	.word	0x00010ebc

0000bbc0 <__assert>:
    bbc0:	e1a03002 	mov	r3, r2
    bbc4:	e92d4010 	push	{r4, lr}
    bbc8:	e3a02000 	mov	r2, #0
    bbcc:	ebffffe7 	bl	bb70 <__assert_func>

0000bbd0 <_fiprintf_r>:
    bbd0:	e92d000c 	push	{r2, r3}
    bbd4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    bbd8:	e24dd00c 	sub	sp, sp, #12
    bbdc:	e28dc014 	add	ip, sp, #20
    bbe0:	e1a0300c 	mov	r3, ip
    bbe4:	e59d2010 	ldr	r2, [sp, #16]
    bbe8:	e58dc004 	str	ip, [sp, #4]
    bbec:	eb000159 	bl	c158 <_vfiprintf_r>
    bbf0:	e28dd00c 	add	sp, sp, #12
    bbf4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    bbf8:	e28dd008 	add	sp, sp, #8
    bbfc:	e12fff1e 	bx	lr

0000bc00 <fiprintf>:
    bc00:	e92d000e 	push	{r1, r2, r3}
    bc04:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    bc08:	e59f202c 	ldr	r2, [pc, #44]	; bc3c <fiprintf+0x3c>
    bc0c:	e24dd008 	sub	sp, sp, #8
    bc10:	e28dc010 	add	ip, sp, #16
    bc14:	e1a01000 	mov	r1, r0
    bc18:	e1a0300c 	mov	r3, ip
    bc1c:	e5920000 	ldr	r0, [r2]
    bc20:	e59d200c 	ldr	r2, [sp, #12]
    bc24:	e58dc004 	str	ip, [sp, #4]
    bc28:	eb00014a 	bl	c158 <_vfiprintf_r>
    bc2c:	e28dd008 	add	sp, sp, #8
    bc30:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    bc34:	e28dd00c 	add	sp, sp, #12
    bc38:	e12fff1e 	bx	lr
    bc3c:	0001108c 	.word	0x0001108c

0000bc40 <__libc_init_array>:
    bc40:	e92d4070 	push	{r4, r5, r6, lr}
    bc44:	e59f6064 	ldr	r6, [pc, #100]	; bcb0 <__libc_init_array+0x70>
    bc48:	e59f5064 	ldr	r5, [pc, #100]	; bcb4 <__libc_init_array+0x74>
    bc4c:	e0466005 	sub	r6, r6, r5
    bc50:	e1b06146 	asrs	r6, r6, #2
    bc54:	13a04000 	movne	r4, #0
    bc58:	0a000005 	beq	bc74 <__libc_init_array+0x34>
    bc5c:	e2844001 	add	r4, r4, #1
    bc60:	e4953004 	ldr	r3, [r5], #4
    bc64:	e1a0e00f 	mov	lr, pc
    bc68:	e12fff13 	bx	r3
    bc6c:	e1560004 	cmp	r6, r4
    bc70:	1afffff9 	bne	bc5c <__libc_init_array+0x1c>
    bc74:	e59f603c 	ldr	r6, [pc, #60]	; bcb8 <__libc_init_array+0x78>
    bc78:	e59f503c 	ldr	r5, [pc, #60]	; bcbc <__libc_init_array+0x7c>
    bc7c:	e0466005 	sub	r6, r6, r5
    bc80:	ebfff0de 	bl	8000 <_init>
    bc84:	e1b06146 	asrs	r6, r6, #2
    bc88:	13a04000 	movne	r4, #0
    bc8c:	0a000005 	beq	bca8 <__libc_init_array+0x68>
    bc90:	e2844001 	add	r4, r4, #1
    bc94:	e4953004 	ldr	r3, [r5], #4
    bc98:	e1a0e00f 	mov	lr, pc
    bc9c:	e12fff13 	bx	r3
    bca0:	e1560004 	cmp	r6, r4
    bca4:	1afffff9 	bne	bc90 <__libc_init_array+0x50>
    bca8:	e8bd4070 	pop	{r4, r5, r6, lr}
    bcac:	e12fff1e 	bx	lr
    bcb0:	00011060 	.word	0x00011060
    bcb4:	00011060 	.word	0x00011060
    bcb8:	00011064 	.word	0x00011064
    bcbc:	00011060 	.word	0x00011060

0000bcc0 <memcpy>:
    bcc0:	e352000f 	cmp	r2, #15
    bcc4:	8a000009 	bhi	bcf0 <memcpy+0x30>
    bcc8:	e3520000 	cmp	r2, #0
    bccc:	e1a03000 	mov	r3, r0
    bcd0:	0a00003c 	beq	bdc8 <memcpy+0x108>
    bcd4:	e2433001 	sub	r3, r3, #1
    bcd8:	e0812002 	add	r2, r1, r2
    bcdc:	e4d1c001 	ldrb	ip, [r1], #1
    bce0:	e1510002 	cmp	r1, r2
    bce4:	e5e3c001 	strb	ip, [r3, #1]!
    bce8:	1afffffb 	bne	bcdc <memcpy+0x1c>
    bcec:	e12fff1e 	bx	lr
    bcf0:	e1813000 	orr	r3, r1, r0
    bcf4:	e3130003 	tst	r3, #3
    bcf8:	1a000030 	bne	bdc0 <memcpy+0x100>
    bcfc:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    bd00:	e1a0e002 	mov	lr, r2
    bd04:	e280c010 	add	ip, r0, #16
    bd08:	e2813010 	add	r3, r1, #16
    bd0c:	e5137010 	ldr	r7, [r3, #-16]
    bd10:	e513600c 	ldr	r6, [r3, #-12]
    bd14:	e5135008 	ldr	r5, [r3, #-8]
    bd18:	e5134004 	ldr	r4, [r3, #-4]
    bd1c:	e24ee010 	sub	lr, lr, #16
    bd20:	e35e000f 	cmp	lr, #15
    bd24:	e50c7010 	str	r7, [ip, #-16]
    bd28:	e50c600c 	str	r6, [ip, #-12]
    bd2c:	e50c5008 	str	r5, [ip, #-8]
    bd30:	e50c4004 	str	r4, [ip, #-4]
    bd34:	e2833010 	add	r3, r3, #16
    bd38:	e28cc010 	add	ip, ip, #16
    bd3c:	8afffff2 	bhi	bd0c <memcpy+0x4c>
    bd40:	e2423010 	sub	r3, r2, #16
    bd44:	e3c3300f 	bic	r3, r3, #15
    bd48:	e202600f 	and	r6, r2, #15
    bd4c:	e2833010 	add	r3, r3, #16
    bd50:	e3560003 	cmp	r6, #3
    bd54:	e0811003 	add	r1, r1, r3
    bd58:	e0803003 	add	r3, r0, r3
    bd5c:	9a00001a 	bls	bdcc <memcpy+0x10c>
    bd60:	e1a04001 	mov	r4, r1
    bd64:	e1a0c006 	mov	ip, r6
    bd68:	e243e004 	sub	lr, r3, #4
    bd6c:	e24cc004 	sub	ip, ip, #4
    bd70:	e4945004 	ldr	r5, [r4], #4
    bd74:	e35c0003 	cmp	ip, #3
    bd78:	e5ae5004 	str	r5, [lr, #4]!
    bd7c:	8afffffa 	bhi	bd6c <memcpy+0xac>
    bd80:	e246c004 	sub	ip, r6, #4
    bd84:	e3ccc003 	bic	ip, ip, #3
    bd88:	e28cc004 	add	ip, ip, #4
    bd8c:	e081100c 	add	r1, r1, ip
    bd90:	e083300c 	add	r3, r3, ip
    bd94:	e2022003 	and	r2, r2, #3
    bd98:	e3520000 	cmp	r2, #0
    bd9c:	12433001 	subne	r3, r3, #1
    bda0:	10812002 	addne	r2, r1, r2
    bda4:	0a000003 	beq	bdb8 <memcpy+0xf8>
    bda8:	e4d1c001 	ldrb	ip, [r1], #1
    bdac:	e1510002 	cmp	r1, r2
    bdb0:	e5e3c001 	strb	ip, [r3, #1]!
    bdb4:	1afffffb 	bne	bda8 <memcpy+0xe8>
    bdb8:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    bdbc:	e12fff1e 	bx	lr
    bdc0:	e1a03000 	mov	r3, r0
    bdc4:	eaffffc2 	b	bcd4 <memcpy+0x14>
    bdc8:	e12fff1e 	bx	lr
    bdcc:	e1a02006 	mov	r2, r6
    bdd0:	eafffff0 	b	bd98 <memcpy+0xd8>

0000bdd4 <memmove>:
    bdd4:	e1500001 	cmp	r0, r1
    bdd8:	9a00000a 	bls	be08 <memmove+0x34>
    bddc:	e0813002 	add	r3, r1, r2
    bde0:	e1500003 	cmp	r0, r3
    bde4:	2a000007 	bcs	be08 <memmove+0x34>
    bde8:	e3520000 	cmp	r2, #0
    bdec:	e0802002 	add	r2, r0, r2
    bdf0:	012fff1e 	bxeq	lr
    bdf4:	e573c001 	ldrb	ip, [r3, #-1]!
    bdf8:	e1510003 	cmp	r1, r3
    bdfc:	e562c001 	strb	ip, [r2, #-1]!
    be00:	1afffffb 	bne	bdf4 <memmove+0x20>
    be04:	e12fff1e 	bx	lr
    be08:	e352000f 	cmp	r2, #15
    be0c:	8a000009 	bhi	be38 <memmove+0x64>
    be10:	e3520000 	cmp	r2, #0
    be14:	e1a03000 	mov	r3, r0
    be18:	0a00003c 	beq	bf10 <memmove+0x13c>
    be1c:	e2433001 	sub	r3, r3, #1
    be20:	e0812002 	add	r2, r1, r2
    be24:	e4d1c001 	ldrb	ip, [r1], #1
    be28:	e1520001 	cmp	r2, r1
    be2c:	e5e3c001 	strb	ip, [r3, #1]!
    be30:	1afffffb 	bne	be24 <memmove+0x50>
    be34:	e12fff1e 	bx	lr
    be38:	e1813000 	orr	r3, r1, r0
    be3c:	e3130003 	tst	r3, #3
    be40:	1a000030 	bne	bf08 <memmove+0x134>
    be44:	e92d4070 	push	{r4, r5, r6, lr}
    be48:	e1a0e002 	mov	lr, r2
    be4c:	e280c010 	add	ip, r0, #16
    be50:	e2813010 	add	r3, r1, #16
    be54:	e5134010 	ldr	r4, [r3, #-16]
    be58:	e50c4010 	str	r4, [ip, #-16]
    be5c:	e513400c 	ldr	r4, [r3, #-12]
    be60:	e50c400c 	str	r4, [ip, #-12]
    be64:	e5134008 	ldr	r4, [r3, #-8]
    be68:	e50c4008 	str	r4, [ip, #-8]
    be6c:	e24ee010 	sub	lr, lr, #16
    be70:	e5134004 	ldr	r4, [r3, #-4]
    be74:	e35e000f 	cmp	lr, #15
    be78:	e50c4004 	str	r4, [ip, #-4]
    be7c:	e2833010 	add	r3, r3, #16
    be80:	e28cc010 	add	ip, ip, #16
    be84:	8afffff2 	bhi	be54 <memmove+0x80>
    be88:	e2423010 	sub	r3, r2, #16
    be8c:	e3c3300f 	bic	r3, r3, #15
    be90:	e202600f 	and	r6, r2, #15
    be94:	e2833010 	add	r3, r3, #16
    be98:	e3560003 	cmp	r6, #3
    be9c:	e0811003 	add	r1, r1, r3
    bea0:	e0803003 	add	r3, r0, r3
    bea4:	9a00001a 	bls	bf14 <memmove+0x140>
    bea8:	e1a04001 	mov	r4, r1
    beac:	e1a0c006 	mov	ip, r6
    beb0:	e243e004 	sub	lr, r3, #4
    beb4:	e24cc004 	sub	ip, ip, #4
    beb8:	e4945004 	ldr	r5, [r4], #4
    bebc:	e35c0003 	cmp	ip, #3
    bec0:	e5ae5004 	str	r5, [lr, #4]!
    bec4:	8afffffa 	bhi	beb4 <memmove+0xe0>
    bec8:	e246c004 	sub	ip, r6, #4
    becc:	e3ccc003 	bic	ip, ip, #3
    bed0:	e28cc004 	add	ip, ip, #4
    bed4:	e081100c 	add	r1, r1, ip
    bed8:	e083300c 	add	r3, r3, ip
    bedc:	e2022003 	and	r2, r2, #3
    bee0:	e3520000 	cmp	r2, #0
    bee4:	12433001 	subne	r3, r3, #1
    bee8:	10812002 	addne	r2, r1, r2
    beec:	0a000003 	beq	bf00 <memmove+0x12c>
    bef0:	e4d1c001 	ldrb	ip, [r1], #1
    bef4:	e1520001 	cmp	r2, r1
    bef8:	e5e3c001 	strb	ip, [r3, #1]!
    befc:	1afffffb 	bne	bef0 <memmove+0x11c>
    bf00:	e8bd4070 	pop	{r4, r5, r6, lr}
    bf04:	e12fff1e 	bx	lr
    bf08:	e1a03000 	mov	r3, r0
    bf0c:	eaffffc2 	b	be1c <memmove+0x48>
    bf10:	e12fff1e 	bx	lr
    bf14:	e1a02006 	mov	r2, r6
    bf18:	eafffff0 	b	bee0 <memmove+0x10c>

0000bf1c <memset>:
    bf1c:	e3100003 	tst	r0, #3
    bf20:	0a000040 	beq	c028 <memset+0x10c>
    bf24:	e3520000 	cmp	r2, #0
    bf28:	e2422001 	sub	r2, r2, #1
    bf2c:	012fff1e 	bxeq	lr
    bf30:	e201c0ff 	and	ip, r1, #255	; 0xff
    bf34:	e1a03000 	mov	r3, r0
    bf38:	ea000002 	b	bf48 <memset+0x2c>
    bf3c:	e2422001 	sub	r2, r2, #1
    bf40:	e3720001 	cmn	r2, #1
    bf44:	012fff1e 	bxeq	lr
    bf48:	e4c3c001 	strb	ip, [r3], #1
    bf4c:	e3130003 	tst	r3, #3
    bf50:	1afffff9 	bne	bf3c <memset+0x20>
    bf54:	e3520003 	cmp	r2, #3
    bf58:	9a00002a 	bls	c008 <memset+0xec>
    bf5c:	e92d4010 	push	{r4, lr}
    bf60:	e201e0ff 	and	lr, r1, #255	; 0xff
    bf64:	e18ee40e 	orr	lr, lr, lr, lsl #8
    bf68:	e352000f 	cmp	r2, #15
    bf6c:	e18ee80e 	orr	lr, lr, lr, lsl #16
    bf70:	9a000010 	bls	bfb8 <memset+0x9c>
    bf74:	e1a04002 	mov	r4, r2
    bf78:	e283c010 	add	ip, r3, #16
    bf7c:	e2444010 	sub	r4, r4, #16
    bf80:	e354000f 	cmp	r4, #15
    bf84:	e50ce010 	str	lr, [ip, #-16]
    bf88:	e50ce00c 	str	lr, [ip, #-12]
    bf8c:	e50ce008 	str	lr, [ip, #-8]
    bf90:	e50ce004 	str	lr, [ip, #-4]
    bf94:	e28cc010 	add	ip, ip, #16
    bf98:	8afffff7 	bhi	bf7c <memset+0x60>
    bf9c:	e242c010 	sub	ip, r2, #16
    bfa0:	e3ccc00f 	bic	ip, ip, #15
    bfa4:	e202200f 	and	r2, r2, #15
    bfa8:	e28cc010 	add	ip, ip, #16
    bfac:	e3520003 	cmp	r2, #3
    bfb0:	e083300c 	add	r3, r3, ip
    bfb4:	9a00000a 	bls	bfe4 <memset+0xc8>
    bfb8:	e1a04003 	mov	r4, r3
    bfbc:	e1a0c002 	mov	ip, r2
    bfc0:	e24cc004 	sub	ip, ip, #4
    bfc4:	e35c0003 	cmp	ip, #3
    bfc8:	e484e004 	str	lr, [r4], #4
    bfcc:	8afffffb 	bhi	bfc0 <memset+0xa4>
    bfd0:	e242c004 	sub	ip, r2, #4
    bfd4:	e3ccc003 	bic	ip, ip, #3
    bfd8:	e28cc004 	add	ip, ip, #4
    bfdc:	e083300c 	add	r3, r3, ip
    bfe0:	e2022003 	and	r2, r2, #3
    bfe4:	e3520000 	cmp	r2, #0
    bfe8:	0a000004 	beq	c000 <memset+0xe4>
    bfec:	e20110ff 	and	r1, r1, #255	; 0xff
    bff0:	e0832002 	add	r2, r3, r2
    bff4:	e4c31001 	strb	r1, [r3], #1
    bff8:	e1520003 	cmp	r2, r3
    bffc:	1afffffc 	bne	bff4 <memset+0xd8>
    c000:	e8bd4010 	pop	{r4, lr}
    c004:	e12fff1e 	bx	lr
    c008:	e3520000 	cmp	r2, #0
    c00c:	012fff1e 	bxeq	lr
    c010:	e20110ff 	and	r1, r1, #255	; 0xff
    c014:	e0832002 	add	r2, r3, r2
    c018:	e4c31001 	strb	r1, [r3], #1
    c01c:	e1520003 	cmp	r2, r3
    c020:	1afffffc 	bne	c018 <memset+0xfc>
    c024:	e12fff1e 	bx	lr
    c028:	e1a03000 	mov	r3, r0
    c02c:	eaffffc8 	b	bf54 <memset+0x38>

0000c030 <strlen>:
    c030:	e3c01003 	bic	r1, r0, #3
    c034:	e2100003 	ands	r0, r0, #3
    c038:	e2600000 	rsb	r0, r0, #0
    c03c:	e4913004 	ldr	r3, [r1], #4
    c040:	e280c004 	add	ip, r0, #4
    c044:	e1a0c18c 	lsl	ip, ip, #3
    c048:	e3e02000 	mvn	r2, #0
    c04c:	11833c32 	orrne	r3, r3, r2, lsr ip
    c050:	e3a0c001 	mov	ip, #1
    c054:	e18cc40c 	orr	ip, ip, ip, lsl #8
    c058:	e18cc80c 	orr	ip, ip, ip, lsl #16
    c05c:	e043200c 	sub	r2, r3, ip
    c060:	e1c22003 	bic	r2, r2, r3
    c064:	e012238c 	ands	r2, r2, ip, lsl #7
    c068:	04913004 	ldreq	r3, [r1], #4
    c06c:	02800004 	addeq	r0, r0, #4
    c070:	0afffff9 	beq	c05c <strlen+0x2c>
    c074:	e31300ff 	tst	r3, #255	; 0xff
    c078:	12800001 	addne	r0, r0, #1
    c07c:	13130cff 	tstne	r3, #65280	; 0xff00
    c080:	12800001 	addne	r0, r0, #1
    c084:	131308ff 	tstne	r3, #16711680	; 0xff0000
    c088:	12800001 	addne	r0, r0, #1
    c08c:	e12fff1e 	bx	lr

0000c090 <__sprint_r.part.0>:
    c090:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c094:	e5913064 	ldr	r3, [r1, #100]	; 0x64
    c098:	e3130a02 	tst	r3, #8192	; 0x2000
    c09c:	e1a0b002 	mov	fp, r2
    c0a0:	0a000024 	beq	c138 <__sprint_r.part.0+0xa8>
    c0a4:	e5923008 	ldr	r3, [r2, #8]
    c0a8:	e5929000 	ldr	r9, [r2]
    c0ac:	e3530000 	cmp	r3, #0
    c0b0:	11a06001 	movne	r6, r1
    c0b4:	11a07000 	movne	r7, r0
    c0b8:	12899008 	addne	r9, r9, #8
    c0bc:	0a00001b 	beq	c130 <__sprint_r.part.0+0xa0>
    c0c0:	e519a004 	ldr	sl, [r9, #-4]
    c0c4:	e5195008 	ldr	r5, [r9, #-8]
    c0c8:	e1b0812a 	lsrs	r8, sl, #2
    c0cc:	13a04000 	movne	r4, #0
    c0d0:	12455004 	subne	r5, r5, #4
    c0d4:	1a000002 	bne	c0e4 <__sprint_r.part.0+0x54>
    c0d8:	ea00000e 	b	c118 <__sprint_r.part.0+0x88>
    c0dc:	e1580004 	cmp	r8, r4
    c0e0:	0a00000b 	beq	c114 <__sprint_r.part.0+0x84>
    c0e4:	e1a02006 	mov	r2, r6
    c0e8:	e5b51004 	ldr	r1, [r5, #4]!
    c0ec:	e1a00007 	mov	r0, r7
    c0f0:	eb000777 	bl	ded4 <_fputwc_r>
    c0f4:	e3700001 	cmn	r0, #1
    c0f8:	e2844001 	add	r4, r4, #1
    c0fc:	1afffff6 	bne	c0dc <__sprint_r.part.0+0x4c>
    c100:	e3a03000 	mov	r3, #0
    c104:	e58b3008 	str	r3, [fp, #8]
    c108:	e58b3004 	str	r3, [fp, #4]
    c10c:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c110:	e12fff1e 	bx	lr
    c114:	e59b3008 	ldr	r3, [fp, #8]
    c118:	e3caa003 	bic	sl, sl, #3
    c11c:	e043300a 	sub	r3, r3, sl
    c120:	e3530000 	cmp	r3, #0
    c124:	e58b3008 	str	r3, [fp, #8]
    c128:	e2899008 	add	r9, r9, #8
    c12c:	1affffe3 	bne	c0c0 <__sprint_r.part.0+0x30>
    c130:	e3a00000 	mov	r0, #0
    c134:	eafffff1 	b	c100 <__sprint_r.part.0+0x70>
    c138:	eb00089d 	bl	e3b4 <__sfvwrite_r>
    c13c:	eaffffef 	b	c100 <__sprint_r.part.0+0x70>

0000c140 <__sprint_r>:
    c140:	e5923008 	ldr	r3, [r2, #8]
    c144:	e3530000 	cmp	r3, #0
    c148:	1affffd0 	bne	c090 <__sprint_r.part.0>
    c14c:	e5823004 	str	r3, [r2, #4]
    c150:	e1a00003 	mov	r0, r3
    c154:	e12fff1e 	bx	lr

0000c158 <_vfiprintf_r>:
    c158:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c15c:	e1a05003 	mov	r5, r3
    c160:	e24dd0b4 	sub	sp, sp, #180	; 0xb4
    c164:	e2503000 	subs	r3, r0, #0
    c168:	e58d3014 	str	r3, [sp, #20]
    c16c:	e1a0a001 	mov	sl, r1
    c170:	e1a09002 	mov	r9, r2
    c174:	e58d5018 	str	r5, [sp, #24]
    c178:	0a000002 	beq	c188 <_vfiprintf_r+0x30>
    c17c:	e5933038 	ldr	r3, [r3, #56]	; 0x38
    c180:	e3530000 	cmp	r3, #0
    c184:	0a0000cf 	beq	c4c8 <_vfiprintf_r+0x370>
    c188:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    c18c:	e3130001 	tst	r3, #1
    c190:	e1da30fc 	ldrsh	r3, [sl, #12]
    c194:	e1a01803 	lsl	r1, r3, #16
    c198:	1a0000a7 	bne	c43c <_vfiprintf_r+0x2e4>
    c19c:	e3110402 	tst	r1, #33554432	; 0x2000000
    c1a0:	e1a01821 	lsr	r1, r1, #16
    c1a4:	0a0000a0 	beq	c42c <_vfiprintf_r+0x2d4>
    c1a8:	e3110a02 	tst	r1, #8192	; 0x2000
    c1ac:	1a000006 	bne	c1cc <_vfiprintf_r+0x74>
    c1b0:	e59a2064 	ldr	r2, [sl, #100]	; 0x64
    c1b4:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    c1b8:	e3c22a02 	bic	r2, r2, #8192	; 0x2000
    c1bc:	e1ca30bc 	strh	r3, [sl, #12]
    c1c0:	e58a2064 	str	r2, [sl, #100]	; 0x64
    c1c4:	e1a03803 	lsl	r3, r3, #16
    c1c8:	e1a01823 	lsr	r1, r3, #16
    c1cc:	e3110008 	tst	r1, #8
    c1d0:	0a0000a0 	beq	c458 <_vfiprintf_r+0x300>
    c1d4:	e59a3010 	ldr	r3, [sl, #16]
    c1d8:	e3530000 	cmp	r3, #0
    c1dc:	0a00009d 	beq	c458 <_vfiprintf_r+0x300>
    c1e0:	e201301a 	and	r3, r1, #26
    c1e4:	e353000a 	cmp	r3, #10
    c1e8:	0a0000a3 	beq	c47c <_vfiprintf_r+0x324>
    c1ec:	e3a03000 	mov	r3, #0
    c1f0:	e28d8070 	add	r8, sp, #112	; 0x70
    c1f4:	e1a0b008 	mov	fp, r8
    c1f8:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    c1fc:	e58d3008 	str	r3, [sp, #8]
    c200:	e58d3044 	str	r3, [sp, #68]	; 0x44
    c204:	e58d3040 	str	r3, [sp, #64]	; 0x40
    c208:	e58d803c 	str	r8, [sp, #60]	; 0x3c
    c20c:	e58da00c 	str	sl, [sp, #12]
    c210:	e5d93000 	ldrb	r3, [r9]
    c214:	e3530000 	cmp	r3, #0
    c218:	13530025 	cmpne	r3, #37	; 0x25
    c21c:	e1a04009 	mov	r4, r9
    c220:	0a000013 	beq	c274 <_vfiprintf_r+0x11c>
    c224:	e5f43001 	ldrb	r3, [r4, #1]!
    c228:	e3530000 	cmp	r3, #0
    c22c:	13530025 	cmpne	r3, #37	; 0x25
    c230:	1afffffb 	bne	c224 <_vfiprintf_r+0xcc>
    c234:	e0545009 	subs	r5, r4, r9
    c238:	0a00000d 	beq	c274 <_vfiprintf_r+0x11c>
    c23c:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
    c240:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    c244:	e2833001 	add	r3, r3, #1
    c248:	e3530007 	cmp	r3, #7
    c24c:	e0852002 	add	r2, r5, r2
    c250:	e58b9000 	str	r9, [fp]
    c254:	e58b5004 	str	r5, [fp, #4]
    c258:	e58d3040 	str	r3, [sp, #64]	; 0x40
    c25c:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c260:	d28bb008 	addle	fp, fp, #8
    c264:	ca000076 	bgt	c444 <_vfiprintf_r+0x2ec>
    c268:	e59d3008 	ldr	r3, [sp, #8]
    c26c:	e0833005 	add	r3, r3, r5
    c270:	e58d3008 	str	r3, [sp, #8]
    c274:	e5d43000 	ldrb	r3, [r4]
    c278:	e3530000 	cmp	r3, #0
    c27c:	0a00042f 	beq	d340 <_vfiprintf_r+0x11e8>
    c280:	e3a01000 	mov	r1, #0
    c284:	e3a03000 	mov	r3, #0
    c288:	e3e0a000 	mvn	sl, #0
    c28c:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    c290:	e2849001 	add	r9, r4, #1
    c294:	e5d43001 	ldrb	r3, [r4, #1]
    c298:	e1a0c001 	mov	ip, r1
    c29c:	e1a00001 	mov	r0, r1
    c2a0:	e1a05001 	mov	r5, r1
    c2a4:	e1a0700a 	mov	r7, sl
    c2a8:	e3a0e001 	mov	lr, #1
    c2ac:	e3a0402b 	mov	r4, #43	; 0x2b
    c2b0:	e3a06020 	mov	r6, #32
    c2b4:	e2899001 	add	r9, r9, #1
    c2b8:	e2432020 	sub	r2, r3, #32
    c2bc:	e3520058 	cmp	r2, #88	; 0x58
    c2c0:	979ff102 	ldrls	pc, [pc, r2, lsl #2]
    c2c4:	ea000220 	b	cb4c <_vfiprintf_r+0x9f4>
    c2c8:	0000cb38 	.word	0x0000cb38
    c2cc:	0000cb4c 	.word	0x0000cb4c
    c2d0:	0000cb4c 	.word	0x0000cb4c
    c2d4:	0000cb14 	.word	0x0000cb14
    c2d8:	0000cb4c 	.word	0x0000cb4c
    c2dc:	0000cb4c 	.word	0x0000cb4c
    c2e0:	0000cb4c 	.word	0x0000cb4c
    c2e4:	0000cb4c 	.word	0x0000cb4c
    c2e8:	0000cb4c 	.word	0x0000cb4c
    c2ec:	0000cb4c 	.word	0x0000cb4c
    c2f0:	0000c4d0 	.word	0x0000c4d0
    c2f4:	0000c920 	.word	0x0000c920
    c2f8:	0000cb4c 	.word	0x0000cb4c
    c2fc:	0000c4ec 	.word	0x0000c4ec
    c300:	0000c8b8 	.word	0x0000c8b8
    c304:	0000cb4c 	.word	0x0000cb4c
    c308:	0000c930 	.word	0x0000c930
    c30c:	0000c93c 	.word	0x0000c93c
    c310:	0000c93c 	.word	0x0000c93c
    c314:	0000c93c 	.word	0x0000c93c
    c318:	0000c93c 	.word	0x0000c93c
    c31c:	0000c93c 	.word	0x0000c93c
    c320:	0000c93c 	.word	0x0000c93c
    c324:	0000c93c 	.word	0x0000c93c
    c328:	0000c93c 	.word	0x0000c93c
    c32c:	0000c93c 	.word	0x0000c93c
    c330:	0000cb4c 	.word	0x0000cb4c
    c334:	0000cb4c 	.word	0x0000cb4c
    c338:	0000cb4c 	.word	0x0000cb4c
    c33c:	0000cb4c 	.word	0x0000cb4c
    c340:	0000cb4c 	.word	0x0000cb4c
    c344:	0000cb4c 	.word	0x0000cb4c
    c348:	0000cb4c 	.word	0x0000cb4c
    c34c:	0000cb4c 	.word	0x0000cb4c
    c350:	0000cb4c 	.word	0x0000cb4c
    c354:	0000cb4c 	.word	0x0000cb4c
    c358:	0000c960 	.word	0x0000c960
    c35c:	0000cb4c 	.word	0x0000cb4c
    c360:	0000cb4c 	.word	0x0000cb4c
    c364:	0000cb4c 	.word	0x0000cb4c
    c368:	0000cb4c 	.word	0x0000cb4c
    c36c:	0000cb4c 	.word	0x0000cb4c
    c370:	0000cb4c 	.word	0x0000cb4c
    c374:	0000cb4c 	.word	0x0000cb4c
    c378:	0000cb4c 	.word	0x0000cb4c
    c37c:	0000cb4c 	.word	0x0000cb4c
    c380:	0000cb4c 	.word	0x0000cb4c
    c384:	0000c7f4 	.word	0x0000c7f4
    c388:	0000cb4c 	.word	0x0000cb4c
    c38c:	0000cb4c 	.word	0x0000cb4c
    c390:	0000cb4c 	.word	0x0000cb4c
    c394:	0000cb4c 	.word	0x0000cb4c
    c398:	0000cb4c 	.word	0x0000cb4c
    c39c:	0000c800 	.word	0x0000c800
    c3a0:	0000cb4c 	.word	0x0000cb4c
    c3a4:	0000cb4c 	.word	0x0000cb4c
    c3a8:	0000ca64 	.word	0x0000ca64
    c3ac:	0000cb4c 	.word	0x0000cb4c
    c3b0:	0000cb4c 	.word	0x0000cb4c
    c3b4:	0000cb4c 	.word	0x0000cb4c
    c3b8:	0000cb4c 	.word	0x0000cb4c
    c3bc:	0000cb4c 	.word	0x0000cb4c
    c3c0:	0000cb4c 	.word	0x0000cb4c
    c3c4:	0000cb4c 	.word	0x0000cb4c
    c3c8:	0000cb4c 	.word	0x0000cb4c
    c3cc:	0000cb4c 	.word	0x0000cb4c
    c3d0:	0000cb4c 	.word	0x0000cb4c
    c3d4:	0000cad8 	.word	0x0000cad8
    c3d8:	0000ca54 	.word	0x0000ca54
    c3dc:	0000cb4c 	.word	0x0000cb4c
    c3e0:	0000cb4c 	.word	0x0000cb4c
    c3e4:	0000cb4c 	.word	0x0000cb4c
    c3e8:	0000c8f8 	.word	0x0000c8f8
    c3ec:	0000ca54 	.word	0x0000ca54
    c3f0:	0000cb4c 	.word	0x0000cb4c
    c3f4:	0000cb4c 	.word	0x0000cb4c
    c3f8:	0000c904 	.word	0x0000c904
    c3fc:	0000cb4c 	.word	0x0000cb4c
    c400:	0000ca18 	.word	0x0000ca18
    c404:	0000c7b8 	.word	0x0000c7b8
    c408:	0000c80c 	.word	0x0000c80c
    c40c:	0000c848 	.word	0x0000c848
    c410:	0000cb4c 	.word	0x0000cb4c
    c414:	0000c854 	.word	0x0000c854
    c418:	0000cb4c 	.word	0x0000cb4c
    c41c:	0000c4f8 	.word	0x0000c4f8
    c420:	0000cb4c 	.word	0x0000cb4c
    c424:	0000cb4c 	.word	0x0000cb4c
    c428:	0000cb20 	.word	0x0000cb20
    c42c:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    c430:	eb000995 	bl	ea8c <__retarget_lock_acquire_recursive>
    c434:	e1da30fc 	ldrsh	r3, [sl, #12]
    c438:	e1a01803 	lsl	r1, r3, #16
    c43c:	e1a01821 	lsr	r1, r1, #16
    c440:	eaffff58 	b	c1a8 <_vfiprintf_r+0x50>
    c444:	e3520000 	cmp	r2, #0
    c448:	1a000314 	bne	d0a0 <_vfiprintf_r+0xf48>
    c44c:	e58d2040 	str	r2, [sp, #64]	; 0x40
    c450:	e1a0b008 	mov	fp, r8
    c454:	eaffff83 	b	c268 <_vfiprintf_r+0x110>
    c458:	e1a0100a 	mov	r1, sl
    c45c:	e59d0014 	ldr	r0, [sp, #20]
    c460:	eb000438 	bl	d548 <__swsetup_r>
    c464:	e3500000 	cmp	r0, #0
    c468:	1a0002f6 	bne	d048 <_vfiprintf_r+0xef0>
    c46c:	e1da10bc 	ldrh	r1, [sl, #12]
    c470:	e201301a 	and	r3, r1, #26
    c474:	e353000a 	cmp	r3, #10
    c478:	1affff5b 	bne	c1ec <_vfiprintf_r+0x94>
    c47c:	e1da30fe 	ldrsh	r3, [sl, #14]
    c480:	e3530000 	cmp	r3, #0
    c484:	baffff58 	blt	c1ec <_vfiprintf_r+0x94>
    c488:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    c48c:	e3130001 	tst	r3, #1
    c490:	1a000002 	bne	c4a0 <_vfiprintf_r+0x348>
    c494:	e3110c02 	tst	r1, #512	; 0x200
    c498:	059a0058 	ldreq	r0, [sl, #88]	; 0x58
    c49c:	0b000980 	bleq	eaa4 <__retarget_lock_release_recursive>
    c4a0:	e1a03005 	mov	r3, r5
    c4a4:	e1a02009 	mov	r2, r9
    c4a8:	e1a0100a 	mov	r1, sl
    c4ac:	e59d0014 	ldr	r0, [sp, #20]
    c4b0:	eb0003f0 	bl	d478 <__sbprintf>
    c4b4:	e58d0008 	str	r0, [sp, #8]
    c4b8:	e59d0008 	ldr	r0, [sp, #8]
    c4bc:	e28dd0b4 	add	sp, sp, #180	; 0xb4
    c4c0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c4c4:	e12fff1e 	bx	lr
    c4c8:	eb0005a0 	bl	db50 <__sinit>
    c4cc:	eaffff2d 	b	c188 <_vfiprintf_r+0x30>
    c4d0:	e59d3018 	ldr	r3, [sp, #24]
    c4d4:	e5930000 	ldr	r0, [r3]
    c4d8:	e2833004 	add	r3, r3, #4
    c4dc:	e3500000 	cmp	r0, #0
    c4e0:	e58d3018 	str	r3, [sp, #24]
    c4e4:	aa000001 	bge	c4f0 <_vfiprintf_r+0x398>
    c4e8:	e2600000 	rsb	r0, r0, #0
    c4ec:	e3855004 	orr	r5, r5, #4
    c4f0:	e5d93000 	ldrb	r3, [r9]
    c4f4:	eaffff6e 	b	c2b4 <_vfiprintf_r+0x15c>
    c4f8:	e58d001c 	str	r0, [sp, #28]
    c4fc:	e3150020 	tst	r5, #32
    c500:	1a00032b 	bne	d1b4 <_vfiprintf_r+0x105c>
    c504:	e59d2018 	ldr	r2, [sp, #24]
    c508:	e3150010 	tst	r5, #16
    c50c:	e1a03002 	mov	r3, r2
    c510:	1a0002f0 	bne	d0d8 <_vfiprintf_r+0xf80>
    c514:	e3150040 	tst	r5, #64	; 0x40
    c518:	0a0002ee 	beq	d0d8 <_vfiprintf_r+0xf80>
    c51c:	e3a03001 	mov	r3, #1
    c520:	e3a07000 	mov	r7, #0
    c524:	e1d260b0 	ldrh	r6, [r2]
    c528:	e2822004 	add	r2, r2, #4
    c52c:	e58d2018 	str	r2, [sp, #24]
    c530:	e3a02000 	mov	r2, #0
    c534:	e3a04000 	mov	r4, #0
    c538:	e5cd2037 	strb	r2, [sp, #55]	; 0x37
    c53c:	e37a0001 	cmn	sl, #1
    c540:	0a00011e 	beq	c9c0 <_vfiprintf_r+0x868>
    c544:	e1862007 	orr	r2, r6, r7
    c548:	e3520000 	cmp	r2, #0
    c54c:	035a0000 	cmpeq	sl, #0
    c550:	e3c52080 	bic	r2, r5, #128	; 0x80
    c554:	e58d2004 	str	r2, [sp, #4]
    c558:	1a000298 	bne	cfc0 <_vfiprintf_r+0xe68>
    c55c:	e3530000 	cmp	r3, #0
    c560:	1a000292 	bne	cfb0 <_vfiprintf_r+0xe58>
    c564:	e2153001 	ands	r3, r5, #1
    c568:	e58d3010 	str	r3, [sp, #16]
    c56c:	058d8024 	streq	r8, [sp, #36]	; 0x24
    c570:	13a03030 	movne	r3, #48	; 0x30
    c574:	128d20b0 	addne	r2, sp, #176	; 0xb0
    c578:	15623041 	strbne	r3, [r2, #-65]!	; 0xffffffbf
    c57c:	158d2024 	strne	r2, [sp, #36]	; 0x24
    c580:	e59d3010 	ldr	r3, [sp, #16]
    c584:	e15a0003 	cmp	sl, r3
    c588:	a1a0700a 	movge	r7, sl
    c58c:	b1a07003 	movlt	r7, r3
    c590:	e3540000 	cmp	r4, #0
    c594:	12877001 	addne	r7, r7, #1
    c598:	e59d3004 	ldr	r3, [sp, #4]
    c59c:	e2133002 	ands	r3, r3, #2
    c5a0:	e58d3020 	str	r3, [sp, #32]
    c5a4:	e59d3004 	ldr	r3, [sp, #4]
    c5a8:	12877002 	addne	r7, r7, #2
    c5ac:	e2136084 	ands	r6, r3, #132	; 0x84
    c5b0:	1a00018d 	bne	cbec <_vfiprintf_r+0xa94>
    c5b4:	e59d301c 	ldr	r3, [sp, #28]
    c5b8:	e0434007 	sub	r4, r3, r7
    c5bc:	e3540000 	cmp	r4, #0
    c5c0:	da000189 	ble	cbec <_vfiprintf_r+0xa94>
    c5c4:	e3540010 	cmp	r4, #16
    c5c8:	da000378 	ble	d3b0 <_vfiprintf_r+0x1258>
    c5cc:	e1a0e00b 	mov	lr, fp
    c5d0:	e3a05010 	mov	r5, #16
    c5d4:	e1a0b007 	mov	fp, r7
    c5d8:	e3a03001 	mov	r3, #1
    c5dc:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    c5e0:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
    c5e4:	e59d7014 	ldr	r7, [sp, #20]
    c5e8:	ea000005 	b	c604 <_vfiprintf_r+0x4ac>
    c5ec:	e28c1002 	add	r1, ip, #2
    c5f0:	e1a0c000 	mov	ip, r0
    c5f4:	e28ee008 	add	lr, lr, #8
    c5f8:	e2444010 	sub	r4, r4, #16
    c5fc:	e3540010 	cmp	r4, #16
    c600:	da00000f 	ble	c644 <_vfiprintf_r+0x4ec>
    c604:	e28c0001 	add	r0, ip, #1
    c608:	e59f1e38 	ldr	r1, [pc, #3640]	; d448 <_vfiprintf_r+0x12f0>
    c60c:	e2822010 	add	r2, r2, #16
    c610:	e3500007 	cmp	r0, #7
    c614:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c618:	e88e0022 	stm	lr, {r1, r5}
    c61c:	e58d0040 	str	r0, [sp, #64]	; 0x40
    c620:	dafffff1 	ble	c5ec <_vfiprintf_r+0x494>
    c624:	e3520000 	cmp	r2, #0
    c628:	1a00015b 	bne	cb9c <_vfiprintf_r+0xa44>
    c62c:	e2444010 	sub	r4, r4, #16
    c630:	e3540010 	cmp	r4, #16
    c634:	e1a0c006 	mov	ip, r6
    c638:	e1a01003 	mov	r1, r3
    c63c:	e1a0e008 	mov	lr, r8
    c640:	caffffef 	bgt	c604 <_vfiprintf_r+0x4ac>
    c644:	e1a0700b 	mov	r7, fp
    c648:	e1a0b00e 	mov	fp, lr
    c64c:	e59f3df4 	ldr	r3, [pc, #3572]	; d448 <_vfiprintf_r+0x12f0>
    c650:	e3510007 	cmp	r1, #7
    c654:	e0842002 	add	r2, r4, r2
    c658:	e88b0018 	stm	fp, {r3, r4}
    c65c:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c660:	e58d1040 	str	r1, [sp, #64]	; 0x40
    c664:	d28bb008 	addle	fp, fp, #8
    c668:	d2810001 	addle	r0, r1, #1
    c66c:	da000161 	ble	cbf8 <_vfiprintf_r+0xaa0>
    c670:	e3520000 	cmp	r2, #0
    c674:	1a000155 	bne	cbd0 <_vfiprintf_r+0xa78>
    c678:	e5dd1037 	ldrb	r1, [sp, #55]	; 0x37
    c67c:	e3510000 	cmp	r1, #0
    c680:	0a0002fb 	beq	d274 <_vfiprintf_r+0x111c>
    c684:	e3a02001 	mov	r2, #1
    c688:	e1a0b008 	mov	fp, r8
    c68c:	e1a00002 	mov	r0, r2
    c690:	e28d1037 	add	r1, sp, #55	; 0x37
    c694:	e58d2074 	str	r2, [sp, #116]	; 0x74
    c698:	e58d1070 	str	r1, [sp, #112]	; 0x70
    c69c:	e1a01000 	mov	r1, r0
    c6a0:	e28bb008 	add	fp, fp, #8
    c6a4:	e2800001 	add	r0, r0, #1
    c6a8:	e59d3020 	ldr	r3, [sp, #32]
    c6ac:	e3530000 	cmp	r3, #0
    c6b0:	0a00016a 	beq	cc60 <_vfiprintf_r+0xb08>
    c6b4:	e3a01002 	mov	r1, #2
    c6b8:	e28d3038 	add	r3, sp, #56	; 0x38
    c6bc:	e0822001 	add	r2, r2, r1
    c6c0:	e3500007 	cmp	r0, #7
    c6c4:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c6c8:	e58d0040 	str	r0, [sp, #64]	; 0x40
    c6cc:	e58b1004 	str	r1, [fp, #4]
    c6d0:	e58b3000 	str	r3, [fp]
    c6d4:	da00015e 	ble	cc54 <_vfiprintf_r+0xafc>
    c6d8:	e3520000 	cmp	r2, #0
    c6dc:	1a000292 	bne	d12c <_vfiprintf_r+0xfd4>
    c6e0:	e3560080 	cmp	r6, #128	; 0x80
    c6e4:	e3a00001 	mov	r0, #1
    c6e8:	e3a01000 	mov	r1, #0
    c6ec:	e1a0b008 	mov	fp, r8
    c6f0:	1a00015c 	bne	cc68 <_vfiprintf_r+0xb10>
    c6f4:	e59d301c 	ldr	r3, [sp, #28]
    c6f8:	e0434007 	sub	r4, r3, r7
    c6fc:	e3540000 	cmp	r4, #0
    c700:	da000158 	ble	cc68 <_vfiprintf_r+0xb10>
    c704:	e3540010 	cmp	r4, #16
    c708:	da00033b 	ble	d3fc <_vfiprintf_r+0x12a4>
    c70c:	e1a0e00b 	mov	lr, fp
    c710:	e3a05010 	mov	r5, #16
    c714:	e1a0b007 	mov	fp, r7
    c718:	e3a06001 	mov	r6, #1
    c71c:	e1a07004 	mov	r7, r4
    c720:	e59d4014 	ldr	r4, [sp, #20]
    c724:	ea000005 	b	c740 <_vfiprintf_r+0x5e8>
    c728:	e281c002 	add	ip, r1, #2
    c72c:	e1a01000 	mov	r1, r0
    c730:	e28ee008 	add	lr, lr, #8
    c734:	e2477010 	sub	r7, r7, #16
    c738:	e3570010 	cmp	r7, #16
    c73c:	da00000f 	ble	c780 <_vfiprintf_r+0x628>
    c740:	e2810001 	add	r0, r1, #1
    c744:	e59f3d00 	ldr	r3, [pc, #3328]	; d44c <_vfiprintf_r+0x12f4>
    c748:	e2822010 	add	r2, r2, #16
    c74c:	e3500007 	cmp	r0, #7
    c750:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c754:	e88e0028 	stm	lr, {r3, r5}
    c758:	e58d0040 	str	r0, [sp, #64]	; 0x40
    c75c:	dafffff1 	ble	c728 <_vfiprintf_r+0x5d0>
    c760:	e3520000 	cmp	r2, #0
    c764:	1a000206 	bne	cf84 <_vfiprintf_r+0xe2c>
    c768:	e2477010 	sub	r7, r7, #16
    c76c:	e3570010 	cmp	r7, #16
    c770:	e1a0c006 	mov	ip, r6
    c774:	e3a01000 	mov	r1, #0
    c778:	e1a0e008 	mov	lr, r8
    c77c:	caffffef 	bgt	c740 <_vfiprintf_r+0x5e8>
    c780:	e1a04007 	mov	r4, r7
    c784:	e1a0700b 	mov	r7, fp
    c788:	e1a0b00e 	mov	fp, lr
    c78c:	e59f3cb8 	ldr	r3, [pc, #3256]	; d44c <_vfiprintf_r+0x12f4>
    c790:	e0822004 	add	r2, r2, r4
    c794:	e35c0007 	cmp	ip, #7
    c798:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c79c:	e88b0018 	stm	fp, {r3, r4}
    c7a0:	e58dc040 	str	ip, [sp, #64]	; 0x40
    c7a4:	ca00026b 	bgt	d158 <_vfiprintf_r+0x1000>
    c7a8:	e28bb008 	add	fp, fp, #8
    c7ac:	e28c0001 	add	r0, ip, #1
    c7b0:	e1a0100c 	mov	r1, ip
    c7b4:	ea00012b 	b	cc68 <_vfiprintf_r+0xb10>
    c7b8:	e58d001c 	str	r0, [sp, #28]
    c7bc:	e3150020 	tst	r5, #32
    c7c0:	1a000283 	bne	d1d4 <_vfiprintf_r+0x107c>
    c7c4:	e59d2018 	ldr	r2, [sp, #24]
    c7c8:	e3150010 	tst	r5, #16
    c7cc:	e1a03002 	mov	r3, r2
    c7d0:	1a00023a 	bne	d0c0 <_vfiprintf_r+0xf68>
    c7d4:	e3150040 	tst	r5, #64	; 0x40
    c7d8:	0a000238 	beq	d0c0 <_vfiprintf_r+0xf68>
    c7dc:	e1d260b0 	ldrh	r6, [r2]
    c7e0:	e2822004 	add	r2, r2, #4
    c7e4:	e3a03000 	mov	r3, #0
    c7e8:	e58d2018 	str	r2, [sp, #24]
    c7ec:	e3a07000 	mov	r7, #0
    c7f0:	eaffff4e 	b	c530 <_vfiprintf_r+0x3d8>
    c7f4:	e58d001c 	str	r0, [sp, #28]
    c7f8:	e3855010 	orr	r5, r5, #16
    c7fc:	eaffffee 	b	c7bc <_vfiprintf_r+0x664>
    c800:	e58d001c 	str	r0, [sp, #28]
    c804:	e3855010 	orr	r5, r5, #16
    c808:	eaffff3b 	b	c4fc <_vfiprintf_r+0x3a4>
    c80c:	e3a03078 	mov	r3, #120	; 0x78
    c810:	e3a02030 	mov	r2, #48	; 0x30
    c814:	e59d1018 	ldr	r1, [sp, #24]
    c818:	e5cd3039 	strb	r3, [sp, #57]	; 0x39
    c81c:	e2813004 	add	r3, r1, #4
    c820:	e58d3018 	str	r3, [sp, #24]
    c824:	e59f3c24 	ldr	r3, [pc, #3108]	; d450 <_vfiprintf_r+0x12f8>
    c828:	e58d001c 	str	r0, [sp, #28]
    c82c:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    c830:	e5916000 	ldr	r6, [r1]
    c834:	e3855002 	orr	r5, r5, #2
    c838:	e5cd2038 	strb	r2, [sp, #56]	; 0x38
    c83c:	e3a07000 	mov	r7, #0
    c840:	e3a03002 	mov	r3, #2
    c844:	eaffff39 	b	c530 <_vfiprintf_r+0x3d8>
    c848:	e3855020 	orr	r5, r5, #32
    c84c:	e5d93000 	ldrb	r3, [r9]
    c850:	eafffe97 	b	c2b4 <_vfiprintf_r+0x15c>
    c854:	e59d3018 	ldr	r3, [sp, #24]
    c858:	e5932000 	ldr	r2, [r3]
    c85c:	e58d2024 	str	r2, [sp, #36]	; 0x24
    c860:	e3520000 	cmp	r2, #0
    c864:	e3a02000 	mov	r2, #0
    c868:	e58d001c 	str	r0, [sp, #28]
    c86c:	e5cd2037 	strb	r2, [sp, #55]	; 0x37
    c870:	e2834004 	add	r4, r3, #4
    c874:	0a0002d1 	beq	d3c0 <_vfiprintf_r+0x1268>
    c878:	e37a0001 	cmn	sl, #1
    c87c:	0a0002b8 	beq	d364 <_vfiprintf_r+0x120c>
    c880:	e59d6024 	ldr	r6, [sp, #36]	; 0x24
    c884:	e1a0200a 	mov	r2, sl
    c888:	e3a01000 	mov	r1, #0
    c88c:	e1a00006 	mov	r0, r6
    c890:	eb000aef 	bl	f454 <memchr>
    c894:	e3500000 	cmp	r0, #0
    c898:	0a0002d1 	beq	d3e4 <_vfiprintf_r+0x128c>
    c89c:	e0403006 	sub	r3, r0, r6
    c8a0:	e58d4018 	str	r4, [sp, #24]
    c8a4:	e58d3010 	str	r3, [sp, #16]
    c8a8:	e58d5004 	str	r5, [sp, #4]
    c8ac:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    c8b0:	e3a0a000 	mov	sl, #0
    c8b4:	eaffff31 	b	c580 <_vfiprintf_r+0x428>
    c8b8:	e5d93000 	ldrb	r3, [r9]
    c8bc:	e353002a 	cmp	r3, #42	; 0x2a
    c8c0:	e289a001 	add	sl, r9, #1
    c8c4:	0a0002d5 	beq	d420 <_vfiprintf_r+0x12c8>
    c8c8:	e2432030 	sub	r2, r3, #48	; 0x30
    c8cc:	e3520009 	cmp	r2, #9
    c8d0:	e1a0900a 	mov	r9, sl
    c8d4:	e3a0a000 	mov	sl, #0
    c8d8:	8afffe76 	bhi	c2b8 <_vfiprintf_r+0x160>
    c8dc:	e4d93001 	ldrb	r3, [r9], #1
    c8e0:	e08aa10a 	add	sl, sl, sl, lsl #2
    c8e4:	e082a08a 	add	sl, r2, sl, lsl #1
    c8e8:	e2432030 	sub	r2, r3, #48	; 0x30
    c8ec:	e3520009 	cmp	r2, #9
    c8f0:	9afffff9 	bls	c8dc <_vfiprintf_r+0x784>
    c8f4:	eafffe6f 	b	c2b8 <_vfiprintf_r+0x160>
    c8f8:	e3855040 	orr	r5, r5, #64	; 0x40
    c8fc:	e5d93000 	ldrb	r3, [r9]
    c900:	eafffe6b 	b	c2b4 <_vfiprintf_r+0x15c>
    c904:	e5d93000 	ldrb	r3, [r9]
    c908:	e353006c 	cmp	r3, #108	; 0x6c
    c90c:	05d93001 	ldrbeq	r3, [r9, #1]
    c910:	03855020 	orreq	r5, r5, #32
    c914:	02899001 	addeq	r9, r9, #1
    c918:	13855010 	orrne	r5, r5, #16
    c91c:	eafffe64 	b	c2b4 <_vfiprintf_r+0x15c>
    c920:	e5d93000 	ldrb	r3, [r9]
    c924:	e1a0100e 	mov	r1, lr
    c928:	e1a0c004 	mov	ip, r4
    c92c:	eafffe60 	b	c2b4 <_vfiprintf_r+0x15c>
    c930:	e3855080 	orr	r5, r5, #128	; 0x80
    c934:	e5d93000 	ldrb	r3, [r9]
    c938:	eafffe5d 	b	c2b4 <_vfiprintf_r+0x15c>
    c93c:	e3a00000 	mov	r0, #0
    c940:	e2432030 	sub	r2, r3, #48	; 0x30
    c944:	e4d93001 	ldrb	r3, [r9], #1
    c948:	e0800100 	add	r0, r0, r0, lsl #2
    c94c:	e0820080 	add	r0, r2, r0, lsl #1
    c950:	e2432030 	sub	r2, r3, #48	; 0x30
    c954:	e3520009 	cmp	r2, #9
    c958:	9afffff9 	bls	c944 <_vfiprintf_r+0x7ec>
    c95c:	eafffe55 	b	c2b8 <_vfiprintf_r+0x160>
    c960:	e3510000 	cmp	r1, #0
    c964:	e58d001c 	str	r0, [sp, #28]
    c968:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    c96c:	e3855010 	orr	r5, r5, #16
    c970:	e3150020 	tst	r5, #32
    c974:	1a0001ff 	bne	d178 <_vfiprintf_r+0x1020>
    c978:	e3150010 	tst	r5, #16
    c97c:	1a00025a 	bne	d2ec <_vfiprintf_r+0x1194>
    c980:	e3150040 	tst	r5, #64	; 0x40
    c984:	0a000241 	beq	d290 <_vfiprintf_r+0x1138>
    c988:	e59d3018 	ldr	r3, [sp, #24]
    c98c:	e1d360f0 	ldrsh	r6, [r3]
    c990:	e2833004 	add	r3, r3, #4
    c994:	e1a07fc6 	asr	r7, r6, #31
    c998:	e58d3018 	str	r3, [sp, #24]
    c99c:	e1a02006 	mov	r2, r6
    c9a0:	e1a03007 	mov	r3, r7
    c9a4:	e3520000 	cmp	r2, #0
    c9a8:	e2d33000 	sbcs	r3, r3, #0
    c9ac:	ba000229 	blt	d258 <_vfiprintf_r+0x1100>
    c9b0:	e37a0001 	cmn	sl, #1
    c9b4:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    c9b8:	e3a03001 	mov	r3, #1
    c9bc:	1afffee0 	bne	c544 <_vfiprintf_r+0x3ec>
    c9c0:	e3530001 	cmp	r3, #1
    c9c4:	0a000180 	beq	cfcc <_vfiprintf_r+0xe74>
    c9c8:	e3530002 	cmp	r3, #2
    c9cc:	11a01008 	movne	r1, r8
    c9d0:	1a000153 	bne	cf24 <_vfiprintf_r+0xdcc>
    c9d4:	e1a02008 	mov	r2, r8
    c9d8:	e59dc02c 	ldr	ip, [sp, #44]	; 0x2c
    c9dc:	e1a03226 	lsr	r3, r6, #4
    c9e0:	e1833e07 	orr	r3, r3, r7, lsl #28
    c9e4:	e1a00227 	lsr	r0, r7, #4
    c9e8:	e206100f 	and	r1, r6, #15
    c9ec:	e1a07000 	mov	r7, r0
    c9f0:	e1a06003 	mov	r6, r3
    c9f4:	e7dc3001 	ldrb	r3, [ip, r1]
    c9f8:	e1961007 	orrs	r1, r6, r7
    c9fc:	e5623001 	strb	r3, [r2, #-1]!
    ca00:	1afffff5 	bne	c9dc <_vfiprintf_r+0x884>
    ca04:	e0483002 	sub	r3, r8, r2
    ca08:	e58d2024 	str	r2, [sp, #36]	; 0x24
    ca0c:	e58d5004 	str	r5, [sp, #4]
    ca10:	e58d3010 	str	r3, [sp, #16]
    ca14:	eafffed9 	b	c580 <_vfiprintf_r+0x428>
    ca18:	e3510000 	cmp	r1, #0
    ca1c:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    ca20:	e3150020 	tst	r5, #32
    ca24:	1a00023d 	bne	d320 <_vfiprintf_r+0x11c8>
    ca28:	e3150010 	tst	r5, #16
    ca2c:	1a000053 	bne	cb80 <_vfiprintf_r+0xa28>
    ca30:	e3150040 	tst	r5, #64	; 0x40
    ca34:	0a000051 	beq	cb80 <_vfiprintf_r+0xa28>
    ca38:	e59d2018 	ldr	r2, [sp, #24]
    ca3c:	e5923000 	ldr	r3, [r2]
    ca40:	e2822004 	add	r2, r2, #4
    ca44:	e58d2018 	str	r2, [sp, #24]
    ca48:	e1dd20b8 	ldrh	r2, [sp, #8]
    ca4c:	e1c320b0 	strh	r2, [r3]
    ca50:	eafffdee 	b	c210 <_vfiprintf_r+0xb8>
    ca54:	e3510000 	cmp	r1, #0
    ca58:	e58d001c 	str	r0, [sp, #28]
    ca5c:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    ca60:	eaffffc2 	b	c970 <_vfiprintf_r+0x818>
    ca64:	e59f29e8 	ldr	r2, [pc, #2536]	; d454 <_vfiprintf_r+0x12fc>
    ca68:	e3510000 	cmp	r1, #0
    ca6c:	e58d001c 	str	r0, [sp, #28]
    ca70:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    ca74:	e58d202c 	str	r2, [sp, #44]	; 0x2c
    ca78:	e3150020 	tst	r5, #32
    ca7c:	e59d2018 	ldr	r2, [sp, #24]
    ca80:	1a0001c5 	bne	d19c <_vfiprintf_r+0x1044>
    ca84:	e3150010 	tst	r5, #16
    ca88:	1a00021a 	bne	d2f8 <_vfiprintf_r+0x11a0>
    ca8c:	e3150040 	tst	r5, #64	; 0x40
    ca90:	13a07000 	movne	r7, #0
    ca94:	03a07000 	moveq	r7, #0
    ca98:	11d260b0 	ldrhne	r6, [r2]
    ca9c:	05926000 	ldreq	r6, [r2]
    caa0:	12822004 	addne	r2, r2, #4
    caa4:	02822004 	addeq	r2, r2, #4
    caa8:	158d2018 	strne	r2, [sp, #24]
    caac:	058d2018 	streq	r2, [sp, #24]
    cab0:	e3150001 	tst	r5, #1
    cab4:	0a00016e 	beq	d074 <_vfiprintf_r+0xf1c>
    cab8:	e1962007 	orrs	r2, r6, r7
    cabc:	0a00016c 	beq	d074 <_vfiprintf_r+0xf1c>
    cac0:	e3a02030 	mov	r2, #48	; 0x30
    cac4:	e5cd3039 	strb	r3, [sp, #57]	; 0x39
    cac8:	e3855002 	orr	r5, r5, #2
    cacc:	e5cd2038 	strb	r2, [sp, #56]	; 0x38
    cad0:	e3a03002 	mov	r3, #2
    cad4:	eafffe95 	b	c530 <_vfiprintf_r+0x3d8>
    cad8:	e3a07001 	mov	r7, #1
    cadc:	e3a01000 	mov	r1, #0
    cae0:	e59d2018 	ldr	r2, [sp, #24]
    cae4:	e5923000 	ldr	r3, [r2]
    cae8:	e5cd3048 	strb	r3, [sp, #72]	; 0x48
    caec:	e2823004 	add	r3, r2, #4
    caf0:	e58d3018 	str	r3, [sp, #24]
    caf4:	e28d3048 	add	r3, sp, #72	; 0x48
    caf8:	e58d001c 	str	r0, [sp, #28]
    cafc:	e5cd1037 	strb	r1, [sp, #55]	; 0x37
    cb00:	e58d7010 	str	r7, [sp, #16]
    cb04:	e58d3024 	str	r3, [sp, #36]	; 0x24
    cb08:	e58d5004 	str	r5, [sp, #4]
    cb0c:	e3a0a000 	mov	sl, #0
    cb10:	eafffea0 	b	c598 <_vfiprintf_r+0x440>
    cb14:	e3855001 	orr	r5, r5, #1
    cb18:	e5d93000 	ldrb	r3, [r9]
    cb1c:	eafffde4 	b	c2b4 <_vfiprintf_r+0x15c>
    cb20:	e59f2928 	ldr	r2, [pc, #2344]	; d450 <_vfiprintf_r+0x12f8>
    cb24:	e3510000 	cmp	r1, #0
    cb28:	e58d001c 	str	r0, [sp, #28]
    cb2c:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    cb30:	e58d202c 	str	r2, [sp, #44]	; 0x2c
    cb34:	eaffffcf 	b	ca78 <_vfiprintf_r+0x920>
    cb38:	e35c0000 	cmp	ip, #0
    cb3c:	e5d93000 	ldrb	r3, [r9]
    cb40:	01a0100e 	moveq	r1, lr
    cb44:	01a0c006 	moveq	ip, r6
    cb48:	eafffdd9 	b	c2b4 <_vfiprintf_r+0x15c>
    cb4c:	e3510000 	cmp	r1, #0
    cb50:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    cb54:	e3530000 	cmp	r3, #0
    cb58:	e58d001c 	str	r0, [sp, #28]
    cb5c:	0a0001f7 	beq	d340 <_vfiprintf_r+0x11e8>
    cb60:	e5cd3048 	strb	r3, [sp, #72]	; 0x48
    cb64:	e3a03000 	mov	r3, #0
    cb68:	e3a07001 	mov	r7, #1
    cb6c:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    cb70:	e28d3048 	add	r3, sp, #72	; 0x48
    cb74:	e58d7010 	str	r7, [sp, #16]
    cb78:	e58d3024 	str	r3, [sp, #36]	; 0x24
    cb7c:	eaffffe1 	b	cb08 <_vfiprintf_r+0x9b0>
    cb80:	e59d2018 	ldr	r2, [sp, #24]
    cb84:	e5923000 	ldr	r3, [r2]
    cb88:	e2822004 	add	r2, r2, #4
    cb8c:	e58d2018 	str	r2, [sp, #24]
    cb90:	e59d2008 	ldr	r2, [sp, #8]
    cb94:	e5832000 	str	r2, [r3]
    cb98:	eafffd9c 	b	c210 <_vfiprintf_r+0xb8>
    cb9c:	e28d203c 	add	r2, sp, #60	; 0x3c
    cba0:	e59d100c 	ldr	r1, [sp, #12]
    cba4:	e1a00007 	mov	r0, r7
    cba8:	e58d3028 	str	r3, [sp, #40]	; 0x28
    cbac:	ebfffd37 	bl	c090 <__sprint_r.part.0>
    cbb0:	e3500000 	cmp	r0, #0
    cbb4:	1a000114 	bne	d00c <_vfiprintf_r+0xeb4>
    cbb8:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
    cbbc:	e1a0e008 	mov	lr, r8
    cbc0:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    cbc4:	e28c1001 	add	r1, ip, #1
    cbc8:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    cbcc:	eafffe89 	b	c5f8 <_vfiprintf_r+0x4a0>
    cbd0:	e28d203c 	add	r2, sp, #60	; 0x3c
    cbd4:	e59d100c 	ldr	r1, [sp, #12]
    cbd8:	e59d0014 	ldr	r0, [sp, #20]
    cbdc:	ebfffd2b 	bl	c090 <__sprint_r.part.0>
    cbe0:	e3500000 	cmp	r0, #0
    cbe4:	1a000108 	bne	d00c <_vfiprintf_r+0xeb4>
    cbe8:	e1a0b008 	mov	fp, r8
    cbec:	e28d1040 	add	r1, sp, #64	; 0x40
    cbf0:	e8910006 	ldm	r1, {r1, r2}
    cbf4:	e2810001 	add	r0, r1, #1
    cbf8:	e5ddc037 	ldrb	ip, [sp, #55]	; 0x37
    cbfc:	e35c0000 	cmp	ip, #0
    cc00:	0afffea8 	beq	c6a8 <_vfiprintf_r+0x550>
    cc04:	e3a01001 	mov	r1, #1
    cc08:	e28dc037 	add	ip, sp, #55	; 0x37
    cc0c:	e0822001 	add	r2, r2, r1
    cc10:	e3500007 	cmp	r0, #7
    cc14:	e58d2044 	str	r2, [sp, #68]	; 0x44
    cc18:	e58d0040 	str	r0, [sp, #64]	; 0x40
    cc1c:	e58b1004 	str	r1, [fp, #4]
    cc20:	e58bc000 	str	ip, [fp]
    cc24:	dafffe9c 	ble	c69c <_vfiprintf_r+0x544>
    cc28:	e3520000 	cmp	r2, #0
    cc2c:	1a000133 	bne	d100 <_vfiprintf_r+0xfa8>
    cc30:	e59d3020 	ldr	r3, [sp, #32]
    cc34:	e3530000 	cmp	r3, #0
    cc38:	0afffea8 	beq	c6e0 <_vfiprintf_r+0x588>
    cc3c:	e3a02002 	mov	r2, #2
    cc40:	e1a00001 	mov	r0, r1
    cc44:	e1a0b008 	mov	fp, r8
    cc48:	e28d3038 	add	r3, sp, #56	; 0x38
    cc4c:	e58d2074 	str	r2, [sp, #116]	; 0x74
    cc50:	e58d3070 	str	r3, [sp, #112]	; 0x70
    cc54:	e1a01000 	mov	r1, r0
    cc58:	e28bb008 	add	fp, fp, #8
    cc5c:	e2800001 	add	r0, r0, #1
    cc60:	e3560080 	cmp	r6, #128	; 0x80
    cc64:	0afffea2 	beq	c6f4 <_vfiprintf_r+0x59c>
    cc68:	e59d3010 	ldr	r3, [sp, #16]
    cc6c:	e04aa003 	sub	sl, sl, r3
    cc70:	e35a0000 	cmp	sl, #0
    cc74:	da000057 	ble	cdd8 <_vfiprintf_r+0xc80>
    cc78:	e35a0010 	cmp	sl, #16
    cc7c:	da000019 	ble	cce8 <_vfiprintf_r+0xb90>
    cc80:	e3a04010 	mov	r4, #16
    cc84:	e59d5014 	ldr	r5, [sp, #20]
    cc88:	e59d600c 	ldr	r6, [sp, #12]
    cc8c:	ea000005 	b	cca8 <_vfiprintf_r+0xb50>
    cc90:	e2810002 	add	r0, r1, #2
    cc94:	e1a01003 	mov	r1, r3
    cc98:	e28bb008 	add	fp, fp, #8
    cc9c:	e24aa010 	sub	sl, sl, #16
    cca0:	e35a0010 	cmp	sl, #16
    cca4:	da00000f 	ble	cce8 <_vfiprintf_r+0xb90>
    cca8:	e2813001 	add	r3, r1, #1
    ccac:	e59f0798 	ldr	r0, [pc, #1944]	; d44c <_vfiprintf_r+0x12f4>
    ccb0:	e2822010 	add	r2, r2, #16
    ccb4:	e3530007 	cmp	r3, #7
    ccb8:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ccbc:	e88b0011 	stm	fp, {r0, r4}
    ccc0:	e58d3040 	str	r3, [sp, #64]	; 0x40
    ccc4:	dafffff1 	ble	cc90 <_vfiprintf_r+0xb38>
    ccc8:	e3520000 	cmp	r2, #0
    cccc:	1a00002c 	bne	cd84 <_vfiprintf_r+0xc2c>
    ccd0:	e24aa010 	sub	sl, sl, #16
    ccd4:	e35a0010 	cmp	sl, #16
    ccd8:	e3a00001 	mov	r0, #1
    ccdc:	e3a01000 	mov	r1, #0
    cce0:	e1a0b008 	mov	fp, r8
    cce4:	caffffef 	bgt	cca8 <_vfiprintf_r+0xb50>
    cce8:	e59f375c 	ldr	r3, [pc, #1884]	; d44c <_vfiprintf_r+0x12f4>
    ccec:	e3500007 	cmp	r0, #7
    ccf0:	e082200a 	add	r2, r2, sl
    ccf4:	e88b0408 	stm	fp, {r3, sl}
    ccf8:	e58d0040 	str	r0, [sp, #64]	; 0x40
    ccfc:	e58d2044 	str	r2, [sp, #68]	; 0x44
    cd00:	d28bb008 	addle	fp, fp, #8
    cd04:	d2800001 	addle	r0, r0, #1
    cd08:	da000032 	ble	cdd8 <_vfiprintf_r+0xc80>
    cd0c:	e3520000 	cmp	r2, #0
    cd10:	1a000026 	bne	cdb0 <_vfiprintf_r+0xc58>
    cd14:	e3a03001 	mov	r3, #1
    cd18:	e1a0b008 	mov	fp, r8
    cd1c:	e59d2010 	ldr	r2, [sp, #16]
    cd20:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    cd24:	e58d2074 	str	r2, [sp, #116]	; 0x74
    cd28:	e58d2044 	str	r2, [sp, #68]	; 0x44
    cd2c:	e58d1070 	str	r1, [sp, #112]	; 0x70
    cd30:	e58d3040 	str	r3, [sp, #64]	; 0x40
    cd34:	e28bb008 	add	fp, fp, #8
    cd38:	e59d3004 	ldr	r3, [sp, #4]
    cd3c:	e3130004 	tst	r3, #4
    cd40:	0a000003 	beq	cd54 <_vfiprintf_r+0xbfc>
    cd44:	e59d301c 	ldr	r3, [sp, #28]
    cd48:	e0434007 	sub	r4, r3, r7
    cd4c:	e3540000 	cmp	r4, #0
    cd50:	ca000033 	bgt	ce24 <_vfiprintf_r+0xccc>
    cd54:	e59d3008 	ldr	r3, [sp, #8]
    cd58:	e59d101c 	ldr	r1, [sp, #28]
    cd5c:	e1510007 	cmp	r1, r7
    cd60:	a0833001 	addge	r3, r3, r1
    cd64:	b0833007 	addlt	r3, r3, r7
    cd68:	e3520000 	cmp	r2, #0
    cd6c:	e58d3008 	str	r3, [sp, #8]
    cd70:	1a00009f 	bne	cff4 <_vfiprintf_r+0xe9c>
    cd74:	e3a03000 	mov	r3, #0
    cd78:	e1a0b008 	mov	fp, r8
    cd7c:	e58d3040 	str	r3, [sp, #64]	; 0x40
    cd80:	eafffd22 	b	c210 <_vfiprintf_r+0xb8>
    cd84:	e28d203c 	add	r2, sp, #60	; 0x3c
    cd88:	e1a01006 	mov	r1, r6
    cd8c:	e1a00005 	mov	r0, r5
    cd90:	ebfffcbe 	bl	c090 <__sprint_r.part.0>
    cd94:	e3500000 	cmp	r0, #0
    cd98:	1a0000f4 	bne	d170 <_vfiprintf_r+0x1018>
    cd9c:	e28d1040 	add	r1, sp, #64	; 0x40
    cda0:	e8910006 	ldm	r1, {r1, r2}
    cda4:	e1a0b008 	mov	fp, r8
    cda8:	e2810001 	add	r0, r1, #1
    cdac:	eaffffba 	b	cc9c <_vfiprintf_r+0xb44>
    cdb0:	e28d203c 	add	r2, sp, #60	; 0x3c
    cdb4:	e59d100c 	ldr	r1, [sp, #12]
    cdb8:	e59d0014 	ldr	r0, [sp, #20]
    cdbc:	ebfffcb3 	bl	c090 <__sprint_r.part.0>
    cdc0:	e3500000 	cmp	r0, #0
    cdc4:	1a000090 	bne	d00c <_vfiprintf_r+0xeb4>
    cdc8:	e1a0b008 	mov	fp, r8
    cdcc:	e28d0040 	add	r0, sp, #64	; 0x40
    cdd0:	e8900005 	ldm	r0, {r0, r2}
    cdd4:	e2800001 	add	r0, r0, #1
    cdd8:	e59d3010 	ldr	r3, [sp, #16]
    cddc:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    cde0:	e0832002 	add	r2, r3, r2
    cde4:	e3500007 	cmp	r0, #7
    cde8:	e58d2044 	str	r2, [sp, #68]	; 0x44
    cdec:	e88b000a 	stm	fp, {r1, r3}
    cdf0:	e58d0040 	str	r0, [sp, #64]	; 0x40
    cdf4:	daffffce 	ble	cd34 <_vfiprintf_r+0xbdc>
    cdf8:	e3520000 	cmp	r2, #0
    cdfc:	1a00009e 	bne	d07c <_vfiprintf_r+0xf24>
    ce00:	e59d3004 	ldr	r3, [sp, #4]
    ce04:	e3130004 	tst	r3, #4
    ce08:	e58d2040 	str	r2, [sp, #64]	; 0x40
    ce0c:	0a000031 	beq	ced8 <_vfiprintf_r+0xd80>
    ce10:	e59d301c 	ldr	r3, [sp, #28]
    ce14:	e0434007 	sub	r4, r3, r7
    ce18:	e3540000 	cmp	r4, #0
    ce1c:	c1a0b008 	movgt	fp, r8
    ce20:	da00002c 	ble	ced8 <_vfiprintf_r+0xd80>
    ce24:	e3540010 	cmp	r4, #16
    ce28:	d59d0040 	ldrle	r0, [sp, #64]	; 0x40
    ce2c:	d2800001 	addle	r0, r0, #1
    ce30:	da00001f 	ble	ceb4 <_vfiprintf_r+0xd5c>
    ce34:	e1a0c00b 	mov	ip, fp
    ce38:	e3a05010 	mov	r5, #16
    ce3c:	e1a0b004 	mov	fp, r4
    ce40:	e3a06001 	mov	r6, #1
    ce44:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    ce48:	e59da014 	ldr	sl, [sp, #20]
    ce4c:	e59d400c 	ldr	r4, [sp, #12]
    ce50:	ea000005 	b	ce6c <_vfiprintf_r+0xd14>
    ce54:	e2810002 	add	r0, r1, #2
    ce58:	e1a01003 	mov	r1, r3
    ce5c:	e28cc008 	add	ip, ip, #8
    ce60:	e24bb010 	sub	fp, fp, #16
    ce64:	e35b0010 	cmp	fp, #16
    ce68:	da00000f 	ble	ceac <_vfiprintf_r+0xd54>
    ce6c:	e2813001 	add	r3, r1, #1
    ce70:	e59f05d0 	ldr	r0, [pc, #1488]	; d448 <_vfiprintf_r+0x12f0>
    ce74:	e2822010 	add	r2, r2, #16
    ce78:	e3530007 	cmp	r3, #7
    ce7c:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ce80:	e88c0021 	stm	ip, {r0, r5}
    ce84:	e58d3040 	str	r3, [sp, #64]	; 0x40
    ce88:	dafffff1 	ble	ce54 <_vfiprintf_r+0xcfc>
    ce8c:	e3520000 	cmp	r2, #0
    ce90:	1a000017 	bne	cef4 <_vfiprintf_r+0xd9c>
    ce94:	e24bb010 	sub	fp, fp, #16
    ce98:	e35b0010 	cmp	fp, #16
    ce9c:	e1a00006 	mov	r0, r6
    cea0:	e3a01000 	mov	r1, #0
    cea4:	e1a0c008 	mov	ip, r8
    cea8:	caffffef 	bgt	ce6c <_vfiprintf_r+0xd14>
    ceac:	e1a0400b 	mov	r4, fp
    ceb0:	e1a0b00c 	mov	fp, ip
    ceb4:	e59f358c 	ldr	r3, [pc, #1420]	; d448 <_vfiprintf_r+0x12f0>
    ceb8:	e0822004 	add	r2, r2, r4
    cebc:	e3500007 	cmp	r0, #7
    cec0:	e58d2044 	str	r2, [sp, #68]	; 0x44
    cec4:	e88b0018 	stm	fp, {r3, r4}
    cec8:	e58d0040 	str	r0, [sp, #64]	; 0x40
    cecc:	daffffa0 	ble	cd54 <_vfiprintf_r+0xbfc>
    ced0:	e3520000 	cmp	r2, #0
    ced4:	1a0000f5 	bne	d2b0 <_vfiprintf_r+0x1158>
    ced8:	e59d3008 	ldr	r3, [sp, #8]
    cedc:	e59d201c 	ldr	r2, [sp, #28]
    cee0:	e1520007 	cmp	r2, r7
    cee4:	a0833002 	addge	r3, r3, r2
    cee8:	b0833007 	addlt	r3, r3, r7
    ceec:	e58d3008 	str	r3, [sp, #8]
    cef0:	eaffff9f 	b	cd74 <_vfiprintf_r+0xc1c>
    cef4:	e28d203c 	add	r2, sp, #60	; 0x3c
    cef8:	e1a01004 	mov	r1, r4
    cefc:	e1a0000a 	mov	r0, sl
    cf00:	ebfffc62 	bl	c090 <__sprint_r.part.0>
    cf04:	e3500000 	cmp	r0, #0
    cf08:	1a000113 	bne	d35c <_vfiprintf_r+0x1204>
    cf0c:	e28d1040 	add	r1, sp, #64	; 0x40
    cf10:	e8910006 	ldm	r1, {r1, r2}
    cf14:	e1a0c008 	mov	ip, r8
    cf18:	e2810001 	add	r0, r1, #1
    cf1c:	eaffffcf 	b	ce60 <_vfiprintf_r+0xd08>
    cf20:	e1a01002 	mov	r1, r2
    cf24:	e1a021a6 	lsr	r2, r6, #3
    cf28:	e1822e87 	orr	r2, r2, r7, lsl #29
    cf2c:	e1a001a7 	lsr	r0, r7, #3
    cf30:	e2063007 	and	r3, r6, #7
    cf34:	e1a07000 	mov	r7, r0
    cf38:	e1a06002 	mov	r6, r2
    cf3c:	e2833030 	add	r3, r3, #48	; 0x30
    cf40:	e1962007 	orrs	r2, r6, r7
    cf44:	e5413001 	strb	r3, [r1, #-1]
    cf48:	e2412001 	sub	r2, r1, #1
    cf4c:	1afffff3 	bne	cf20 <_vfiprintf_r+0xdc8>
    cf50:	e3530030 	cmp	r3, #48	; 0x30
    cf54:	03a03000 	moveq	r3, #0
    cf58:	12053001 	andne	r3, r5, #1
    cf5c:	e3530000 	cmp	r3, #0
    cf60:	0a0000e9 	beq	d30c <_vfiprintf_r+0x11b4>
    cf64:	e3a03030 	mov	r3, #48	; 0x30
    cf68:	e2411002 	sub	r1, r1, #2
    cf6c:	e58d1024 	str	r1, [sp, #36]	; 0x24
    cf70:	e0481001 	sub	r1, r8, r1
    cf74:	e58d5004 	str	r5, [sp, #4]
    cf78:	e58d1010 	str	r1, [sp, #16]
    cf7c:	e5423001 	strb	r3, [r2, #-1]
    cf80:	eafffd7e 	b	c580 <_vfiprintf_r+0x428>
    cf84:	e28d203c 	add	r2, sp, #60	; 0x3c
    cf88:	e59d100c 	ldr	r1, [sp, #12]
    cf8c:	e1a00004 	mov	r0, r4
    cf90:	ebfffc3e 	bl	c090 <__sprint_r.part.0>
    cf94:	e3500000 	cmp	r0, #0
    cf98:	1a00001b 	bne	d00c <_vfiprintf_r+0xeb4>
    cf9c:	e28d1040 	add	r1, sp, #64	; 0x40
    cfa0:	e8910006 	ldm	r1, {r1, r2}
    cfa4:	e1a0e008 	mov	lr, r8
    cfa8:	e281c001 	add	ip, r1, #1
    cfac:	eafffde0 	b	c734 <_vfiprintf_r+0x5dc>
    cfb0:	e3a03000 	mov	r3, #0
    cfb4:	e58d8024 	str	r8, [sp, #36]	; 0x24
    cfb8:	e58d3010 	str	r3, [sp, #16]
    cfbc:	eafffd6f 	b	c580 <_vfiprintf_r+0x428>
    cfc0:	e3530001 	cmp	r3, #1
    cfc4:	e1a05002 	mov	r5, r2
    cfc8:	1afffe7e 	bne	c9c8 <_vfiprintf_r+0x870>
    cfcc:	e3570000 	cmp	r7, #0
    cfd0:	03560009 	cmpeq	r6, #9
    cfd4:	8a000086 	bhi	d1f4 <_vfiprintf_r+0x109c>
    cfd8:	e28d20b0 	add	r2, sp, #176	; 0xb0
    cfdc:	e2866030 	add	r6, r6, #48	; 0x30
    cfe0:	e5626041 	strb	r6, [r2, #-65]!	; 0xffffffbf
    cfe4:	e58d5004 	str	r5, [sp, #4]
    cfe8:	e58d3010 	str	r3, [sp, #16]
    cfec:	e58d2024 	str	r2, [sp, #36]	; 0x24
    cff0:	eafffd62 	b	c580 <_vfiprintf_r+0x428>
    cff4:	e28d203c 	add	r2, sp, #60	; 0x3c
    cff8:	e59d100c 	ldr	r1, [sp, #12]
    cffc:	e59d0014 	ldr	r0, [sp, #20]
    d000:	ebfffc22 	bl	c090 <__sprint_r.part.0>
    d004:	e3500000 	cmp	r0, #0
    d008:	0affff59 	beq	cd74 <_vfiprintf_r+0xc1c>
    d00c:	e59da00c 	ldr	sl, [sp, #12]
    d010:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    d014:	e3130001 	tst	r3, #1
    d018:	e1da30bc 	ldrh	r3, [sl, #12]
    d01c:	1a000001 	bne	d028 <_vfiprintf_r+0xed0>
    d020:	e3130c02 	tst	r3, #512	; 0x200
    d024:	0a000031 	beq	d0f0 <_vfiprintf_r+0xf98>
    d028:	e3130040 	tst	r3, #64	; 0x40
    d02c:	0afffd21 	beq	c4b8 <_vfiprintf_r+0x360>
    d030:	e3e03000 	mvn	r3, #0
    d034:	e58d3008 	str	r3, [sp, #8]
    d038:	e59d0008 	ldr	r0, [sp, #8]
    d03c:	e28dd0b4 	add	sp, sp, #180	; 0xb4
    d040:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d044:	e12fff1e 	bx	lr
    d048:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    d04c:	e3130001 	tst	r3, #1
    d050:	1afffff6 	bne	d030 <_vfiprintf_r+0xed8>
    d054:	e1da30bc 	ldrh	r3, [sl, #12]
    d058:	e3130c02 	tst	r3, #512	; 0x200
    d05c:	1afffff3 	bne	d030 <_vfiprintf_r+0xed8>
    d060:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    d064:	eb00068e 	bl	eaa4 <__retarget_lock_release_recursive>
    d068:	e3e03000 	mvn	r3, #0
    d06c:	e58d3008 	str	r3, [sp, #8]
    d070:	eafffd10 	b	c4b8 <_vfiprintf_r+0x360>
    d074:	e3a03002 	mov	r3, #2
    d078:	eafffd2c 	b	c530 <_vfiprintf_r+0x3d8>
    d07c:	e28d203c 	add	r2, sp, #60	; 0x3c
    d080:	e59d100c 	ldr	r1, [sp, #12]
    d084:	e59d0014 	ldr	r0, [sp, #20]
    d088:	ebfffc00 	bl	c090 <__sprint_r.part.0>
    d08c:	e3500000 	cmp	r0, #0
    d090:	1affffdd 	bne	d00c <_vfiprintf_r+0xeb4>
    d094:	e1a0b008 	mov	fp, r8
    d098:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    d09c:	eaffff25 	b	cd38 <_vfiprintf_r+0xbe0>
    d0a0:	e28d203c 	add	r2, sp, #60	; 0x3c
    d0a4:	e59d100c 	ldr	r1, [sp, #12]
    d0a8:	e59d0014 	ldr	r0, [sp, #20]
    d0ac:	ebfffbf7 	bl	c090 <__sprint_r.part.0>
    d0b0:	e3500000 	cmp	r0, #0
    d0b4:	1affffd4 	bne	d00c <_vfiprintf_r+0xeb4>
    d0b8:	e1a0b008 	mov	fp, r8
    d0bc:	eafffc69 	b	c268 <_vfiprintf_r+0x110>
    d0c0:	e2822004 	add	r2, r2, #4
    d0c4:	e5936000 	ldr	r6, [r3]
    d0c8:	e3a07000 	mov	r7, #0
    d0cc:	e3a03000 	mov	r3, #0
    d0d0:	e58d2018 	str	r2, [sp, #24]
    d0d4:	eafffd15 	b	c530 <_vfiprintf_r+0x3d8>
    d0d8:	e2822004 	add	r2, r2, #4
    d0dc:	e5936000 	ldr	r6, [r3]
    d0e0:	e3a07000 	mov	r7, #0
    d0e4:	e3a03001 	mov	r3, #1
    d0e8:	e58d2018 	str	r2, [sp, #24]
    d0ec:	eafffd0f 	b	c530 <_vfiprintf_r+0x3d8>
    d0f0:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    d0f4:	eb00066a 	bl	eaa4 <__retarget_lock_release_recursive>
    d0f8:	e1da30bc 	ldrh	r3, [sl, #12]
    d0fc:	eaffffc9 	b	d028 <_vfiprintf_r+0xed0>
    d100:	e28d203c 	add	r2, sp, #60	; 0x3c
    d104:	e59d100c 	ldr	r1, [sp, #12]
    d108:	e59d0014 	ldr	r0, [sp, #20]
    d10c:	ebfffbdf 	bl	c090 <__sprint_r.part.0>
    d110:	e3500000 	cmp	r0, #0
    d114:	1affffbc 	bne	d00c <_vfiprintf_r+0xeb4>
    d118:	e28d1040 	add	r1, sp, #64	; 0x40
    d11c:	e8910006 	ldm	r1, {r1, r2}
    d120:	e1a0b008 	mov	fp, r8
    d124:	e2810001 	add	r0, r1, #1
    d128:	eafffd5e 	b	c6a8 <_vfiprintf_r+0x550>
    d12c:	e28d203c 	add	r2, sp, #60	; 0x3c
    d130:	e59d100c 	ldr	r1, [sp, #12]
    d134:	e59d0014 	ldr	r0, [sp, #20]
    d138:	ebfffbd4 	bl	c090 <__sprint_r.part.0>
    d13c:	e3500000 	cmp	r0, #0
    d140:	1affffb1 	bne	d00c <_vfiprintf_r+0xeb4>
    d144:	e28d1040 	add	r1, sp, #64	; 0x40
    d148:	e8910006 	ldm	r1, {r1, r2}
    d14c:	e1a0b008 	mov	fp, r8
    d150:	e2810001 	add	r0, r1, #1
    d154:	eafffec1 	b	cc60 <_vfiprintf_r+0xb08>
    d158:	e3520000 	cmp	r2, #0
    d15c:	1a000088 	bne	d384 <_vfiprintf_r+0x122c>
    d160:	e3a00001 	mov	r0, #1
    d164:	e3a01000 	mov	r1, #0
    d168:	e1a0b008 	mov	fp, r8
    d16c:	eafffebd 	b	cc68 <_vfiprintf_r+0xb10>
    d170:	e1a0a006 	mov	sl, r6
    d174:	eaffffa5 	b	d010 <_vfiprintf_r+0xeb8>
    d178:	e59d3018 	ldr	r3, [sp, #24]
    d17c:	e2833007 	add	r3, r3, #7
    d180:	e3c31007 	bic	r1, r3, #7
    d184:	e891000c 	ldm	r1, {r2, r3}
    d188:	e2811008 	add	r1, r1, #8
    d18c:	e58d1018 	str	r1, [sp, #24]
    d190:	e1a06002 	mov	r6, r2
    d194:	e1a07003 	mov	r7, r3
    d198:	eafffe01 	b	c9a4 <_vfiprintf_r+0x84c>
    d19c:	e2822007 	add	r2, r2, #7
    d1a0:	e3c22007 	bic	r2, r2, #7
    d1a4:	e2821008 	add	r1, r2, #8
    d1a8:	e58d1018 	str	r1, [sp, #24]
    d1ac:	e89200c0 	ldm	r2, {r6, r7}
    d1b0:	eafffe3e 	b	cab0 <_vfiprintf_r+0x958>
    d1b4:	e59d3018 	ldr	r3, [sp, #24]
    d1b8:	e2833007 	add	r3, r3, #7
    d1bc:	e3c33007 	bic	r3, r3, #7
    d1c0:	e2832008 	add	r2, r3, #8
    d1c4:	e89300c0 	ldm	r3, {r6, r7}
    d1c8:	e58d2018 	str	r2, [sp, #24]
    d1cc:	e3a03001 	mov	r3, #1
    d1d0:	eafffcd6 	b	c530 <_vfiprintf_r+0x3d8>
    d1d4:	e59d3018 	ldr	r3, [sp, #24]
    d1d8:	e2833007 	add	r3, r3, #7
    d1dc:	e3c33007 	bic	r3, r3, #7
    d1e0:	e2832008 	add	r2, r3, #8
    d1e4:	e89300c0 	ldm	r3, {r6, r7}
    d1e8:	e58d2018 	str	r2, [sp, #24]
    d1ec:	e3a03000 	mov	r3, #0
    d1f0:	eafffcce 	b	c530 <_vfiprintf_r+0x3d8>
    d1f4:	e58d4004 	str	r4, [sp, #4]
    d1f8:	e1a04008 	mov	r4, r8
    d1fc:	e1a00006 	mov	r0, r6
    d200:	e1a01007 	mov	r1, r7
    d204:	e3a0200a 	mov	r2, #10
    d208:	e3a03000 	mov	r3, #0
    d20c:	eb000d55 	bl	10768 <__aeabi_uldivmod>
    d210:	e2822030 	add	r2, r2, #48	; 0x30
    d214:	e5642001 	strb	r2, [r4, #-1]!
    d218:	e1a00006 	mov	r0, r6
    d21c:	e1a01007 	mov	r1, r7
    d220:	e3a03000 	mov	r3, #0
    d224:	e3a0200a 	mov	r2, #10
    d228:	eb000d4e 	bl	10768 <__aeabi_uldivmod>
    d22c:	e1a06000 	mov	r6, r0
    d230:	e1a07001 	mov	r7, r1
    d234:	e1963007 	orrs	r3, r6, r7
    d238:	1affffef 	bne	d1fc <_vfiprintf_r+0x10a4>
    d23c:	e1a03004 	mov	r3, r4
    d240:	e0483003 	sub	r3, r8, r3
    d244:	e58d4024 	str	r4, [sp, #36]	; 0x24
    d248:	e58d3010 	str	r3, [sp, #16]
    d24c:	e59d4004 	ldr	r4, [sp, #4]
    d250:	e58d5004 	str	r5, [sp, #4]
    d254:	eafffcc9 	b	c580 <_vfiprintf_r+0x428>
    d258:	e3a0302d 	mov	r3, #45	; 0x2d
    d25c:	e2766000 	rsbs	r6, r6, #0
    d260:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    d264:	e1a04003 	mov	r4, r3
    d268:	e2e77000 	rsc	r7, r7, #0
    d26c:	e3a03001 	mov	r3, #1
    d270:	eafffcb1 	b	c53c <_vfiprintf_r+0x3e4>
    d274:	e59d3020 	ldr	r3, [sp, #32]
    d278:	e3530000 	cmp	r3, #0
    d27c:	1a000013 	bne	d2d0 <_vfiprintf_r+0x1178>
    d280:	e3a01000 	mov	r1, #0
    d284:	e3a00001 	mov	r0, #1
    d288:	e1a0b008 	mov	fp, r8
    d28c:	eafffe75 	b	cc68 <_vfiprintf_r+0xb10>
    d290:	e59d1018 	ldr	r1, [sp, #24]
    d294:	e5916000 	ldr	r6, [r1]
    d298:	e2811004 	add	r1, r1, #4
    d29c:	e1a07fc6 	asr	r7, r6, #31
    d2a0:	e1a02006 	mov	r2, r6
    d2a4:	e1a03007 	mov	r3, r7
    d2a8:	e58d1018 	str	r1, [sp, #24]
    d2ac:	eafffdbc 	b	c9a4 <_vfiprintf_r+0x84c>
    d2b0:	e28d203c 	add	r2, sp, #60	; 0x3c
    d2b4:	e59d100c 	ldr	r1, [sp, #12]
    d2b8:	e59d0014 	ldr	r0, [sp, #20]
    d2bc:	ebfffb73 	bl	c090 <__sprint_r.part.0>
    d2c0:	e3500000 	cmp	r0, #0
    d2c4:	1affff50 	bne	d00c <_vfiprintf_r+0xeb4>
    d2c8:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    d2cc:	eafffea0 	b	cd54 <_vfiprintf_r+0xbfc>
    d2d0:	e3a02002 	mov	r2, #2
    d2d4:	e28d3038 	add	r3, sp, #56	; 0x38
    d2d8:	e58d2074 	str	r2, [sp, #116]	; 0x74
    d2dc:	e58d3070 	str	r3, [sp, #112]	; 0x70
    d2e0:	e3a00001 	mov	r0, #1
    d2e4:	e1a0b008 	mov	fp, r8
    d2e8:	eafffe59 	b	cc54 <_vfiprintf_r+0xafc>
    d2ec:	e59d3018 	ldr	r3, [sp, #24]
    d2f0:	e5936000 	ldr	r6, [r3]
    d2f4:	eafffda5 	b	c990 <_vfiprintf_r+0x838>
    d2f8:	e5926000 	ldr	r6, [r2]
    d2fc:	e2822004 	add	r2, r2, #4
    d300:	e58d2018 	str	r2, [sp, #24]
    d304:	e3a07000 	mov	r7, #0
    d308:	eafffde8 	b	cab0 <_vfiprintf_r+0x958>
    d30c:	e0483002 	sub	r3, r8, r2
    d310:	e58d5004 	str	r5, [sp, #4]
    d314:	e58d3010 	str	r3, [sp, #16]
    d318:	e58d2024 	str	r2, [sp, #36]	; 0x24
    d31c:	eafffc97 	b	c580 <_vfiprintf_r+0x428>
    d320:	e59d3018 	ldr	r3, [sp, #24]
    d324:	e59d2008 	ldr	r2, [sp, #8]
    d328:	e5931000 	ldr	r1, [r3]
    d32c:	e2833004 	add	r3, r3, #4
    d330:	e58d3018 	str	r3, [sp, #24]
    d334:	e1a03fc2 	asr	r3, r2, #31
    d338:	e881000c 	stm	r1, {r2, r3}
    d33c:	eafffbb3 	b	c210 <_vfiprintf_r+0xb8>
    d340:	e59d3044 	ldr	r3, [sp, #68]	; 0x44
    d344:	e3530000 	cmp	r3, #0
    d348:	e59da00c 	ldr	sl, [sp, #12]
    d34c:	1a00002c 	bne	d404 <_vfiprintf_r+0x12ac>
    d350:	e3a03000 	mov	r3, #0
    d354:	e58d3040 	str	r3, [sp, #64]	; 0x40
    d358:	eaffff2c 	b	d010 <_vfiprintf_r+0xeb8>
    d35c:	e1a0a004 	mov	sl, r4
    d360:	eaffff2a 	b	d010 <_vfiprintf_r+0xeb8>
    d364:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    d368:	e58d4018 	str	r4, [sp, #24]
    d36c:	e58d5004 	str	r5, [sp, #4]
    d370:	ebfffb2e 	bl	c030 <strlen>
    d374:	e3a0a000 	mov	sl, #0
    d378:	e58d0010 	str	r0, [sp, #16]
    d37c:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    d380:	eafffc7e 	b	c580 <_vfiprintf_r+0x428>
    d384:	e28d203c 	add	r2, sp, #60	; 0x3c
    d388:	e59d100c 	ldr	r1, [sp, #12]
    d38c:	e59d0014 	ldr	r0, [sp, #20]
    d390:	ebfffb3e 	bl	c090 <__sprint_r.part.0>
    d394:	e3500000 	cmp	r0, #0
    d398:	1affff1b 	bne	d00c <_vfiprintf_r+0xeb4>
    d39c:	e28d1040 	add	r1, sp, #64	; 0x40
    d3a0:	e8910006 	ldm	r1, {r1, r2}
    d3a4:	e1a0b008 	mov	fp, r8
    d3a8:	e2810001 	add	r0, r1, #1
    d3ac:	eafffe2d 	b	cc68 <_vfiprintf_r+0xb10>
    d3b0:	e28d1040 	add	r1, sp, #64	; 0x40
    d3b4:	e8910006 	ldm	r1, {r1, r2}
    d3b8:	e2811001 	add	r1, r1, #1
    d3bc:	eafffca2 	b	c64c <_vfiprintf_r+0x4f4>
    d3c0:	e35a0006 	cmp	sl, #6
    d3c4:	31a0300a 	movcc	r3, sl
    d3c8:	23a03006 	movcs	r3, #6
    d3cc:	e58d3010 	str	r3, [sp, #16]
    d3d0:	e1a07003 	mov	r7, r3
    d3d4:	e59f307c 	ldr	r3, [pc, #124]	; d458 <_vfiprintf_r+0x1300>
    d3d8:	e58d4018 	str	r4, [sp, #24]
    d3dc:	e58d3024 	str	r3, [sp, #36]	; 0x24
    d3e0:	eafffdc8 	b	cb08 <_vfiprintf_r+0x9b0>
    d3e4:	e58da010 	str	sl, [sp, #16]
    d3e8:	e58d4018 	str	r4, [sp, #24]
    d3ec:	e58d5004 	str	r5, [sp, #4]
    d3f0:	e3a0a000 	mov	sl, #0
    d3f4:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    d3f8:	eafffc60 	b	c580 <_vfiprintf_r+0x428>
    d3fc:	e1a0c000 	mov	ip, r0
    d400:	eafffce1 	b	c78c <_vfiprintf_r+0x634>
    d404:	e59d0014 	ldr	r0, [sp, #20]
    d408:	e28d203c 	add	r2, sp, #60	; 0x3c
    d40c:	e1a0100a 	mov	r1, sl
    d410:	ebfffb1e 	bl	c090 <__sprint_r.part.0>
    d414:	e3500000 	cmp	r0, #0
    d418:	0affffcc 	beq	d350 <_vfiprintf_r+0x11f8>
    d41c:	eafffefb 	b	d010 <_vfiprintf_r+0xeb8>
    d420:	e59d2018 	ldr	r2, [sp, #24]
    d424:	e58da004 	str	sl, [sp, #4]
    d428:	e592a000 	ldr	sl, [r2]
    d42c:	e2822004 	add	r2, r2, #4
    d430:	e15a0007 	cmp	sl, r7
    d434:	e5d93001 	ldrb	r3, [r9, #1]
    d438:	b1a0a007 	movlt	sl, r7
    d43c:	e59d9004 	ldr	r9, [sp, #4]
    d440:	e58d2018 	str	r2, [sp, #24]
    d444:	eafffb9a 	b	c2b4 <_vfiprintf_r+0x15c>
    d448:	00010f20 	.word	0x00010f20
    d44c:	00010f30 	.word	0x00010f30
    d450:	00010f04 	.word	0x00010f04
    d454:	00010ef0 	.word	0x00010ef0
    d458:	00010f18 	.word	0x00010f18

0000d45c <vfiprintf>:
    d45c:	e59fc010 	ldr	ip, [pc, #16]	; d474 <vfiprintf+0x18>
    d460:	e1a03002 	mov	r3, r2
    d464:	e1a02001 	mov	r2, r1
    d468:	e1a01000 	mov	r1, r0
    d46c:	e59c0000 	ldr	r0, [ip]
    d470:	eafffb38 	b	c158 <_vfiprintf_r>
    d474:	0001108c 	.word	0x0001108c

0000d478 <__sbprintf>:
    d478:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    d47c:	e1a04001 	mov	r4, r1
    d480:	e3a0cb01 	mov	ip, #1024	; 0x400
    d484:	e3a0e000 	mov	lr, #0
    d488:	e1a06002 	mov	r6, r2
    d48c:	e1a07000 	mov	r7, r0
    d490:	e1a08003 	mov	r8, r3
    d494:	e24dde46 	sub	sp, sp, #1120	; 0x460
    d498:	e1d430be 	ldrh	r3, [r4, #14]
    d49c:	e24dd008 	sub	sp, sp, #8
    d4a0:	e1d110bc 	ldrh	r1, [r1, #12]
    d4a4:	e1cd30be 	strh	r3, [sp, #14]
    d4a8:	e5943064 	ldr	r3, [r4, #100]	; 0x64
    d4ac:	e594201c 	ldr	r2, [r4, #28]
    d4b0:	e3c11002 	bic	r1, r1, #2
    d4b4:	e58d3064 	str	r3, [sp, #100]	; 0x64
    d4b8:	e5943024 	ldr	r3, [r4, #36]	; 0x24
    d4bc:	e1cd10bc 	strh	r1, [sp, #12]
    d4c0:	e28d0058 	add	r0, sp, #88	; 0x58
    d4c4:	e28d1068 	add	r1, sp, #104	; 0x68
    d4c8:	e58dc008 	str	ip, [sp, #8]
    d4cc:	e58dc014 	str	ip, [sp, #20]
    d4d0:	e58d201c 	str	r2, [sp, #28]
    d4d4:	e58d3024 	str	r3, [sp, #36]	; 0x24
    d4d8:	e58de018 	str	lr, [sp, #24]
    d4dc:	e58d1000 	str	r1, [sp]
    d4e0:	e58d1010 	str	r1, [sp, #16]
    d4e4:	eb000564 	bl	ea7c <__retarget_lock_init_recursive>
    d4e8:	e1a02006 	mov	r2, r6
    d4ec:	e1a03008 	mov	r3, r8
    d4f0:	e1a0100d 	mov	r1, sp
    d4f4:	e1a00007 	mov	r0, r7
    d4f8:	ebfffb16 	bl	c158 <_vfiprintf_r>
    d4fc:	e2506000 	subs	r6, r0, #0
    d500:	ba000004 	blt	d518 <__sbprintf+0xa0>
    d504:	e1a0100d 	mov	r1, sp
    d508:	e1a00007 	mov	r0, r7
    d50c:	eb0000fa 	bl	d8fc <_fflush_r>
    d510:	e3500000 	cmp	r0, #0
    d514:	13e06000 	mvnne	r6, #0
    d518:	e1dd30bc 	ldrh	r3, [sp, #12]
    d51c:	e3130040 	tst	r3, #64	; 0x40
    d520:	11d430bc 	ldrhne	r3, [r4, #12]
    d524:	13833040 	orrne	r3, r3, #64	; 0x40
    d528:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    d52c:	11c430bc 	strhne	r3, [r4, #12]
    d530:	eb000553 	bl	ea84 <__retarget_lock_close_recursive>
    d534:	e1a00006 	mov	r0, r6
    d538:	e28dde46 	add	sp, sp, #1120	; 0x460
    d53c:	e28dd008 	add	sp, sp, #8
    d540:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    d544:	e12fff1e 	bx	lr

0000d548 <__swsetup_r>:
    d548:	e59f3158 	ldr	r3, [pc, #344]	; d6a8 <__swsetup_r+0x160>
    d54c:	e5933000 	ldr	r3, [r3]
    d550:	e3530000 	cmp	r3, #0
    d554:	e92d4070 	push	{r4, r5, r6, lr}
    d558:	e1a05000 	mov	r5, r0
    d55c:	e1a04001 	mov	r4, r1
    d560:	0a000002 	beq	d570 <__swsetup_r+0x28>
    d564:	e5932038 	ldr	r2, [r3, #56]	; 0x38
    d568:	e3520000 	cmp	r2, #0
    d56c:	0a000034 	beq	d644 <__swsetup_r+0xfc>
    d570:	e1d420fc 	ldrsh	r2, [r4, #12]
    d574:	e1a03802 	lsl	r3, r2, #16
    d578:	e3130702 	tst	r3, #524288	; 0x80000
    d57c:	e1a03823 	lsr	r3, r3, #16
    d580:	0a00000c 	beq	d5b8 <__swsetup_r+0x70>
    d584:	e5940010 	ldr	r0, [r4, #16]
    d588:	e3500000 	cmp	r0, #0
    d58c:	0a000014 	beq	d5e4 <__swsetup_r+0x9c>
    d590:	e2132001 	ands	r2, r3, #1
    d594:	1a00001b 	bne	d608 <__swsetup_r+0xc0>
    d598:	e3130002 	tst	r3, #2
    d59c:	05942014 	ldreq	r2, [r4, #20]
    d5a0:	e3500000 	cmp	r0, #0
    d5a4:	e5842008 	str	r2, [r4, #8]
    d5a8:	13a00000 	movne	r0, #0
    d5ac:	0a00001d 	beq	d628 <__swsetup_r+0xe0>
    d5b0:	e8bd4070 	pop	{r4, r5, r6, lr}
    d5b4:	e12fff1e 	bx	lr
    d5b8:	e3130010 	tst	r3, #16
    d5bc:	0a000033 	beq	d690 <__swsetup_r+0x148>
    d5c0:	e3130004 	tst	r3, #4
    d5c4:	1a000021 	bne	d650 <__swsetup_r+0x108>
    d5c8:	e5940010 	ldr	r0, [r4, #16]
    d5cc:	e3822008 	orr	r2, r2, #8
    d5d0:	e1c420bc 	strh	r2, [r4, #12]
    d5d4:	e3500000 	cmp	r0, #0
    d5d8:	e1a02802 	lsl	r2, r2, #16
    d5dc:	e1a03822 	lsr	r3, r2, #16
    d5e0:	1affffea 	bne	d590 <__swsetup_r+0x48>
    d5e4:	e2032d0a 	and	r2, r3, #640	; 0x280
    d5e8:	e3520c02 	cmp	r2, #512	; 0x200
    d5ec:	0affffe7 	beq	d590 <__swsetup_r+0x48>
    d5f0:	e1a00005 	mov	r0, r5
    d5f4:	e1a01004 	mov	r1, r4
    d5f8:	eb000552 	bl	eb48 <__smakebuf_r>
    d5fc:	e1d430bc 	ldrh	r3, [r4, #12]
    d600:	e5940010 	ldr	r0, [r4, #16]
    d604:	eaffffe1 	b	d590 <__swsetup_r+0x48>
    d608:	e3a02000 	mov	r2, #0
    d60c:	e5943014 	ldr	r3, [r4, #20]
    d610:	e3500000 	cmp	r0, #0
    d614:	e2633000 	rsb	r3, r3, #0
    d618:	e5843018 	str	r3, [r4, #24]
    d61c:	e5842008 	str	r2, [r4, #8]
    d620:	13a00000 	movne	r0, #0
    d624:	1affffe1 	bne	d5b0 <__swsetup_r+0x68>
    d628:	e1d430fc 	ldrsh	r3, [r4, #12]
    d62c:	e3130080 	tst	r3, #128	; 0x80
    d630:	13833040 	orrne	r3, r3, #64	; 0x40
    d634:	11c430bc 	strhne	r3, [r4, #12]
    d638:	13e00000 	mvnne	r0, #0
    d63c:	e8bd4070 	pop	{r4, r5, r6, lr}
    d640:	e12fff1e 	bx	lr
    d644:	e1a00003 	mov	r0, r3
    d648:	eb000140 	bl	db50 <__sinit>
    d64c:	eaffffc7 	b	d570 <__swsetup_r+0x28>
    d650:	e5941030 	ldr	r1, [r4, #48]	; 0x30
    d654:	e3510000 	cmp	r1, #0
    d658:	0a000007 	beq	d67c <__swsetup_r+0x134>
    d65c:	e2843040 	add	r3, r4, #64	; 0x40
    d660:	e1510003 	cmp	r1, r3
    d664:	0a000002 	beq	d674 <__swsetup_r+0x12c>
    d668:	e1a00005 	mov	r0, r5
    d66c:	eb000298 	bl	e0d4 <_free_r>
    d670:	e1d420fc 	ldrsh	r2, [r4, #12]
    d674:	e3a03000 	mov	r3, #0
    d678:	e5843030 	str	r3, [r4, #48]	; 0x30
    d67c:	e3a03000 	mov	r3, #0
    d680:	e5940010 	ldr	r0, [r4, #16]
    d684:	e3c22024 	bic	r2, r2, #36	; 0x24
    d688:	e8840009 	stm	r4, {r0, r3}
    d68c:	eaffffce 	b	d5cc <__swsetup_r+0x84>
    d690:	e3a03009 	mov	r3, #9
    d694:	e3822040 	orr	r2, r2, #64	; 0x40
    d698:	e5853000 	str	r3, [r5]
    d69c:	e3e00000 	mvn	r0, #0
    d6a0:	e1c420bc 	strh	r2, [r4, #12]
    d6a4:	eaffffc1 	b	d5b0 <__swsetup_r+0x68>
    d6a8:	0001108c 	.word	0x0001108c

0000d6ac <abort>:
    d6ac:	e92d4010 	push	{r4, lr}
    d6b0:	e3a00006 	mov	r0, #6
    d6b4:	eb00097f 	bl	fcb8 <raise>
    d6b8:	e3a00001 	mov	r0, #1
    d6bc:	eb000cda 	bl	10a2c <_exit>

0000d6c0 <__sflush_r>:
    d6c0:	e1d130fc 	ldrsh	r3, [r1, #12]
    d6c4:	e1a02803 	lsl	r2, r3, #16
    d6c8:	e3120702 	tst	r2, #524288	; 0x80000
    d6cc:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    d6d0:	e1a05001 	mov	r5, r1
    d6d4:	e1a08000 	mov	r8, r0
    d6d8:	1a000034 	bne	d7b0 <__sflush_r+0xf0>
    d6dc:	e5912004 	ldr	r2, [r1, #4]
    d6e0:	e3833b02 	orr	r3, r3, #2048	; 0x800
    d6e4:	e3520000 	cmp	r2, #0
    d6e8:	e1c130bc 	strh	r3, [r1, #12]
    d6ec:	da000050 	ble	d834 <__sflush_r+0x174>
    d6f0:	e5954028 	ldr	r4, [r5, #40]	; 0x28
    d6f4:	e3540000 	cmp	r4, #0
    d6f8:	0a000050 	beq	d840 <__sflush_r+0x180>
    d6fc:	e3a02000 	mov	r2, #0
    d700:	e1a03803 	lsl	r3, r3, #16
    d704:	e2030201 	and	r0, r3, #268435456	; 0x10000000
    d708:	e1b07820 	lsrs	r7, r0, #16
    d70c:	e5986000 	ldr	r6, [r8]
    d710:	e1a03823 	lsr	r3, r3, #16
    d714:	e5882000 	str	r2, [r8]
    d718:	0a00005e 	beq	d898 <__sflush_r+0x1d8>
    d71c:	e5952050 	ldr	r2, [r5, #80]	; 0x50
    d720:	e3130004 	tst	r3, #4
    d724:	0a000005 	beq	d740 <__sflush_r+0x80>
    d728:	e5951030 	ldr	r1, [r5, #48]	; 0x30
    d72c:	e5953004 	ldr	r3, [r5, #4]
    d730:	e3510000 	cmp	r1, #0
    d734:	e0422003 	sub	r2, r2, r3
    d738:	1595303c 	ldrne	r3, [r5, #60]	; 0x3c
    d73c:	10422003 	subne	r2, r2, r3
    d740:	e3a03000 	mov	r3, #0
    d744:	e595101c 	ldr	r1, [r5, #28]
    d748:	e1a00008 	mov	r0, r8
    d74c:	e1a0e00f 	mov	lr, pc
    d750:	e12fff14 	bx	r4
    d754:	e3700001 	cmn	r0, #1
    d758:	0a00003b 	beq	d84c <__sflush_r+0x18c>
    d75c:	e3a01000 	mov	r1, #0
    d760:	e1d530fc 	ldrsh	r3, [r5, #12]
    d764:	e5952010 	ldr	r2, [r5, #16]
    d768:	e3c33b02 	bic	r3, r3, #2048	; 0x800
    d76c:	e3130a01 	tst	r3, #4096	; 0x1000
    d770:	e1c530bc 	strh	r3, [r5, #12]
    d774:	e5851004 	str	r1, [r5, #4]
    d778:	e5852000 	str	r2, [r5]
    d77c:	1a000043 	bne	d890 <__sflush_r+0x1d0>
    d780:	e5951030 	ldr	r1, [r5, #48]	; 0x30
    d784:	e3510000 	cmp	r1, #0
    d788:	e5886000 	str	r6, [r8]
    d78c:	0a00002b 	beq	d840 <__sflush_r+0x180>
    d790:	e2853040 	add	r3, r5, #64	; 0x40
    d794:	e1510003 	cmp	r1, r3
    d798:	11a00008 	movne	r0, r8
    d79c:	1b00024c 	blne	e0d4 <_free_r>
    d7a0:	e3a00000 	mov	r0, #0
    d7a4:	e5850030 	str	r0, [r5, #48]	; 0x30
    d7a8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    d7ac:	e12fff1e 	bx	lr
    d7b0:	e5916010 	ldr	r6, [r1, #16]
    d7b4:	e3560000 	cmp	r6, #0
    d7b8:	0a000020 	beq	d840 <__sflush_r+0x180>
    d7bc:	e1a02822 	lsr	r2, r2, #16
    d7c0:	e3120003 	tst	r2, #3
    d7c4:	13a03000 	movne	r3, #0
    d7c8:	e5914000 	ldr	r4, [r1]
    d7cc:	05913014 	ldreq	r3, [r1, #20]
    d7d0:	e0444006 	sub	r4, r4, r6
    d7d4:	e3540000 	cmp	r4, #0
    d7d8:	e5816000 	str	r6, [r1]
    d7dc:	e5813008 	str	r3, [r1, #8]
    d7e0:	ca000003 	bgt	d7f4 <__sflush_r+0x134>
    d7e4:	ea000015 	b	d840 <__sflush_r+0x180>
    d7e8:	e3540000 	cmp	r4, #0
    d7ec:	e0866000 	add	r6, r6, r0
    d7f0:	da000012 	ble	d840 <__sflush_r+0x180>
    d7f4:	e1a03004 	mov	r3, r4
    d7f8:	e5957024 	ldr	r7, [r5, #36]	; 0x24
    d7fc:	e1a02006 	mov	r2, r6
    d800:	e595101c 	ldr	r1, [r5, #28]
    d804:	e1a00008 	mov	r0, r8
    d808:	e1a0e00f 	mov	lr, pc
    d80c:	e12fff17 	bx	r7
    d810:	e3500000 	cmp	r0, #0
    d814:	e0444000 	sub	r4, r4, r0
    d818:	cafffff2 	bgt	d7e8 <__sflush_r+0x128>
    d81c:	e3e00000 	mvn	r0, #0
    d820:	e1d530bc 	ldrh	r3, [r5, #12]
    d824:	e3833040 	orr	r3, r3, #64	; 0x40
    d828:	e1c530bc 	strh	r3, [r5, #12]
    d82c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    d830:	e12fff1e 	bx	lr
    d834:	e591203c 	ldr	r2, [r1, #60]	; 0x3c
    d838:	e3520000 	cmp	r2, #0
    d83c:	caffffab 	bgt	d6f0 <__sflush_r+0x30>
    d840:	e3a00000 	mov	r0, #0
    d844:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    d848:	e12fff1e 	bx	lr
    d84c:	e5981000 	ldr	r1, [r8]
    d850:	e351001d 	cmp	r1, #29
    d854:	8afffff0 	bhi	d81c <__sflush_r+0x15c>
    d858:	e59f3098 	ldr	r3, [pc, #152]	; d8f8 <__sflush_r+0x238>
    d85c:	e1e03133 	mvn	r3, r3, lsr r1
    d860:	e2133001 	ands	r3, r3, #1
    d864:	1affffec 	bne	d81c <__sflush_r+0x15c>
    d868:	e1d520fc 	ldrsh	r2, [r5, #12]
    d86c:	e595c010 	ldr	ip, [r5, #16]
    d870:	e3c22b02 	bic	r2, r2, #2048	; 0x800
    d874:	e3120a01 	tst	r2, #4096	; 0x1000
    d878:	e5853004 	str	r3, [r5, #4]
    d87c:	e1c520bc 	strh	r2, [r5, #12]
    d880:	e585c000 	str	ip, [r5]
    d884:	0affffbd 	beq	d780 <__sflush_r+0xc0>
    d888:	e3510000 	cmp	r1, #0
    d88c:	1affffbb 	bne	d780 <__sflush_r+0xc0>
    d890:	e5850050 	str	r0, [r5, #80]	; 0x50
    d894:	eaffffb9 	b	d780 <__sflush_r+0xc0>
    d898:	e1a02007 	mov	r2, r7
    d89c:	e3a03001 	mov	r3, #1
    d8a0:	e595101c 	ldr	r1, [r5, #28]
    d8a4:	e1a00008 	mov	r0, r8
    d8a8:	e1a0e00f 	mov	lr, pc
    d8ac:	e12fff14 	bx	r4
    d8b0:	e3700001 	cmn	r0, #1
    d8b4:	e1a02000 	mov	r2, r0
    d8b8:	0a000002 	beq	d8c8 <__sflush_r+0x208>
    d8bc:	e1d530bc 	ldrh	r3, [r5, #12]
    d8c0:	e5954028 	ldr	r4, [r5, #40]	; 0x28
    d8c4:	eaffff95 	b	d720 <__sflush_r+0x60>
    d8c8:	e5983000 	ldr	r3, [r8]
    d8cc:	e3530000 	cmp	r3, #0
    d8d0:	0afffff9 	beq	d8bc <__sflush_r+0x1fc>
    d8d4:	e3530016 	cmp	r3, #22
    d8d8:	1353001d 	cmpne	r3, #29
    d8dc:	11d530bc 	ldrhne	r3, [r5, #12]
    d8e0:	13833040 	orrne	r3, r3, #64	; 0x40
    d8e4:	05886000 	streq	r6, [r8]
    d8e8:	01a00007 	moveq	r0, r7
    d8ec:	11a00002 	movne	r0, r2
    d8f0:	11c530bc 	strhne	r3, [r5, #12]
    d8f4:	eaffffcc 	b	d82c <__sflush_r+0x16c>
    d8f8:	20400001 	.word	0x20400001

0000d8fc <_fflush_r>:
    d8fc:	e92d4070 	push	{r4, r5, r6, lr}
    d900:	e2504000 	subs	r4, r0, #0
    d904:	e1a05001 	mov	r5, r1
    d908:	0a000002 	beq	d918 <_fflush_r+0x1c>
    d90c:	e5943038 	ldr	r3, [r4, #56]	; 0x38
    d910:	e3530000 	cmp	r3, #0
    d914:	0a000015 	beq	d970 <_fflush_r+0x74>
    d918:	e1d500fc 	ldrsh	r0, [r5, #12]
    d91c:	e3500000 	cmp	r0, #0
    d920:	01a04000 	moveq	r4, r0
    d924:	0a00000e 	beq	d964 <_fflush_r+0x68>
    d928:	e5953064 	ldr	r3, [r5, #100]	; 0x64
    d92c:	e3130001 	tst	r3, #1
    d930:	1a000001 	bne	d93c <_fflush_r+0x40>
    d934:	e3100c02 	tst	r0, #512	; 0x200
    d938:	0a000013 	beq	d98c <_fflush_r+0x90>
    d93c:	e1a00004 	mov	r0, r4
    d940:	e1a01005 	mov	r1, r5
    d944:	ebffff5d 	bl	d6c0 <__sflush_r>
    d948:	e5953064 	ldr	r3, [r5, #100]	; 0x64
    d94c:	e3130001 	tst	r3, #1
    d950:	e1a04000 	mov	r4, r0
    d954:	1a000002 	bne	d964 <_fflush_r+0x68>
    d958:	e1d530bc 	ldrh	r3, [r5, #12]
    d95c:	e3130c02 	tst	r3, #512	; 0x200
    d960:	0a000004 	beq	d978 <_fflush_r+0x7c>
    d964:	e1a00004 	mov	r0, r4
    d968:	e8bd4070 	pop	{r4, r5, r6, lr}
    d96c:	e12fff1e 	bx	lr
    d970:	eb000076 	bl	db50 <__sinit>
    d974:	eaffffe7 	b	d918 <_fflush_r+0x1c>
    d978:	e5950058 	ldr	r0, [r5, #88]	; 0x58
    d97c:	eb000448 	bl	eaa4 <__retarget_lock_release_recursive>
    d980:	e1a00004 	mov	r0, r4
    d984:	e8bd4070 	pop	{r4, r5, r6, lr}
    d988:	e12fff1e 	bx	lr
    d98c:	e5950058 	ldr	r0, [r5, #88]	; 0x58
    d990:	eb00043d 	bl	ea8c <__retarget_lock_acquire_recursive>
    d994:	eaffffe8 	b	d93c <_fflush_r+0x40>

0000d998 <fflush>:
    d998:	e2501000 	subs	r1, r0, #0
    d99c:	159f3020 	ldrne	r3, [pc, #32]	; d9c4 <fflush+0x2c>
    d9a0:	15930000 	ldrne	r0, [r3]
    d9a4:	1affffd4 	bne	d8fc <_fflush_r>
    d9a8:	e92d4010 	push	{r4, lr}
    d9ac:	e59f3014 	ldr	r3, [pc, #20]	; d9c8 <fflush+0x30>
    d9b0:	e59f1014 	ldr	r1, [pc, #20]	; d9cc <fflush+0x34>
    d9b4:	e5930000 	ldr	r0, [r3]
    d9b8:	eb0003d5 	bl	e914 <_fwalk_reent>
    d9bc:	e8bd4010 	pop	{r4, lr}
    d9c0:	e12fff1e 	bx	lr
    d9c4:	0001108c 	.word	0x0001108c
    d9c8:	00010eec 	.word	0x00010eec
    d9cc:	0000d8fc 	.word	0x0000d8fc

0000d9d0 <_cleanup_r>:
    d9d0:	e92d4010 	push	{r4, lr}
    d9d4:	e59f1008 	ldr	r1, [pc, #8]	; d9e4 <_cleanup_r+0x14>
    d9d8:	eb0003cd 	bl	e914 <_fwalk_reent>
    d9dc:	e8bd4010 	pop	{r4, lr}
    d9e0:	e12fff1e 	bx	lr
    d9e4:	000103c4 	.word	0x000103c4

0000d9e8 <std.isra.0>:
    d9e8:	e3a03000 	mov	r3, #0
    d9ec:	e92d4010 	push	{r4, lr}
    d9f0:	e1a04000 	mov	r4, r0
    d9f4:	e1c010bc 	strh	r1, [r0, #12]
    d9f8:	e1c020be 	strh	r2, [r0, #14]
    d9fc:	e5803000 	str	r3, [r0]
    da00:	e5803004 	str	r3, [r0, #4]
    da04:	e5803008 	str	r3, [r0, #8]
    da08:	e5803064 	str	r3, [r0, #100]	; 0x64
    da0c:	e5803010 	str	r3, [r0, #16]
    da10:	e5803014 	str	r3, [r0, #20]
    da14:	e5803018 	str	r3, [r0, #24]
    da18:	e1a01003 	mov	r1, r3
    da1c:	e3a02008 	mov	r2, #8
    da20:	e280005c 	add	r0, r0, #92	; 0x5c
    da24:	ebfff93c 	bl	bf1c <memset>
    da28:	e59f002c 	ldr	r0, [pc, #44]	; da5c <std.isra.0+0x74>
    da2c:	e59f102c 	ldr	r1, [pc, #44]	; da60 <std.isra.0+0x78>
    da30:	e59f202c 	ldr	r2, [pc, #44]	; da64 <std.isra.0+0x7c>
    da34:	e59f302c 	ldr	r3, [pc, #44]	; da68 <std.isra.0+0x80>
    da38:	e5840020 	str	r0, [r4, #32]
    da3c:	e584401c 	str	r4, [r4, #28]
    da40:	e5841024 	str	r1, [r4, #36]	; 0x24
    da44:	e5842028 	str	r2, [r4, #40]	; 0x28
    da48:	e584302c 	str	r3, [r4, #44]	; 0x2c
    da4c:	e2840058 	add	r0, r4, #88	; 0x58
    da50:	eb000409 	bl	ea7c <__retarget_lock_init_recursive>
    da54:	e8bd4010 	pop	{r4, lr}
    da58:	e12fff1e 	bx	lr
    da5c:	0000fd70 	.word	0x0000fd70
    da60:	0000fdac 	.word	0x0000fdac
    da64:	0000fe04 	.word	0x0000fe04
    da68:	0000fe34 	.word	0x0000fe34

0000da6c <__fp_lock>:
    da6c:	e5903064 	ldr	r3, [r0, #100]	; 0x64
    da70:	e3130001 	tst	r3, #1
    da74:	1a000002 	bne	da84 <__fp_lock+0x18>
    da78:	e1d030bc 	ldrh	r3, [r0, #12]
    da7c:	e3130c02 	tst	r3, #512	; 0x200
    da80:	0a000001 	beq	da8c <__fp_lock+0x20>
    da84:	e3a00000 	mov	r0, #0
    da88:	e12fff1e 	bx	lr
    da8c:	e92d4010 	push	{r4, lr}
    da90:	e5900058 	ldr	r0, [r0, #88]	; 0x58
    da94:	eb0003fc 	bl	ea8c <__retarget_lock_acquire_recursive>
    da98:	e3a00000 	mov	r0, #0
    da9c:	e8bd4010 	pop	{r4, lr}
    daa0:	e12fff1e 	bx	lr

0000daa4 <__fp_unlock>:
    daa4:	e5903064 	ldr	r3, [r0, #100]	; 0x64
    daa8:	e3130001 	tst	r3, #1
    daac:	1a000002 	bne	dabc <__fp_unlock+0x18>
    dab0:	e1d030bc 	ldrh	r3, [r0, #12]
    dab4:	e3130c02 	tst	r3, #512	; 0x200
    dab8:	0a000001 	beq	dac4 <__fp_unlock+0x20>
    dabc:	e3a00000 	mov	r0, #0
    dac0:	e12fff1e 	bx	lr
    dac4:	e92d4010 	push	{r4, lr}
    dac8:	e5900058 	ldr	r0, [r0, #88]	; 0x58
    dacc:	eb0003f4 	bl	eaa4 <__retarget_lock_release_recursive>
    dad0:	e3a00000 	mov	r0, #0
    dad4:	e8bd4010 	pop	{r4, lr}
    dad8:	e12fff1e 	bx	lr

0000dadc <__sfmoreglue>:
    dadc:	e2412001 	sub	r2, r1, #1
    dae0:	e92d4070 	push	{r4, r5, r6, lr}
    dae4:	e0824082 	add	r4, r2, r2, lsl #1
    dae8:	e0822104 	add	r2, r2, r4, lsl #2
    daec:	e1a04182 	lsl	r4, r2, #3
    daf0:	e1a06001 	mov	r6, r1
    daf4:	e2841074 	add	r1, r4, #116	; 0x74
    daf8:	eb000452 	bl	ec48 <_malloc_r>
    dafc:	e2505000 	subs	r5, r0, #0
    db00:	0a000006 	beq	db20 <__sfmoreglue+0x44>
    db04:	e3a01000 	mov	r1, #0
    db08:	e285000c 	add	r0, r5, #12
    db0c:	e5856004 	str	r6, [r5, #4]
    db10:	e2842068 	add	r2, r4, #104	; 0x68
    db14:	e5851000 	str	r1, [r5]
    db18:	e5850008 	str	r0, [r5, #8]
    db1c:	ebfff8fe 	bl	bf1c <memset>
    db20:	e1a00005 	mov	r0, r5
    db24:	e8bd4070 	pop	{r4, r5, r6, lr}
    db28:	e12fff1e 	bx	lr

0000db2c <_cleanup>:
    db2c:	e92d4010 	push	{r4, lr}
    db30:	e59f3010 	ldr	r3, [pc, #16]	; db48 <_cleanup+0x1c>
    db34:	e59f1010 	ldr	r1, [pc, #16]	; db4c <_cleanup+0x20>
    db38:	e5930000 	ldr	r0, [r3]
    db3c:	eb000374 	bl	e914 <_fwalk_reent>
    db40:	e8bd4010 	pop	{r4, lr}
    db44:	e12fff1e 	bx	lr
    db48:	00010eec 	.word	0x00010eec
    db4c:	000103c4 	.word	0x000103c4

0000db50 <__sinit>:
    db50:	e92d4010 	push	{r4, lr}
    db54:	e1a04000 	mov	r4, r0
    db58:	e59f007c 	ldr	r0, [pc, #124]	; dbdc <__sinit+0x8c>
    db5c:	eb0003ca 	bl	ea8c <__retarget_lock_acquire_recursive>
    db60:	e5942038 	ldr	r2, [r4, #56]	; 0x38
    db64:	e3520000 	cmp	r2, #0
    db68:	1a000017 	bne	dbcc <__sinit+0x7c>
    db6c:	e3a00003 	mov	r0, #3
    db70:	e59f1068 	ldr	r1, [pc, #104]	; dbe0 <__sinit+0x90>
    db74:	e2843fbb 	add	r3, r4, #748	; 0x2ec
    db78:	e58432e8 	str	r3, [r4, #744]	; 0x2e8
    db7c:	e58422e0 	str	r2, [r4, #736]	; 0x2e0
    db80:	e58402e4 	str	r0, [r4, #740]	; 0x2e4
    db84:	e584103c 	str	r1, [r4, #60]	; 0x3c
    db88:	e5940004 	ldr	r0, [r4, #4]
    db8c:	e3a01004 	mov	r1, #4
    db90:	ebffff94 	bl	d9e8 <std.isra.0>
    db94:	e5940008 	ldr	r0, [r4, #8]
    db98:	e3a02001 	mov	r2, #1
    db9c:	e3a01009 	mov	r1, #9
    dba0:	ebffff90 	bl	d9e8 <std.isra.0>
    dba4:	e594000c 	ldr	r0, [r4, #12]
    dba8:	e3a02002 	mov	r2, #2
    dbac:	e3a01012 	mov	r1, #18
    dbb0:	ebffff8c 	bl	d9e8 <std.isra.0>
    dbb4:	e3a03001 	mov	r3, #1
    dbb8:	e59f001c 	ldr	r0, [pc, #28]	; dbdc <__sinit+0x8c>
    dbbc:	e5843038 	str	r3, [r4, #56]	; 0x38
    dbc0:	eb0003b7 	bl	eaa4 <__retarget_lock_release_recursive>
    dbc4:	e8bd4010 	pop	{r4, lr}
    dbc8:	e12fff1e 	bx	lr
    dbcc:	e59f0008 	ldr	r0, [pc, #8]	; dbdc <__sinit+0x8c>
    dbd0:	eb0003b3 	bl	eaa4 <__retarget_lock_release_recursive>
    dbd4:	e8bd4010 	pop	{r4, lr}
    dbd8:	e12fff1e 	bx	lr
    dbdc:	00011ac4 	.word	0x00011ac4
    dbe0:	0000d9d0 	.word	0x0000d9d0

0000dbe4 <__sfp>:
    dbe4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    dbe8:	e1a06000 	mov	r6, r0
    dbec:	e59f0108 	ldr	r0, [pc, #264]	; dcfc <__sfp+0x118>
    dbf0:	eb0003a5 	bl	ea8c <__retarget_lock_acquire_recursive>
    dbf4:	e59f3104 	ldr	r3, [pc, #260]	; dd00 <__sfp+0x11c>
    dbf8:	e5935000 	ldr	r5, [r3]
    dbfc:	e5953038 	ldr	r3, [r5, #56]	; 0x38
    dc00:	e3530000 	cmp	r3, #0
    dc04:	0a00002d 	beq	dcc0 <__sfp+0xdc>
    dc08:	e3a07004 	mov	r7, #4
    dc0c:	e2855e2e 	add	r5, r5, #736	; 0x2e0
    dc10:	e5953004 	ldr	r3, [r5, #4]
    dc14:	e2533001 	subs	r3, r3, #1
    dc18:	e5954008 	ldr	r4, [r5, #8]
    dc1c:	5a000004 	bpl	dc34 <__sfp+0x50>
    dc20:	ea000021 	b	dcac <__sfp+0xc8>
    dc24:	e2433001 	sub	r3, r3, #1
    dc28:	e3730001 	cmn	r3, #1
    dc2c:	e2844068 	add	r4, r4, #104	; 0x68
    dc30:	0a00001d 	beq	dcac <__sfp+0xc8>
    dc34:	e1d420fc 	ldrsh	r2, [r4, #12]
    dc38:	e3520000 	cmp	r2, #0
    dc3c:	1afffff8 	bne	dc24 <__sfp+0x40>
    dc40:	e3a05000 	mov	r5, #0
    dc44:	e3e02000 	mvn	r2, #0
    dc48:	e3a03001 	mov	r3, #1
    dc4c:	e1c420be 	strh	r2, [r4, #14]
    dc50:	e1c430bc 	strh	r3, [r4, #12]
    dc54:	e2840058 	add	r0, r4, #88	; 0x58
    dc58:	e5845064 	str	r5, [r4, #100]	; 0x64
    dc5c:	eb000386 	bl	ea7c <__retarget_lock_init_recursive>
    dc60:	e59f0094 	ldr	r0, [pc, #148]	; dcfc <__sfp+0x118>
    dc64:	eb00038e 	bl	eaa4 <__retarget_lock_release_recursive>
    dc68:	e5845000 	str	r5, [r4]
    dc6c:	e5845008 	str	r5, [r4, #8]
    dc70:	e5845004 	str	r5, [r4, #4]
    dc74:	e5845010 	str	r5, [r4, #16]
    dc78:	e5845014 	str	r5, [r4, #20]
    dc7c:	e5845018 	str	r5, [r4, #24]
    dc80:	e1a01005 	mov	r1, r5
    dc84:	e3a02008 	mov	r2, #8
    dc88:	e284005c 	add	r0, r4, #92	; 0x5c
    dc8c:	ebfff8a2 	bl	bf1c <memset>
    dc90:	e5845030 	str	r5, [r4, #48]	; 0x30
    dc94:	e5845034 	str	r5, [r4, #52]	; 0x34
    dc98:	e5845044 	str	r5, [r4, #68]	; 0x44
    dc9c:	e5845048 	str	r5, [r4, #72]	; 0x48
    dca0:	e1a00004 	mov	r0, r4
    dca4:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    dca8:	e12fff1e 	bx	lr
    dcac:	e5954000 	ldr	r4, [r5]
    dcb0:	e3540000 	cmp	r4, #0
    dcb4:	0a000004 	beq	dccc <__sfp+0xe8>
    dcb8:	e1a05004 	mov	r5, r4
    dcbc:	eaffffd3 	b	dc10 <__sfp+0x2c>
    dcc0:	e1a00005 	mov	r0, r5
    dcc4:	ebffffa1 	bl	db50 <__sinit>
    dcc8:	eaffffce 	b	dc08 <__sfp+0x24>
    dccc:	e1a01007 	mov	r1, r7
    dcd0:	e1a00006 	mov	r0, r6
    dcd4:	ebffff80 	bl	dadc <__sfmoreglue>
    dcd8:	e3500000 	cmp	r0, #0
    dcdc:	e1a04000 	mov	r4, r0
    dce0:	e5850000 	str	r0, [r5]
    dce4:	1afffff3 	bne	dcb8 <__sfp+0xd4>
    dce8:	e59f000c 	ldr	r0, [pc, #12]	; dcfc <__sfp+0x118>
    dcec:	eb00036c 	bl	eaa4 <__retarget_lock_release_recursive>
    dcf0:	e3a0300c 	mov	r3, #12
    dcf4:	e5863000 	str	r3, [r6]
    dcf8:	eaffffe8 	b	dca0 <__sfp+0xbc>
    dcfc:	00011ad8 	.word	0x00011ad8
    dd00:	00010eec 	.word	0x00010eec

0000dd04 <__sfp_lock_acquire>:
    dd04:	e92d4010 	push	{r4, lr}
    dd08:	e59f0008 	ldr	r0, [pc, #8]	; dd18 <__sfp_lock_acquire+0x14>
    dd0c:	eb00035e 	bl	ea8c <__retarget_lock_acquire_recursive>
    dd10:	e8bd4010 	pop	{r4, lr}
    dd14:	e12fff1e 	bx	lr
    dd18:	00011ad8 	.word	0x00011ad8

0000dd1c <__sfp_lock_release>:
    dd1c:	e92d4010 	push	{r4, lr}
    dd20:	e59f0008 	ldr	r0, [pc, #8]	; dd30 <__sfp_lock_release+0x14>
    dd24:	eb00035e 	bl	eaa4 <__retarget_lock_release_recursive>
    dd28:	e8bd4010 	pop	{r4, lr}
    dd2c:	e12fff1e 	bx	lr
    dd30:	00011ad8 	.word	0x00011ad8

0000dd34 <__sinit_lock_acquire>:
    dd34:	e92d4010 	push	{r4, lr}
    dd38:	e59f0008 	ldr	r0, [pc, #8]	; dd48 <__sinit_lock_acquire+0x14>
    dd3c:	eb000352 	bl	ea8c <__retarget_lock_acquire_recursive>
    dd40:	e8bd4010 	pop	{r4, lr}
    dd44:	e12fff1e 	bx	lr
    dd48:	00011ac4 	.word	0x00011ac4

0000dd4c <__sinit_lock_release>:
    dd4c:	e92d4010 	push	{r4, lr}
    dd50:	e59f0008 	ldr	r0, [pc, #8]	; dd60 <__sinit_lock_release+0x14>
    dd54:	eb000352 	bl	eaa4 <__retarget_lock_release_recursive>
    dd58:	e8bd4010 	pop	{r4, lr}
    dd5c:	e12fff1e 	bx	lr
    dd60:	00011ac4 	.word	0x00011ac4

0000dd64 <__fp_lock_all>:
    dd64:	e92d4010 	push	{r4, lr}
    dd68:	e59f0018 	ldr	r0, [pc, #24]	; dd88 <__fp_lock_all+0x24>
    dd6c:	eb000346 	bl	ea8c <__retarget_lock_acquire_recursive>
    dd70:	e59f3014 	ldr	r3, [pc, #20]	; dd8c <__fp_lock_all+0x28>
    dd74:	e59f1014 	ldr	r1, [pc, #20]	; dd90 <__fp_lock_all+0x2c>
    dd78:	e5930000 	ldr	r0, [r3]
    dd7c:	eb0002c3 	bl	e890 <_fwalk>
    dd80:	e8bd4010 	pop	{r4, lr}
    dd84:	e12fff1e 	bx	lr
    dd88:	00011ad8 	.word	0x00011ad8
    dd8c:	0001108c 	.word	0x0001108c
    dd90:	0000da6c 	.word	0x0000da6c

0000dd94 <__fp_unlock_all>:
    dd94:	e92d4010 	push	{r4, lr}
    dd98:	e59f3018 	ldr	r3, [pc, #24]	; ddb8 <__fp_unlock_all+0x24>
    dd9c:	e59f1018 	ldr	r1, [pc, #24]	; ddbc <__fp_unlock_all+0x28>
    dda0:	e5930000 	ldr	r0, [r3]
    dda4:	eb0002b9 	bl	e890 <_fwalk>
    dda8:	e59f0010 	ldr	r0, [pc, #16]	; ddc0 <__fp_unlock_all+0x2c>
    ddac:	eb00033c 	bl	eaa4 <__retarget_lock_release_recursive>
    ddb0:	e8bd4010 	pop	{r4, lr}
    ddb4:	e12fff1e 	bx	lr
    ddb8:	0001108c 	.word	0x0001108c
    ddbc:	0000daa4 	.word	0x0000daa4
    ddc0:	00011ad8 	.word	0x00011ad8

0000ddc4 <__fputwc>:
    ddc4:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    ddc8:	e24dd00c 	sub	sp, sp, #12
    ddcc:	e1a08000 	mov	r8, r0
    ddd0:	e1a07001 	mov	r7, r1
    ddd4:	e1a04002 	mov	r4, r2
    ddd8:	eb00030a 	bl	ea08 <__locale_mb_cur_max>
    dddc:	e3500001 	cmp	r0, #1
    dde0:	0a000030 	beq	dea8 <__fputwc+0xe4>
    dde4:	e284305c 	add	r3, r4, #92	; 0x5c
    dde8:	e1a02007 	mov	r2, r7
    ddec:	e28d1004 	add	r1, sp, #4
    ddf0:	e1a00008 	mov	r0, r8
    ddf4:	eb0008ef 	bl	101b8 <_wcrtomb_r>
    ddf8:	e3700001 	cmn	r0, #1
    ddfc:	e1a06000 	mov	r6, r0
    de00:	0a000022 	beq	de90 <__fputwc+0xcc>
    de04:	e3500000 	cmp	r0, #0
    de08:	15dd1004 	ldrbne	r1, [sp, #4]
    de0c:	0a00002c 	beq	dec4 <__fputwc+0x100>
    de10:	e3a05000 	mov	r5, #0
    de14:	e28d9004 	add	r9, sp, #4
    de18:	ea000007 	b	de3c <__fputwc+0x78>
    de1c:	e5943000 	ldr	r3, [r4]
    de20:	e2832001 	add	r2, r3, #1
    de24:	e5842000 	str	r2, [r4]
    de28:	e5c31000 	strb	r1, [r3]
    de2c:	e2855001 	add	r5, r5, #1
    de30:	e1560005 	cmp	r6, r5
    de34:	9a000022 	bls	dec4 <__fputwc+0x100>
    de38:	e7d51009 	ldrb	r1, [r5, r9]
    de3c:	e5943008 	ldr	r3, [r4, #8]
    de40:	e2433001 	sub	r3, r3, #1
    de44:	e3530000 	cmp	r3, #0
    de48:	e5843008 	str	r3, [r4, #8]
    de4c:	aafffff2 	bge	de1c <__fputwc+0x58>
    de50:	e5942018 	ldr	r2, [r4, #24]
    de54:	e1530002 	cmp	r3, r2
    de58:	b3a03000 	movlt	r3, #0
    de5c:	a3a03001 	movge	r3, #1
    de60:	e351000a 	cmp	r1, #10
    de64:	03a03000 	moveq	r3, #0
    de68:	e3530000 	cmp	r3, #0
    de6c:	1affffea 	bne	de1c <__fputwc+0x58>
    de70:	e1a02004 	mov	r2, r4
    de74:	e1a00008 	mov	r0, r8
    de78:	eb00087b 	bl	1006c <__swbuf_r>
    de7c:	e3700001 	cmn	r0, #1
    de80:	1affffe9 	bne	de2c <__fputwc+0x68>
    de84:	e28dd00c 	add	sp, sp, #12
    de88:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    de8c:	e12fff1e 	bx	lr
    de90:	e1d430bc 	ldrh	r3, [r4, #12]
    de94:	e3833040 	orr	r3, r3, #64	; 0x40
    de98:	e1c430bc 	strh	r3, [r4, #12]
    de9c:	e28dd00c 	add	sp, sp, #12
    dea0:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    dea4:	e12fff1e 	bx	lr
    dea8:	e2473001 	sub	r3, r7, #1
    deac:	e35300fe 	cmp	r3, #254	; 0xfe
    deb0:	8affffcb 	bhi	dde4 <__fputwc+0x20>
    deb4:	e20710ff 	and	r1, r7, #255	; 0xff
    deb8:	e1a06000 	mov	r6, r0
    debc:	e5cd1004 	strb	r1, [sp, #4]
    dec0:	eaffffd2 	b	de10 <__fputwc+0x4c>
    dec4:	e1a00007 	mov	r0, r7
    dec8:	e28dd00c 	add	sp, sp, #12
    decc:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    ded0:	e12fff1e 	bx	lr

0000ded4 <_fputwc_r>:
    ded4:	e92d4030 	push	{r4, r5, lr}
    ded8:	e5923064 	ldr	r3, [r2, #100]	; 0x64
    dedc:	e1a04002 	mov	r4, r2
    dee0:	e1d220fc 	ldrsh	r2, [r2, #12]
    dee4:	e3130001 	tst	r3, #1
    dee8:	e1a03802 	lsl	r3, r2, #16
    deec:	e24dd00c 	sub	sp, sp, #12
    def0:	e1a05000 	mov	r5, r0
    def4:	11a03823 	lsrne	r3, r3, #16
    def8:	1a000002 	bne	df08 <_fputwc_r+0x34>
    defc:	e3130402 	tst	r3, #33554432	; 0x2000000
    df00:	e1a03823 	lsr	r3, r3, #16
    df04:	0a000019 	beq	df70 <_fputwc_r+0x9c>
    df08:	e3130a02 	tst	r3, #8192	; 0x2000
    df0c:	05943064 	ldreq	r3, [r4, #100]	; 0x64
    df10:	03822a02 	orreq	r2, r2, #8192	; 0x2000
    df14:	03833a02 	orreq	r3, r3, #8192	; 0x2000
    df18:	01c420bc 	strheq	r2, [r4, #12]
    df1c:	05843064 	streq	r3, [r4, #100]	; 0x64
    df20:	e1a00005 	mov	r0, r5
    df24:	e1a02004 	mov	r2, r4
    df28:	ebffffa5 	bl	ddc4 <__fputwc>
    df2c:	e5943064 	ldr	r3, [r4, #100]	; 0x64
    df30:	e3130001 	tst	r3, #1
    df34:	e1a05000 	mov	r5, r0
    df38:	1a000002 	bne	df48 <_fputwc_r+0x74>
    df3c:	e1d430bc 	ldrh	r3, [r4, #12]
    df40:	e3130c02 	tst	r3, #512	; 0x200
    df44:	0a000003 	beq	df58 <_fputwc_r+0x84>
    df48:	e1a00005 	mov	r0, r5
    df4c:	e28dd00c 	add	sp, sp, #12
    df50:	e8bd4030 	pop	{r4, r5, lr}
    df54:	e12fff1e 	bx	lr
    df58:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    df5c:	eb0002d0 	bl	eaa4 <__retarget_lock_release_recursive>
    df60:	e1a00005 	mov	r0, r5
    df64:	e28dd00c 	add	sp, sp, #12
    df68:	e8bd4030 	pop	{r4, r5, lr}
    df6c:	e12fff1e 	bx	lr
    df70:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    df74:	e58d1004 	str	r1, [sp, #4]
    df78:	eb0002c3 	bl	ea8c <__retarget_lock_acquire_recursive>
    df7c:	e1d420fc 	ldrsh	r2, [r4, #12]
    df80:	e1a03802 	lsl	r3, r2, #16
    df84:	e1a03823 	lsr	r3, r3, #16
    df88:	e59d1004 	ldr	r1, [sp, #4]
    df8c:	eaffffdd 	b	df08 <_fputwc_r+0x34>

0000df90 <fputwc>:
    df90:	e59f3038 	ldr	r3, [pc, #56]	; dfd0 <fputwc+0x40>
    df94:	e92d4070 	push	{r4, r5, r6, lr}
    df98:	e5934000 	ldr	r4, [r3]
    df9c:	e3540000 	cmp	r4, #0
    dfa0:	e1a05000 	mov	r5, r0
    dfa4:	e1a06001 	mov	r6, r1
    dfa8:	0a000003 	beq	dfbc <fputwc+0x2c>
    dfac:	e5943038 	ldr	r3, [r4, #56]	; 0x38
    dfb0:	e3530000 	cmp	r3, #0
    dfb4:	01a00004 	moveq	r0, r4
    dfb8:	0bfffee4 	bleq	db50 <__sinit>
    dfbc:	e1a02006 	mov	r2, r6
    dfc0:	e1a01005 	mov	r1, r5
    dfc4:	e1a00004 	mov	r0, r4
    dfc8:	e8bd4070 	pop	{r4, r5, r6, lr}
    dfcc:	eaffffc0 	b	ded4 <_fputwc_r>
    dfd0:	0001108c 	.word	0x0001108c

0000dfd4 <_malloc_trim_r>:
    dfd4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    dfd8:	e1a04001 	mov	r4, r1
    dfdc:	e59f70e4 	ldr	r7, [pc, #228]	; e0c8 <_malloc_trim_r+0xf4>
    dfe0:	e1a06000 	mov	r6, r0
    dfe4:	eb00055e 	bl	f564 <__malloc_lock>
    dfe8:	e5973008 	ldr	r3, [r7, #8]
    dfec:	e5935004 	ldr	r5, [r3, #4]
    dff0:	e2641efe 	rsb	r1, r4, #4064	; 0xfe0
    dff4:	e281100f 	add	r1, r1, #15
    dff8:	e3c55003 	bic	r5, r5, #3
    dffc:	e0814005 	add	r4, r1, r5
    e000:	e1a04624 	lsr	r4, r4, #12
    e004:	e2444001 	sub	r4, r4, #1
    e008:	e1a04604 	lsl	r4, r4, #12
    e00c:	e3540a01 	cmp	r4, #4096	; 0x1000
    e010:	ba000006 	blt	e030 <_malloc_trim_r+0x5c>
    e014:	e3a01000 	mov	r1, #0
    e018:	e1a00006 	mov	r0, r6
    e01c:	eb000691 	bl	fa68 <_sbrk_r>
    e020:	e5973008 	ldr	r3, [r7, #8]
    e024:	e0833005 	add	r3, r3, r5
    e028:	e1500003 	cmp	r0, r3
    e02c:	0a000004 	beq	e044 <_malloc_trim_r+0x70>
    e030:	e1a00006 	mov	r0, r6
    e034:	eb000550 	bl	f57c <__malloc_unlock>
    e038:	e3a00000 	mov	r0, #0
    e03c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    e040:	e12fff1e 	bx	lr
    e044:	e2641000 	rsb	r1, r4, #0
    e048:	e1a00006 	mov	r0, r6
    e04c:	eb000685 	bl	fa68 <_sbrk_r>
    e050:	e3700001 	cmn	r0, #1
    e054:	0a00000c 	beq	e08c <_malloc_trim_r+0xb8>
    e058:	e59f206c 	ldr	r2, [pc, #108]	; e0cc <_malloc_trim_r+0xf8>
    e05c:	e5971008 	ldr	r1, [r7, #8]
    e060:	e5923000 	ldr	r3, [r2]
    e064:	e0455004 	sub	r5, r5, r4
    e068:	e3855001 	orr	r5, r5, #1
    e06c:	e1a00006 	mov	r0, r6
    e070:	e0434004 	sub	r4, r3, r4
    e074:	e5815004 	str	r5, [r1, #4]
    e078:	e5824000 	str	r4, [r2]
    e07c:	eb00053e 	bl	f57c <__malloc_unlock>
    e080:	e3a00001 	mov	r0, #1
    e084:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    e088:	e12fff1e 	bx	lr
    e08c:	e3a01000 	mov	r1, #0
    e090:	e1a00006 	mov	r0, r6
    e094:	eb000673 	bl	fa68 <_sbrk_r>
    e098:	e5972008 	ldr	r2, [r7, #8]
    e09c:	e0403002 	sub	r3, r0, r2
    e0a0:	e353000f 	cmp	r3, #15
    e0a4:	daffffe1 	ble	e030 <_malloc_trim_r+0x5c>
    e0a8:	e59f1020 	ldr	r1, [pc, #32]	; e0d0 <_malloc_trim_r+0xfc>
    e0ac:	e591c000 	ldr	ip, [r1]
    e0b0:	e59f1014 	ldr	r1, [pc, #20]	; e0cc <_malloc_trim_r+0xf8>
    e0b4:	e3833001 	orr	r3, r3, #1
    e0b8:	e040000c 	sub	r0, r0, ip
    e0bc:	e5823004 	str	r3, [r2, #4]
    e0c0:	e5810000 	str	r0, [r1]
    e0c4:	eaffffd9 	b	e030 <_malloc_trim_r+0x5c>
    e0c8:	00011624 	.word	0x00011624
    e0cc:	00011a80 	.word	0x00011a80
    e0d0:	00011a2c 	.word	0x00011a2c

0000e0d4 <_free_r>:
    e0d4:	e92d4070 	push	{r4, r5, r6, lr}
    e0d8:	e2514000 	subs	r4, r1, #0
    e0dc:	0a000031 	beq	e1a8 <_free_r+0xd4>
    e0e0:	e1a05000 	mov	r5, r0
    e0e4:	eb00051e 	bl	f564 <__malloc_lock>
    e0e8:	e5141004 	ldr	r1, [r4, #-4]
    e0ec:	e59fe2ac 	ldr	lr, [pc, #684]	; e3a0 <_free_r+0x2cc>
    e0f0:	e3c13001 	bic	r3, r1, #1
    e0f4:	e244c008 	sub	ip, r4, #8
    e0f8:	e08c0003 	add	r0, ip, r3
    e0fc:	e59e6008 	ldr	r6, [lr, #8]
    e100:	e5902004 	ldr	r2, [r0, #4]
    e104:	e1500006 	cmp	r0, r6
    e108:	e3c22003 	bic	r2, r2, #3
    e10c:	0a00004e 	beq	e24c <_free_r+0x178>
    e110:	e3110001 	tst	r1, #1
    e114:	e5802004 	str	r2, [r0, #4]
    e118:	1a000009 	bne	e144 <_free_r+0x70>
    e11c:	e5144008 	ldr	r4, [r4, #-8]
    e120:	e04cc004 	sub	ip, ip, r4
    e124:	e59c1008 	ldr	r1, [ip, #8]
    e128:	e28e6008 	add	r6, lr, #8
    e12c:	e1510006 	cmp	r1, r6
    e130:	e0833004 	add	r3, r3, r4
    e134:	0a00005c 	beq	e2ac <_free_r+0x1d8>
    e138:	e59c400c 	ldr	r4, [ip, #12]
    e13c:	e581400c 	str	r4, [r1, #12]
    e140:	e5841008 	str	r1, [r4, #8]
    e144:	e0801002 	add	r1, r0, r2
    e148:	e5911004 	ldr	r1, [r1, #4]
    e14c:	e3110001 	tst	r1, #1
    e150:	13832001 	orrne	r2, r3, #1
    e154:	158c2004 	strne	r2, [ip, #4]
    e158:	178c3003 	strne	r3, [ip, r3]
    e15c:	0a00002c 	beq	e214 <_free_r+0x140>
    e160:	e3530c02 	cmp	r3, #512	; 0x200
    e164:	2a000011 	bcs	e1b0 <_free_r+0xdc>
    e168:	e3a04001 	mov	r4, #1
    e16c:	e59e0004 	ldr	r0, [lr, #4]
    e170:	e1a031a3 	lsr	r3, r3, #3
    e174:	e0832004 	add	r2, r3, r4
    e178:	e1a03143 	asr	r3, r3, #2
    e17c:	e1803314 	orr	r3, r0, r4, lsl r3
    e180:	e08e1182 	add	r1, lr, r2, lsl #3
    e184:	e79e0182 	ldr	r0, [lr, r2, lsl #3]
    e188:	e2411008 	sub	r1, r1, #8
    e18c:	e58e3004 	str	r3, [lr, #4]
    e190:	e58c100c 	str	r1, [ip, #12]
    e194:	e58c0008 	str	r0, [ip, #8]
    e198:	e78ec182 	str	ip, [lr, r2, lsl #3]
    e19c:	e580c00c 	str	ip, [r0, #12]
    e1a0:	e1a00005 	mov	r0, r5
    e1a4:	eb0004f4 	bl	f57c <__malloc_unlock>
    e1a8:	e8bd4070 	pop	{r4, r5, r6, lr}
    e1ac:	e12fff1e 	bx	lr
    e1b0:	e1a024a3 	lsr	r2, r3, #9
    e1b4:	e3520004 	cmp	r2, #4
    e1b8:	8a000048 	bhi	e2e0 <_free_r+0x20c>
    e1bc:	e1a02323 	lsr	r2, r3, #6
    e1c0:	e2824039 	add	r4, r2, #57	; 0x39
    e1c4:	e1a04184 	lsl	r4, r4, #3
    e1c8:	e2821038 	add	r1, r2, #56	; 0x38
    e1cc:	e08e0004 	add	r0, lr, r4
    e1d0:	e79e2004 	ldr	r2, [lr, r4]
    e1d4:	e2400008 	sub	r0, r0, #8
    e1d8:	e1500002 	cmp	r0, r2
    e1dc:	0a000045 	beq	e2f8 <_free_r+0x224>
    e1e0:	e5921004 	ldr	r1, [r2, #4]
    e1e4:	e3c11003 	bic	r1, r1, #3
    e1e8:	e1530001 	cmp	r3, r1
    e1ec:	2a00002c 	bcs	e2a4 <_free_r+0x1d0>
    e1f0:	e5922008 	ldr	r2, [r2, #8]
    e1f4:	e1500002 	cmp	r0, r2
    e1f8:	1afffff8 	bne	e1e0 <_free_r+0x10c>
    e1fc:	e590300c 	ldr	r3, [r0, #12]
    e200:	e58c300c 	str	r3, [ip, #12]
    e204:	e58c0008 	str	r0, [ip, #8]
    e208:	e583c008 	str	ip, [r3, #8]
    e20c:	e580c00c 	str	ip, [r0, #12]
    e210:	eaffffe2 	b	e1a0 <_free_r+0xcc>
    e214:	e5901008 	ldr	r1, [r0, #8]
    e218:	e59f4184 	ldr	r4, [pc, #388]	; e3a4 <_free_r+0x2d0>
    e21c:	e1510004 	cmp	r1, r4
    e220:	e0833002 	add	r3, r3, r2
    e224:	0a00003a 	beq	e314 <_free_r+0x240>
    e228:	e590000c 	ldr	r0, [r0, #12]
    e22c:	e3832001 	orr	r2, r3, #1
    e230:	e3530c02 	cmp	r3, #512	; 0x200
    e234:	e581000c 	str	r0, [r1, #12]
    e238:	e5801008 	str	r1, [r0, #8]
    e23c:	e58c2004 	str	r2, [ip, #4]
    e240:	e78c3003 	str	r3, [ip, r3]
    e244:	2affffd9 	bcs	e1b0 <_free_r+0xdc>
    e248:	eaffffc6 	b	e168 <_free_r+0x94>
    e24c:	e3110001 	tst	r1, #1
    e250:	e0833002 	add	r3, r3, r2
    e254:	1a000006 	bne	e274 <_free_r+0x1a0>
    e258:	e5142008 	ldr	r2, [r4, #-8]
    e25c:	e04cc002 	sub	ip, ip, r2
    e260:	e28c0008 	add	r0, ip, #8
    e264:	e8900003 	ldm	r0, {r0, r1}
    e268:	e580100c 	str	r1, [r0, #12]
    e26c:	e5810008 	str	r0, [r1, #8]
    e270:	e0833002 	add	r3, r3, r2
    e274:	e59f212c 	ldr	r2, [pc, #300]	; e3a8 <_free_r+0x2d4>
    e278:	e5921000 	ldr	r1, [r2]
    e27c:	e3832001 	orr	r2, r3, #1
    e280:	e1530001 	cmp	r3, r1
    e284:	e58c2004 	str	r2, [ip, #4]
    e288:	e58ec008 	str	ip, [lr, #8]
    e28c:	3affffc3 	bcc	e1a0 <_free_r+0xcc>
    e290:	e59f3114 	ldr	r3, [pc, #276]	; e3ac <_free_r+0x2d8>
    e294:	e1a00005 	mov	r0, r5
    e298:	e5931000 	ldr	r1, [r3]
    e29c:	ebffff4c 	bl	dfd4 <_malloc_trim_r>
    e2a0:	eaffffbe 	b	e1a0 <_free_r+0xcc>
    e2a4:	e1a00002 	mov	r0, r2
    e2a8:	eaffffd3 	b	e1fc <_free_r+0x128>
    e2ac:	e0801002 	add	r1, r0, r2
    e2b0:	e5911004 	ldr	r1, [r1, #4]
    e2b4:	e3110001 	tst	r1, #1
    e2b8:	1a000034 	bne	e390 <_free_r+0x2bc>
    e2bc:	e2801008 	add	r1, r0, #8
    e2c0:	e0823003 	add	r3, r2, r3
    e2c4:	e8910006 	ldm	r1, {r1, r2}
    e2c8:	e3830001 	orr	r0, r3, #1
    e2cc:	e581200c 	str	r2, [r1, #12]
    e2d0:	e5821008 	str	r1, [r2, #8]
    e2d4:	e58c0004 	str	r0, [ip, #4]
    e2d8:	e78c3003 	str	r3, [ip, r3]
    e2dc:	eaffffaf 	b	e1a0 <_free_r+0xcc>
    e2e0:	e3520014 	cmp	r2, #20
    e2e4:	8a000012 	bhi	e334 <_free_r+0x260>
    e2e8:	e282405c 	add	r4, r2, #92	; 0x5c
    e2ec:	e1a04184 	lsl	r4, r4, #3
    e2f0:	e282105b 	add	r1, r2, #91	; 0x5b
    e2f4:	eaffffb4 	b	e1cc <_free_r+0xf8>
    e2f8:	e3a04001 	mov	r4, #1
    e2fc:	e59e3004 	ldr	r3, [lr, #4]
    e300:	e1a02141 	asr	r2, r1, #2
    e304:	e1832214 	orr	r2, r3, r4, lsl r2
    e308:	e58e2004 	str	r2, [lr, #4]
    e30c:	e1a03000 	mov	r3, r0
    e310:	eaffffba 	b	e200 <_free_r+0x12c>
    e314:	e3832001 	orr	r2, r3, #1
    e318:	e58ec014 	str	ip, [lr, #20]
    e31c:	e58ec010 	str	ip, [lr, #16]
    e320:	e58c100c 	str	r1, [ip, #12]
    e324:	e58c1008 	str	r1, [ip, #8]
    e328:	e58c2004 	str	r2, [ip, #4]
    e32c:	e78c3003 	str	r3, [ip, r3]
    e330:	eaffff9a 	b	e1a0 <_free_r+0xcc>
    e334:	e3520054 	cmp	r2, #84	; 0x54
    e338:	8a000004 	bhi	e350 <_free_r+0x27c>
    e33c:	e1a02623 	lsr	r2, r3, #12
    e340:	e282406f 	add	r4, r2, #111	; 0x6f
    e344:	e1a04184 	lsl	r4, r4, #3
    e348:	e282106e 	add	r1, r2, #110	; 0x6e
    e34c:	eaffff9e 	b	e1cc <_free_r+0xf8>
    e350:	e3520f55 	cmp	r2, #340	; 0x154
    e354:	8a000004 	bhi	e36c <_free_r+0x298>
    e358:	e1a027a3 	lsr	r2, r3, #15
    e35c:	e2824078 	add	r4, r2, #120	; 0x78
    e360:	e1a04184 	lsl	r4, r4, #3
    e364:	e2821077 	add	r1, r2, #119	; 0x77
    e368:	eaffff97 	b	e1cc <_free_r+0xf8>
    e36c:	e59f103c 	ldr	r1, [pc, #60]	; e3b0 <_free_r+0x2dc>
    e370:	e1520001 	cmp	r2, r1
    e374:	91a02923 	lsrls	r2, r3, #18
    e378:	9282407d 	addls	r4, r2, #125	; 0x7d
    e37c:	91a04184 	lslls	r4, r4, #3
    e380:	9282107c 	addls	r1, r2, #124	; 0x7c
    e384:	83a04ffe 	movhi	r4, #1016	; 0x3f8
    e388:	83a0107e 	movhi	r1, #126	; 0x7e
    e38c:	eaffff8e 	b	e1cc <_free_r+0xf8>
    e390:	e3832001 	orr	r2, r3, #1
    e394:	e58c2004 	str	r2, [ip, #4]
    e398:	e5803000 	str	r3, [r0]
    e39c:	eaffff7f 	b	e1a0 <_free_r+0xcc>
    e3a0:	00011624 	.word	0x00011624
    e3a4:	0001162c 	.word	0x0001162c
    e3a8:	00011a30 	.word	0x00011a30
    e3ac:	00011ab0 	.word	0x00011ab0
    e3b0:	00000554 	.word	0x00000554

0000e3b4 <__sfvwrite_r>:
    e3b4:	e5923008 	ldr	r3, [r2, #8]
    e3b8:	e3530000 	cmp	r3, #0
    e3bc:	0a0000cb 	beq	e6f0 <__sfvwrite_r+0x33c>
    e3c0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e3c4:	e1d130fc 	ldrsh	r3, [r1, #12]
    e3c8:	e1a03803 	lsl	r3, r3, #16
    e3cc:	e3130702 	tst	r3, #524288	; 0x80000
    e3d0:	e24dd00c 	sub	sp, sp, #12
    e3d4:	e1a04001 	mov	r4, r1
    e3d8:	e1a0b000 	mov	fp, r0
    e3dc:	e1a06002 	mov	r6, r2
    e3e0:	e1a0a823 	lsr	sl, r3, #16
    e3e4:	0a000020 	beq	e46c <__sfvwrite_r+0xb8>
    e3e8:	e5912010 	ldr	r2, [r1, #16]
    e3ec:	e3520000 	cmp	r2, #0
    e3f0:	0a00001d 	beq	e46c <__sfvwrite_r+0xb8>
    e3f4:	e21a9002 	ands	r9, sl, #2
    e3f8:	e5965000 	ldr	r5, [r6]
    e3fc:	0a000025 	beq	e498 <__sfvwrite_r+0xe4>
    e400:	e3a08000 	mov	r8, #0
    e404:	e1a07008 	mov	r7, r8
    e408:	e59f947c 	ldr	r9, [pc, #1148]	; e88c <__sfvwrite_r+0x4d8>
    e40c:	e3570000 	cmp	r7, #0
    e410:	0a00004a 	beq	e540 <__sfvwrite_r+0x18c>
    e414:	e1570009 	cmp	r7, r9
    e418:	31a03007 	movcc	r3, r7
    e41c:	21a03009 	movcs	r3, r9
    e420:	e594a024 	ldr	sl, [r4, #36]	; 0x24
    e424:	e1a02008 	mov	r2, r8
    e428:	e594101c 	ldr	r1, [r4, #28]
    e42c:	e1a0000b 	mov	r0, fp
    e430:	e1a0e00f 	mov	lr, pc
    e434:	e12fff1a 	bx	sl
    e438:	e3500000 	cmp	r0, #0
    e43c:	da000089 	ble	e668 <__sfvwrite_r+0x2b4>
    e440:	e5963008 	ldr	r3, [r6, #8]
    e444:	e0433000 	sub	r3, r3, r0
    e448:	e3530000 	cmp	r3, #0
    e44c:	e0888000 	add	r8, r8, r0
    e450:	e0477000 	sub	r7, r7, r0
    e454:	e5863008 	str	r3, [r6, #8]
    e458:	1affffeb 	bne	e40c <__sfvwrite_r+0x58>
    e45c:	e3a00000 	mov	r0, #0
    e460:	e28dd00c 	add	sp, sp, #12
    e464:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e468:	e12fff1e 	bx	lr
    e46c:	e1a01004 	mov	r1, r4
    e470:	e1a0000b 	mov	r0, fp
    e474:	ebfffc33 	bl	d548 <__swsetup_r>
    e478:	e3500000 	cmp	r0, #0
    e47c:	1a0000fc 	bne	e874 <__sfvwrite_r+0x4c0>
    e480:	e1d430fc 	ldrsh	r3, [r4, #12]
    e484:	e1a03803 	lsl	r3, r3, #16
    e488:	e1a0a823 	lsr	sl, r3, #16
    e48c:	e21a9002 	ands	r9, sl, #2
    e490:	e5965000 	ldr	r5, [r6]
    e494:	1affffd9 	bne	e400 <__sfvwrite_r+0x4c>
    e498:	e21aa001 	ands	sl, sl, #1
    e49c:	01a0900a 	moveq	r9, sl
    e4a0:	1a000094 	bne	e6f8 <__sfvwrite_r+0x344>
    e4a4:	e3590000 	cmp	r9, #0
    e4a8:	0a000020 	beq	e530 <__sfvwrite_r+0x17c>
    e4ac:	e3130402 	tst	r3, #33554432	; 0x2000000
    e4b0:	e5947008 	ldr	r7, [r4, #8]
    e4b4:	e1a03823 	lsr	r3, r3, #16
    e4b8:	0a000024 	beq	e550 <__sfvwrite_r+0x19c>
    e4bc:	e1590007 	cmp	r9, r7
    e4c0:	e1a08007 	mov	r8, r7
    e4c4:	3a000037 	bcc	e5a8 <__sfvwrite_r+0x1f4>
    e4c8:	e3130d12 	tst	r3, #1152	; 0x480
    e4cc:	1a00003a 	bne	e5bc <__sfvwrite_r+0x208>
    e4d0:	e1a03009 	mov	r3, r9
    e4d4:	e5940000 	ldr	r0, [r4]
    e4d8:	e1a02008 	mov	r2, r8
    e4dc:	e1a0100a 	mov	r1, sl
    e4e0:	e58d3004 	str	r3, [sp, #4]
    e4e4:	ebfff63a 	bl	bdd4 <memmove>
    e4e8:	e5941008 	ldr	r1, [r4, #8]
    e4ec:	e5942000 	ldr	r2, [r4]
    e4f0:	e0417007 	sub	r7, r1, r7
    e4f4:	e0828008 	add	r8, r2, r8
    e4f8:	e5847008 	str	r7, [r4, #8]
    e4fc:	e5848000 	str	r8, [r4]
    e500:	e59d3004 	ldr	r3, [sp, #4]
    e504:	e5962008 	ldr	r2, [r6, #8]
    e508:	e0422003 	sub	r2, r2, r3
    e50c:	e3520000 	cmp	r2, #0
    e510:	e08aa003 	add	sl, sl, r3
    e514:	e0499003 	sub	r9, r9, r3
    e518:	e5862008 	str	r2, [r6, #8]
    e51c:	0affffce 	beq	e45c <__sfvwrite_r+0xa8>
    e520:	e1d430fc 	ldrsh	r3, [r4, #12]
    e524:	e3590000 	cmp	r9, #0
    e528:	e1a03803 	lsl	r3, r3, #16
    e52c:	1affffde 	bne	e4ac <__sfvwrite_r+0xf8>
    e530:	e595a000 	ldr	sl, [r5]
    e534:	e5959004 	ldr	r9, [r5, #4]
    e538:	e2855008 	add	r5, r5, #8
    e53c:	eaffffd8 	b	e4a4 <__sfvwrite_r+0xf0>
    e540:	e5958000 	ldr	r8, [r5]
    e544:	e5957004 	ldr	r7, [r5, #4]
    e548:	e2855008 	add	r5, r5, #8
    e54c:	eaffffae 	b	e40c <__sfvwrite_r+0x58>
    e550:	e5940000 	ldr	r0, [r4]
    e554:	e5943010 	ldr	r3, [r4, #16]
    e558:	e1500003 	cmp	r0, r3
    e55c:	8a000002 	bhi	e56c <__sfvwrite_r+0x1b8>
    e560:	e5948014 	ldr	r8, [r4, #20]
    e564:	e1590008 	cmp	r9, r8
    e568:	2a000045 	bcs	e684 <__sfvwrite_r+0x2d0>
    e56c:	e1570009 	cmp	r7, r9
    e570:	21a07009 	movcs	r7, r9
    e574:	e1a0100a 	mov	r1, sl
    e578:	e1a02007 	mov	r2, r7
    e57c:	ebfff614 	bl	bdd4 <memmove>
    e580:	e5942008 	ldr	r2, [r4, #8]
    e584:	e5943000 	ldr	r3, [r4]
    e588:	e0422007 	sub	r2, r2, r7
    e58c:	e0833007 	add	r3, r3, r7
    e590:	e3520000 	cmp	r2, #0
    e594:	e5842008 	str	r2, [r4, #8]
    e598:	e5843000 	str	r3, [r4]
    e59c:	0a00002c 	beq	e654 <__sfvwrite_r+0x2a0>
    e5a0:	e1a03007 	mov	r3, r7
    e5a4:	eaffffd6 	b	e504 <__sfvwrite_r+0x150>
    e5a8:	e1a07009 	mov	r7, r9
    e5ac:	e1a03009 	mov	r3, r9
    e5b0:	e1a08009 	mov	r8, r9
    e5b4:	e5940000 	ldr	r0, [r4]
    e5b8:	eaffffc6 	b	e4d8 <__sfvwrite_r+0x124>
    e5bc:	e5941010 	ldr	r1, [r4, #16]
    e5c0:	e5948000 	ldr	r8, [r4]
    e5c4:	e5942014 	ldr	r2, [r4, #20]
    e5c8:	e0488001 	sub	r8, r8, r1
    e5cc:	e0822082 	add	r2, r2, r2, lsl #1
    e5d0:	e2887001 	add	r7, r8, #1
    e5d4:	e0822fa2 	add	r2, r2, r2, lsr #31
    e5d8:	e0877009 	add	r7, r7, r9
    e5dc:	e1a020c2 	asr	r2, r2, #1
    e5e0:	e1570002 	cmp	r7, r2
    e5e4:	91a07002 	movls	r7, r2
    e5e8:	81a02007 	movhi	r2, r7
    e5ec:	e3130b01 	tst	r3, #1024	; 0x400
    e5f0:	0a000032 	beq	e6c0 <__sfvwrite_r+0x30c>
    e5f4:	e1a01002 	mov	r1, r2
    e5f8:	e1a0000b 	mov	r0, fp
    e5fc:	eb000191 	bl	ec48 <_malloc_r>
    e600:	e2503000 	subs	r3, r0, #0
    e604:	0a00009c 	beq	e87c <__sfvwrite_r+0x4c8>
    e608:	e1a02008 	mov	r2, r8
    e60c:	e5941010 	ldr	r1, [r4, #16]
    e610:	e58d3004 	str	r3, [sp, #4]
    e614:	ebfff5a9 	bl	bcc0 <memcpy>
    e618:	e1d420bc 	ldrh	r2, [r4, #12]
    e61c:	e3c22d12 	bic	r2, r2, #1152	; 0x480
    e620:	e3822080 	orr	r2, r2, #128	; 0x80
    e624:	e1c420bc 	strh	r2, [r4, #12]
    e628:	e59d3004 	ldr	r3, [sp, #4]
    e62c:	e0830008 	add	r0, r3, r8
    e630:	e0478008 	sub	r8, r7, r8
    e634:	e5843010 	str	r3, [r4, #16]
    e638:	e5848008 	str	r8, [r4, #8]
    e63c:	e5847014 	str	r7, [r4, #20]
    e640:	e5840000 	str	r0, [r4]
    e644:	e1a07009 	mov	r7, r9
    e648:	e1a03009 	mov	r3, r9
    e64c:	e1a08009 	mov	r8, r9
    e650:	eaffffa0 	b	e4d8 <__sfvwrite_r+0x124>
    e654:	e1a01004 	mov	r1, r4
    e658:	e1a0000b 	mov	r0, fp
    e65c:	ebfffca6 	bl	d8fc <_fflush_r>
    e660:	e3500000 	cmp	r0, #0
    e664:	0affffcd 	beq	e5a0 <__sfvwrite_r+0x1ec>
    e668:	e1d430fc 	ldrsh	r3, [r4, #12]
    e66c:	e3e00000 	mvn	r0, #0
    e670:	e3833040 	orr	r3, r3, #64	; 0x40
    e674:	e1c430bc 	strh	r3, [r4, #12]
    e678:	e28dd00c 	add	sp, sp, #12
    e67c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e680:	e12fff1e 	bx	lr
    e684:	e3790106 	cmn	r9, #-2147483647	; 0x80000001
    e688:	31a00009 	movcc	r0, r9
    e68c:	23e00102 	mvncs	r0, #-2147483648	; 0x80000000
    e690:	e1a01008 	mov	r1, r8
    e694:	ebfff4e2 	bl	ba24 <__divsi3>
    e698:	e5947024 	ldr	r7, [r4, #36]	; 0x24
    e69c:	e0030098 	mul	r3, r8, r0
    e6a0:	e1a0200a 	mov	r2, sl
    e6a4:	e594101c 	ldr	r1, [r4, #28]
    e6a8:	e1a0000b 	mov	r0, fp
    e6ac:	e1a0e00f 	mov	lr, pc
    e6b0:	e12fff17 	bx	r7
    e6b4:	e2503000 	subs	r3, r0, #0
    e6b8:	caffff91 	bgt	e504 <__sfvwrite_r+0x150>
    e6bc:	eaffffe9 	b	e668 <__sfvwrite_r+0x2b4>
    e6c0:	e1a0000b 	mov	r0, fp
    e6c4:	eb0003b2 	bl	f594 <_realloc_r>
    e6c8:	e2503000 	subs	r3, r0, #0
    e6cc:	1affffd6 	bne	e62c <__sfvwrite_r+0x278>
    e6d0:	e5941010 	ldr	r1, [r4, #16]
    e6d4:	e1a0000b 	mov	r0, fp
    e6d8:	ebfffe7d 	bl	e0d4 <_free_r>
    e6dc:	e3a0200c 	mov	r2, #12
    e6e0:	e1d430fc 	ldrsh	r3, [r4, #12]
    e6e4:	e58b2000 	str	r2, [fp]
    e6e8:	e3c33080 	bic	r3, r3, #128	; 0x80
    e6ec:	eaffffde 	b	e66c <__sfvwrite_r+0x2b8>
    e6f0:	e3a00000 	mov	r0, #0
    e6f4:	e12fff1e 	bx	lr
    e6f8:	e1a00009 	mov	r0, r9
    e6fc:	e1a0a009 	mov	sl, r9
    e700:	e1a08009 	mov	r8, r9
    e704:	ea000026 	b	e7a4 <__sfvwrite_r+0x3f0>
    e708:	e3500000 	cmp	r0, #0
    e70c:	0a00002d 	beq	e7c8 <__sfvwrite_r+0x414>
    e710:	e1590008 	cmp	r9, r8
    e714:	31a01009 	movcc	r1, r9
    e718:	21a01008 	movcs	r1, r8
    e71c:	e5942010 	ldr	r2, [r4, #16]
    e720:	e594c014 	ldr	ip, [r4, #20]
    e724:	e5943008 	ldr	r3, [r4, #8]
    e728:	e5940000 	ldr	r0, [r4]
    e72c:	e08c3003 	add	r3, ip, r3
    e730:	e1500002 	cmp	r0, r2
    e734:	93a02000 	movls	r2, #0
    e738:	83a02001 	movhi	r2, #1
    e73c:	e1510003 	cmp	r1, r3
    e740:	d3a02000 	movle	r2, #0
    e744:	e3520000 	cmp	r2, #0
    e748:	e1a07001 	mov	r7, r1
    e74c:	1a000038 	bne	e834 <__sfvwrite_r+0x480>
    e750:	e151000c 	cmp	r1, ip
    e754:	ba000024 	blt	e7ec <__sfvwrite_r+0x438>
    e758:	e5947024 	ldr	r7, [r4, #36]	; 0x24
    e75c:	e1a0300c 	mov	r3, ip
    e760:	e1a0200a 	mov	r2, sl
    e764:	e594101c 	ldr	r1, [r4, #28]
    e768:	e1a0000b 	mov	r0, fp
    e76c:	e1a0e00f 	mov	lr, pc
    e770:	e12fff17 	bx	r7
    e774:	e2507000 	subs	r7, r0, #0
    e778:	daffffba 	ble	e668 <__sfvwrite_r+0x2b4>
    e77c:	e0599007 	subs	r9, r9, r7
    e780:	13a00001 	movne	r0, #1
    e784:	0a000024 	beq	e81c <__sfvwrite_r+0x468>
    e788:	e5963008 	ldr	r3, [r6, #8]
    e78c:	e0433007 	sub	r3, r3, r7
    e790:	e3530000 	cmp	r3, #0
    e794:	e08aa007 	add	sl, sl, r7
    e798:	e0488007 	sub	r8, r8, r7
    e79c:	e5863008 	str	r3, [r6, #8]
    e7a0:	0affff2d 	beq	e45c <__sfvwrite_r+0xa8>
    e7a4:	e3580000 	cmp	r8, #0
    e7a8:	1affffd6 	bne	e708 <__sfvwrite_r+0x354>
    e7ac:	e2853008 	add	r3, r5, #8
    e7b0:	e5138004 	ldr	r8, [r3, #-4]
    e7b4:	e3580000 	cmp	r8, #0
    e7b8:	e1a05003 	mov	r5, r3
    e7bc:	e513a008 	ldr	sl, [r3, #-8]
    e7c0:	e2833008 	add	r3, r3, #8
    e7c4:	0afffff9 	beq	e7b0 <__sfvwrite_r+0x3fc>
    e7c8:	e1a02008 	mov	r2, r8
    e7cc:	e3a0100a 	mov	r1, #10
    e7d0:	e1a0000a 	mov	r0, sl
    e7d4:	eb00031e 	bl	f454 <memchr>
    e7d8:	e3500000 	cmp	r0, #0
    e7dc:	12800001 	addne	r0, r0, #1
    e7e0:	1040900a 	subne	r9, r0, sl
    e7e4:	02889001 	addeq	r9, r8, #1
    e7e8:	eaffffc8 	b	e710 <__sfvwrite_r+0x35c>
    e7ec:	e1a02001 	mov	r2, r1
    e7f0:	e1a0100a 	mov	r1, sl
    e7f4:	ebfff576 	bl	bdd4 <memmove>
    e7f8:	e5942008 	ldr	r2, [r4, #8]
    e7fc:	e5943000 	ldr	r3, [r4]
    e800:	e0422007 	sub	r2, r2, r7
    e804:	e0833007 	add	r3, r3, r7
    e808:	e0599007 	subs	r9, r9, r7
    e80c:	e5842008 	str	r2, [r4, #8]
    e810:	e5843000 	str	r3, [r4]
    e814:	13a00001 	movne	r0, #1
    e818:	1affffda 	bne	e788 <__sfvwrite_r+0x3d4>
    e81c:	e1a01004 	mov	r1, r4
    e820:	e1a0000b 	mov	r0, fp
    e824:	ebfffc34 	bl	d8fc <_fflush_r>
    e828:	e3500000 	cmp	r0, #0
    e82c:	0affffd5 	beq	e788 <__sfvwrite_r+0x3d4>
    e830:	eaffff8c 	b	e668 <__sfvwrite_r+0x2b4>
    e834:	e1a02003 	mov	r2, r3
    e838:	e1a0100a 	mov	r1, sl
    e83c:	e58d3004 	str	r3, [sp, #4]
    e840:	ebfff563 	bl	bdd4 <memmove>
    e844:	e5942000 	ldr	r2, [r4]
    e848:	e59d3004 	ldr	r3, [sp, #4]
    e84c:	e0822003 	add	r2, r2, r3
    e850:	e5842000 	str	r2, [r4]
    e854:	e1a01004 	mov	r1, r4
    e858:	e1a0000b 	mov	r0, fp
    e85c:	ebfffc26 	bl	d8fc <_fflush_r>
    e860:	e3500000 	cmp	r0, #0
    e864:	e59d3004 	ldr	r3, [sp, #4]
    e868:	1affff7e 	bne	e668 <__sfvwrite_r+0x2b4>
    e86c:	e1a07003 	mov	r7, r3
    e870:	eaffffc1 	b	e77c <__sfvwrite_r+0x3c8>
    e874:	e3e00000 	mvn	r0, #0
    e878:	eafffef8 	b	e460 <__sfvwrite_r+0xac>
    e87c:	e3a0200c 	mov	r2, #12
    e880:	e1d430fc 	ldrsh	r3, [r4, #12]
    e884:	e58b2000 	str	r2, [fp]
    e888:	eaffff77 	b	e66c <__sfvwrite_r+0x2b8>
    e88c:	7ffffc00 	.word	0x7ffffc00

0000e890 <_fwalk>:
    e890:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    e894:	e2907e2e 	adds	r7, r0, #736	; 0x2e0
    e898:	0a000019 	beq	e904 <_fwalk+0x74>
    e89c:	e1a08001 	mov	r8, r1
    e8a0:	e3a06000 	mov	r6, #0
    e8a4:	e5975004 	ldr	r5, [r7, #4]
    e8a8:	e2555001 	subs	r5, r5, #1
    e8ac:	e5974008 	ldr	r4, [r7, #8]
    e8b0:	4a00000d 	bmi	e8ec <_fwalk+0x5c>
    e8b4:	e1d430bc 	ldrh	r3, [r4, #12]
    e8b8:	e3530001 	cmp	r3, #1
    e8bc:	e2455001 	sub	r5, r5, #1
    e8c0:	9a000006 	bls	e8e0 <_fwalk+0x50>
    e8c4:	e1d430fe 	ldrsh	r3, [r4, #14]
    e8c8:	e3730001 	cmn	r3, #1
    e8cc:	0a000003 	beq	e8e0 <_fwalk+0x50>
    e8d0:	e1a00004 	mov	r0, r4
    e8d4:	e1a0e00f 	mov	lr, pc
    e8d8:	e12fff18 	bx	r8
    e8dc:	e1866000 	orr	r6, r6, r0
    e8e0:	e3750001 	cmn	r5, #1
    e8e4:	e2844068 	add	r4, r4, #104	; 0x68
    e8e8:	1afffff1 	bne	e8b4 <_fwalk+0x24>
    e8ec:	e5977000 	ldr	r7, [r7]
    e8f0:	e3570000 	cmp	r7, #0
    e8f4:	1affffea 	bne	e8a4 <_fwalk+0x14>
    e8f8:	e1a00006 	mov	r0, r6
    e8fc:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    e900:	e12fff1e 	bx	lr
    e904:	e1a06007 	mov	r6, r7
    e908:	e1a00006 	mov	r0, r6
    e90c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    e910:	e12fff1e 	bx	lr

0000e914 <_fwalk_reent>:
    e914:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    e918:	e2906e2e 	adds	r6, r0, #736	; 0x2e0
    e91c:	0a00001b 	beq	e990 <_fwalk_reent+0x7c>
    e920:	e1a08001 	mov	r8, r1
    e924:	e1a07000 	mov	r7, r0
    e928:	e3a09000 	mov	r9, #0
    e92c:	e5965004 	ldr	r5, [r6, #4]
    e930:	e2555001 	subs	r5, r5, #1
    e934:	e5964008 	ldr	r4, [r6, #8]
    e938:	4a00000e 	bmi	e978 <_fwalk_reent+0x64>
    e93c:	e1d430bc 	ldrh	r3, [r4, #12]
    e940:	e3530001 	cmp	r3, #1
    e944:	e2455001 	sub	r5, r5, #1
    e948:	9a000007 	bls	e96c <_fwalk_reent+0x58>
    e94c:	e1d430fe 	ldrsh	r3, [r4, #14]
    e950:	e3730001 	cmn	r3, #1
    e954:	0a000004 	beq	e96c <_fwalk_reent+0x58>
    e958:	e1a01004 	mov	r1, r4
    e95c:	e1a00007 	mov	r0, r7
    e960:	e1a0e00f 	mov	lr, pc
    e964:	e12fff18 	bx	r8
    e968:	e1899000 	orr	r9, r9, r0
    e96c:	e3750001 	cmn	r5, #1
    e970:	e2844068 	add	r4, r4, #104	; 0x68
    e974:	1afffff0 	bne	e93c <_fwalk_reent+0x28>
    e978:	e5966000 	ldr	r6, [r6]
    e97c:	e3560000 	cmp	r6, #0
    e980:	1affffe9 	bne	e92c <_fwalk_reent+0x18>
    e984:	e1a00009 	mov	r0, r9
    e988:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    e98c:	e12fff1e 	bx	lr
    e990:	e1a09006 	mov	r9, r6
    e994:	e1a00009 	mov	r0, r9
    e998:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    e99c:	e12fff1e 	bx	lr

0000e9a0 <_setlocale_r>:
    e9a0:	e92d4010 	push	{r4, lr}
    e9a4:	e2524000 	subs	r4, r2, #0
    e9a8:	0a000004 	beq	e9c0 <_setlocale_r+0x20>
    e9ac:	e59f1048 	ldr	r1, [pc, #72]	; e9fc <_setlocale_r+0x5c>
    e9b0:	e1a00004 	mov	r0, r4
    e9b4:	eb000523 	bl	fe48 <strcmp>
    e9b8:	e3500000 	cmp	r0, #0
    e9bc:	1a000002 	bne	e9cc <_setlocale_r+0x2c>
    e9c0:	e59f0038 	ldr	r0, [pc, #56]	; ea00 <_setlocale_r+0x60>
    e9c4:	e8bd4010 	pop	{r4, lr}
    e9c8:	e12fff1e 	bx	lr
    e9cc:	e59f102c 	ldr	r1, [pc, #44]	; ea00 <_setlocale_r+0x60>
    e9d0:	e1a00004 	mov	r0, r4
    e9d4:	eb00051b 	bl	fe48 <strcmp>
    e9d8:	e3500000 	cmp	r0, #0
    e9dc:	0afffff7 	beq	e9c0 <_setlocale_r+0x20>
    e9e0:	e1a00004 	mov	r0, r4
    e9e4:	e59f1018 	ldr	r1, [pc, #24]	; ea04 <_setlocale_r+0x64>
    e9e8:	eb000516 	bl	fe48 <strcmp>
    e9ec:	e3500000 	cmp	r0, #0
    e9f0:	0afffff2 	beq	e9c0 <_setlocale_r+0x20>
    e9f4:	e3a00000 	mov	r0, #0
    e9f8:	eafffff1 	b	e9c4 <_setlocale_r+0x24>
    e9fc:	00010f44 	.word	0x00010f44
    ea00:	00010f40 	.word	0x00010f40
    ea04:	00010eb8 	.word	0x00010eb8

0000ea08 <__locale_mb_cur_max>:
    ea08:	e59f3018 	ldr	r3, [pc, #24]	; ea28 <__locale_mb_cur_max+0x20>
    ea0c:	e5933000 	ldr	r3, [r3]
    ea10:	e5933034 	ldr	r3, [r3, #52]	; 0x34
    ea14:	e59f2010 	ldr	r2, [pc, #16]	; ea2c <__locale_mb_cur_max+0x24>
    ea18:	e3530000 	cmp	r3, #0
    ea1c:	01a03002 	moveq	r3, r2
    ea20:	e5d30128 	ldrb	r0, [r3, #296]	; 0x128
    ea24:	e12fff1e 	bx	lr
    ea28:	0001108c 	.word	0x0001108c
    ea2c:	000114b8 	.word	0x000114b8

0000ea30 <__locale_ctype_ptr_l>:
    ea30:	e59000ec 	ldr	r0, [r0, #236]	; 0xec
    ea34:	e12fff1e 	bx	lr

0000ea38 <__locale_ctype_ptr>:
    ea38:	e59f3018 	ldr	r3, [pc, #24]	; ea58 <__locale_ctype_ptr+0x20>
    ea3c:	e5933000 	ldr	r3, [r3]
    ea40:	e5933034 	ldr	r3, [r3, #52]	; 0x34
    ea44:	e59f2010 	ldr	r2, [pc, #16]	; ea5c <__locale_ctype_ptr+0x24>
    ea48:	e3530000 	cmp	r3, #0
    ea4c:	01a03002 	moveq	r3, r2
    ea50:	e59300ec 	ldr	r0, [r3, #236]	; 0xec
    ea54:	e12fff1e 	bx	lr
    ea58:	0001108c 	.word	0x0001108c
    ea5c:	000114b8 	.word	0x000114b8

0000ea60 <setlocale>:
    ea60:	e59f300c 	ldr	r3, [pc, #12]	; ea74 <setlocale+0x14>
    ea64:	e1a02001 	mov	r2, r1
    ea68:	e1a01000 	mov	r1, r0
    ea6c:	e5930000 	ldr	r0, [r3]
    ea70:	eaffffca 	b	e9a0 <_setlocale_r>
    ea74:	0001108c 	.word	0x0001108c

0000ea78 <__retarget_lock_init>:
    ea78:	e12fff1e 	bx	lr

0000ea7c <__retarget_lock_init_recursive>:
    ea7c:	e12fff1e 	bx	lr

0000ea80 <__retarget_lock_close>:
    ea80:	e12fff1e 	bx	lr

0000ea84 <__retarget_lock_close_recursive>:
    ea84:	e12fff1e 	bx	lr

0000ea88 <__retarget_lock_acquire>:
    ea88:	e12fff1e 	bx	lr

0000ea8c <__retarget_lock_acquire_recursive>:
    ea8c:	e12fff1e 	bx	lr

0000ea90 <__retarget_lock_try_acquire>:
    ea90:	e3a00001 	mov	r0, #1
    ea94:	e12fff1e 	bx	lr

0000ea98 <__retarget_lock_try_acquire_recursive>:
    ea98:	e3a00001 	mov	r0, #1
    ea9c:	e12fff1e 	bx	lr

0000eaa0 <__retarget_lock_release>:
    eaa0:	e12fff1e 	bx	lr

0000eaa4 <__retarget_lock_release_recursive>:
    eaa4:	e12fff1e 	bx	lr

0000eaa8 <__swhatbuf_r>:
    eaa8:	e92d4070 	push	{r4, r5, r6, lr}
    eaac:	e1a04001 	mov	r4, r1
    eab0:	e1d110fe 	ldrsh	r1, [r1, #14]
    eab4:	e3510000 	cmp	r1, #0
    eab8:	e24dd040 	sub	sp, sp, #64	; 0x40
    eabc:	e1a05002 	mov	r5, r2
    eac0:	e1a06003 	mov	r6, r3
    eac4:	ba00000f 	blt	eb08 <__swhatbuf_r+0x60>
    eac8:	e28d2004 	add	r2, sp, #4
    eacc:	eb000699 	bl	10538 <_fstat_r>
    ead0:	e3500000 	cmp	r0, #0
    ead4:	ba00000b 	blt	eb08 <__swhatbuf_r+0x60>
    ead8:	e59d2008 	ldr	r2, [sp, #8]
    eadc:	e2022a0f 	and	r2, r2, #61440	; 0xf000
    eae0:	e2423a02 	sub	r3, r2, #8192	; 0x2000
    eae4:	e2732000 	rsbs	r2, r3, #0
    eae8:	e0a22003 	adc	r2, r2, r3
    eaec:	e3a00b02 	mov	r0, #2048	; 0x800
    eaf0:	e3a03b01 	mov	r3, #1024	; 0x400
    eaf4:	e5862000 	str	r2, [r6]
    eaf8:	e5853000 	str	r3, [r5]
    eafc:	e28dd040 	add	sp, sp, #64	; 0x40
    eb00:	e8bd4070 	pop	{r4, r5, r6, lr}
    eb04:	e12fff1e 	bx	lr
    eb08:	e3a03000 	mov	r3, #0
    eb0c:	e1d420bc 	ldrh	r2, [r4, #12]
    eb10:	e2120080 	ands	r0, r2, #128	; 0x80
    eb14:	e5863000 	str	r3, [r6]
    eb18:	0a000005 	beq	eb34 <__swhatbuf_r+0x8c>
    eb1c:	e3a02040 	mov	r2, #64	; 0x40
    eb20:	e1a00003 	mov	r0, r3
    eb24:	e5852000 	str	r2, [r5]
    eb28:	e28dd040 	add	sp, sp, #64	; 0x40
    eb2c:	e8bd4070 	pop	{r4, r5, r6, lr}
    eb30:	e12fff1e 	bx	lr
    eb34:	e3a03b01 	mov	r3, #1024	; 0x400
    eb38:	e5853000 	str	r3, [r5]
    eb3c:	e28dd040 	add	sp, sp, #64	; 0x40
    eb40:	e8bd4070 	pop	{r4, r5, r6, lr}
    eb44:	e12fff1e 	bx	lr

0000eb48 <__smakebuf_r>:
    eb48:	e92d4070 	push	{r4, r5, r6, lr}
    eb4c:	e1d120bc 	ldrh	r2, [r1, #12]
    eb50:	e3120002 	tst	r2, #2
    eb54:	e24dd008 	sub	sp, sp, #8
    eb58:	e1a04001 	mov	r4, r1
    eb5c:	0a000007 	beq	eb80 <__smakebuf_r+0x38>
    eb60:	e3a01001 	mov	r1, #1
    eb64:	e2842043 	add	r2, r4, #67	; 0x43
    eb68:	e5841014 	str	r1, [r4, #20]
    eb6c:	e5842000 	str	r2, [r4]
    eb70:	e5842010 	str	r2, [r4, #16]
    eb74:	e28dd008 	add	sp, sp, #8
    eb78:	e8bd4070 	pop	{r4, r5, r6, lr}
    eb7c:	e12fff1e 	bx	lr
    eb80:	e28d3004 	add	r3, sp, #4
    eb84:	e1a0200d 	mov	r2, sp
    eb88:	e1a06000 	mov	r6, r0
    eb8c:	ebffffc5 	bl	eaa8 <__swhatbuf_r>
    eb90:	e59d1000 	ldr	r1, [sp]
    eb94:	e1a05000 	mov	r5, r0
    eb98:	e1a00006 	mov	r0, r6
    eb9c:	eb000029 	bl	ec48 <_malloc_r>
    eba0:	e3500000 	cmp	r0, #0
    eba4:	e1d430fc 	ldrsh	r3, [r4, #12]
    eba8:	0a00001a 	beq	ec18 <__smakebuf_r+0xd0>
    ebac:	e59dc004 	ldr	ip, [sp, #4]
    ebb0:	e59f108c 	ldr	r1, [pc, #140]	; ec44 <__smakebuf_r+0xfc>
    ebb4:	e59d2000 	ldr	r2, [sp]
    ebb8:	e3833080 	orr	r3, r3, #128	; 0x80
    ebbc:	e35c0000 	cmp	ip, #0
    ebc0:	e586103c 	str	r1, [r6, #60]	; 0x3c
    ebc4:	e1c430bc 	strh	r3, [r4, #12]
    ebc8:	e5840000 	str	r0, [r4]
    ebcc:	e5840010 	str	r0, [r4, #16]
    ebd0:	e5842014 	str	r2, [r4, #20]
    ebd4:	1a000004 	bne	ebec <__smakebuf_r+0xa4>
    ebd8:	e1833005 	orr	r3, r3, r5
    ebdc:	e1c430bc 	strh	r3, [r4, #12]
    ebe0:	e28dd008 	add	sp, sp, #8
    ebe4:	e8bd4070 	pop	{r4, r5, r6, lr}
    ebe8:	e12fff1e 	bx	lr
    ebec:	e1a00006 	mov	r0, r6
    ebf0:	e1d410fe 	ldrsh	r1, [r4, #14]
    ebf4:	eb000660 	bl	1057c <_isatty_r>
    ebf8:	e3500000 	cmp	r0, #0
    ebfc:	11d430bc 	ldrhne	r3, [r4, #12]
    ec00:	13c33003 	bicne	r3, r3, #3
    ec04:	13833001 	orrne	r3, r3, #1
    ec08:	11a03803 	lslne	r3, r3, #16
    ec0c:	01d430fc 	ldrsheq	r3, [r4, #12]
    ec10:	11a03843 	asrne	r3, r3, #16
    ec14:	eaffffef 	b	ebd8 <__smakebuf_r+0x90>
    ec18:	e3130c02 	tst	r3, #512	; 0x200
    ec1c:	1affffd4 	bne	eb74 <__smakebuf_r+0x2c>
    ec20:	e3a01001 	mov	r1, #1
    ec24:	e3c33003 	bic	r3, r3, #3
    ec28:	e2842043 	add	r2, r4, #67	; 0x43
    ec2c:	e3833002 	orr	r3, r3, #2
    ec30:	e1c430bc 	strh	r3, [r4, #12]
    ec34:	e5841014 	str	r1, [r4, #20]
    ec38:	e5842000 	str	r2, [r4]
    ec3c:	e5842010 	str	r2, [r4, #16]
    ec40:	eaffffcb 	b	eb74 <__smakebuf_r+0x2c>
    ec44:	0000d9d0 	.word	0x0000d9d0

0000ec48 <_malloc_r>:
    ec48:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ec4c:	e281600b 	add	r6, r1, #11
    ec50:	e3560016 	cmp	r6, #22
    ec54:	e24dd00c 	sub	sp, sp, #12
    ec58:	e1a05000 	mov	r5, r0
    ec5c:	9a000072 	bls	ee2c <_malloc_r+0x1e4>
    ec60:	e3c66007 	bic	r6, r6, #7
    ec64:	e1510006 	cmp	r1, r6
    ec68:	93a01000 	movls	r1, #0
    ec6c:	83a01001 	movhi	r1, #1
    ec70:	e1913fa6 	orrs	r3, r1, r6, lsr #31
    ec74:	1a000089 	bne	eea0 <_malloc_r+0x258>
    ec78:	eb000239 	bl	f564 <__malloc_lock>
    ec7c:	e3560f7e 	cmp	r6, #504	; 0x1f8
    ec80:	3a0001c8 	bcc	f3a8 <_malloc_r+0x760>
    ec84:	e1b034a6 	lsrs	r3, r6, #9
    ec88:	0a00008b 	beq	eebc <_malloc_r+0x274>
    ec8c:	e3530004 	cmp	r3, #4
    ec90:	8a0000d6 	bhi	eff0 <_malloc_r+0x3a8>
    ec94:	e1a03326 	lsr	r3, r6, #6
    ec98:	e2830039 	add	r0, r3, #57	; 0x39
    ec9c:	e283c038 	add	ip, r3, #56	; 0x38
    eca0:	e1a01180 	lsl	r1, r0, #3
    eca4:	e59f7708 	ldr	r7, [pc, #1800]	; f3b4 <_malloc_r+0x76c>
    eca8:	e0871001 	add	r1, r7, r1
    ecac:	e5914004 	ldr	r4, [r1, #4]
    ecb0:	e2411008 	sub	r1, r1, #8
    ecb4:	e1510004 	cmp	r1, r4
    ecb8:	1a000005 	bne	ecd4 <_malloc_r+0x8c>
    ecbc:	ea00000a 	b	ecec <_malloc_r+0xa4>
    ecc0:	e3520000 	cmp	r2, #0
    ecc4:	aa000066 	bge	ee64 <_malloc_r+0x21c>
    ecc8:	e594400c 	ldr	r4, [r4, #12]
    eccc:	e1510004 	cmp	r1, r4
    ecd0:	0a000005 	beq	ecec <_malloc_r+0xa4>
    ecd4:	e5943004 	ldr	r3, [r4, #4]
    ecd8:	e3c33003 	bic	r3, r3, #3
    ecdc:	e0432006 	sub	r2, r3, r6
    ece0:	e352000f 	cmp	r2, #15
    ece4:	dafffff5 	ble	ecc0 <_malloc_r+0x78>
    ece8:	e1a0000c 	mov	r0, ip
    ecec:	e5974010 	ldr	r4, [r7, #16]
    ecf0:	e59fc6c0 	ldr	ip, [pc, #1728]	; f3b8 <_malloc_r+0x770>
    ecf4:	e154000c 	cmp	r4, ip
    ecf8:	05973004 	ldreq	r3, [r7, #4]
    ecfc:	0a000018 	beq	ed64 <_malloc_r+0x11c>
    ed00:	e5943004 	ldr	r3, [r4, #4]
    ed04:	e3c33003 	bic	r3, r3, #3
    ed08:	e0432006 	sub	r2, r3, r6
    ed0c:	e352000f 	cmp	r2, #15
    ed10:	ca0000da 	bgt	f080 <_malloc_r+0x438>
    ed14:	e3520000 	cmp	r2, #0
    ed18:	e587c014 	str	ip, [r7, #20]
    ed1c:	e587c010 	str	ip, [r7, #16]
    ed20:	aa000069 	bge	eecc <_malloc_r+0x284>
    ed24:	e3530c02 	cmp	r3, #512	; 0x200
    ed28:	2a0000b9 	bcs	f014 <_malloc_r+0x3cc>
    ed2c:	e3a08001 	mov	r8, #1
    ed30:	e5972004 	ldr	r2, [r7, #4]
    ed34:	e1a031a3 	lsr	r3, r3, #3
    ed38:	e0831008 	add	r1, r3, r8
    ed3c:	e1a03143 	asr	r3, r3, #2
    ed40:	e1823318 	orr	r3, r2, r8, lsl r3
    ed44:	e087e181 	add	lr, r7, r1, lsl #3
    ed48:	e7978181 	ldr	r8, [r7, r1, lsl #3]
    ed4c:	e24e2008 	sub	r2, lr, #8
    ed50:	e584200c 	str	r2, [r4, #12]
    ed54:	e5848008 	str	r8, [r4, #8]
    ed58:	e5873004 	str	r3, [r7, #4]
    ed5c:	e7874181 	str	r4, [r7, r1, lsl #3]
    ed60:	e588400c 	str	r4, [r8, #12]
    ed64:	e3a01001 	mov	r1, #1
    ed68:	e1a02140 	asr	r2, r0, #2
    ed6c:	e1a0e211 	lsl	lr, r1, r2
    ed70:	e15e0003 	cmp	lr, r3
    ed74:	8a00005f 	bhi	eef8 <_malloc_r+0x2b0>
    ed78:	e11e0003 	tst	lr, r3
    ed7c:	1a000008 	bne	eda4 <_malloc_r+0x15c>
    ed80:	e1a0e11e 	lsl	lr, lr, r1
    ed84:	e3c00003 	bic	r0, r0, #3
    ed88:	e11e0003 	tst	lr, r3
    ed8c:	e2800004 	add	r0, r0, #4
    ed90:	1a000003 	bne	eda4 <_malloc_r+0x15c>
    ed94:	e1a0e08e 	lsl	lr, lr, #1
    ed98:	e11e0003 	tst	lr, r3
    ed9c:	e2800004 	add	r0, r0, #4
    eda0:	0afffffb 	beq	ed94 <_malloc_r+0x14c>
    eda4:	e0879180 	add	r9, r7, r0, lsl #3
    eda8:	e1a01009 	mov	r1, r9
    edac:	e1a04000 	mov	r4, r0
    edb0:	e591800c 	ldr	r8, [r1, #12]
    edb4:	e1510008 	cmp	r1, r8
    edb8:	1a000005 	bne	edd4 <_malloc_r+0x18c>
    edbc:	ea0000bc 	b	f0b4 <_malloc_r+0x46c>
    edc0:	e3520000 	cmp	r2, #0
    edc4:	aa0000c4 	bge	f0dc <_malloc_r+0x494>
    edc8:	e598800c 	ldr	r8, [r8, #12]
    edcc:	e1510008 	cmp	r1, r8
    edd0:	0a0000b7 	beq	f0b4 <_malloc_r+0x46c>
    edd4:	e5983004 	ldr	r3, [r8, #4]
    edd8:	e3c33003 	bic	r3, r3, #3
    eddc:	e0432006 	sub	r2, r3, r6
    ede0:	e352000f 	cmp	r2, #15
    ede4:	dafffff5 	ble	edc0 <_malloc_r+0x178>
    ede8:	e598100c 	ldr	r1, [r8, #12]
    edec:	e598e008 	ldr	lr, [r8, #8]
    edf0:	e3864001 	orr	r4, r6, #1
    edf4:	e5884004 	str	r4, [r8, #4]
    edf8:	e0886006 	add	r6, r8, r6
    edfc:	e3824001 	orr	r4, r2, #1
    ee00:	e58e100c 	str	r1, [lr, #12]
    ee04:	e1a00005 	mov	r0, r5
    ee08:	e581e008 	str	lr, [r1, #8]
    ee0c:	e5876014 	str	r6, [r7, #20]
    ee10:	e5876010 	str	r6, [r7, #16]
    ee14:	e9861010 	stmib	r6, {r4, ip}
    ee18:	e586c00c 	str	ip, [r6, #12]
    ee1c:	e7882003 	str	r2, [r8, r3]
    ee20:	eb0001d5 	bl	f57c <__malloc_unlock>
    ee24:	e2884008 	add	r4, r8, #8
    ee28:	ea000018 	b	ee90 <_malloc_r+0x248>
    ee2c:	e3510010 	cmp	r1, #16
    ee30:	8a00001a 	bhi	eea0 <_malloc_r+0x258>
    ee34:	eb0001ca 	bl	f564 <__malloc_lock>
    ee38:	e3a06010 	mov	r6, #16
    ee3c:	e3a03018 	mov	r3, #24
    ee40:	e3a00002 	mov	r0, #2
    ee44:	e59f7568 	ldr	r7, [pc, #1384]	; f3b4 <_malloc_r+0x76c>
    ee48:	e0873003 	add	r3, r7, r3
    ee4c:	e5934004 	ldr	r4, [r3, #4]
    ee50:	e2432008 	sub	r2, r3, #8
    ee54:	e1540002 	cmp	r4, r2
    ee58:	0a00009a 	beq	f0c8 <_malloc_r+0x480>
    ee5c:	e5943004 	ldr	r3, [r4, #4]
    ee60:	e3c33003 	bic	r3, r3, #3
    ee64:	e0843003 	add	r3, r4, r3
    ee68:	e5932004 	ldr	r2, [r3, #4]
    ee6c:	e594100c 	ldr	r1, [r4, #12]
    ee70:	e594c008 	ldr	ip, [r4, #8]
    ee74:	e3822001 	orr	r2, r2, #1
    ee78:	e58c100c 	str	r1, [ip, #12]
    ee7c:	e1a00005 	mov	r0, r5
    ee80:	e581c008 	str	ip, [r1, #8]
    ee84:	e5832004 	str	r2, [r3, #4]
    ee88:	eb0001bb 	bl	f57c <__malloc_unlock>
    ee8c:	e2844008 	add	r4, r4, #8
    ee90:	e1a00004 	mov	r0, r4
    ee94:	e28dd00c 	add	sp, sp, #12
    ee98:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ee9c:	e12fff1e 	bx	lr
    eea0:	e3a04000 	mov	r4, #0
    eea4:	e3a0300c 	mov	r3, #12
    eea8:	e1a00004 	mov	r0, r4
    eeac:	e5853000 	str	r3, [r5]
    eeb0:	e28dd00c 	add	sp, sp, #12
    eeb4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    eeb8:	e12fff1e 	bx	lr
    eebc:	e3a01c02 	mov	r1, #512	; 0x200
    eec0:	e3a00040 	mov	r0, #64	; 0x40
    eec4:	e3a0c03f 	mov	ip, #63	; 0x3f
    eec8:	eaffff75 	b	eca4 <_malloc_r+0x5c>
    eecc:	e0843003 	add	r3, r4, r3
    eed0:	e5932004 	ldr	r2, [r3, #4]
    eed4:	e3822001 	orr	r2, r2, #1
    eed8:	e1a00005 	mov	r0, r5
    eedc:	e5832004 	str	r2, [r3, #4]
    eee0:	e2844008 	add	r4, r4, #8
    eee4:	eb0001a4 	bl	f57c <__malloc_unlock>
    eee8:	e1a00004 	mov	r0, r4
    eeec:	e28dd00c 	add	sp, sp, #12
    eef0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    eef4:	e12fff1e 	bx	lr
    eef8:	e5974008 	ldr	r4, [r7, #8]
    eefc:	e5943004 	ldr	r3, [r4, #4]
    ef00:	e3c39003 	bic	r9, r3, #3
    ef04:	e0493006 	sub	r3, r9, r6
    ef08:	e353000f 	cmp	r3, #15
    ef0c:	c3a02000 	movgt	r2, #0
    ef10:	d3a02001 	movle	r2, #1
    ef14:	e1590006 	cmp	r9, r6
    ef18:	33822001 	orrcc	r2, r2, #1
    ef1c:	e3520000 	cmp	r2, #0
    ef20:	0a000025 	beq	efbc <_malloc_r+0x374>
    ef24:	e59fa490 	ldr	sl, [pc, #1168]	; f3bc <_malloc_r+0x774>
    ef28:	e59f2490 	ldr	r2, [pc, #1168]	; f3c0 <_malloc_r+0x778>
    ef2c:	e59a3000 	ldr	r3, [sl]
    ef30:	e5922000 	ldr	r2, [r2]
    ef34:	e3730001 	cmn	r3, #1
    ef38:	e0862002 	add	r2, r6, r2
    ef3c:	12823a01 	addne	r3, r2, #4096	; 0x1000
    ef40:	1283300f 	addne	r3, r3, #15
    ef44:	13c32eff 	bicne	r2, r3, #4080	; 0xff0
    ef48:	02822010 	addeq	r2, r2, #16
    ef4c:	13c2200f 	bicne	r2, r2, #15
    ef50:	e1a01002 	mov	r1, r2
    ef54:	e1a00005 	mov	r0, r5
    ef58:	e58d2004 	str	r2, [sp, #4]
    ef5c:	eb0002c1 	bl	fa68 <_sbrk_r>
    ef60:	e3700001 	cmn	r0, #1
    ef64:	e1a0b000 	mov	fp, r0
    ef68:	e59d2004 	ldr	r2, [sp, #4]
    ef6c:	0a000003 	beq	ef80 <_malloc_r+0x338>
    ef70:	e0843009 	add	r3, r4, r9
    ef74:	e1540007 	cmp	r4, r7
    ef78:	11530000 	cmpne	r3, r0
    ef7c:	9a000084 	bls	f194 <_malloc_r+0x54c>
    ef80:	e5974008 	ldr	r4, [r7, #8]
    ef84:	e5943004 	ldr	r3, [r4, #4]
    ef88:	e3c33003 	bic	r3, r3, #3
    ef8c:	e1560003 	cmp	r6, r3
    ef90:	93a02000 	movls	r2, #0
    ef94:	83a02001 	movhi	r2, #1
    ef98:	e0433006 	sub	r3, r3, r6
    ef9c:	e353000f 	cmp	r3, #15
    efa0:	d3822001 	orrle	r2, r2, #1
    efa4:	e3520000 	cmp	r2, #0
    efa8:	0a000003 	beq	efbc <_malloc_r+0x374>
    efac:	e1a00005 	mov	r0, r5
    efb0:	eb000171 	bl	f57c <__malloc_unlock>
    efb4:	e3a04000 	mov	r4, #0
    efb8:	eaffffb4 	b	ee90 <_malloc_r+0x248>
    efbc:	e3862001 	orr	r2, r6, #1
    efc0:	e3833001 	orr	r3, r3, #1
    efc4:	e0846006 	add	r6, r4, r6
    efc8:	e5842004 	str	r2, [r4, #4]
    efcc:	e1a00005 	mov	r0, r5
    efd0:	e5876008 	str	r6, [r7, #8]
    efd4:	e2844008 	add	r4, r4, #8
    efd8:	e5863004 	str	r3, [r6, #4]
    efdc:	eb000166 	bl	f57c <__malloc_unlock>
    efe0:	e1a00004 	mov	r0, r4
    efe4:	e28dd00c 	add	sp, sp, #12
    efe8:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    efec:	e12fff1e 	bx	lr
    eff0:	e3530014 	cmp	r3, #20
    eff4:	9a000044 	bls	f10c <_malloc_r+0x4c4>
    eff8:	e3530054 	cmp	r3, #84	; 0x54
    effc:	8a0000a8 	bhi	f2a4 <_malloc_r+0x65c>
    f000:	e1a03626 	lsr	r3, r6, #12
    f004:	e283006f 	add	r0, r3, #111	; 0x6f
    f008:	e283c06e 	add	ip, r3, #110	; 0x6e
    f00c:	e1a01180 	lsl	r1, r0, #3
    f010:	eaffff23 	b	eca4 <_malloc_r+0x5c>
    f014:	e1a024a3 	lsr	r2, r3, #9
    f018:	e3520004 	cmp	r2, #4
    f01c:	9a00003e 	bls	f11c <_malloc_r+0x4d4>
    f020:	e3520014 	cmp	r2, #20
    f024:	8a0000b4 	bhi	f2fc <_malloc_r+0x6b4>
    f028:	e282805c 	add	r8, r2, #92	; 0x5c
    f02c:	e1a08188 	lsl	r8, r8, #3
    f030:	e282105b 	add	r1, r2, #91	; 0x5b
    f034:	e087e008 	add	lr, r7, r8
    f038:	e7972008 	ldr	r2, [r7, r8]
    f03c:	e24ee008 	sub	lr, lr, #8
    f040:	e15e0002 	cmp	lr, r2
    f044:	0a00009d 	beq	f2c0 <_malloc_r+0x678>
    f048:	e5921004 	ldr	r1, [r2, #4]
    f04c:	e3c11003 	bic	r1, r1, #3
    f050:	e1530001 	cmp	r3, r1
    f054:	2a000090 	bcs	f29c <_malloc_r+0x654>
    f058:	e5922008 	ldr	r2, [r2, #8]
    f05c:	e15e0002 	cmp	lr, r2
    f060:	1afffff8 	bne	f048 <_malloc_r+0x400>
    f064:	e59e200c 	ldr	r2, [lr, #12]
    f068:	e5973004 	ldr	r3, [r7, #4]
    f06c:	e584200c 	str	r2, [r4, #12]
    f070:	e584e008 	str	lr, [r4, #8]
    f074:	e5824008 	str	r4, [r2, #8]
    f078:	e58e400c 	str	r4, [lr, #12]
    f07c:	eaffff38 	b	ed64 <_malloc_r+0x11c>
    f080:	e386e001 	orr	lr, r6, #1
    f084:	e3821001 	orr	r1, r2, #1
    f088:	e0846006 	add	r6, r4, r6
    f08c:	e584e004 	str	lr, [r4, #4]
    f090:	e1a00005 	mov	r0, r5
    f094:	e5876014 	str	r6, [r7, #20]
    f098:	e5876010 	str	r6, [r7, #16]
    f09c:	e586c00c 	str	ip, [r6, #12]
    f0a0:	e9861002 	stmib	r6, {r1, ip}
    f0a4:	e7842003 	str	r2, [r4, r3]
    f0a8:	eb000133 	bl	f57c <__malloc_unlock>
    f0ac:	e2844008 	add	r4, r4, #8
    f0b0:	eaffff76 	b	ee90 <_malloc_r+0x248>
    f0b4:	e2844001 	add	r4, r4, #1
    f0b8:	e3140003 	tst	r4, #3
    f0bc:	e2811008 	add	r1, r1, #8
    f0c0:	1affff3a 	bne	edb0 <_malloc_r+0x168>
    f0c4:	ea00001d 	b	f140 <_malloc_r+0x4f8>
    f0c8:	e593400c 	ldr	r4, [r3, #12]
    f0cc:	e1530004 	cmp	r3, r4
    f0d0:	02800002 	addeq	r0, r0, #2
    f0d4:	0affff04 	beq	ecec <_malloc_r+0xa4>
    f0d8:	eaffff5f 	b	ee5c <_malloc_r+0x214>
    f0dc:	e1a04008 	mov	r4, r8
    f0e0:	e0883003 	add	r3, r8, r3
    f0e4:	e5932004 	ldr	r2, [r3, #4]
    f0e8:	e598100c 	ldr	r1, [r8, #12]
    f0ec:	e5b4c008 	ldr	ip, [r4, #8]!
    f0f0:	e3822001 	orr	r2, r2, #1
    f0f4:	e5832004 	str	r2, [r3, #4]
    f0f8:	e1a00005 	mov	r0, r5
    f0fc:	e58c100c 	str	r1, [ip, #12]
    f100:	e581c008 	str	ip, [r1, #8]
    f104:	eb00011c 	bl	f57c <__malloc_unlock>
    f108:	eaffff60 	b	ee90 <_malloc_r+0x248>
    f10c:	e283005c 	add	r0, r3, #92	; 0x5c
    f110:	e283c05b 	add	ip, r3, #91	; 0x5b
    f114:	e1a01180 	lsl	r1, r0, #3
    f118:	eafffee1 	b	eca4 <_malloc_r+0x5c>
    f11c:	e1a02323 	lsr	r2, r3, #6
    f120:	e2828039 	add	r8, r2, #57	; 0x39
    f124:	e1a08188 	lsl	r8, r8, #3
    f128:	e2821038 	add	r1, r2, #56	; 0x38
    f12c:	eaffffc0 	b	f034 <_malloc_r+0x3ec>
    f130:	e4193008 	ldr	r3, [r9], #-8
    f134:	e1590003 	cmp	r9, r3
    f138:	e2400001 	sub	r0, r0, #1
    f13c:	1a000097 	bne	f3a0 <_malloc_r+0x758>
    f140:	e3100003 	tst	r0, #3
    f144:	1afffff9 	bne	f130 <_malloc_r+0x4e8>
    f148:	e5973004 	ldr	r3, [r7, #4]
    f14c:	e1c3300e 	bic	r3, r3, lr
    f150:	e5873004 	str	r3, [r7, #4]
    f154:	e1b0e08e 	lsls	lr, lr, #1
    f158:	13a02001 	movne	r2, #1
    f15c:	03a02000 	moveq	r2, #0
    f160:	e15e0003 	cmp	lr, r3
    f164:	83a02000 	movhi	r2, #0
    f168:	92022001 	andls	r2, r2, #1
    f16c:	e3520000 	cmp	r2, #0
    f170:	0affff60 	beq	eef8 <_malloc_r+0x2b0>
    f174:	e11e0003 	tst	lr, r3
    f178:	e1a00004 	mov	r0, r4
    f17c:	1affff08 	bne	eda4 <_malloc_r+0x15c>
    f180:	e1a0e08e 	lsl	lr, lr, #1
    f184:	e11e0003 	tst	lr, r3
    f188:	e2800004 	add	r0, r0, #4
    f18c:	0afffffb 	beq	f180 <_malloc_r+0x538>
    f190:	eaffff03 	b	eda4 <_malloc_r+0x15c>
    f194:	e59f8228 	ldr	r8, [pc, #552]	; f3c4 <_malloc_r+0x77c>
    f198:	e5981000 	ldr	r1, [r8]
    f19c:	e1530000 	cmp	r3, r0
    f1a0:	e0821001 	add	r1, r2, r1
    f1a4:	e5881000 	str	r1, [r8]
    f1a8:	0a00005e 	beq	f328 <_malloc_r+0x6e0>
    f1ac:	e59a0000 	ldr	r0, [sl]
    f1b0:	e3700001 	cmn	r0, #1
    f1b4:	104b3003 	subne	r3, fp, r3
    f1b8:	10831001 	addne	r1, r3, r1
    f1bc:	058ab000 	streq	fp, [sl]
    f1c0:	15881000 	strne	r1, [r8]
    f1c4:	e21b1007 	ands	r1, fp, #7
    f1c8:	03a01a01 	moveq	r1, #4096	; 0x1000
    f1cc:	12613008 	rsbne	r3, r1, #8
    f1d0:	108bb003 	addne	fp, fp, r3
    f1d4:	e08b2002 	add	r2, fp, r2
    f1d8:	12611a01 	rsbne	r1, r1, #4096	; 0x1000
    f1dc:	e1a02a02 	lsl	r2, r2, #20
    f1e0:	12811008 	addne	r1, r1, #8
    f1e4:	e1a02a22 	lsr	r2, r2, #20
    f1e8:	e041a002 	sub	sl, r1, r2
    f1ec:	e1a0100a 	mov	r1, sl
    f1f0:	e1a00005 	mov	r0, r5
    f1f4:	eb00021b 	bl	fa68 <_sbrk_r>
    f1f8:	e3700001 	cmn	r0, #1
    f1fc:	03a0a000 	moveq	sl, #0
    f200:	03a03001 	moveq	r3, #1
    f204:	1040300b 	subne	r3, r0, fp
    f208:	e5981000 	ldr	r1, [r8]
    f20c:	1083300a 	addne	r3, r3, sl
    f210:	13833001 	orrne	r3, r3, #1
    f214:	e08a1001 	add	r1, sl, r1
    f218:	e1540007 	cmp	r4, r7
    f21c:	e587b008 	str	fp, [r7, #8]
    f220:	e5881000 	str	r1, [r8]
    f224:	e58b3004 	str	r3, [fp, #4]
    f228:	0a00000f 	beq	f26c <_malloc_r+0x624>
    f22c:	e359000f 	cmp	r9, #15
    f230:	93a03001 	movls	r3, #1
    f234:	958b3004 	strls	r3, [fp, #4]
    f238:	9affff5b 	bls	efac <_malloc_r+0x364>
    f23c:	e3a00005 	mov	r0, #5
    f240:	e5942004 	ldr	r2, [r4, #4]
    f244:	e249300c 	sub	r3, r9, #12
    f248:	e3c33007 	bic	r3, r3, #7
    f24c:	e2022001 	and	r2, r2, #1
    f250:	e1822003 	orr	r2, r2, r3
    f254:	e353000f 	cmp	r3, #15
    f258:	e0843003 	add	r3, r4, r3
    f25c:	e5842004 	str	r2, [r4, #4]
    f260:	e5830004 	str	r0, [r3, #4]
    f264:	e5830008 	str	r0, [r3, #8]
    f268:	8a000037 	bhi	f34c <_malloc_r+0x704>
    f26c:	e59f3154 	ldr	r3, [pc, #340]	; f3c8 <_malloc_r+0x780>
    f270:	e5932000 	ldr	r2, [r3]
    f274:	e1510002 	cmp	r1, r2
    f278:	e59f214c 	ldr	r2, [pc, #332]	; f3cc <_malloc_r+0x784>
    f27c:	85831000 	strhi	r1, [r3]
    f280:	e5974008 	ldr	r4, [r7, #8]
    f284:	e5923000 	ldr	r3, [r2]
    f288:	e1510003 	cmp	r1, r3
    f28c:	e5943004 	ldr	r3, [r4, #4]
    f290:	85821000 	strhi	r1, [r2]
    f294:	e3c33003 	bic	r3, r3, #3
    f298:	eaffff3b 	b	ef8c <_malloc_r+0x344>
    f29c:	e1a0e002 	mov	lr, r2
    f2a0:	eaffff6f 	b	f064 <_malloc_r+0x41c>
    f2a4:	e3530f55 	cmp	r3, #340	; 0x154
    f2a8:	8a00000b 	bhi	f2dc <_malloc_r+0x694>
    f2ac:	e1a037a6 	lsr	r3, r6, #15
    f2b0:	e2830078 	add	r0, r3, #120	; 0x78
    f2b4:	e283c077 	add	ip, r3, #119	; 0x77
    f2b8:	e1a01180 	lsl	r1, r0, #3
    f2bc:	eafffe78 	b	eca4 <_malloc_r+0x5c>
    f2c0:	e3a08001 	mov	r8, #1
    f2c4:	e5973004 	ldr	r3, [r7, #4]
    f2c8:	e1a02141 	asr	r2, r1, #2
    f2cc:	e1833218 	orr	r3, r3, r8, lsl r2
    f2d0:	e5873004 	str	r3, [r7, #4]
    f2d4:	e1a0200e 	mov	r2, lr
    f2d8:	eaffff63 	b	f06c <_malloc_r+0x424>
    f2dc:	e59f20ec 	ldr	r2, [pc, #236]	; f3d0 <_malloc_r+0x788>
    f2e0:	e1530002 	cmp	r3, r2
    f2e4:	8a00000b 	bhi	f318 <_malloc_r+0x6d0>
    f2e8:	e1a03926 	lsr	r3, r6, #18
    f2ec:	e283007d 	add	r0, r3, #125	; 0x7d
    f2f0:	e283c07c 	add	ip, r3, #124	; 0x7c
    f2f4:	e1a01180 	lsl	r1, r0, #3
    f2f8:	eafffe69 	b	eca4 <_malloc_r+0x5c>
    f2fc:	e3520054 	cmp	r2, #84	; 0x54
    f300:	8a000016 	bhi	f360 <_malloc_r+0x718>
    f304:	e1a02623 	lsr	r2, r3, #12
    f308:	e282806f 	add	r8, r2, #111	; 0x6f
    f30c:	e1a08188 	lsl	r8, r8, #3
    f310:	e282106e 	add	r1, r2, #110	; 0x6e
    f314:	eaffff46 	b	f034 <_malloc_r+0x3ec>
    f318:	e3a01ffe 	mov	r1, #1016	; 0x3f8
    f31c:	e3a0007f 	mov	r0, #127	; 0x7f
    f320:	e3a0c07e 	mov	ip, #126	; 0x7e
    f324:	eafffe5e 	b	eca4 <_malloc_r+0x5c>
    f328:	e1a00a03 	lsl	r0, r3, #20
    f32c:	e1a00a20 	lsr	r0, r0, #20
    f330:	e3500000 	cmp	r0, #0
    f334:	1affff9c 	bne	f1ac <_malloc_r+0x564>
    f338:	e0893002 	add	r3, r9, r2
    f33c:	e5972008 	ldr	r2, [r7, #8]
    f340:	e3833001 	orr	r3, r3, #1
    f344:	e5823004 	str	r3, [r2, #4]
    f348:	eaffffc7 	b	f26c <_malloc_r+0x624>
    f34c:	e2841008 	add	r1, r4, #8
    f350:	e1a00005 	mov	r0, r5
    f354:	ebfffb5e 	bl	e0d4 <_free_r>
    f358:	e5981000 	ldr	r1, [r8]
    f35c:	eaffffc2 	b	f26c <_malloc_r+0x624>
    f360:	e3520f55 	cmp	r2, #340	; 0x154
    f364:	8a000004 	bhi	f37c <_malloc_r+0x734>
    f368:	e1a027a3 	lsr	r2, r3, #15
    f36c:	e2828078 	add	r8, r2, #120	; 0x78
    f370:	e1a08188 	lsl	r8, r8, #3
    f374:	e2821077 	add	r1, r2, #119	; 0x77
    f378:	eaffff2d 	b	f034 <_malloc_r+0x3ec>
    f37c:	e59f104c 	ldr	r1, [pc, #76]	; f3d0 <_malloc_r+0x788>
    f380:	e1520001 	cmp	r2, r1
    f384:	91a02923 	lsrls	r2, r3, #18
    f388:	9282807d 	addls	r8, r2, #125	; 0x7d
    f38c:	91a08188 	lslls	r8, r8, #3
    f390:	9282107c 	addls	r1, r2, #124	; 0x7c
    f394:	83a08ffe 	movhi	r8, #1016	; 0x3f8
    f398:	83a0107e 	movhi	r1, #126	; 0x7e
    f39c:	eaffff24 	b	f034 <_malloc_r+0x3ec>
    f3a0:	e5973004 	ldr	r3, [r7, #4]
    f3a4:	eaffff6a 	b	f154 <_malloc_r+0x50c>
    f3a8:	e1a001a6 	lsr	r0, r6, #3
    f3ac:	e2863008 	add	r3, r6, #8
    f3b0:	eafffea3 	b	ee44 <_malloc_r+0x1fc>
    f3b4:	00011624 	.word	0x00011624
    f3b8:	0001162c 	.word	0x0001162c
    f3bc:	00011a2c 	.word	0x00011a2c
    f3c0:	00011ab0 	.word	0x00011ab0
    f3c4:	00011a80 	.word	0x00011a80
    f3c8:	00011aa8 	.word	0x00011aa8
    f3cc:	00011aac 	.word	0x00011aac
    f3d0:	00000554 	.word	0x00000554

0000f3d4 <_mbtowc_r>:
    f3d4:	e59fc024 	ldr	ip, [pc, #36]	; f400 <_mbtowc_r+0x2c>
    f3d8:	e59cc000 	ldr	ip, [ip]
    f3dc:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
    f3e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    f3e4:	e59fe018 	ldr	lr, [pc, #24]	; f404 <_mbtowc_r+0x30>
    f3e8:	e35c0000 	cmp	ip, #0
    f3ec:	01a0c00e 	moveq	ip, lr
    f3f0:	e59ce0e4 	ldr	lr, [ip, #228]	; 0xe4
    f3f4:	e1a0c00e 	mov	ip, lr
    f3f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    f3fc:	e12fff1c 	bx	ip
    f400:	0001108c 	.word	0x0001108c
    f404:	000114b8 	.word	0x000114b8

0000f408 <__ascii_mbtowc>:
    f408:	e3510000 	cmp	r1, #0
    f40c:	e24dd008 	sub	sp, sp, #8
    f410:	028d1004 	addeq	r1, sp, #4
    f414:	e3520000 	cmp	r2, #0
    f418:	0a000008 	beq	f440 <__ascii_mbtowc+0x38>
    f41c:	e3530000 	cmp	r3, #0
    f420:	0a000009 	beq	f44c <__ascii_mbtowc+0x44>
    f424:	e5d23000 	ldrb	r3, [r2]
    f428:	e5813000 	str	r3, [r1]
    f42c:	e5d22000 	ldrb	r2, [r2]
    f430:	e2920000 	adds	r0, r2, #0
    f434:	13a00001 	movne	r0, #1
    f438:	e28dd008 	add	sp, sp, #8
    f43c:	e12fff1e 	bx	lr
    f440:	e1a00002 	mov	r0, r2
    f444:	e28dd008 	add	sp, sp, #8
    f448:	e12fff1e 	bx	lr
    f44c:	e3e00001 	mvn	r0, #1
    f450:	eafffff8 	b	f438 <__ascii_mbtowc+0x30>

0000f454 <memchr>:
    f454:	e3100003 	tst	r0, #3
    f458:	e92d4070 	push	{r4, r5, r6, lr}
    f45c:	e201e0ff 	and	lr, r1, #255	; 0xff
    f460:	0a000038 	beq	f548 <memchr+0xf4>
    f464:	e3520000 	cmp	r2, #0
    f468:	e242c001 	sub	ip, r2, #1
    f46c:	0a00001e 	beq	f4ec <memchr+0x98>
    f470:	e5d03000 	ldrb	r3, [r0]
    f474:	e153000e 	cmp	r3, lr
    f478:	0a00001c 	beq	f4f0 <memchr+0x9c>
    f47c:	e2803001 	add	r3, r0, #1
    f480:	ea000005 	b	f49c <memchr+0x48>
    f484:	e25cc001 	subs	ip, ip, #1
    f488:	3a000017 	bcc	f4ec <memchr+0x98>
    f48c:	e5d02000 	ldrb	r2, [r0]
    f490:	e152000e 	cmp	r2, lr
    f494:	e2833001 	add	r3, r3, #1
    f498:	0a000014 	beq	f4f0 <memchr+0x9c>
    f49c:	e3130003 	tst	r3, #3
    f4a0:	e1a00003 	mov	r0, r3
    f4a4:	1afffff6 	bne	f484 <memchr+0x30>
    f4a8:	e35c0003 	cmp	ip, #3
    f4ac:	8a000011 	bhi	f4f8 <memchr+0xa4>
    f4b0:	e35c0000 	cmp	ip, #0
    f4b4:	0a000025 	beq	f550 <memchr+0xfc>
    f4b8:	e5d03000 	ldrb	r3, [r0]
    f4bc:	e153000e 	cmp	r3, lr
    f4c0:	0a00000a 	beq	f4f0 <memchr+0x9c>
    f4c4:	e080c00c 	add	ip, r0, ip
    f4c8:	e2803001 	add	r3, r0, #1
    f4cc:	ea000003 	b	f4e0 <memchr+0x8c>
    f4d0:	e5d02000 	ldrb	r2, [r0]
    f4d4:	e152000e 	cmp	r2, lr
    f4d8:	e2833001 	add	r3, r3, #1
    f4dc:	0a000003 	beq	f4f0 <memchr+0x9c>
    f4e0:	e15c0003 	cmp	ip, r3
    f4e4:	e1a00003 	mov	r0, r3
    f4e8:	1afffff8 	bne	f4d0 <memchr+0x7c>
    f4ec:	e3a00000 	mov	r0, #0
    f4f0:	e8bd4070 	pop	{r4, r5, r6, lr}
    f4f4:	e12fff1e 	bx	lr
    f4f8:	e59f4058 	ldr	r4, [pc, #88]	; f558 <memchr+0x104>
    f4fc:	e0044401 	and	r4, r4, r1, lsl #8
    f500:	e184400e 	orr	r4, r4, lr
    f504:	e59f6050 	ldr	r6, [pc, #80]	; f55c <memchr+0x108>
    f508:	e59f5050 	ldr	r5, [pc, #80]	; f560 <memchr+0x10c>
    f50c:	e1844804 	orr	r4, r4, r4, lsl #16
    f510:	e5903000 	ldr	r3, [r0]
    f514:	e0233004 	eor	r3, r3, r4
    f518:	e0832006 	add	r2, r3, r6
    f51c:	e1c23003 	bic	r3, r2, r3
    f520:	e1130005 	tst	r3, r5
    f524:	e1a01000 	mov	r1, r0
    f528:	e2800004 	add	r0, r0, #4
    f52c:	1a000003 	bne	f540 <memchr+0xec>
    f530:	e24cc004 	sub	ip, ip, #4
    f534:	e35c0003 	cmp	ip, #3
    f538:	8afffff4 	bhi	f510 <memchr+0xbc>
    f53c:	eaffffdb 	b	f4b0 <memchr+0x5c>
    f540:	e1a00001 	mov	r0, r1
    f544:	eaffffdb 	b	f4b8 <memchr+0x64>
    f548:	e1a0c002 	mov	ip, r2
    f54c:	eaffffd5 	b	f4a8 <memchr+0x54>
    f550:	e1a0000c 	mov	r0, ip
    f554:	eaffffe5 	b	f4f0 <memchr+0x9c>
    f558:	0000ffff 	.word	0x0000ffff
    f55c:	fefefeff 	.word	0xfefefeff
    f560:	80808080 	.word	0x80808080

0000f564 <__malloc_lock>:
    f564:	e92d4010 	push	{r4, lr}
    f568:	e59f0008 	ldr	r0, [pc, #8]	; f578 <__malloc_lock+0x14>
    f56c:	ebfffd46 	bl	ea8c <__retarget_lock_acquire_recursive>
    f570:	e8bd4010 	pop	{r4, lr}
    f574:	e12fff1e 	bx	lr
    f578:	00011ac8 	.word	0x00011ac8

0000f57c <__malloc_unlock>:
    f57c:	e92d4010 	push	{r4, lr}
    f580:	e59f0008 	ldr	r0, [pc, #8]	; f590 <__malloc_unlock+0x14>
    f584:	ebfffd46 	bl	eaa4 <__retarget_lock_release_recursive>
    f588:	e8bd4010 	pop	{r4, lr}
    f58c:	e12fff1e 	bx	lr
    f590:	00011ac8 	.word	0x00011ac8

0000f594 <_realloc_r>:
    f594:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    f598:	e2517000 	subs	r7, r1, #0
    f59c:	e24dd00c 	sub	sp, sp, #12
    f5a0:	e1a09002 	mov	r9, r2
    f5a4:	0a00007f 	beq	f7a8 <_realloc_r+0x214>
    f5a8:	e289400b 	add	r4, r9, #11
    f5ac:	e1a08000 	mov	r8, r0
    f5b0:	ebffffeb 	bl	f564 <__malloc_lock>
    f5b4:	e3540016 	cmp	r4, #22
    f5b8:	93a02010 	movls	r2, #16
    f5bc:	93a03000 	movls	r3, #0
    f5c0:	91a04002 	movls	r4, r2
    f5c4:	83c44007 	bichi	r4, r4, #7
    f5c8:	81a03fa4 	lsrhi	r3, r4, #31
    f5cc:	81a02004 	movhi	r2, r4
    f5d0:	e1540009 	cmp	r4, r9
    f5d4:	33833001 	orrcc	r3, r3, #1
    f5d8:	e3530000 	cmp	r3, #0
    f5dc:	13a0300c 	movne	r3, #12
    f5e0:	e5171004 	ldr	r1, [r7, #-4]
    f5e4:	e2475008 	sub	r5, r7, #8
    f5e8:	e3c16003 	bic	r6, r1, #3
    f5ec:	13a09000 	movne	r9, #0
    f5f0:	15883000 	strne	r3, [r8]
    f5f4:	1a00000f 	bne	f638 <_realloc_r+0xa4>
    f5f8:	e1560002 	cmp	r6, r2
    f5fc:	ba000011 	blt	f648 <_realloc_r+0xb4>
    f600:	e1a09007 	mov	r9, r7
    f604:	e0463004 	sub	r3, r6, r4
    f608:	e353000f 	cmp	r3, #15
    f60c:	8a000056 	bhi	f76c <_realloc_r+0x1d8>
    f610:	e5953004 	ldr	r3, [r5, #4]
    f614:	e2033001 	and	r3, r3, #1
    f618:	e1833006 	orr	r3, r3, r6
    f61c:	e5853004 	str	r3, [r5, #4]
    f620:	e0855006 	add	r5, r5, r6
    f624:	e5953004 	ldr	r3, [r5, #4]
    f628:	e3833001 	orr	r3, r3, #1
    f62c:	e5853004 	str	r3, [r5, #4]
    f630:	e1a00008 	mov	r0, r8
    f634:	ebffffd0 	bl	f57c <__malloc_unlock>
    f638:	e1a00009 	mov	r0, r9
    f63c:	e28dd00c 	add	sp, sp, #12
    f640:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    f644:	e12fff1e 	bx	lr
    f648:	e59fb414 	ldr	fp, [pc, #1044]	; fa64 <_realloc_r+0x4d0>
    f64c:	e59b3008 	ldr	r3, [fp, #8]
    f650:	e085c006 	add	ip, r5, r6
    f654:	e15c0003 	cmp	ip, r3
    f658:	0a0000a5 	beq	f8f4 <_realloc_r+0x360>
    f65c:	e59c0004 	ldr	r0, [ip, #4]
    f660:	e3c03001 	bic	r3, r0, #1
    f664:	e08c3003 	add	r3, ip, r3
    f668:	e5933004 	ldr	r3, [r3, #4]
    f66c:	e3130001 	tst	r3, #1
    f670:	0a000032 	beq	f740 <_realloc_r+0x1ac>
    f674:	e3110001 	tst	r1, #1
    f678:	0a000088 	beq	f8a0 <_realloc_r+0x30c>
    f67c:	e1a01009 	mov	r1, r9
    f680:	e1a00008 	mov	r0, r8
    f684:	ebfffd6f 	bl	ec48 <_malloc_r>
    f688:	e2509000 	subs	r9, r0, #0
    f68c:	0affffe7 	beq	f630 <_realloc_r+0x9c>
    f690:	e5173004 	ldr	r3, [r7, #-4]
    f694:	e3c33001 	bic	r3, r3, #1
    f698:	e0853003 	add	r3, r5, r3
    f69c:	e2492008 	sub	r2, r9, #8
    f6a0:	e1520003 	cmp	r2, r3
    f6a4:	0a0000e3 	beq	fa38 <_realloc_r+0x4a4>
    f6a8:	e2462004 	sub	r2, r6, #4
    f6ac:	e3520024 	cmp	r2, #36	; 0x24
    f6b0:	8a0000dd 	bhi	fa2c <_realloc_r+0x498>
    f6b4:	e3520013 	cmp	r2, #19
    f6b8:	91a03009 	movls	r3, r9
    f6bc:	91a02007 	movls	r2, r7
    f6c0:	9a000014 	bls	f718 <_realloc_r+0x184>
    f6c4:	e5973000 	ldr	r3, [r7]
    f6c8:	e5893000 	str	r3, [r9]
    f6cc:	e5973004 	ldr	r3, [r7, #4]
    f6d0:	e352001b 	cmp	r2, #27
    f6d4:	e5893004 	str	r3, [r9, #4]
    f6d8:	92872008 	addls	r2, r7, #8
    f6dc:	92893008 	addls	r3, r9, #8
    f6e0:	9a00000c 	bls	f718 <_realloc_r+0x184>
    f6e4:	e5973008 	ldr	r3, [r7, #8]
    f6e8:	e5893008 	str	r3, [r9, #8]
    f6ec:	e597300c 	ldr	r3, [r7, #12]
    f6f0:	e589300c 	str	r3, [r9, #12]
    f6f4:	e3520024 	cmp	r2, #36	; 0x24
    f6f8:	05973010 	ldreq	r3, [r7, #16]
    f6fc:	05893010 	streq	r3, [r9, #16]
    f700:	05972014 	ldreq	r2, [r7, #20]
    f704:	12893010 	addne	r3, r9, #16
    f708:	05892014 	streq	r2, [r9, #20]
    f70c:	12872010 	addne	r2, r7, #16
    f710:	02893018 	addeq	r3, r9, #24
    f714:	02872018 	addeq	r2, r7, #24
    f718:	e5921000 	ldr	r1, [r2]
    f71c:	e5831000 	str	r1, [r3]
    f720:	e5921004 	ldr	r1, [r2, #4]
    f724:	e5831004 	str	r1, [r3, #4]
    f728:	e5922008 	ldr	r2, [r2, #8]
    f72c:	e5832008 	str	r2, [r3, #8]
    f730:	e1a01007 	mov	r1, r7
    f734:	e1a00008 	mov	r0, r8
    f738:	ebfffa65 	bl	e0d4 <_free_r>
    f73c:	eaffffbb 	b	f630 <_realloc_r+0x9c>
    f740:	e3c00003 	bic	r0, r0, #3
    f744:	e0863000 	add	r3, r6, r0
    f748:	e1530002 	cmp	r3, r2
    f74c:	ba00001c 	blt	f7c4 <_realloc_r+0x230>
    f750:	e28c1008 	add	r1, ip, #8
    f754:	e8910006 	ldm	r1, {r1, r2}
    f758:	e1a09007 	mov	r9, r7
    f75c:	e581200c 	str	r2, [r1, #12]
    f760:	e1a06003 	mov	r6, r3
    f764:	e5821008 	str	r1, [r2, #8]
    f768:	eaffffa5 	b	f604 <_realloc_r+0x70>
    f76c:	e5952004 	ldr	r2, [r5, #4]
    f770:	e2022001 	and	r2, r2, #1
    f774:	e0851004 	add	r1, r5, r4
    f778:	e3833001 	orr	r3, r3, #1
    f77c:	e1822004 	orr	r2, r2, r4
    f780:	e5852004 	str	r2, [r5, #4]
    f784:	e5813004 	str	r3, [r1, #4]
    f788:	e0855006 	add	r5, r5, r6
    f78c:	e5953004 	ldr	r3, [r5, #4]
    f790:	e3833001 	orr	r3, r3, #1
    f794:	e2811008 	add	r1, r1, #8
    f798:	e5853004 	str	r3, [r5, #4]
    f79c:	e1a00008 	mov	r0, r8
    f7a0:	ebfffa4b 	bl	e0d4 <_free_r>
    f7a4:	eaffffa1 	b	f630 <_realloc_r+0x9c>
    f7a8:	e1a01002 	mov	r1, r2
    f7ac:	ebfffd25 	bl	ec48 <_malloc_r>
    f7b0:	e1a09000 	mov	r9, r0
    f7b4:	e1a00009 	mov	r0, r9
    f7b8:	e28dd00c 	add	sp, sp, #12
    f7bc:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    f7c0:	e12fff1e 	bx	lr
    f7c4:	e3110001 	tst	r1, #1
    f7c8:	1affffab 	bne	f67c <_realloc_r+0xe8>
    f7cc:	e517a008 	ldr	sl, [r7, #-8]
    f7d0:	e045a00a 	sub	sl, r5, sl
    f7d4:	e59a1004 	ldr	r1, [sl, #4]
    f7d8:	e3c11003 	bic	r1, r1, #3
    f7dc:	e0810000 	add	r0, r1, r0
    f7e0:	e0803006 	add	r3, r0, r6
    f7e4:	e1530002 	cmp	r3, r2
    f7e8:	ba000030 	blt	f8b0 <_realloc_r+0x31c>
    f7ec:	e1a0900a 	mov	r9, sl
    f7f0:	e28c1008 	add	r1, ip, #8
    f7f4:	e8910006 	ldm	r1, {r1, r2}
    f7f8:	e581200c 	str	r2, [r1, #12]
    f7fc:	e5821008 	str	r1, [r2, #8]
    f800:	e59a100c 	ldr	r1, [sl, #12]
    f804:	e5b90008 	ldr	r0, [r9, #8]!
    f808:	e2462004 	sub	r2, r6, #4
    f80c:	e3520024 	cmp	r2, #36	; 0x24
    f810:	e580100c 	str	r1, [r0, #12]
    f814:	e5810008 	str	r0, [r1, #8]
    f818:	8a00002f 	bhi	f8dc <_realloc_r+0x348>
    f81c:	e3520013 	cmp	r2, #19
    f820:	91a02009 	movls	r2, r9
    f824:	9a000014 	bls	f87c <_realloc_r+0x2e8>
    f828:	e5971000 	ldr	r1, [r7]
    f82c:	e58a1008 	str	r1, [sl, #8]
    f830:	e5971004 	ldr	r1, [r7, #4]
    f834:	e352001b 	cmp	r2, #27
    f838:	e58a100c 	str	r1, [sl, #12]
    f83c:	92877008 	addls	r7, r7, #8
    f840:	928a2010 	addls	r2, sl, #16
    f844:	9a00000c 	bls	f87c <_realloc_r+0x2e8>
    f848:	e5971008 	ldr	r1, [r7, #8]
    f84c:	e58a1010 	str	r1, [sl, #16]
    f850:	e597100c 	ldr	r1, [r7, #12]
    f854:	e58a1014 	str	r1, [sl, #20]
    f858:	e3520024 	cmp	r2, #36	; 0x24
    f85c:	05972010 	ldreq	r2, [r7, #16]
    f860:	058a2018 	streq	r2, [sl, #24]
    f864:	05972014 	ldreq	r2, [r7, #20]
    f868:	12877010 	addne	r7, r7, #16
    f86c:	058a201c 	streq	r2, [sl, #28]
    f870:	128a2018 	addne	r2, sl, #24
    f874:	02877018 	addeq	r7, r7, #24
    f878:	028a2020 	addeq	r2, sl, #32
    f87c:	e5971000 	ldr	r1, [r7]
    f880:	e5821000 	str	r1, [r2]
    f884:	e5971004 	ldr	r1, [r7, #4]
    f888:	e5821004 	str	r1, [r2, #4]
    f88c:	e5971008 	ldr	r1, [r7, #8]
    f890:	e1a06003 	mov	r6, r3
    f894:	e1a0500a 	mov	r5, sl
    f898:	e5821008 	str	r1, [r2, #8]
    f89c:	eaffff58 	b	f604 <_realloc_r+0x70>
    f8a0:	e517a008 	ldr	sl, [r7, #-8]
    f8a4:	e045a00a 	sub	sl, r5, sl
    f8a8:	e59a1004 	ldr	r1, [sl, #4]
    f8ac:	e3c11003 	bic	r1, r1, #3
    f8b0:	e0863001 	add	r3, r6, r1
    f8b4:	e1530002 	cmp	r3, r2
    f8b8:	baffff6f 	blt	f67c <_realloc_r+0xe8>
    f8bc:	e1a0900a 	mov	r9, sl
    f8c0:	e59a100c 	ldr	r1, [sl, #12]
    f8c4:	e5b90008 	ldr	r0, [r9, #8]!
    f8c8:	e2462004 	sub	r2, r6, #4
    f8cc:	e3520024 	cmp	r2, #36	; 0x24
    f8d0:	e580100c 	str	r1, [r0, #12]
    f8d4:	e5810008 	str	r0, [r1, #8]
    f8d8:	9affffcf 	bls	f81c <_realloc_r+0x288>
    f8dc:	e1a01007 	mov	r1, r7
    f8e0:	e1a00009 	mov	r0, r9
    f8e4:	e1a06003 	mov	r6, r3
    f8e8:	e1a0500a 	mov	r5, sl
    f8ec:	ebfff138 	bl	bdd4 <memmove>
    f8f0:	eaffff43 	b	f604 <_realloc_r+0x70>
    f8f4:	e59c3004 	ldr	r3, [ip, #4]
    f8f8:	e3c33003 	bic	r3, r3, #3
    f8fc:	e0833006 	add	r3, r3, r6
    f900:	e2840010 	add	r0, r4, #16
    f904:	e1530000 	cmp	r3, r0
    f908:	aa00003a 	bge	f9f8 <_realloc_r+0x464>
    f90c:	e3110001 	tst	r1, #1
    f910:	1affff59 	bne	f67c <_realloc_r+0xe8>
    f914:	e517a008 	ldr	sl, [r7, #-8]
    f918:	e045a00a 	sub	sl, r5, sl
    f91c:	e59a1004 	ldr	r1, [sl, #4]
    f920:	e3c11003 	bic	r1, r1, #3
    f924:	e0813003 	add	r3, r1, r3
    f928:	e1500003 	cmp	r0, r3
    f92c:	caffffdf 	bgt	f8b0 <_realloc_r+0x31c>
    f930:	e1a0900a 	mov	r9, sl
    f934:	e59a100c 	ldr	r1, [sl, #12]
    f938:	e5b90008 	ldr	r0, [r9, #8]!
    f93c:	e2462004 	sub	r2, r6, #4
    f940:	e3520024 	cmp	r2, #36	; 0x24
    f944:	e580100c 	str	r1, [r0, #12]
    f948:	e5810008 	str	r0, [r1, #8]
    f94c:	8a00003e 	bhi	fa4c <_realloc_r+0x4b8>
    f950:	e3520013 	cmp	r2, #19
    f954:	91a02009 	movls	r2, r9
    f958:	9a000014 	bls	f9b0 <_realloc_r+0x41c>
    f95c:	e5971000 	ldr	r1, [r7]
    f960:	e58a1008 	str	r1, [sl, #8]
    f964:	e5971004 	ldr	r1, [r7, #4]
    f968:	e352001b 	cmp	r2, #27
    f96c:	e58a100c 	str	r1, [sl, #12]
    f970:	92877008 	addls	r7, r7, #8
    f974:	928a2010 	addls	r2, sl, #16
    f978:	9a00000c 	bls	f9b0 <_realloc_r+0x41c>
    f97c:	e5971008 	ldr	r1, [r7, #8]
    f980:	e58a1010 	str	r1, [sl, #16]
    f984:	e597100c 	ldr	r1, [r7, #12]
    f988:	e58a1014 	str	r1, [sl, #20]
    f98c:	e3520024 	cmp	r2, #36	; 0x24
    f990:	05972010 	ldreq	r2, [r7, #16]
    f994:	058a2018 	streq	r2, [sl, #24]
    f998:	05972014 	ldreq	r2, [r7, #20]
    f99c:	12877010 	addne	r7, r7, #16
    f9a0:	058a201c 	streq	r2, [sl, #28]
    f9a4:	128a2018 	addne	r2, sl, #24
    f9a8:	02877018 	addeq	r7, r7, #24
    f9ac:	028a2020 	addeq	r2, sl, #32
    f9b0:	e5971000 	ldr	r1, [r7]
    f9b4:	e5821000 	str	r1, [r2]
    f9b8:	e5971004 	ldr	r1, [r7, #4]
    f9bc:	e5821004 	str	r1, [r2, #4]
    f9c0:	e5971008 	ldr	r1, [r7, #8]
    f9c4:	e5821008 	str	r1, [r2, #8]
    f9c8:	e0433004 	sub	r3, r3, r4
    f9cc:	e08a2004 	add	r2, sl, r4
    f9d0:	e3833001 	orr	r3, r3, #1
    f9d4:	e58b2008 	str	r2, [fp, #8]
    f9d8:	e5823004 	str	r3, [r2, #4]
    f9dc:	e59a3004 	ldr	r3, [sl, #4]
    f9e0:	e2033001 	and	r3, r3, #1
    f9e4:	e1834004 	orr	r4, r3, r4
    f9e8:	e1a00008 	mov	r0, r8
    f9ec:	e58a4004 	str	r4, [sl, #4]
    f9f0:	ebfffee1 	bl	f57c <__malloc_unlock>
    f9f4:	eaffff0f 	b	f638 <_realloc_r+0xa4>
    f9f8:	e0433004 	sub	r3, r3, r4
    f9fc:	e0855004 	add	r5, r5, r4
    fa00:	e3833001 	orr	r3, r3, #1
    fa04:	e58b5008 	str	r5, [fp, #8]
    fa08:	e5853004 	str	r3, [r5, #4]
    fa0c:	e5173004 	ldr	r3, [r7, #-4]
    fa10:	e2033001 	and	r3, r3, #1
    fa14:	e1834004 	orr	r4, r3, r4
    fa18:	e1a00008 	mov	r0, r8
    fa1c:	e5074004 	str	r4, [r7, #-4]
    fa20:	ebfffed5 	bl	f57c <__malloc_unlock>
    fa24:	e1a09007 	mov	r9, r7
    fa28:	eaffff02 	b	f638 <_realloc_r+0xa4>
    fa2c:	e1a01007 	mov	r1, r7
    fa30:	ebfff0e7 	bl	bdd4 <memmove>
    fa34:	eaffff3d 	b	f730 <_realloc_r+0x19c>
    fa38:	e5193004 	ldr	r3, [r9, #-4]
    fa3c:	e3c33003 	bic	r3, r3, #3
    fa40:	e0866003 	add	r6, r6, r3
    fa44:	e1a09007 	mov	r9, r7
    fa48:	eafffeed 	b	f604 <_realloc_r+0x70>
    fa4c:	e1a01007 	mov	r1, r7
    fa50:	e1a00009 	mov	r0, r9
    fa54:	e58d3004 	str	r3, [sp, #4]
    fa58:	ebfff0dd 	bl	bdd4 <memmove>
    fa5c:	e59d3004 	ldr	r3, [sp, #4]
    fa60:	eaffffd8 	b	f9c8 <_realloc_r+0x434>
    fa64:	00011624 	.word	0x00011624

0000fa68 <_sbrk_r>:
    fa68:	e3a03000 	mov	r3, #0
    fa6c:	e92d4070 	push	{r4, r5, r6, lr}
    fa70:	e59f4030 	ldr	r4, [pc, #48]	; faa8 <_sbrk_r+0x40>
    fa74:	e1a05000 	mov	r5, r0
    fa78:	e1a00001 	mov	r0, r1
    fa7c:	e5843000 	str	r3, [r4]
    fa80:	eb0003d8 	bl	109e8 <_sbrk>
    fa84:	e3700001 	cmn	r0, #1
    fa88:	0a000001 	beq	fa94 <_sbrk_r+0x2c>
    fa8c:	e8bd4070 	pop	{r4, r5, r6, lr}
    fa90:	e12fff1e 	bx	lr
    fa94:	e5943000 	ldr	r3, [r4]
    fa98:	e3530000 	cmp	r3, #0
    fa9c:	15853000 	strne	r3, [r5]
    faa0:	e8bd4070 	pop	{r4, r5, r6, lr}
    faa4:	e12fff1e 	bx	lr
    faa8:	00011adc 	.word	0x00011adc

0000faac <_init_signal_r.part.0>:
    faac:	e92d4010 	push	{r4, lr}
    fab0:	e3a01080 	mov	r1, #128	; 0x80
    fab4:	e1a04000 	mov	r4, r0
    fab8:	ebfffc62 	bl	ec48 <_malloc_r>
    fabc:	e3500000 	cmp	r0, #0
    fac0:	e58402dc 	str	r0, [r4, #732]	; 0x2dc
    fac4:	0a000008 	beq	faec <_init_signal_r.part.0+0x40>
    fac8:	e3a02000 	mov	r2, #0
    facc:	e2403004 	sub	r3, r0, #4
    fad0:	e280007c 	add	r0, r0, #124	; 0x7c
    fad4:	e5a32004 	str	r2, [r3, #4]!
    fad8:	e1530000 	cmp	r3, r0
    fadc:	1afffffc 	bne	fad4 <_init_signal_r.part.0+0x28>
    fae0:	e3a00000 	mov	r0, #0
    fae4:	e8bd4010 	pop	{r4, lr}
    fae8:	e12fff1e 	bx	lr
    faec:	e3e00000 	mvn	r0, #0
    faf0:	eafffffb 	b	fae4 <_init_signal_r.part.0+0x38>

0000faf4 <_init_signal_r>:
    faf4:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
    faf8:	e3530000 	cmp	r3, #0
    fafc:	0a000001 	beq	fb08 <_init_signal_r+0x14>
    fb00:	e3a00000 	mov	r0, #0
    fb04:	e12fff1e 	bx	lr
    fb08:	eaffffe7 	b	faac <_init_signal_r.part.0>

0000fb0c <_signal_r>:
    fb0c:	e351001f 	cmp	r1, #31
    fb10:	e1a03000 	mov	r3, r0
    fb14:	8a000005 	bhi	fb30 <_signal_r+0x24>
    fb18:	e590c2dc 	ldr	ip, [r0, #732]	; 0x2dc
    fb1c:	e35c0000 	cmp	ip, #0
    fb20:	0a000006 	beq	fb40 <_signal_r+0x34>
    fb24:	e79c0101 	ldr	r0, [ip, r1, lsl #2]
    fb28:	e78c2101 	str	r2, [ip, r1, lsl #2]
    fb2c:	e12fff1e 	bx	lr
    fb30:	e3a02016 	mov	r2, #22
    fb34:	e3e00000 	mvn	r0, #0
    fb38:	e5832000 	str	r2, [r3]
    fb3c:	e12fff1e 	bx	lr
    fb40:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    fb44:	e24dd014 	sub	sp, sp, #20
    fb48:	e98d000e 	stmib	sp, {r1, r2, r3}
    fb4c:	ebffffd6 	bl	faac <_init_signal_r.part.0>
    fb50:	e3500000 	cmp	r0, #0
    fb54:	13e00000 	mvnne	r0, #0
    fb58:	059d300c 	ldreq	r3, [sp, #12]
    fb5c:	099d0006 	ldmibeq	sp, {r1, r2}
    fb60:	0593c2dc 	ldreq	ip, [r3, #732]	; 0x2dc
    fb64:	079c0101 	ldreq	r0, [ip, r1, lsl #2]
    fb68:	078c2101 	streq	r2, [ip, r1, lsl #2]
    fb6c:	e28dd014 	add	sp, sp, #20
    fb70:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    fb74:	e12fff1e 	bx	lr

0000fb78 <_raise_r>:
    fb78:	e351001f 	cmp	r1, #31
    fb7c:	e92d4020 	push	{r5, lr}
    fb80:	83a03016 	movhi	r3, #22
    fb84:	e1a05000 	mov	r5, r0
    fb88:	e24dd008 	sub	sp, sp, #8
    fb8c:	83e00000 	mvnhi	r0, #0
    fb90:	85853000 	strhi	r3, [r5]
    fb94:	8a000012 	bhi	fbe4 <_raise_r+0x6c>
    fb98:	e59522dc 	ldr	r2, [r5, #732]	; 0x2dc
    fb9c:	e3520000 	cmp	r2, #0
    fba0:	0a000014 	beq	fbf8 <_raise_r+0x80>
    fba4:	e7923101 	ldr	r3, [r2, r1, lsl #2]
    fba8:	e3530000 	cmp	r3, #0
    fbac:	0a000011 	beq	fbf8 <_raise_r+0x80>
    fbb0:	e3530001 	cmp	r3, #1
    fbb4:	0a00000d 	beq	fbf0 <_raise_r+0x78>
    fbb8:	e3730001 	cmn	r3, #1
    fbbc:	03a03016 	moveq	r3, #22
    fbc0:	03a00001 	moveq	r0, #1
    fbc4:	05853000 	streq	r3, [r5]
    fbc8:	0a000005 	beq	fbe4 <_raise_r+0x6c>
    fbcc:	e3a05000 	mov	r5, #0
    fbd0:	e1a00001 	mov	r0, r1
    fbd4:	e7825101 	str	r5, [r2, r1, lsl #2]
    fbd8:	e1a0e00f 	mov	lr, pc
    fbdc:	e12fff13 	bx	r3
    fbe0:	e1a00005 	mov	r0, r5
    fbe4:	e28dd008 	add	sp, sp, #8
    fbe8:	e8bd4020 	pop	{r5, lr}
    fbec:	e12fff1e 	bx	lr
    fbf0:	e3a00000 	mov	r0, #0
    fbf4:	eafffffa 	b	fbe4 <_raise_r+0x6c>
    fbf8:	e1a00005 	mov	r0, r5
    fbfc:	e58d1004 	str	r1, [sp, #4]
    fc00:	eb000056 	bl	fd60 <_getpid_r>
    fc04:	e59d1004 	ldr	r1, [sp, #4]
    fc08:	e1a02001 	mov	r2, r1
    fc0c:	e1a01000 	mov	r1, r0
    fc10:	e1a00005 	mov	r0, r5
    fc14:	eb000040 	bl	fd1c <_kill_r>
    fc18:	eafffff1 	b	fbe4 <_raise_r+0x6c>

0000fc1c <__sigtramp_r>:
    fc1c:	e351001f 	cmp	r1, #31
    fc20:	8a000022 	bhi	fcb0 <__sigtramp_r+0x94>
    fc24:	e92d4020 	push	{r5, lr}
    fc28:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
    fc2c:	e3530000 	cmp	r3, #0
    fc30:	e24dd008 	sub	sp, sp, #8
    fc34:	e1a05000 	mov	r5, r0
    fc38:	0a000014 	beq	fc90 <__sigtramp_r+0x74>
    fc3c:	e7932101 	ldr	r2, [r3, r1, lsl #2]
    fc40:	e3520000 	cmp	r2, #0
    fc44:	e0833101 	add	r3, r3, r1, lsl #2
    fc48:	0a00000e 	beq	fc88 <__sigtramp_r+0x6c>
    fc4c:	e3720001 	cmn	r2, #1
    fc50:	03a00002 	moveq	r0, #2
    fc54:	0a000008 	beq	fc7c <__sigtramp_r+0x60>
    fc58:	e3520001 	cmp	r2, #1
    fc5c:	03a00003 	moveq	r0, #3
    fc60:	0a000005 	beq	fc7c <__sigtramp_r+0x60>
    fc64:	e3a05000 	mov	r5, #0
    fc68:	e1a00001 	mov	r0, r1
    fc6c:	e5835000 	str	r5, [r3]
    fc70:	e1a0e00f 	mov	lr, pc
    fc74:	e12fff12 	bx	r2
    fc78:	e1a00005 	mov	r0, r5
    fc7c:	e28dd008 	add	sp, sp, #8
    fc80:	e8bd4020 	pop	{r5, lr}
    fc84:	e12fff1e 	bx	lr
    fc88:	e3a00001 	mov	r0, #1
    fc8c:	eafffffa 	b	fc7c <__sigtramp_r+0x60>
    fc90:	e58d1004 	str	r1, [sp, #4]
    fc94:	ebffff84 	bl	faac <_init_signal_r.part.0>
    fc98:	e3500000 	cmp	r0, #0
    fc9c:	059532dc 	ldreq	r3, [r5, #732]	; 0x2dc
    fca0:	059d1004 	ldreq	r1, [sp, #4]
    fca4:	0affffe4 	beq	fc3c <__sigtramp_r+0x20>
    fca8:	e3e00000 	mvn	r0, #0
    fcac:	eafffff2 	b	fc7c <__sigtramp_r+0x60>
    fcb0:	e3e00000 	mvn	r0, #0
    fcb4:	e12fff1e 	bx	lr

0000fcb8 <raise>:
    fcb8:	e59f3008 	ldr	r3, [pc, #8]	; fcc8 <raise+0x10>
    fcbc:	e1a01000 	mov	r1, r0
    fcc0:	e5930000 	ldr	r0, [r3]
    fcc4:	eaffffab 	b	fb78 <_raise_r>
    fcc8:	0001108c 	.word	0x0001108c

0000fccc <signal>:
    fccc:	e59f300c 	ldr	r3, [pc, #12]	; fce0 <signal+0x14>
    fcd0:	e1a02001 	mov	r2, r1
    fcd4:	e1a01000 	mov	r1, r0
    fcd8:	e5930000 	ldr	r0, [r3]
    fcdc:	eaffff8a 	b	fb0c <_signal_r>
    fce0:	0001108c 	.word	0x0001108c

0000fce4 <_init_signal>:
    fce4:	e59f3018 	ldr	r3, [pc, #24]	; fd04 <_init_signal+0x20>
    fce8:	e5930000 	ldr	r0, [r3]
    fcec:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
    fcf0:	e3530000 	cmp	r3, #0
    fcf4:	0a000001 	beq	fd00 <_init_signal+0x1c>
    fcf8:	e3a00000 	mov	r0, #0
    fcfc:	e12fff1e 	bx	lr
    fd00:	eaffff69 	b	faac <_init_signal_r.part.0>
    fd04:	0001108c 	.word	0x0001108c

0000fd08 <__sigtramp>:
    fd08:	e59f3008 	ldr	r3, [pc, #8]	; fd18 <__sigtramp+0x10>
    fd0c:	e1a01000 	mov	r1, r0
    fd10:	e5930000 	ldr	r0, [r3]
    fd14:	eaffffc0 	b	fc1c <__sigtramp_r>
    fd18:	0001108c 	.word	0x0001108c

0000fd1c <_kill_r>:
    fd1c:	e1a0c001 	mov	ip, r1
    fd20:	e3a03000 	mov	r3, #0
    fd24:	e92d4070 	push	{r4, r5, r6, lr}
    fd28:	e59f402c 	ldr	r4, [pc, #44]	; fd5c <_kill_r+0x40>
    fd2c:	e1a05000 	mov	r5, r0
    fd30:	e1a01002 	mov	r1, r2
    fd34:	e1a0000c 	mov	r0, ip
    fd38:	e5843000 	str	r3, [r4]
    fd3c:	eb000317 	bl	109a0 <_kill>
    fd40:	e3700001 	cmn	r0, #1
    fd44:	1a000002 	bne	fd54 <_kill_r+0x38>
    fd48:	e5943000 	ldr	r3, [r4]
    fd4c:	e3530000 	cmp	r3, #0
    fd50:	15853000 	strne	r3, [r5]
    fd54:	e8bd4070 	pop	{r4, r5, r6, lr}
    fd58:	e12fff1e 	bx	lr
    fd5c:	00011adc 	.word	0x00011adc

0000fd60 <_getpid_r>:
    fd60:	e92d4010 	push	{r4, lr}
    fd64:	eb000301 	bl	10970 <_getpid>
    fd68:	e8bd4010 	pop	{r4, lr}
    fd6c:	e12fff1e 	bx	lr

0000fd70 <__sread>:
    fd70:	e92d4010 	push	{r4, lr}
    fd74:	e1a04001 	mov	r4, r1
    fd78:	e1d110fe 	ldrsh	r1, [r1, #14]
    fd7c:	eb00021f 	bl	10600 <_read_r>
    fd80:	e3500000 	cmp	r0, #0
    fd84:	a5943050 	ldrge	r3, [r4, #80]	; 0x50
    fd88:	b1d430bc 	ldrhlt	r3, [r4, #12]
    fd8c:	a0833000 	addge	r3, r3, r0
    fd90:	b3c33a01 	biclt	r3, r3, #4096	; 0x1000
    fd94:	a5843050 	strge	r3, [r4, #80]	; 0x50
    fd98:	b1c430bc 	strhlt	r3, [r4, #12]
    fd9c:	e8bd4010 	pop	{r4, lr}
    fda0:	e12fff1e 	bx	lr

0000fda4 <__seofread>:
    fda4:	e3a00000 	mov	r0, #0
    fda8:	e12fff1e 	bx	lr

0000fdac <__swrite>:
    fdac:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    fdb0:	e1a04001 	mov	r4, r1
    fdb4:	e1d110fc 	ldrsh	r1, [r1, #12]
    fdb8:	e3110c01 	tst	r1, #256	; 0x100
    fdbc:	e1a06002 	mov	r6, r2
    fdc0:	e1a07003 	mov	r7, r3
    fdc4:	e1a05000 	mov	r5, r0
    fdc8:	0a000004 	beq	fde0 <__swrite+0x34>
    fdcc:	e1d410fe 	ldrsh	r1, [r4, #14]
    fdd0:	e3a03002 	mov	r3, #2
    fdd4:	e3a02000 	mov	r2, #0
    fdd8:	eb0001f6 	bl	105b8 <_lseek_r>
    fddc:	e1d410fc 	ldrsh	r1, [r4, #12]
    fde0:	e3c11a01 	bic	r1, r1, #4096	; 0x1000
    fde4:	e1c410bc 	strh	r1, [r4, #12]
    fde8:	e1a03007 	mov	r3, r7
    fdec:	e1a02006 	mov	r2, r6
    fdf0:	e1d410fe 	ldrsh	r1, [r4, #14]
    fdf4:	e1a00005 	mov	r0, r5
    fdf8:	eb000150 	bl	10340 <_write_r>
    fdfc:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    fe00:	e12fff1e 	bx	lr

0000fe04 <__sseek>:
    fe04:	e92d4010 	push	{r4, lr}
    fe08:	e1a04001 	mov	r4, r1
    fe0c:	e1d110fe 	ldrsh	r1, [r1, #14]
    fe10:	eb0001e8 	bl	105b8 <_lseek_r>
    fe14:	e1d430bc 	ldrh	r3, [r4, #12]
    fe18:	e3700001 	cmn	r0, #1
    fe1c:	03c33a01 	biceq	r3, r3, #4096	; 0x1000
    fe20:	13833a01 	orrne	r3, r3, #4096	; 0x1000
    fe24:	15840050 	strne	r0, [r4, #80]	; 0x50
    fe28:	e1c430bc 	strh	r3, [r4, #12]
    fe2c:	e8bd4010 	pop	{r4, lr}
    fe30:	e12fff1e 	bx	lr

0000fe34 <__sclose>:
    fe34:	e92d4010 	push	{r4, lr}
    fe38:	e1d110fe 	ldrsh	r1, [r1, #14]
    fe3c:	eb000151 	bl	10388 <_close_r>
    fe40:	e8bd4010 	pop	{r4, lr}
    fe44:	e12fff1e 	bx	lr

0000fe48 <strcmp>:
    fe48:	e020c001 	eor	ip, r0, r1
    fe4c:	e31c0003 	tst	ip, #3
    fe50:	1a000021 	bne	fedc <strcmp+0x94>
    fe54:	e210c003 	ands	ip, r0, #3
    fe58:	e3c00003 	bic	r0, r0, #3
    fe5c:	e3c11003 	bic	r1, r1, #3
    fe60:	e4902004 	ldr	r2, [r0], #4
    fe64:	04913004 	ldreq	r3, [r1], #4
    fe68:	0a000006 	beq	fe88 <strcmp+0x40>
    fe6c:	e22cc003 	eor	ip, ip, #3
    fe70:	e3e034ff 	mvn	r3, #-16777216	; 0xff000000
    fe74:	e1a0c18c 	lsl	ip, ip, #3
    fe78:	e1a0cc33 	lsr	ip, r3, ip
    fe7c:	e4913004 	ldr	r3, [r1], #4
    fe80:	e182200c 	orr	r2, r2, ip
    fe84:	e183300c 	orr	r3, r3, ip
    fe88:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    fe8c:	e3a04001 	mov	r4, #1
    fe90:	e1844404 	orr	r4, r4, r4, lsl #8
    fe94:	e1844804 	orr	r4, r4, r4, lsl #16
    fe98:	e042c004 	sub	ip, r2, r4
    fe9c:	e1520003 	cmp	r2, r3
    fea0:	01ccc002 	biceq	ip, ip, r2
    fea4:	011c0384 	tsteq	ip, r4, lsl #7
    fea8:	04902004 	ldreq	r2, [r0], #4
    feac:	04913004 	ldreq	r3, [r1], #4
    feb0:	0afffff8 	beq	fe98 <strcmp+0x50>
    feb4:	e1a00c02 	lsl	r0, r2, #24
    feb8:	e1a02422 	lsr	r2, r2, #8
    febc:	e3500001 	cmp	r0, #1
    fec0:	21500c03 	cmpcs	r0, r3, lsl #24
    fec4:	01a03423 	lsreq	r3, r3, #8
    fec8:	0afffff9 	beq	feb4 <strcmp+0x6c>
    fecc:	e20330ff 	and	r3, r3, #255	; 0xff
    fed0:	e0630c20 	rsb	r0, r3, r0, lsr #24
    fed4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    fed8:	e12fff1e 	bx	lr
    fedc:	e3100003 	tst	r0, #3
    fee0:	0a000006 	beq	ff00 <strcmp+0xb8>
    fee4:	e4d02001 	ldrb	r2, [r0], #1
    fee8:	e4d13001 	ldrb	r3, [r1], #1
    feec:	e3520001 	cmp	r2, #1
    fef0:	21520003 	cmpcs	r2, r3
    fef4:	0afffff8 	beq	fedc <strcmp+0x94>
    fef8:	e0420003 	sub	r0, r2, r3
    fefc:	e12fff1e 	bx	lr
    ff00:	e92d0030 	push	{r4, r5}
    ff04:	e3a04001 	mov	r4, #1
    ff08:	e1844404 	orr	r4, r4, r4, lsl #8
    ff0c:	e1844804 	orr	r4, r4, r4, lsl #16
    ff10:	e4902004 	ldr	r2, [r0], #4
    ff14:	e2015003 	and	r5, r1, #3
    ff18:	e3c11003 	bic	r1, r1, #3
    ff1c:	e4913004 	ldr	r3, [r1], #4
    ff20:	e3550002 	cmp	r5, #2
    ff24:	0a000017 	beq	ff88 <strcmp+0x140>
    ff28:	8a00002d 	bhi	ffe4 <strcmp+0x19c>
    ff2c:	e3c254ff 	bic	r5, r2, #-16777216	; 0xff000000
    ff30:	e1550423 	cmp	r5, r3, lsr #8
    ff34:	e042c004 	sub	ip, r2, r4
    ff38:	e1ccc002 	bic	ip, ip, r2
    ff3c:	1a000007 	bne	ff60 <strcmp+0x118>
    ff40:	e01cc384 	ands	ip, ip, r4, lsl #7
    ff44:	04913004 	ldreq	r3, [r1], #4
    ff48:	1a000006 	bne	ff68 <strcmp+0x120>
    ff4c:	e0255002 	eor	r5, r5, r2
    ff50:	e1550c03 	cmp	r5, r3, lsl #24
    ff54:	1a000008 	bne	ff7c <strcmp+0x134>
    ff58:	e4902004 	ldr	r2, [r0], #4
    ff5c:	eafffff2 	b	ff2c <strcmp+0xe4>
    ff60:	e1a03423 	lsr	r3, r3, #8
    ff64:	ea000036 	b	10044 <strcmp+0x1fc>
    ff68:	e3dcc4ff 	bics	ip, ip, #-16777216	; 0xff000000
    ff6c:	1a000031 	bne	10038 <strcmp+0x1f0>
    ff70:	e5d13000 	ldrb	r3, [r1]
    ff74:	e1a05c22 	lsr	r5, r2, #24
    ff78:	ea000031 	b	10044 <strcmp+0x1fc>
    ff7c:	e1a05c22 	lsr	r5, r2, #24
    ff80:	e20330ff 	and	r3, r3, #255	; 0xff
    ff84:	ea00002e 	b	10044 <strcmp+0x1fc>
    ff88:	e1a05802 	lsl	r5, r2, #16
    ff8c:	e042c004 	sub	ip, r2, r4
    ff90:	e1a05825 	lsr	r5, r5, #16
    ff94:	e1ccc002 	bic	ip, ip, r2
    ff98:	e1550823 	cmp	r5, r3, lsr #16
    ff9c:	1a00000e 	bne	ffdc <strcmp+0x194>
    ffa0:	e01cc384 	ands	ip, ip, r4, lsl #7
    ffa4:	04913004 	ldreq	r3, [r1], #4
    ffa8:	1a000004 	bne	ffc0 <strcmp+0x178>
    ffac:	e0255002 	eor	r5, r5, r2
    ffb0:	e1550803 	cmp	r5, r3, lsl #16
    ffb4:	1a000006 	bne	ffd4 <strcmp+0x18c>
    ffb8:	e4902004 	ldr	r2, [r0], #4
    ffbc:	eafffff1 	b	ff88 <strcmp+0x140>
    ffc0:	e1b0c80c 	lsls	ip, ip, #16
    ffc4:	1a00001b 	bne	10038 <strcmp+0x1f0>
    ffc8:	e1d130b0 	ldrh	r3, [r1]
    ffcc:	e1a05822 	lsr	r5, r2, #16
    ffd0:	ea00001b 	b	10044 <strcmp+0x1fc>
    ffd4:	e1a03803 	lsl	r3, r3, #16
    ffd8:	e1a05822 	lsr	r5, r2, #16
    ffdc:	e1a03823 	lsr	r3, r3, #16
    ffe0:	ea000017 	b	10044 <strcmp+0x1fc>
    ffe4:	e20250ff 	and	r5, r2, #255	; 0xff
    ffe8:	e1550c23 	cmp	r5, r3, lsr #24
    ffec:	e042c004 	sub	ip, r2, r4
    fff0:	e1ccc002 	bic	ip, ip, r2
    fff4:	1a000007 	bne	10018 <strcmp+0x1d0>
    fff8:	e01cc384 	ands	ip, ip, r4, lsl #7
    fffc:	04913004 	ldreq	r3, [r1], #4
   10000:	1a000006 	bne	10020 <strcmp+0x1d8>
   10004:	e0255002 	eor	r5, r5, r2
   10008:	e1550403 	cmp	r5, r3, lsl #8
   1000c:	1a000006 	bne	1002c <strcmp+0x1e4>
   10010:	e4902004 	ldr	r2, [r0], #4
   10014:	eafffff2 	b	ffe4 <strcmp+0x19c>
   10018:	e1a03c23 	lsr	r3, r3, #24
   1001c:	ea000008 	b	10044 <strcmp+0x1fc>
   10020:	e31200ff 	tst	r2, #255	; 0xff
   10024:	0a000003 	beq	10038 <strcmp+0x1f0>
   10028:	e4913004 	ldr	r3, [r1], #4
   1002c:	e1a05422 	lsr	r5, r2, #8
   10030:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
   10034:	ea000002 	b	10044 <strcmp+0x1fc>
   10038:	e3a00000 	mov	r0, #0
   1003c:	e8bd0030 	pop	{r4, r5}
   10040:	e12fff1e 	bx	lr
   10044:	e20520ff 	and	r2, r5, #255	; 0xff
   10048:	e20300ff 	and	r0, r3, #255	; 0xff
   1004c:	e3500001 	cmp	r0, #1
   10050:	21500002 	cmpcs	r0, r2
   10054:	01a05425 	lsreq	r5, r5, #8
   10058:	01a03423 	lsreq	r3, r3, #8
   1005c:	0afffff8 	beq	10044 <strcmp+0x1fc>
   10060:	e0420000 	sub	r0, r2, r0
   10064:	e8bd0030 	pop	{r4, r5}
   10068:	e12fff1e 	bx	lr

0001006c <__swbuf_r>:
   1006c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   10070:	e2506000 	subs	r6, r0, #0
   10074:	e1a05001 	mov	r5, r1
   10078:	e1a04002 	mov	r4, r2
   1007c:	0a000002 	beq	1008c <__swbuf_r+0x20>
   10080:	e5963038 	ldr	r3, [r6, #56]	; 0x38
   10084:	e3530000 	cmp	r3, #0
   10088:	0a000042 	beq	10198 <__swbuf_r+0x12c>
   1008c:	e1d410fc 	ldrsh	r1, [r4, #12]
   10090:	e5940018 	ldr	r0, [r4, #24]
   10094:	e1a03801 	lsl	r3, r1, #16
   10098:	e3130702 	tst	r3, #524288	; 0x80000
   1009c:	e1a02823 	lsr	r2, r3, #16
   100a0:	e5840008 	str	r0, [r4, #8]
   100a4:	0a000022 	beq	10134 <__swbuf_r+0xc8>
   100a8:	e5943010 	ldr	r3, [r4, #16]
   100ac:	e3530000 	cmp	r3, #0
   100b0:	0a00001f 	beq	10134 <__swbuf_r+0xc8>
   100b4:	e3120a02 	tst	r2, #8192	; 0x2000
   100b8:	05942064 	ldreq	r2, [r4, #100]	; 0x64
   100bc:	03c22a02 	biceq	r2, r2, #8192	; 0x2000
   100c0:	03811a02 	orreq	r1, r1, #8192	; 0x2000
   100c4:	05842064 	streq	r2, [r4, #100]	; 0x64
   100c8:	e5942000 	ldr	r2, [r4]
   100cc:	01c410bc 	strheq	r1, [r4, #12]
   100d0:	e5941014 	ldr	r1, [r4, #20]
   100d4:	e0423003 	sub	r3, r2, r3
   100d8:	e20550ff 	and	r5, r5, #255	; 0xff
   100dc:	e1530001 	cmp	r3, r1
   100e0:	e1a07005 	mov	r7, r5
   100e4:	b2833001 	addlt	r3, r3, #1
   100e8:	aa000022 	bge	10178 <__swbuf_r+0x10c>
   100ec:	e5941008 	ldr	r1, [r4, #8]
   100f0:	e2820001 	add	r0, r2, #1
   100f4:	e2411001 	sub	r1, r1, #1
   100f8:	e5841008 	str	r1, [r4, #8]
   100fc:	e5840000 	str	r0, [r4]
   10100:	e5c25000 	strb	r5, [r2]
   10104:	e5942014 	ldr	r2, [r4, #20]
   10108:	e1520003 	cmp	r2, r3
   1010c:	0a000012 	beq	1015c <__swbuf_r+0xf0>
   10110:	e1d430bc 	ldrh	r3, [r4, #12]
   10114:	e355000a 	cmp	r5, #10
   10118:	13a05000 	movne	r5, #0
   1011c:	02035001 	andeq	r5, r3, #1
   10120:	e3550000 	cmp	r5, #0
   10124:	1a00000c 	bne	1015c <__swbuf_r+0xf0>
   10128:	e1a00007 	mov	r0, r7
   1012c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   10130:	e12fff1e 	bx	lr
   10134:	e1a01004 	mov	r1, r4
   10138:	e1a00006 	mov	r0, r6
   1013c:	ebfff501 	bl	d548 <__swsetup_r>
   10140:	e3500000 	cmp	r0, #0
   10144:	1a000009 	bne	10170 <__swbuf_r+0x104>
   10148:	e1d410fc 	ldrsh	r1, [r4, #12]
   1014c:	e1a02801 	lsl	r2, r1, #16
   10150:	e5943010 	ldr	r3, [r4, #16]
   10154:	e1a02822 	lsr	r2, r2, #16
   10158:	eaffffd5 	b	100b4 <__swbuf_r+0x48>
   1015c:	e1a01004 	mov	r1, r4
   10160:	e1a00006 	mov	r0, r6
   10164:	ebfff5e4 	bl	d8fc <_fflush_r>
   10168:	e3500000 	cmp	r0, #0
   1016c:	0affffed 	beq	10128 <__swbuf_r+0xbc>
   10170:	e3e07000 	mvn	r7, #0
   10174:	eaffffeb 	b	10128 <__swbuf_r+0xbc>
   10178:	e1a01004 	mov	r1, r4
   1017c:	e1a00006 	mov	r0, r6
   10180:	ebfff5dd 	bl	d8fc <_fflush_r>
   10184:	e3500000 	cmp	r0, #0
   10188:	1afffff8 	bne	10170 <__swbuf_r+0x104>
   1018c:	e3a03001 	mov	r3, #1
   10190:	e5942000 	ldr	r2, [r4]
   10194:	eaffffd4 	b	100ec <__swbuf_r+0x80>
   10198:	ebfff66c 	bl	db50 <__sinit>
   1019c:	eaffffba 	b	1008c <__swbuf_r+0x20>

000101a0 <__swbuf>:
   101a0:	e59f300c 	ldr	r3, [pc, #12]	; 101b4 <__swbuf+0x14>
   101a4:	e1a02001 	mov	r2, r1
   101a8:	e1a01000 	mov	r1, r0
   101ac:	e5930000 	ldr	r0, [r3]
   101b0:	eaffffad 	b	1006c <__swbuf_r>
   101b4:	0001108c 	.word	0x0001108c

000101b8 <_wcrtomb_r>:
   101b8:	e92d4070 	push	{r4, r5, r6, lr}
   101bc:	e251c000 	subs	ip, r1, #0
   101c0:	e24dd010 	sub	sp, sp, #16
   101c4:	e1a05000 	mov	r5, r0
   101c8:	e1a06003 	mov	r6, r3
   101cc:	0a000010 	beq	10214 <_wcrtomb_r+0x5c>
   101d0:	e59fc06c 	ldr	ip, [pc, #108]	; 10244 <_wcrtomb_r+0x8c>
   101d4:	e59cc000 	ldr	ip, [ip]
   101d8:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
   101dc:	e59fe064 	ldr	lr, [pc, #100]	; 10248 <_wcrtomb_r+0x90>
   101e0:	e35c0000 	cmp	ip, #0
   101e4:	01a0c00e 	moveq	ip, lr
   101e8:	e59c40e0 	ldr	r4, [ip, #224]	; 0xe0
   101ec:	e1a0e00f 	mov	lr, pc
   101f0:	e12fff14 	bx	r4
   101f4:	e3700001 	cmn	r0, #1
   101f8:	03a02000 	moveq	r2, #0
   101fc:	03a0308a 	moveq	r3, #138	; 0x8a
   10200:	05862000 	streq	r2, [r6]
   10204:	05853000 	streq	r3, [r5]
   10208:	e28dd010 	add	sp, sp, #16
   1020c:	e8bd4070 	pop	{r4, r5, r6, lr}
   10210:	e12fff1e 	bx	lr
   10214:	e59f2028 	ldr	r2, [pc, #40]	; 10244 <_wcrtomb_r+0x8c>
   10218:	e5921000 	ldr	r1, [r2]
   1021c:	e5911034 	ldr	r1, [r1, #52]	; 0x34
   10220:	e59f2020 	ldr	r2, [pc, #32]	; 10248 <_wcrtomb_r+0x90>
   10224:	e3510000 	cmp	r1, #0
   10228:	01a01002 	moveq	r1, r2
   1022c:	e1a0200c 	mov	r2, ip
   10230:	e59140e0 	ldr	r4, [r1, #224]	; 0xe0
   10234:	e28d1004 	add	r1, sp, #4
   10238:	e1a0e00f 	mov	lr, pc
   1023c:	e12fff14 	bx	r4
   10240:	eaffffeb 	b	101f4 <_wcrtomb_r+0x3c>
   10244:	0001108c 	.word	0x0001108c
   10248:	000114b8 	.word	0x000114b8

0001024c <wcrtomb>:
   1024c:	e92d4070 	push	{r4, r5, r6, lr}
   10250:	e59f3084 	ldr	r3, [pc, #132]	; 102dc <wcrtomb+0x90>
   10254:	e5934000 	ldr	r4, [r3]
   10258:	e3500000 	cmp	r0, #0
   1025c:	e1a05002 	mov	r5, r2
   10260:	e24dd010 	sub	sp, sp, #16
   10264:	e5943034 	ldr	r3, [r4, #52]	; 0x34
   10268:	e59f2070 	ldr	r2, [pc, #112]	; 102e0 <wcrtomb+0x94>
   1026c:	0a000010 	beq	102b4 <wcrtomb+0x68>
   10270:	e3530000 	cmp	r3, #0
   10274:	01a03002 	moveq	r3, r2
   10278:	e1a02001 	mov	r2, r1
   1027c:	e59360e0 	ldr	r6, [r3, #224]	; 0xe0
   10280:	e1a01000 	mov	r1, r0
   10284:	e1a03005 	mov	r3, r5
   10288:	e1a00004 	mov	r0, r4
   1028c:	e1a0e00f 	mov	lr, pc
   10290:	e12fff16 	bx	r6
   10294:	e3700001 	cmn	r0, #1
   10298:	03a02000 	moveq	r2, #0
   1029c:	03a0308a 	moveq	r3, #138	; 0x8a
   102a0:	05852000 	streq	r2, [r5]
   102a4:	05843000 	streq	r3, [r4]
   102a8:	e28dd010 	add	sp, sp, #16
   102ac:	e8bd4070 	pop	{r4, r5, r6, lr}
   102b0:	e12fff1e 	bx	lr
   102b4:	e3530000 	cmp	r3, #0
   102b8:	01a03002 	moveq	r3, r2
   102bc:	e28d1004 	add	r1, sp, #4
   102c0:	e1a02000 	mov	r2, r0
   102c4:	e59360e0 	ldr	r6, [r3, #224]	; 0xe0
   102c8:	e1a00004 	mov	r0, r4
   102cc:	e1a03005 	mov	r3, r5
   102d0:	e1a0e00f 	mov	lr, pc
   102d4:	e12fff16 	bx	r6
   102d8:	eaffffed 	b	10294 <wcrtomb+0x48>
   102dc:	0001108c 	.word	0x0001108c
   102e0:	000114b8 	.word	0x000114b8

000102e4 <_wctomb_r>:
   102e4:	e59fc024 	ldr	ip, [pc, #36]	; 10310 <_wctomb_r+0x2c>
   102e8:	e59cc000 	ldr	ip, [ip]
   102ec:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
   102f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   102f4:	e59fe018 	ldr	lr, [pc, #24]	; 10314 <_wctomb_r+0x30>
   102f8:	e35c0000 	cmp	ip, #0
   102fc:	01a0c00e 	moveq	ip, lr
   10300:	e59ce0e0 	ldr	lr, [ip, #224]	; 0xe0
   10304:	e1a0c00e 	mov	ip, lr
   10308:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
   1030c:	e12fff1c 	bx	ip
   10310:	0001108c 	.word	0x0001108c
   10314:	000114b8 	.word	0x000114b8

00010318 <__ascii_wctomb>:
   10318:	e3510000 	cmp	r1, #0
   1031c:	0a000005 	beq	10338 <__ascii_wctomb+0x20>
   10320:	e35200ff 	cmp	r2, #255	; 0xff
   10324:	83a0308a 	movhi	r3, #138	; 0x8a
   10328:	95c12000 	strbls	r2, [r1]
   1032c:	83e01000 	mvnhi	r1, #0
   10330:	93a01001 	movls	r1, #1
   10334:	85803000 	strhi	r3, [r0]
   10338:	e1a00001 	mov	r0, r1
   1033c:	e12fff1e 	bx	lr

00010340 <_write_r>:
   10340:	e92d4070 	push	{r4, r5, r6, lr}
   10344:	e1a0e001 	mov	lr, r1
   10348:	e3a0c000 	mov	ip, #0
   1034c:	e59f4030 	ldr	r4, [pc, #48]	; 10384 <_write_r+0x44>
   10350:	e1a01002 	mov	r1, r2
   10354:	e1a05000 	mov	r5, r0
   10358:	e1a02003 	mov	r2, r3
   1035c:	e1a0000e 	mov	r0, lr
   10360:	e584c000 	str	ip, [r4]
   10364:	eb0001aa 	bl	10a14 <_write>
   10368:	e3700001 	cmn	r0, #1
   1036c:	1a000002 	bne	1037c <_write_r+0x3c>
   10370:	e5943000 	ldr	r3, [r4]
   10374:	e3530000 	cmp	r3, #0
   10378:	15853000 	strne	r3, [r5]
   1037c:	e8bd4070 	pop	{r4, r5, r6, lr}
   10380:	e12fff1e 	bx	lr
   10384:	00011adc 	.word	0x00011adc

00010388 <_close_r>:
   10388:	e3a03000 	mov	r3, #0
   1038c:	e92d4070 	push	{r4, r5, r6, lr}
   10390:	e59f4028 	ldr	r4, [pc, #40]	; 103c0 <_close_r+0x38>
   10394:	e1a05000 	mov	r5, r0
   10398:	e1a00001 	mov	r0, r1
   1039c:	e5843000 	str	r3, [r4]
   103a0:	eb000166 	bl	10940 <_close>
   103a4:	e3700001 	cmn	r0, #1
   103a8:	1a000002 	bne	103b8 <_close_r+0x30>
   103ac:	e5943000 	ldr	r3, [r4]
   103b0:	e3530000 	cmp	r3, #0
   103b4:	15853000 	strne	r3, [r5]
   103b8:	e8bd4070 	pop	{r4, r5, r6, lr}
   103bc:	e12fff1e 	bx	lr
   103c0:	00011adc 	.word	0x00011adc

000103c4 <_fclose_r>:
   103c4:	e92d4070 	push	{r4, r5, r6, lr}
   103c8:	e2514000 	subs	r4, r1, #0
   103cc:	0a00000b 	beq	10400 <_fclose_r+0x3c>
   103d0:	e3500000 	cmp	r0, #0
   103d4:	e1a06000 	mov	r6, r0
   103d8:	0a000002 	beq	103e8 <_fclose_r+0x24>
   103dc:	e5903038 	ldr	r3, [r0, #56]	; 0x38
   103e0:	e3530000 	cmp	r3, #0
   103e4:	0a000038 	beq	104cc <_fclose_r+0x108>
   103e8:	e5943064 	ldr	r3, [r4, #100]	; 0x64
   103ec:	e3130001 	tst	r3, #1
   103f0:	0a000006 	beq	10410 <_fclose_r+0x4c>
   103f4:	e1d430fc 	ldrsh	r3, [r4, #12]
   103f8:	e3530000 	cmp	r3, #0
   103fc:	1a000006 	bne	1041c <_fclose_r+0x58>
   10400:	e3a05000 	mov	r5, #0
   10404:	e1a00005 	mov	r0, r5
   10408:	e8bd4070 	pop	{r4, r5, r6, lr}
   1040c:	e12fff1e 	bx	lr
   10410:	e1d430bc 	ldrh	r3, [r4, #12]
   10414:	e3130c02 	tst	r3, #512	; 0x200
   10418:	0a000034 	beq	104f0 <_fclose_r+0x12c>
   1041c:	e1a01004 	mov	r1, r4
   10420:	e1a00006 	mov	r0, r6
   10424:	ebfff4a5 	bl	d6c0 <__sflush_r>
   10428:	e594302c 	ldr	r3, [r4, #44]	; 0x2c
   1042c:	e3530000 	cmp	r3, #0
   10430:	e1a05000 	mov	r5, r0
   10434:	0a000005 	beq	10450 <_fclose_r+0x8c>
   10438:	e594101c 	ldr	r1, [r4, #28]
   1043c:	e1a00006 	mov	r0, r6
   10440:	e1a0e00f 	mov	lr, pc
   10444:	e12fff13 	bx	r3
   10448:	e3500000 	cmp	r0, #0
   1044c:	b3e05000 	mvnlt	r5, #0
   10450:	e1d430bc 	ldrh	r3, [r4, #12]
   10454:	e3130080 	tst	r3, #128	; 0x80
   10458:	1a00001d 	bne	104d4 <_fclose_r+0x110>
   1045c:	e5941030 	ldr	r1, [r4, #48]	; 0x30
   10460:	e3510000 	cmp	r1, #0
   10464:	0a000005 	beq	10480 <_fclose_r+0xbc>
   10468:	e2843040 	add	r3, r4, #64	; 0x40
   1046c:	e1510003 	cmp	r1, r3
   10470:	11a00006 	movne	r0, r6
   10474:	1bfff716 	blne	e0d4 <_free_r>
   10478:	e3a03000 	mov	r3, #0
   1047c:	e5843030 	str	r3, [r4, #48]	; 0x30
   10480:	e5941044 	ldr	r1, [r4, #68]	; 0x44
   10484:	e3510000 	cmp	r1, #0
   10488:	0a000003 	beq	1049c <_fclose_r+0xd8>
   1048c:	e1a00006 	mov	r0, r6
   10490:	ebfff70f 	bl	e0d4 <_free_r>
   10494:	e3a03000 	mov	r3, #0
   10498:	e5843044 	str	r3, [r4, #68]	; 0x44
   1049c:	ebfff618 	bl	dd04 <__sfp_lock_acquire>
   104a0:	e3a03000 	mov	r3, #0
   104a4:	e5942064 	ldr	r2, [r4, #100]	; 0x64
   104a8:	e3120001 	tst	r2, #1
   104ac:	e1c430bc 	strh	r3, [r4, #12]
   104b0:	0a00000b 	beq	104e4 <_fclose_r+0x120>
   104b4:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   104b8:	ebfff971 	bl	ea84 <__retarget_lock_close_recursive>
   104bc:	ebfff616 	bl	dd1c <__sfp_lock_release>
   104c0:	e1a00005 	mov	r0, r5
   104c4:	e8bd4070 	pop	{r4, r5, r6, lr}
   104c8:	e12fff1e 	bx	lr
   104cc:	ebfff59f 	bl	db50 <__sinit>
   104d0:	eaffffc4 	b	103e8 <_fclose_r+0x24>
   104d4:	e5941010 	ldr	r1, [r4, #16]
   104d8:	e1a00006 	mov	r0, r6
   104dc:	ebfff6fc 	bl	e0d4 <_free_r>
   104e0:	eaffffdd 	b	1045c <_fclose_r+0x98>
   104e4:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   104e8:	ebfff96d 	bl	eaa4 <__retarget_lock_release_recursive>
   104ec:	eafffff0 	b	104b4 <_fclose_r+0xf0>
   104f0:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   104f4:	ebfff964 	bl	ea8c <__retarget_lock_acquire_recursive>
   104f8:	e1d430fc 	ldrsh	r3, [r4, #12]
   104fc:	e3530000 	cmp	r3, #0
   10500:	1affffc5 	bne	1041c <_fclose_r+0x58>
   10504:	e5945064 	ldr	r5, [r4, #100]	; 0x64
   10508:	e2155001 	ands	r5, r5, #1
   1050c:	1affffbb 	bne	10400 <_fclose_r+0x3c>
   10510:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   10514:	ebfff962 	bl	eaa4 <__retarget_lock_release_recursive>
   10518:	e1a00005 	mov	r0, r5
   1051c:	e8bd4070 	pop	{r4, r5, r6, lr}
   10520:	e12fff1e 	bx	lr

00010524 <fclose>:
   10524:	e59f3008 	ldr	r3, [pc, #8]	; 10534 <fclose+0x10>
   10528:	e1a01000 	mov	r1, r0
   1052c:	e5930000 	ldr	r0, [r3]
   10530:	eaffffa3 	b	103c4 <_fclose_r>
   10534:	0001108c 	.word	0x0001108c

00010538 <_fstat_r>:
   10538:	e1a0c001 	mov	ip, r1
   1053c:	e3a03000 	mov	r3, #0
   10540:	e92d4070 	push	{r4, r5, r6, lr}
   10544:	e59f402c 	ldr	r4, [pc, #44]	; 10578 <_fstat_r+0x40>
   10548:	e1a05000 	mov	r5, r0
   1054c:	e1a01002 	mov	r1, r2
   10550:	e1a0000c 	mov	r0, ip
   10554:	e5843000 	str	r3, [r4]
   10558:	eb0000fe 	bl	10958 <_fstat>
   1055c:	e3700001 	cmn	r0, #1
   10560:	1a000002 	bne	10570 <_fstat_r+0x38>
   10564:	e5943000 	ldr	r3, [r4]
   10568:	e3530000 	cmp	r3, #0
   1056c:	15853000 	strne	r3, [r5]
   10570:	e8bd4070 	pop	{r4, r5, r6, lr}
   10574:	e12fff1e 	bx	lr
   10578:	00011adc 	.word	0x00011adc

0001057c <_isatty_r>:
   1057c:	e3a03000 	mov	r3, #0
   10580:	e92d4070 	push	{r4, r5, r6, lr}
   10584:	e59f4028 	ldr	r4, [pc, #40]	; 105b4 <_isatty_r+0x38>
   10588:	e1a05000 	mov	r5, r0
   1058c:	e1a00001 	mov	r0, r1
   10590:	e5843000 	str	r3, [r4]
   10594:	eb0000fb 	bl	10988 <_isatty>
   10598:	e3700001 	cmn	r0, #1
   1059c:	1a000002 	bne	105ac <_isatty_r+0x30>
   105a0:	e5943000 	ldr	r3, [r4]
   105a4:	e3530000 	cmp	r3, #0
   105a8:	15853000 	strne	r3, [r5]
   105ac:	e8bd4070 	pop	{r4, r5, r6, lr}
   105b0:	e12fff1e 	bx	lr
   105b4:	00011adc 	.word	0x00011adc

000105b8 <_lseek_r>:
   105b8:	e92d4070 	push	{r4, r5, r6, lr}
   105bc:	e1a0e001 	mov	lr, r1
   105c0:	e3a0c000 	mov	ip, #0
   105c4:	e59f4030 	ldr	r4, [pc, #48]	; 105fc <_lseek_r+0x44>
   105c8:	e1a01002 	mov	r1, r2
   105cc:	e1a05000 	mov	r5, r0
   105d0:	e1a02003 	mov	r2, r3
   105d4:	e1a0000e 	mov	r0, lr
   105d8:	e584c000 	str	ip, [r4]
   105dc:	eb0000f5 	bl	109b8 <_lseek>
   105e0:	e3700001 	cmn	r0, #1
   105e4:	1a000002 	bne	105f4 <_lseek_r+0x3c>
   105e8:	e5943000 	ldr	r3, [r4]
   105ec:	e3530000 	cmp	r3, #0
   105f0:	15853000 	strne	r3, [r5]
   105f4:	e8bd4070 	pop	{r4, r5, r6, lr}
   105f8:	e12fff1e 	bx	lr
   105fc:	00011adc 	.word	0x00011adc

00010600 <_read_r>:
   10600:	e92d4070 	push	{r4, r5, r6, lr}
   10604:	e1a0e001 	mov	lr, r1
   10608:	e3a0c000 	mov	ip, #0
   1060c:	e59f4030 	ldr	r4, [pc, #48]	; 10644 <_read_r+0x44>
   10610:	e1a01002 	mov	r1, r2
   10614:	e1a05000 	mov	r5, r0
   10618:	e1a02003 	mov	r2, r3
   1061c:	e1a0000e 	mov	r0, lr
   10620:	e584c000 	str	ip, [r4]
   10624:	eb0000e9 	bl	109d0 <_read>
   10628:	e3700001 	cmn	r0, #1
   1062c:	1a000002 	bne	1063c <_read_r+0x3c>
   10630:	e5943000 	ldr	r3, [r4]
   10634:	e3530000 	cmp	r3, #0
   10638:	15853000 	strne	r3, [r5]
   1063c:	e8bd4070 	pop	{r4, r5, r6, lr}
   10640:	e12fff1e 	bx	lr
   10644:	00011adc 	.word	0x00011adc

00010648 <cleanup_glue>:
   10648:	e92d4070 	push	{r4, r5, r6, lr}
   1064c:	e1a04001 	mov	r4, r1
   10650:	e5911000 	ldr	r1, [r1]
   10654:	e3510000 	cmp	r1, #0
   10658:	e1a05000 	mov	r5, r0
   1065c:	1bfffff9 	blne	10648 <cleanup_glue>
   10660:	e1a01004 	mov	r1, r4
   10664:	e1a00005 	mov	r0, r5
   10668:	ebfff699 	bl	e0d4 <_free_r>
   1066c:	e8bd4070 	pop	{r4, r5, r6, lr}
   10670:	e12fff1e 	bx	lr

00010674 <_reclaim_reent>:
   10674:	e59f30e8 	ldr	r3, [pc, #232]	; 10764 <_reclaim_reent+0xf0>
   10678:	e5933000 	ldr	r3, [r3]
   1067c:	e1530000 	cmp	r3, r0
   10680:	012fff1e 	bxeq	lr
   10684:	e590304c 	ldr	r3, [r0, #76]	; 0x4c
   10688:	e3530000 	cmp	r3, #0
   1068c:	e92d4070 	push	{r4, r5, r6, lr}
   10690:	e1a05000 	mov	r5, r0
   10694:	0a00000f 	beq	106d8 <_reclaim_reent+0x64>
   10698:	e3a06000 	mov	r6, #0
   1069c:	e7931006 	ldr	r1, [r3, r6]
   106a0:	e3510000 	cmp	r1, #0
   106a4:	0a000005 	beq	106c0 <_reclaim_reent+0x4c>
   106a8:	e5914000 	ldr	r4, [r1]
   106ac:	e1a00005 	mov	r0, r5
   106b0:	ebfff687 	bl	e0d4 <_free_r>
   106b4:	e2541000 	subs	r1, r4, #0
   106b8:	1afffffa 	bne	106a8 <_reclaim_reent+0x34>
   106bc:	e595304c 	ldr	r3, [r5, #76]	; 0x4c
   106c0:	e2866004 	add	r6, r6, #4
   106c4:	e3560080 	cmp	r6, #128	; 0x80
   106c8:	1afffff3 	bne	1069c <_reclaim_reent+0x28>
   106cc:	e1a01003 	mov	r1, r3
   106d0:	e1a00005 	mov	r0, r5
   106d4:	ebfff67e 	bl	e0d4 <_free_r>
   106d8:	e5951040 	ldr	r1, [r5, #64]	; 0x40
   106dc:	e3510000 	cmp	r1, #0
   106e0:	11a00005 	movne	r0, r5
   106e4:	1bfff67a 	blne	e0d4 <_free_r>
   106e8:	e5951148 	ldr	r1, [r5, #328]	; 0x148
   106ec:	e3510000 	cmp	r1, #0
   106f0:	0a000008 	beq	10718 <_reclaim_reent+0xa4>
   106f4:	e2856f53 	add	r6, r5, #332	; 0x14c
   106f8:	e1510006 	cmp	r1, r6
   106fc:	0a000005 	beq	10718 <_reclaim_reent+0xa4>
   10700:	e5914000 	ldr	r4, [r1]
   10704:	e1a00005 	mov	r0, r5
   10708:	ebfff671 	bl	e0d4 <_free_r>
   1070c:	e1560004 	cmp	r6, r4
   10710:	e1a01004 	mov	r1, r4
   10714:	1afffff9 	bne	10700 <_reclaim_reent+0x8c>
   10718:	e5951054 	ldr	r1, [r5, #84]	; 0x54
   1071c:	e3510000 	cmp	r1, #0
   10720:	11a00005 	movne	r0, r5
   10724:	1bfff66a 	blne	e0d4 <_free_r>
   10728:	e5953038 	ldr	r3, [r5, #56]	; 0x38
   1072c:	e3530000 	cmp	r3, #0
   10730:	1a000001 	bne	1073c <_reclaim_reent+0xc8>
   10734:	e8bd4070 	pop	{r4, r5, r6, lr}
   10738:	e12fff1e 	bx	lr
   1073c:	e595303c 	ldr	r3, [r5, #60]	; 0x3c
   10740:	e1a00005 	mov	r0, r5
   10744:	e1a0e00f 	mov	lr, pc
   10748:	e12fff13 	bx	r3
   1074c:	e59512e0 	ldr	r1, [r5, #736]	; 0x2e0
   10750:	e3510000 	cmp	r1, #0
   10754:	0afffff6 	beq	10734 <_reclaim_reent+0xc0>
   10758:	e1a00005 	mov	r0, r5
   1075c:	e8bd4070 	pop	{r4, r5, r6, lr}
   10760:	eaffffb8 	b	10648 <cleanup_glue>
   10764:	0001108c 	.word	0x0001108c

00010768 <__aeabi_uldivmod>:
   10768:	e3530000 	cmp	r3, #0
   1076c:	03520000 	cmpeq	r2, #0
   10770:	1a000004 	bne	10788 <__aeabi_uldivmod+0x20>
   10774:	e3510000 	cmp	r1, #0
   10778:	03500000 	cmpeq	r0, #0
   1077c:	13e01000 	mvnne	r1, #0
   10780:	13e00000 	mvnne	r0, #0
   10784:	eaffecf8 	b	bb6c <__aeabi_idiv0>
   10788:	e24dd008 	sub	sp, sp, #8
   1078c:	e92d6000 	push	{sp, lr}
   10790:	eb000003 	bl	107a4 <__udivmoddi4>
   10794:	e59de004 	ldr	lr, [sp, #4]
   10798:	e28dd008 	add	sp, sp, #8
   1079c:	e8bd000c 	pop	{r2, r3}
   107a0:	e12fff1e 	bx	lr

000107a4 <__udivmoddi4>:
   107a4:	e1510003 	cmp	r1, r3
   107a8:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
   107ac:	01500002 	cmpeq	r0, r2
   107b0:	e1a04000 	mov	r4, r0
   107b4:	e1a05001 	mov	r5, r1
   107b8:	e59da028 	ldr	sl, [sp, #40]	; 0x28
   107bc:	33a00000 	movcc	r0, #0
   107c0:	33a01000 	movcc	r1, #0
   107c4:	3a00003d 	bcc	108c0 <__udivmoddi4+0x11c>
   107c8:	e1a00002 	mov	r0, r2
   107cc:	e1a01003 	mov	r1, r3
   107d0:	e1a08002 	mov	r8, r2
   107d4:	e1a09003 	mov	r9, r3
   107d8:	eb00003c 	bl	108d0 <__clzdi2>
   107dc:	e1a01005 	mov	r1, r5
   107e0:	e1a0b000 	mov	fp, r0
   107e4:	e1a00004 	mov	r0, r4
   107e8:	eb000038 	bl	108d0 <__clzdi2>
   107ec:	e04bb000 	sub	fp, fp, r0
   107f0:	e24b2020 	sub	r2, fp, #32
   107f4:	e1a07b19 	lsl	r7, r9, fp
   107f8:	e1877218 	orr	r7, r7, r8, lsl r2
   107fc:	e26bc020 	rsb	ip, fp, #32
   10800:	e1877c38 	orr	r7, r7, r8, lsr ip
   10804:	e1550007 	cmp	r5, r7
   10808:	e1a06b18 	lsl	r6, r8, fp
   1080c:	01540006 	cmpeq	r4, r6
   10810:	33a00000 	movcc	r0, #0
   10814:	33a01000 	movcc	r1, #0
   10818:	3a000005 	bcc	10834 <__udivmoddi4+0x90>
   1081c:	e3a0e001 	mov	lr, #1
   10820:	e0544006 	subs	r4, r4, r6
   10824:	e1a0121e 	lsl	r1, lr, r2
   10828:	e1811c3e 	orr	r1, r1, lr, lsr ip
   1082c:	e0c55007 	sbc	r5, r5, r7
   10830:	e1a00b1e 	lsl	r0, lr, fp
   10834:	e35b0000 	cmp	fp, #0
   10838:	0a000020 	beq	108c0 <__udivmoddi4+0x11c>
   1083c:	e1b070a7 	lsrs	r7, r7, #1
   10840:	e1a06066 	rrx	r6, r6
   10844:	e1a0e00b 	mov	lr, fp
   10848:	ea000007 	b	1086c <__udivmoddi4+0xc8>
   1084c:	e0544006 	subs	r4, r4, r6
   10850:	e0c55007 	sbc	r5, r5, r7
   10854:	e0944004 	adds	r4, r4, r4
   10858:	e0a55005 	adc	r5, r5, r5
   1085c:	e2944001 	adds	r4, r4, #1
   10860:	e2a55000 	adc	r5, r5, #0
   10864:	e25ee001 	subs	lr, lr, #1
   10868:	0a000006 	beq	10888 <__udivmoddi4+0xe4>
   1086c:	e1550007 	cmp	r5, r7
   10870:	01540006 	cmpeq	r4, r6
   10874:	2afffff4 	bcs	1084c <__udivmoddi4+0xa8>
   10878:	e0944004 	adds	r4, r4, r4
   1087c:	e0a55005 	adc	r5, r5, r5
   10880:	e25ee001 	subs	lr, lr, #1
   10884:	1afffff8 	bne	1086c <__udivmoddi4+0xc8>
   10888:	e1a0eb34 	lsr	lr, r4, fp
   1088c:	e18eec15 	orr	lr, lr, r5, lsl ip
   10890:	e18ee235 	orr	lr, lr, r5, lsr r2
   10894:	e0906004 	adds	r6, r0, r4
   10898:	e1a0400e 	mov	r4, lr
   1089c:	e0a17005 	adc	r7, r1, r5
   108a0:	e1a01b35 	lsr	r1, r5, fp
   108a4:	e1a05001 	mov	r5, r1
   108a8:	e1a01b11 	lsl	r1, r1, fp
   108ac:	e181121e 	orr	r1, r1, lr, lsl r2
   108b0:	e1a00b1e 	lsl	r0, lr, fp
   108b4:	e1811c3e 	orr	r1, r1, lr, lsr ip
   108b8:	e0560000 	subs	r0, r6, r0
   108bc:	e0c71001 	sbc	r1, r7, r1
   108c0:	e35a0000 	cmp	sl, #0
   108c4:	188a0030 	stmne	sl, {r4, r5}
   108c8:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
   108cc:	e12fff1e 	bx	lr

000108d0 <__clzdi2>:
   108d0:	e92d4010 	push	{r4, lr}
   108d4:	e3510000 	cmp	r1, #0
   108d8:	1a000002 	bne	108e8 <__clzdi2+0x18>
   108dc:	eb000005 	bl	108f8 <__clzsi2>
   108e0:	e2800020 	add	r0, r0, #32
   108e4:	ea000001 	b	108f0 <__clzdi2+0x20>
   108e8:	e1a00001 	mov	r0, r1
   108ec:	eb000001 	bl	108f8 <__clzsi2>
   108f0:	e8bd4010 	pop	{r4, lr}
   108f4:	e12fff1e 	bx	lr

000108f8 <__clzsi2>:
   108f8:	e3a0101c 	mov	r1, #28
   108fc:	e3500801 	cmp	r0, #65536	; 0x10000
   10900:	21a00820 	lsrcs	r0, r0, #16
   10904:	22411010 	subcs	r1, r1, #16
   10908:	e3500c01 	cmp	r0, #256	; 0x100
   1090c:	21a00420 	lsrcs	r0, r0, #8
   10910:	22411008 	subcs	r1, r1, #8
   10914:	e3500010 	cmp	r0, #16
   10918:	21a00220 	lsrcs	r0, r0, #4
   1091c:	22411004 	subcs	r1, r1, #4
   10920:	e28f2008 	add	r2, pc, #8
   10924:	e7d20000 	ldrb	r0, [r2, r0]
   10928:	e0800001 	add	r0, r0, r1
   1092c:	e12fff1e 	bx	lr
   10930:	02020304 	.word	0x02020304
   10934:	01010101 	.word	0x01010101
	...

00010940 <_close>:
   10940:	e3a02058 	mov	r2, #88	; 0x58
   10944:	e59f3008 	ldr	r3, [pc, #8]	; 10954 <_close+0x14>
   10948:	e3e00000 	mvn	r0, #0
   1094c:	e5832000 	str	r2, [r3]
   10950:	e12fff1e 	bx	lr
   10954:	00011adc 	.word	0x00011adc

00010958 <_fstat>:
   10958:	e3a02058 	mov	r2, #88	; 0x58
   1095c:	e59f3008 	ldr	r3, [pc, #8]	; 1096c <_fstat+0x14>
   10960:	e3e00000 	mvn	r0, #0
   10964:	e5832000 	str	r2, [r3]
   10968:	e12fff1e 	bx	lr
   1096c:	00011adc 	.word	0x00011adc

00010970 <_getpid>:
   10970:	e3a02058 	mov	r2, #88	; 0x58
   10974:	e59f3008 	ldr	r3, [pc, #8]	; 10984 <_getpid+0x14>
   10978:	e3e00000 	mvn	r0, #0
   1097c:	e5832000 	str	r2, [r3]
   10980:	e12fff1e 	bx	lr
   10984:	00011adc 	.word	0x00011adc

00010988 <_isatty>:
   10988:	e3a02058 	mov	r2, #88	; 0x58
   1098c:	e59f3008 	ldr	r3, [pc, #8]	; 1099c <_isatty+0x14>
   10990:	e3a00000 	mov	r0, #0
   10994:	e5832000 	str	r2, [r3]
   10998:	e12fff1e 	bx	lr
   1099c:	00011adc 	.word	0x00011adc

000109a0 <_kill>:
   109a0:	e3a02058 	mov	r2, #88	; 0x58
   109a4:	e59f3008 	ldr	r3, [pc, #8]	; 109b4 <_kill+0x14>
   109a8:	e3e00000 	mvn	r0, #0
   109ac:	e5832000 	str	r2, [r3]
   109b0:	e12fff1e 	bx	lr
   109b4:	00011adc 	.word	0x00011adc

000109b8 <_lseek>:
   109b8:	e3a02058 	mov	r2, #88	; 0x58
   109bc:	e59f3008 	ldr	r3, [pc, #8]	; 109cc <_lseek+0x14>
   109c0:	e3e00000 	mvn	r0, #0
   109c4:	e5832000 	str	r2, [r3]
   109c8:	e12fff1e 	bx	lr
   109cc:	00011adc 	.word	0x00011adc

000109d0 <_read>:
   109d0:	e3a02058 	mov	r2, #88	; 0x58
   109d4:	e59f3008 	ldr	r3, [pc, #8]	; 109e4 <_read+0x14>
   109d8:	e3e00000 	mvn	r0, #0
   109dc:	e5832000 	str	r2, [r3]
   109e0:	e12fff1e 	bx	lr
   109e4:	00011adc 	.word	0x00011adc

000109e8 <_sbrk>:
   109e8:	e59f201c 	ldr	r2, [pc, #28]	; 10a0c <_sbrk+0x24>
   109ec:	e5923000 	ldr	r3, [r2]
   109f0:	e59f1018 	ldr	r1, [pc, #24]	; 10a10 <_sbrk+0x28>
   109f4:	e3530000 	cmp	r3, #0
   109f8:	01a03001 	moveq	r3, r1
   109fc:	e0830000 	add	r0, r3, r0
   10a00:	e5820000 	str	r0, [r2]
   10a04:	e1a00003 	mov	r0, r3
   10a08:	e12fff1e 	bx	lr
   10a0c:	00011ab4 	.word	0x00011ab4
   10a10:	00011ae0 	.word	0x00011ae0

00010a14 <_write>:
   10a14:	e3a02058 	mov	r2, #88	; 0x58
   10a18:	e59f3008 	ldr	r3, [pc, #8]	; 10a28 <_write+0x14>
   10a1c:	e3e00000 	mvn	r0, #0
   10a20:	e5832000 	str	r2, [r3]
   10a24:	e12fff1e 	bx	lr
   10a28:	00011adc 	.word	0x00011adc

00010a2c <_exit>:
   10a2c:	eafffffe 	b	10a2c <_exit>

Disassembly of section .fini:

00010a30 <_fini>:
   10a30:	e1a0c00d 	mov	ip, sp
   10a34:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
   10a38:	e24cb004 	sub	fp, ip, #4
   10a3c:	e24bd028 	sub	sp, fp, #40	; 0x28
   10a40:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
   10a44:	e12fff1e 	bx	lr
