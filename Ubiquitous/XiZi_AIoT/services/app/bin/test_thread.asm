
test_thread:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <main>:
    return 0;
}

static char sem_file_name[] = "/semaphore_server";
int main(int argc, char** argv)
{
       0:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    global_value = 0;

    printf("Test Create Semaphore.\n");
       4:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
       8:	910b8000 	add	x0, x0, #0x2e0
{
       c:	910003fd 	mov	x29, sp
      10:	a90363f7 	stp	x23, x24, [sp, #48]
    global_value = 0;
      14:	d0000077 	adrp	x23, e000 <__malloc_av_+0x768>
      18:	b900faff 	str	wzr, [x23, #248]
{
      1c:	a90153f3 	stp	x19, x20, [sp, #16]
      20:	90000073 	adrp	x19, c000 <_reclaim_reent+0xc0>
      24:	913d6273 	add	x19, x19, #0xf58
      28:	a9025bf5 	stp	x21, x22, [sp, #32]
    printf("Test Create Semaphore.\n");
      2c:	9400078d 	bl	1e60 <printf>
    struct Session sem_session;
    bool spawn_sem_server = false;
    while (connect_session(&sem_session, sem_server_name, 4096) < 0) {
        if (!spawn_sem_server) {
            struct Session fs_session;
            printf("Connect FS.\n");
      30:	90000076 	adrp	x22, c000 <_reclaim_reent+0xc0>
      34:	910be2d6 	add	x22, x22, #0x2f8
            if (connect_session(&fs_session, "MemFS", 8192) < 0) {
      38:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
      3c:	910c2018 	add	x24, x0, #0x308
    bool spawn_sem_server = false;
      40:	52800014 	mov	w20, #0x0                   	// #0
    while (connect_session(&sem_session, sem_server_name, 4096) < 0) {
      44:	14000002 	b	4c <main+0x4c>
        if (!spawn_sem_server) {
      48:	34000834 	cbz	w20, 14c <main+0x14c>
    while (connect_session(&sem_session, sem_server_name, 4096) < 0) {
      4c:	aa1303e1 	mov	x1, x19
      50:	910163e0 	add	x0, sp, #0x58
      54:	52820002 	mov	w2, #0x1000                	// #4096
      58:	94000e4a 	bl	3980 <connect_session>
      5c:	37ffff60 	tbnz	w0, #31, 48 <main+0x48>
            spawn_sem_server = true;
            free_session(&fs_session);
        }
    }
    printf("Create new sem.\n");
    sem_create(&sem_session, &sem, 0);
      60:	9103e2f8 	add	x24, x23, #0xf8
    printf("Create new sem.\n");
      64:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
      68:	910e6000 	add	x0, x0, #0x398
      6c:	9400077d 	bl	1e60 <printf>
    sem_create(&sem_session, &sem, 0);
      70:	91001301 	add	x1, x24, #0x4
      74:	52800002 	mov	w2, #0x0                   	// #0
      78:	910163e0 	add	x0, sp, #0x58
      7c:	90000016 	adrp	x22, 0 <main>
      80:	910f02d6 	add	x22, x22, #0x3c0
      84:	94000bcf 	bl	2fc0 <sem_create>

    printf("Create new thread.\n");
      88:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
      8c:	910ec000 	add	x0, x0, #0x3b0
    char* task_param[2] = { "add_gval", NULL };
      90:	90000075 	adrp	x21, c000 <_reclaim_reent+0xc0>
      94:	910f22b5 	add	x21, x21, #0x3c8
    printf("Create new thread.\n");
      98:	94000772 	bl	1e60 <printf>
    char* task_param[2] = { "add_gval", NULL };
      9c:	52801013 	mov	w19, #0x80                  	// #128
    int nr_thread = 0;
      a0:	52800014 	mov	w20, #0x0                   	// #0
    char* task_param[2] = { "add_gval", NULL };
      a4:	a908fff5 	stp	x21, xzr, [sp, #136]
    for (int i = 0; i < 128; i++) {
        int tid = thread(sub_thread_entry, "add_gval", task_param);
      a8:	910223e2 	add	x2, sp, #0x88
      ac:	aa1503e1 	mov	x1, x21
      b0:	aa1603e0 	mov	x0, x22
      b4:	9400085f 	bl	2230 <thread>
        if (tid > 0) {
            nr_thread++;
      b8:	7100001f 	cmp	w0, #0x0
      bc:	1a94d694 	cinc	w20, w20, gt
    for (int i = 0; i < 128; i++) {
      c0:	71000673 	subs	w19, w19, #0x1
      c4:	54ffff21 	b.ne	a8 <main+0xa8>  // b.any
        }
    }

    printf("Main thread waiting for sem for %d times.\n", nr_thread);
      c8:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
      cc:	2a1403e1 	mov	w1, w20
      d0:	910f6000 	add	x0, x0, #0x3d8
      d4:	94000763 	bl	1e60 <printf>
    for (int i = 0; i < nr_thread; i++) {
      d8:	34000174 	cbz	w20, 104 <main+0x104>
        int sem_wait_ret = sem_wait(&sem_session, &sem, 0);
      dc:	91001315 	add	x21, x24, #0x4
    for (int i = 0; i < nr_thread; i++) {
      e0:	52800013 	mov	w19, #0x0                   	// #0
      e4:	d503201f 	nop
      e8:	11000673 	add	w19, w19, #0x1
        int sem_wait_ret = sem_wait(&sem_session, &sem, 0);
      ec:	aa1503e1 	mov	x1, x21
      f0:	910163e0 	add	x0, sp, #0x58
      f4:	52800002 	mov	w2, #0x0                   	// #0
      f8:	94000c66 	bl	3290 <sem_wait>
    for (int i = 0; i < nr_thread; i++) {
      fc:	6b13029f 	cmp	w20, w19
     100:	54ffff41 	b.ne	e8 <main+0xe8>  // b.any
    }
    printf("Main thread sem %d wait return, global val: %d.\n", sem, global_value);
     104:	b940fae2 	ldr	w2, [x23, #248]
     108:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     10c:	91102000 	add	x0, x0, #0x408
     110:	b8404f01 	ldr	w1, [x24, #4]!
     114:	94000753 	bl	1e60 <printf>

    sem_delete(&sem_session, &sem);
     118:	aa1803e1 	mov	x1, x24
     11c:	910163e0 	add	x0, sp, #0x58
     120:	94000bec 	bl	30d0 <sem_delete>
    free_session(&sem_session);
     124:	910163e0 	add	x0, sp, #0x58
     128:	94000e1e 	bl	39a0 <free_session>
    exit(0);
     12c:	52800000 	mov	w0, #0x0                   	// #0
     130:	94000848 	bl	2250 <exit>
    return 0;
     134:	52800000 	mov	w0, #0x0                   	// #0
     138:	a94153f3 	ldp	x19, x20, [sp, #16]
     13c:	a9425bf5 	ldp	x21, x22, [sp, #32]
     140:	a94363f7 	ldp	x23, x24, [sp, #48]
     144:	a8ca7bfd 	ldp	x29, x30, [sp], #160
     148:	d65f03c0 	ret
            printf("Connect FS.\n");
     14c:	aa1603e0 	mov	x0, x22
     150:	f90023f9 	str	x25, [sp, #64]
     154:	94000743 	bl	1e60 <printf>
            if ((fd = open(&fs_session, sem_file_name)) < 0) {
     158:	91004279 	add	x25, x19, #0x10
            if (connect_session(&fs_session, "MemFS", 8192) < 0) {
     15c:	9101c3e0 	add	x0, sp, #0x70
     160:	aa1803e1 	mov	x1, x24
            spawn_sem_server = true;
     164:	52800034 	mov	w20, #0x1                   	// #1
            if (connect_session(&fs_session, "MemFS", 8192) < 0) {
     168:	52840002 	mov	w2, #0x2000                	// #8192
     16c:	94000e05 	bl	3980 <connect_session>
     170:	37f80400 	tbnz	w0, #31, 1f0 <main+0x1f0>
            printf("Loading semaphore server.\n");
     174:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     178:	910ca000 	add	x0, x0, #0x328
     17c:	94000739 	bl	1e60 <printf>
            if ((fd = open(&fs_session, sem_file_name)) < 0) {
     180:	aa1903e1 	mov	x1, x25
     184:	9101c3e0 	add	x0, sp, #0x70
     188:	94000a26 	bl	2a20 <open>
     18c:	2a0003f5 	mov	w21, w0
     190:	37f804e0 	tbnz	w0, #31, 22c <main+0x22c>
            printf("Spawn semaphore server.\n");
     194:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     198:	910d8000 	add	x0, x0, #0x360
     19c:	94000731 	bl	1e60 <printf>
            char* sem_server_params[] = { sem_server_name, sem_server_name, NULL };
     1a0:	90000064 	adrp	x4, c000 <_reclaim_reent+0xc0>
     1a4:	91110084 	add	x4, x4, #0x440
            if (spawn(&fs_session, fd, read, fsize, sem_server_name, sem_server_params) < 0) {
     1a8:	d0000003 	adrp	x3, 2000 <snprintf_+0x60>
     1ac:	d0000002 	adrp	x2, 2000 <snprintf_+0x60>
     1b0:	2a1503e1 	mov	w1, w21
     1b4:	913b8063 	add	x3, x3, #0xee0
            char* sem_server_params[] = { sem_server_name, sem_server_name, NULL };
     1b8:	a9402488 	ldp	x8, x9, [x4]
            if (spawn(&fs_session, fd, read, fsize, sem_server_name, sem_server_params) < 0) {
     1bc:	91300042 	add	x2, x2, #0xc00
            char* sem_server_params[] = { sem_server_name, sem_server_name, NULL };
     1c0:	f9400886 	ldr	x6, [x4, #16]
            if (spawn(&fs_session, fd, read, fsize, sem_server_name, sem_server_params) < 0) {
     1c4:	910223e5 	add	x5, sp, #0x88
     1c8:	9101c3e0 	add	x0, sp, #0x70
     1cc:	aa1303e4 	mov	x4, x19
            char* sem_server_params[] = { sem_server_name, sem_server_name, NULL };
     1d0:	a908a7e8 	stp	x8, x9, [sp, #136]
     1d4:	f9004fe6 	str	x6, [sp, #152]
            if (spawn(&fs_session, fd, read, fsize, sem_server_name, sem_server_params) < 0) {
     1d8:	940007e2 	bl	2160 <spawn>
     1dc:	37f80160 	tbnz	w0, #31, 208 <main+0x208>
            free_session(&fs_session);
     1e0:	9101c3e0 	add	x0, sp, #0x70
     1e4:	94000def 	bl	39a0 <free_session>
     1e8:	f94023f9 	ldr	x25, [sp, #64]
     1ec:	17ffff98 	b	4c <main+0x4c>
                printf("Connect FS failed.\n");
     1f0:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     1f4:	910c4000 	add	x0, x0, #0x310
     1f8:	9400071a 	bl	1e60 <printf>
                exit(1);
     1fc:	2a1403e0 	mov	w0, w20
     200:	94000814 	bl	2250 <exit>
     204:	17ffffdc 	b	174 <main+0x174>
                printf("Spawn %s failed.\n", sem_file_name);
     208:	91004261 	add	x1, x19, #0x10
     20c:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     210:	910e0000 	add	x0, x0, #0x380
     214:	94000713 	bl	1e60 <printf>
                free_session(&fs_session);
     218:	9101c3e0 	add	x0, sp, #0x70
     21c:	94000de1 	bl	39a0 <free_session>
                exit(1);
     220:	52800020 	mov	w0, #0x1                   	// #1
     224:	9400080b 	bl	2250 <exit>
     228:	17ffffee 	b	1e0 <main+0x1e0>
                printf("Open %s failed.\n", sem_file_name);
     22c:	aa1903e1 	mov	x1, x25
     230:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     234:	910d2000 	add	x0, x0, #0x348
     238:	9400070a 	bl	1e60 <printf>
                free_session(&fs_session);
     23c:	9101c3e0 	add	x0, sp, #0x70
     240:	94000dd8 	bl	39a0 <free_session>
                exit(1);
     244:	52800020 	mov	w0, #0x1                   	// #1
     248:	94000802 	bl	2250 <exit>
     24c:	17ffffd2 	b	194 <main+0x194>

0000000000000250 <deregister_tm_clones>:
     250:	d0000060 	adrp	x0, e000 <__malloc_av_+0x768>
     254:	91030000 	add	x0, x0, #0xc0
     258:	d0000061 	adrp	x1, e000 <__malloc_av_+0x768>
     25c:	91030021 	add	x1, x1, #0xc0
     260:	eb00003f 	cmp	x1, x0
     264:	540000c0 	b.eq	27c <deregister_tm_clones+0x2c>  // b.none
     268:	90000061 	adrp	x1, c000 <_reclaim_reent+0xc0>
     26c:	f9415421 	ldr	x1, [x1, #680]
     270:	b4000061 	cbz	x1, 27c <deregister_tm_clones+0x2c>
     274:	aa0103f0 	mov	x16, x1
     278:	d61f0200 	br	x16
     27c:	d65f03c0 	ret

0000000000000280 <register_tm_clones>:
     280:	d0000060 	adrp	x0, e000 <__malloc_av_+0x768>
     284:	91030000 	add	x0, x0, #0xc0
     288:	d0000061 	adrp	x1, e000 <__malloc_av_+0x768>
     28c:	91030021 	add	x1, x1, #0xc0
     290:	cb000021 	sub	x1, x1, x0
     294:	d37ffc22 	lsr	x2, x1, #63
     298:	8b810c41 	add	x1, x2, x1, asr #3
     29c:	9341fc21 	asr	x1, x1, #1
     2a0:	b40000c1 	cbz	x1, 2b8 <register_tm_clones+0x38>
     2a4:	90000062 	adrp	x2, c000 <_reclaim_reent+0xc0>
     2a8:	f9415842 	ldr	x2, [x2, #688]
     2ac:	b4000062 	cbz	x2, 2b8 <register_tm_clones+0x38>
     2b0:	aa0203f0 	mov	x16, x2
     2b4:	d61f0200 	br	x16
     2b8:	d65f03c0 	ret
     2bc:	d503201f 	nop

00000000000002c0 <__do_global_dtors_aux>:
     2c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     2c4:	910003fd 	mov	x29, sp
     2c8:	f9000bf3 	str	x19, [sp, #16]
     2cc:	d0000073 	adrp	x19, e000 <__malloc_av_+0x768>
     2d0:	39430260 	ldrb	w0, [x19, #192]
     2d4:	35000140 	cbnz	w0, 2fc <__do_global_dtors_aux+0x3c>
     2d8:	97ffffde 	bl	250 <deregister_tm_clones>
     2dc:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     2e0:	f9415c00 	ldr	x0, [x0, #696]
     2e4:	b4000080 	cbz	x0, 2f4 <__do_global_dtors_aux+0x34>
     2e8:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     2ec:	913cf000 	add	x0, x0, #0xf3c
     2f0:	d503201f 	nop
     2f4:	52800020 	mov	w0, #0x1                   	// #1
     2f8:	39030260 	strb	w0, [x19, #192]
     2fc:	f9400bf3 	ldr	x19, [sp, #16]
     300:	a8c27bfd 	ldp	x29, x30, [sp], #32
     304:	d65f03c0 	ret
     308:	d503201f 	nop
     30c:	d503201f 	nop

0000000000000310 <frame_dummy>:
     310:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     314:	f9416000 	ldr	x0, [x0, #704]
     318:	b4000140 	cbz	x0, 340 <frame_dummy+0x30>
     31c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     320:	d0000061 	adrp	x1, e000 <__malloc_av_+0x768>
     324:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     328:	910003fd 	mov	x29, sp
     32c:	91032021 	add	x1, x1, #0xc8
     330:	913cf000 	add	x0, x0, #0xf3c
     334:	d503201f 	nop
     338:	a8c17bfd 	ldp	x29, x30, [sp], #16
     33c:	17ffffd1 	b	280 <register_tm_clones>
     340:	17ffffd0 	b	280 <register_tm_clones>
     344:	d503201f 	nop

0000000000000348 <_mainCRTStartup>:
     348:	58000281 	ldr	x1, 398 <_cpu_init_hook+0x4>
     34c:	927cec20 	and	x0, x1, #0xfffffffffffffff0
     350:	9100001f 	mov	sp, x0
     354:	d280001d 	mov	x29, #0x0                   	// #0
     358:	a9bf77fd 	stp	x29, x29, [sp, #-16]!
     35c:	910003fd 	mov	x29, sp
     360:	9400000d 	bl	394 <_cpu_init_hook>
     364:	580001e0 	ldr	x0, 3a0 <_cpu_init_hook+0xc>
     368:	52800001 	mov	w1, #0x0                   	// #0
     36c:	580001e2 	ldr	x2, 3a8 <_cpu_init_hook+0x14>
     370:	cb000042 	sub	x2, x2, x0
     374:	94001123 	bl	4800 <memset>
     378:	580001c0 	ldr	x0, 3b0 <_cpu_init_hook+0x1c>
     37c:	94001011 	bl	43c0 <atexit>
     380:	9400106c 	bl	4530 <__libc_init_array>
     384:	d2800000 	mov	x0, #0x0                   	// #0
     388:	d2800001 	mov	x1, #0x0                   	// #0
     38c:	97ffff1d 	bl	0 <main>
     390:	140007b0 	b	2250 <exit>

0000000000000394 <_cpu_init_hook>:
     394:	d65f03c0 	ret
	...
     3a0:	0000e0c0 	.word	0x0000e0c0
     3a4:	00000000 	.word	0x00000000
     3a8:	0000e4e0 	.word	0x0000e4e0
     3ac:	00000000 	.word	0x00000000
     3b0:	000043e0 	.word	0x000043e0
     3b4:	00000000 	.word	0x00000000
     3b8:	d503201f 	.word	0xd503201f
     3bc:	d503201f 	.word	0xd503201f

00000000000003c0 <sub_thread_entry>:
{
     3c0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     3c4:	910003fd 	mov	x29, sp
     3c8:	a90153f3 	stp	x19, x20, [sp, #16]
     3cc:	d0000074 	adrp	x20, e000 <__malloc_av_+0x768>
        global_value++;
     3d0:	b940fa80 	ldr	w0, [x20, #248]
     3d4:	90000073 	adrp	x19, c000 <_reclaim_reent+0xc0>
     3d8:	913d6273 	add	x19, x19, #0xf58
     3dc:	11019000 	add	w0, w0, #0x64
     3e0:	b900fa80 	str	w0, [x20, #248]
     3e4:	14000003 	b	3f0 <sub_thread_entry+0x30>
        yield(SYS_TASK_YIELD_NO_REASON);
     3e8:	52800000 	mov	w0, #0x0                   	// #0
     3ec:	940007a1 	bl	2270 <yield>
    while (connect_session(&sem_session, sem_server_name, 4096) < 0) {
     3f0:	aa1303e1 	mov	x1, x19
     3f4:	9100a3e0 	add	x0, sp, #0x28
     3f8:	52820002 	mov	w2, #0x1000                	// #4096
     3fc:	94000d61 	bl	3980 <connect_session>
     400:	37ffff40 	tbnz	w0, #31, 3e8 <sub_thread_entry+0x28>
    printf("Thread signal sem.\n");
     404:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     408:	910b2000 	add	x0, x0, #0x2c8
     40c:	94000695 	bl	1e60 <printf>
    sem_signal(&sem_session, &sem);
     410:	9103e281 	add	x1, x20, #0xf8
     414:	9100a3e0 	add	x0, sp, #0x28
     418:	91001021 	add	x1, x1, #0x4
     41c:	94000b65 	bl	31b0 <sem_signal>
    exit(0);
     420:	52800000 	mov	w0, #0x0                   	// #0
     424:	9400078b 	bl	2250 <exit>
}
     428:	52800000 	mov	w0, #0x0                   	// #0
     42c:	a94153f3 	ldp	x19, x20, [sp, #16]
     430:	a8c47bfd 	ldp	x29, x30, [sp], #64
     434:	d65f03c0 	ret
     438:	d503201f 	nop
     43c:	d503201f 	nop

0000000000000440 <init_uart_mmio>:
#ifndef CONFIG_SYS_NS16550_CLK
#define CONFIG_SYS_NS16550_CLK 0
#endif

bool init_uart_mmio()
{
     440:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
     444:	52800020 	mov	w0, #0x1                   	// #1
{
     448:	910003fd 	mov	x29, sp
     44c:	f9000bf3 	str	x19, [sp, #16]
    if (mapped == 0) {
     450:	d0000073 	adrp	x19, e000 <__malloc_av_+0x768>
     454:	b9410261 	ldr	w1, [x19, #256]
     458:	34000081 	cbz	w1, 468 <init_uart_mmio+0x28>
}
     45c:	f9400bf3 	ldr	x19, [sp, #16]
     460:	a8c27bfd 	ldp	x29, x30, [sp], #32
     464:	d65f03c0 	ret
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     468:	2a0003e3 	mov	w3, w0
     46c:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     470:	52820002 	mov	w2, #0x1000                	// #4096
     474:	aa0103e0 	mov	x0, x1
     478:	940007de 	bl	23f0 <mmap>
     47c:	3100041f 	cmn	w0, #0x1
            return false;
     480:	52800000 	mov	w0, #0x0                   	// #0
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     484:	54fffec0 	b.eq	45c <init_uart_mmio+0x1c>  // b.none
        mapped = 1;
     488:	52800021 	mov	w1, #0x1                   	// #1
    return true;
     48c:	2a0103e0 	mov	w0, w1
        mapped = 1;
     490:	b9010261 	str	w1, [x19, #256]
}
     494:	f9400bf3 	ldr	x19, [sp, #16]
     498:	a8c27bfd 	ldp	x29, x30, [sp], #32
     49c:	d65f03c0 	ret

00000000000004a0 <putc>:

void putc(char ch)
{
     4a0:	12001c00 	and	w0, w0, #0xff
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    if (ch == '\n') {
     4a4:	7100281f 	cmp	w0, #0xa
     4a8:	540000c0 	b.eq	4c0 <putc+0x20>  // b.none
    return in_le32(addr);
     4ac:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     4b0:	b9401441 	ldr	w1, [x2, #20]
        putc('\r');
    }

    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     4b4:	362fffe1 	tbz	w1, #5, 4b0 <putc+0x10>
    out_le32(addr, value);
     4b8:	b9000040 	str	w0, [x2]
        ;
    serial_dout(&com_port->thr, ch);
}
     4bc:	d65f03c0 	ret
    return in_le32(addr);
     4c0:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     4c4:	d503201f 	nop
     4c8:	b9401441 	ldr	w1, [x2, #20]
    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     4cc:	362fffe1 	tbz	w1, #5, 4c8 <putc+0x28>
    out_le32(addr, value);
     4d0:	528001a1 	mov	w1, #0xd                   	// #13
     4d4:	b9000041 	str	w1, [x2]
}
     4d8:	17fffff5 	b	4ac <putc+0xc>
     4dc:	d503201f 	nop

00000000000004e0 <getc>:
    return in_le32(addr);
     4e0:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     4e4:	d503201f 	nop
     4e8:	b9401420 	ldr	w0, [x1, #20]

char getc(void)
{
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    while (!(serial_din(&com_port->lsr) & UART_LSR_DR))
     4ec:	3607ffe0 	tbz	w0, #0, 4e8 <getc+0x8>
    return in_le32(addr);
     4f0:	b9400020 	ldr	w0, [x1]
        ;

    return serial_din(&com_port->rbr);
     4f4:	d65f03c0 	ret
     4f8:	d503201f 	nop
     4fc:	d503201f 	nop

0000000000000500 <_out_buffer>:
} out_fct_wrap_type;

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
    if (idx < maxlen) {
     500:	eb03005f 	cmp	x2, x3
{
     504:	12001c00 	and	w0, w0, #0xff
    if (idx < maxlen) {
     508:	54000042 	b.cs	510 <_out_buffer+0x10>  // b.hs, b.nlast
        ((char*)buffer)[idx] = character;
     50c:	38226820 	strb	w0, [x1, x2]
    }
}
     510:	d65f03c0 	ret
     514:	d503201f 	nop
     518:	d503201f 	nop
     51c:	d503201f 	nop

0000000000000520 <_out_null>:
{
    (void)character;
    (void)buffer;
    (void)idx;
    (void)maxlen;
}
     520:	d65f03c0 	ret
     524:	d503201f 	nop
     528:	d503201f 	nop
     52c:	d503201f 	nop

0000000000000530 <_out_rev>:
    return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
     530:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
     534:	910003fd 	mov	x29, sp
     538:	a90153f3 	stp	x19, x20, [sp, #16]
     53c:	aa0503f3 	mov	x19, x5
     540:	aa0203f4 	mov	x20, x2
     544:	a9025bf5 	stp	x21, x22, [sp, #32]
     548:	aa0003f5 	mov	x21, x0
     54c:	aa0103f6 	mov	x22, x1
     550:	a90363f7 	stp	x23, x24, [sp, #48]
     554:	aa0203f7 	mov	x23, x2
     558:	aa0403f8 	mov	x24, x4
     55c:	a9046bf9 	stp	x25, x26, [sp, #64]
     560:	2a0703fa 	mov	w26, w7
     564:	2a0603f9 	mov	w25, w6
     568:	a90573fb 	stp	x27, x28, [sp, #80]
    const size_t start_idx = idx;

    // pad spaces up to given width
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     56c:	f240075f 	tst	x26, #0x3
{
     570:	aa0303fb 	mov	x27, x3
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     574:	540001e1 	b.ne	5b0 <_out_rev+0x80>  // b.any
        for (size_t i = len; i < width; i++) {
     578:	2a0603e0 	mov	w0, w6
     57c:	aa0203fc 	mov	x28, x2
     580:	cb050014 	sub	x20, x0, x5
     584:	eb0000bf 	cmp	x5, x0
     588:	8b020294 	add	x20, x20, x2
     58c:	54000542 	b.cs	634 <_out_rev+0x104>  // b.hs, b.nlast
            out(' ', buffer, idx++, maxlen);
     590:	aa1c03e2 	mov	x2, x28
     594:	aa1b03e3 	mov	x3, x27
     598:	9100079c 	add	x28, x28, #0x1
     59c:	aa1603e1 	mov	x1, x22
     5a0:	52800400 	mov	w0, #0x20                  	// #32
     5a4:	d63f02a0 	blr	x21
        for (size_t i = len; i < width; i++) {
     5a8:	eb1c029f 	cmp	x20, x28
     5ac:	54ffff21 	b.ne	590 <_out_rev+0x60>  // b.any
        }
    }

    // reverse string
    while (len) {
     5b0:	8b14027c 	add	x28, x19, x20
     5b4:	b4000133 	cbz	x19, 5d8 <_out_rev+0xa8>
     5b8:	cb130382 	sub	x2, x28, x19
        out(buf[--len], buffer, idx++, maxlen);
     5bc:	d1000673 	sub	x19, x19, #0x1
     5c0:	aa1c03f4 	mov	x20, x28
     5c4:	aa1b03e3 	mov	x3, x27
     5c8:	aa1603e1 	mov	x1, x22
     5cc:	38736b00 	ldrb	w0, [x24, x19]
     5d0:	d63f02a0 	blr	x21
    while (len) {
     5d4:	b5ffff33 	cbnz	x19, 5b8 <_out_rev+0x88>
    }

    // append pad spaces up to given width
    if (flags & FLAGS_LEFT) {
     5d8:	360801fa 	tbz	w26, #1, 614 <_out_rev+0xe4>
        while (idx - start_idx < width) {
     5dc:	cb170297 	sub	x23, x20, x23
     5e0:	2a1903f9 	mov	w25, w25
     5e4:	eb1902ff 	cmp	x23, x25
     5e8:	54000162 	b.cs	614 <_out_rev+0xe4>  // b.hs, b.nlast
     5ec:	d503201f 	nop
            out(' ', buffer, idx++, maxlen);
     5f0:	aa1403e2 	mov	x2, x20
        while (idx - start_idx < width) {
     5f4:	910006f7 	add	x23, x23, #0x1
            out(' ', buffer, idx++, maxlen);
     5f8:	aa1b03e3 	mov	x3, x27
     5fc:	aa1603e1 	mov	x1, x22
     600:	52800400 	mov	w0, #0x20                  	// #32
     604:	d63f02a0 	blr	x21
     608:	91000694 	add	x20, x20, #0x1
        while (idx - start_idx < width) {
     60c:	eb1902ff 	cmp	x23, x25
     610:	54ffff03 	b.cc	5f0 <_out_rev+0xc0>  // b.lo, b.ul, b.last
        }
    }

    return idx;
}
     614:	aa1403e0 	mov	x0, x20
     618:	a94153f3 	ldp	x19, x20, [sp, #16]
     61c:	a9425bf5 	ldp	x21, x22, [sp, #32]
     620:	a94363f7 	ldp	x23, x24, [sp, #48]
     624:	a9446bf9 	ldp	x25, x26, [sp, #64]
     628:	a94573fb 	ldp	x27, x28, [sp, #80]
     62c:	a8c67bfd 	ldp	x29, x30, [sp], #96
     630:	d65f03c0 	ret
        for (size_t i = len; i < width; i++) {
     634:	aa0203f4 	mov	x20, x2
     638:	17ffffde 	b	5b0 <_out_rev+0x80>
     63c:	d503201f 	nop

0000000000000640 <_ntoa_long>:
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
}

// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
     640:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     644:	aa0603eb 	mov	x11, x6
     648:	aa0403e9 	mov	x9, x4
     64c:	910003fd 	mov	x29, sp
     650:	b9403be8 	ldr	w8, [sp, #56]
     654:	2a0703ef 	mov	w15, w7
     658:	b94033e6 	ldr	w6, [sp, #48]
     65c:	12001cb2 	and	w18, w5, #0xff
    if (!value) {
        flags &= ~FLAGS_HASH;
    }

    // write if precision != 0 and value is != 0
    if (!(flags & FLAGS_PRECISION) || value) {
     660:	12160110 	and	w16, w8, #0x400
    if (!value) {
     664:	b5000c64 	cbnz	x4, 7f0 <_ntoa_long+0x1b0>
        flags &= ~FLAGS_HASH;
     668:	121b7907 	and	w7, w8, #0xffffffef
    if (!(flags & FLAGS_PRECISION) || value) {
     66c:	34000730 	cbz	w16, 750 <_ntoa_long+0x110>
    if (!(flags & FLAGS_LEFT)) {
     670:	121f0111 	and	w17, w8, #0x2
     674:	37080fc8 	tbnz	w8, #1, 86c <_ntoa_long+0x22c>
    size_t len = 0U;
     678:	d2800005 	mov	x5, #0x0                   	// #0
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     67c:	2a0f03e9 	mov	w9, w15
     680:	f1007cbf 	cmp	x5, #0x1f
     684:	910043e4 	add	x4, sp, #0x10
     688:	1a9f87ea 	cset	w10, ls  // ls = plast
     68c:	eb05013f 	cmp	x9, x5
     690:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     694:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     698:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     69c:	350009c6 	cbnz	w6, 7d4 <_ntoa_long+0x194>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6a0:	34000108 	cbz	w8, 6c0 <_ntoa_long+0x80>
            buf[len++] = '0';
     6a4:	5280060a 	mov	w10, #0x30                  	// #48
     6a8:	910004a5 	add	x5, x5, #0x1
     6ac:	8b050088 	add	x8, x4, x5
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6b0:	eb05013f 	cmp	x9, x5
     6b4:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     6b8:	381ff10a 	sturb	w10, [x8, #-1]
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6bc:	54ffff69 	b.ls	6a8 <_ntoa_long+0x68>  // b.plast
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6c0:	340001cc 	cbz	w12, 6f8 <_ntoa_long+0xb8>
     6c4:	f1007cbf 	cmp	x5, #0x1f
     6c8:	1a9f87ea 	cset	w10, ls  // ls = plast
     6cc:	7100015f 	cmp	w10, #0x0
     6d0:	2a0603e9 	mov	w9, w6
     6d4:	fa451120 	ccmp	x9, x5, #0x0, ne  // ne = any
     6d8:	54000109 	b.ls	6f8 <_ntoa_long+0xb8>  // b.plast
            buf[len++] = '0';
     6dc:	5280060a 	mov	w10, #0x30                  	// #48
     6e0:	910004a5 	add	x5, x5, #0x1
     6e4:	8b050088 	add	x8, x4, x5
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6e8:	eb05013f 	cmp	x9, x5
     6ec:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     6f0:	381ff10a 	sturb	w10, [x8, #-1]
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6f4:	54ffff69 	b.ls	6e0 <_ntoa_long+0xa0>  // b.plast
    if (flags & FLAGS_HASH) {
     6f8:	340001b1 	cbz	w17, 72c <_ntoa_long+0xec>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     6fc:	350008b0 	cbnz	w16, 810 <_ntoa_long+0x1d0>
     700:	b50007e5 	cbnz	x5, 7fc <_ntoa_long+0x1bc>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     704:	f100417f 	cmp	x11, #0x10
     708:	54000f20 	b.eq	8ec <_ntoa_long+0x2ac>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     70c:	f100097f 	cmp	x11, #0x2
     710:	54000f21 	b.ne	8f4 <_ntoa_long+0x2b4>  // b.any
            buf[len++] = 'b';
     714:	52800c48 	mov	w8, #0x62                  	// #98
     718:	d2800025 	mov	x5, #0x1                   	// #1
     71c:	390043e8 	strb	w8, [sp, #16]
            buf[len++] = '0';
     720:	52800608 	mov	w8, #0x30                  	// #48
     724:	38256888 	strb	w8, [x4, x5]
     728:	910004a5 	add	x5, x5, #0x1
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     72c:	f10080bf 	cmp	x5, #0x20
     730:	540000a0 	b.eq	744 <_ntoa_long+0x104>  // b.none
        if (negative) {
     734:	340008d2 	cbz	w18, 84c <_ntoa_long+0x20c>
            buf[len++] = '-';
     738:	528005a8 	mov	w8, #0x2d                  	// #45
     73c:	38256888 	strb	w8, [x4, x5]
     740:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     744:	97ffff7b 	bl	530 <_out_rev>
            value /= base;
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    }

    return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
}
     748:	a8c37bfd 	ldp	x29, x30, [sp], #48
     74c:	d65f03c0 	ret
    if (!(flags & FLAGS_PRECISION) || value) {
     750:	52800011 	mov	w17, #0x0                   	// #0
     754:	f27b00ff 	tst	x7, #0x20
     758:	52800c24 	mov	w4, #0x61                  	// #97
     75c:	5280082e 	mov	w14, #0x41                  	// #65
     760:	1a8411ce 	csel	w14, w14, w4, ne  // ne = any
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     764:	510029ce 	sub	w14, w14, #0xa
     768:	910043e4 	add	x4, sp, #0x10
     76c:	d2800005 	mov	x5, #0x0                   	// #0
            const char digit = (char)(value % base);
     770:	9acb092c 	udiv	x12, x9, x11
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     774:	910004a5 	add	x5, x5, #0x1
     778:	8b05008d 	add	x13, x4, x5
            const char digit = (char)(value % base);
     77c:	9b0ba58a 	msub	x10, x12, x11, x9
     780:	12001d48 	and	w8, w10, #0xff
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     784:	f100255f 	cmp	x10, #0x9
     788:	1100c10a 	add	w10, w8, #0x30
     78c:	0b0e0108 	add	w8, w8, w14
     790:	12001d4a 	and	w10, w10, #0xff
     794:	12001d08 	and	w8, w8, #0xff
     798:	1a8a8108 	csel	w8, w8, w10, hi  // hi = pmore
     79c:	381ff1a8 	sturb	w8, [x13, #-1]
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     7a0:	eb0b013f 	cmp	x9, x11
            value /= base;
     7a4:	aa0c03e9 	mov	x9, x12
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     7a8:	fa5f28a2 	ccmp	x5, #0x1f, #0x2, cs  // cs = hs, nlast
     7ac:	54fffe29 	b.ls	770 <_ntoa_long+0x130>  // b.plast
    if (!(flags & FLAGS_LEFT)) {
     7b0:	370ffa47 	tbnz	w7, #1, 6f8 <_ntoa_long+0xb8>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     7b4:	f1007cbf 	cmp	x5, #0x1f
     7b8:	2a0f03e9 	mov	w9, w15
     7bc:	1a9f87ea 	cset	w10, ls  // ls = plast
     7c0:	eb05013f 	cmp	x9, x5
     7c4:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     7c8:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     7cc:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     7d0:	34fff686 	cbz	w6, 6a0 <_ntoa_long+0x60>
     7d4:	3400048c 	cbz	w12, 864 <_ntoa_long+0x224>
     7d8:	35000072 	cbnz	w18, 7e4 <_ntoa_long+0x1a4>
     7dc:	721e04ff 	tst	w7, #0xc
     7e0:	54000040 	b.eq	7e8 <_ntoa_long+0x1a8>  // b.none
            width--;
     7e4:	510004c6 	sub	w6, w6, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     7e8:	35fff5e8 	cbnz	w8, 6a4 <_ntoa_long+0x64>
     7ec:	17ffffb8 	b	6cc <_ntoa_long+0x8c>
    if (flags & FLAGS_HASH) {
     7f0:	121c0111 	and	w17, w8, #0x10
     7f4:	2a0803e7 	mov	w7, w8
     7f8:	17ffffd7 	b	754 <_ntoa_long+0x114>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     7fc:	eb2f40bf 	cmp	x5, w15, uxtw
     800:	54000480 	b.eq	890 <_ntoa_long+0x250>  // b.none
     804:	eb2640bf 	cmp	x5, w6, uxtw
     808:	54000440 	b.eq	890 <_ntoa_long+0x250>  // b.none
     80c:	d503201f 	nop
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     810:	f1007cbf 	cmp	x5, #0x1f
     814:	1a9f87e8 	cset	w8, ls  // ls = plast
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     818:	f100417f 	cmp	x11, #0x10
     81c:	54000480 	b.eq	8ac <_ntoa_long+0x26c>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     820:	7100011f 	cmp	w8, #0x0
     824:	7a421960 	ccmp	w11, #0x2, #0x0, ne  // ne = any
     828:	54000081 	b.ne	838 <_ntoa_long+0x1f8>  // b.any
            buf[len++] = 'b';
     82c:	52800c48 	mov	w8, #0x62                  	// #98
     830:	38256888 	strb	w8, [x4, x5]
     834:	910004a5 	add	x5, x5, #0x1
        if (len < PRINTF_NTOA_BUFFER_SIZE) {
     838:	f10080bf 	cmp	x5, #0x20
     83c:	54fff721 	b.ne	720 <_ntoa_long+0xe0>  // b.any
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     840:	97ffff3c 	bl	530 <_out_rev>
}
     844:	a8c37bfd 	ldp	x29, x30, [sp], #48
     848:	d65f03c0 	ret
        } else if (flags & FLAGS_PLUS) {
     84c:	37100167 	tbnz	w7, #2, 878 <_ntoa_long+0x238>
        } else if (flags & FLAGS_SPACE) {
     850:	361ff7a7 	tbz	w7, #3, 744 <_ntoa_long+0x104>
            buf[len++] = ' ';
     854:	52800408 	mov	w8, #0x20                  	// #32
     858:	38256888 	strb	w8, [x4, x5]
     85c:	910004a5 	add	x5, x5, #0x1
     860:	17ffffb9 	b	744 <_ntoa_long+0x104>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     864:	35fff208 	cbnz	w8, 6a4 <_ntoa_long+0x64>
     868:	17ffffa4 	b	6f8 <_ntoa_long+0xb8>
     86c:	910043e4 	add	x4, sp, #0x10
    size_t len = 0U;
     870:	d2800005 	mov	x5, #0x0                   	// #0
     874:	17ffffb0 	b	734 <_ntoa_long+0xf4>
            buf[len++] = '+'; // ignore the space if the '+' exists
     878:	52800568 	mov	w8, #0x2b                  	// #43
     87c:	38256888 	strb	w8, [x4, x5]
     880:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     884:	97ffff2b 	bl	530 <_out_rev>
}
     888:	a8c37bfd 	ldp	x29, x30, [sp], #48
     88c:	d65f03c0 	ret
            if (len && (base == 16U)) {
     890:	f10004aa 	subs	x10, x5, #0x1
                len--;
     894:	d10008a5 	sub	x5, x5, #0x2
            if (len && (base == 16U)) {
     898:	1a9f07e8 	cset	w8, ne  // ne = any
     89c:	7100417f 	cmp	w11, #0x10
     8a0:	1a9f17e9 	cset	w9, eq  // eq = none
     8a4:	6a090108 	ands	w8, w8, w9
     8a8:	54000160 	b.eq	8d4 <_ntoa_long+0x294>  // b.none
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     8ac:	721b00e9 	ands	w9, w7, #0x20
     8b0:	7a400904 	ccmp	w8, #0x0, #0x4, eq  // eq = none
     8b4:	54000141 	b.ne	8dc <_ntoa_long+0x29c>  // b.any
        } else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     8b8:	7100013f 	cmp	w9, #0x0
     8bc:	7a401904 	ccmp	w8, #0x0, #0x4, ne  // ne = any
     8c0:	54fffbc0 	b.eq	838 <_ntoa_long+0x1f8>  // b.none
            buf[len++] = 'X';
     8c4:	52800b08 	mov	w8, #0x58                  	// #88
     8c8:	38256888 	strb	w8, [x4, x5]
     8cc:	910004a5 	add	x5, x5, #0x1
     8d0:	17ffffda 	b	838 <_ntoa_long+0x1f8>
            len--;
     8d4:	aa0a03e5 	mov	x5, x10
     8d8:	17ffffce 	b	810 <_ntoa_long+0x1d0>
            buf[len++] = 'x';
     8dc:	52800f08 	mov	w8, #0x78                  	// #120
     8e0:	38256888 	strb	w8, [x4, x5]
     8e4:	910004a5 	add	x5, x5, #0x1
     8e8:	17ffffd4 	b	838 <_ntoa_long+0x1f8>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     8ec:	52800028 	mov	w8, #0x1                   	// #1
     8f0:	17ffffef 	b	8ac <_ntoa_long+0x26c>
            buf[len++] = '0';
     8f4:	52800608 	mov	w8, #0x30                  	// #48
     8f8:	d2800025 	mov	x5, #0x1                   	// #1
     8fc:	390043e8 	strb	w8, [sp, #16]
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     900:	17ffff8d 	b	734 <_ntoa_long+0xf4>
     904:	d503201f 	nop
     908:	d503201f 	nop
     90c:	d503201f 	nop

0000000000000910 <_etoa>:
}

#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
     910:	d10203ff 	sub	sp, sp, #0x80
    // check for NaN and special values
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     914:	1e602000 	fcmp	d0, d0
{
     918:	a9017bfd 	stp	x29, x30, [sp, #16]
     91c:	910043fd 	add	x29, sp, #0x10
     920:	a90253f3 	stp	x19, x20, [sp, #32]
     924:	aa0203f3 	mov	x19, x2
     928:	2a0603f4 	mov	w20, w6
     92c:	a9035bf5 	stp	x21, x22, [sp, #48]
     930:	2a0503f6 	mov	w22, w5
     934:	a90463f7 	stp	x23, x24, [sp, #64]
     938:	aa0003f7 	mov	x23, x0
     93c:	a9056bf9 	stp	x25, x26, [sp, #80]
     940:	aa0103f9 	mov	x25, x1
     944:	a90673fb 	stp	x27, x28, [sp, #96]
     948:	aa0303fb 	mov	x27, x3
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     94c:	54001361 	b.ne	bb8 <_etoa+0x2a8>  // b.any
     950:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     954:	9e670001 	fmov	d1, x0
     958:	1e612010 	fcmpe	d0, d1
     95c:	540012ec 	b.gt	bb8 <_etoa+0x2a8>
     960:	92e00200 	mov	x0, #0xffefffffffffffff    	// #-4503599627370497
     964:	9e670001 	fmov	d1, x0
     968:	1e612010 	fcmpe	d0, d1
     96c:	54001264 	b.mi	bb8 <_etoa+0x2a8>  // b.first
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    }

    // determine the sign
    const bool negative = value < 0;
    if (negative) {
     970:	1e602018 	fcmpe	d0, #0.0
     974:	1e614007 	fneg	d7, d0

    conv.F = value;
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     978:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     97c:	fd42c417 	ldr	d23, [x0, #1416]
     980:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     984:	fd42c801 	ldr	d1, [x0, #1424]
     988:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     98c:	fd42cc16 	ldr	d22, [x0, #1432]
     990:	1e604ce7 	fcsel	d7, d7, d0, mi  // mi = first
    // now we want to compute 10^expval but we want to be sure it won't overflow
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     994:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     998:	fd42d006 	ldr	d6, [x0, #1440]
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     99c:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     9a0:	fd42d415 	ldr	d21, [x0, #1448]
     9a4:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     9a8:	fd42d814 	ldr	d20, [x0, #1456]
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     9ac:	1e6f1018 	fmov	d24, #1.500000000000000000e+00
    conv.F = value;
     9b0:	9e6600e1 	fmov	x1, d7
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     9b4:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    const double z2 = z * z;
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     9b8:	1e659002 	fmov	d2, #1.400000000000000000e+01
     9bc:	1e649011 	fmov	d17, #1.000000000000000000e+01
     9c0:	1e631013 	fmov	d19, #6.000000000000000000e+00
     9c4:	1e601010 	fmov	d16, #2.000000000000000000e+00
     9c8:	1e6e1012 	fmov	d18, #1.000000000000000000e+00
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     9cc:	721600c3 	ands	w3, w6, #0x400
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     9d0:	9240cc20 	and	x0, x1, #0xfffffffffffff
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
     9d4:	d374f821 	ubfx	x1, x1, #52, #11
     9d8:	510ffc21 	sub	w1, w1, #0x3ff
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     9dc:	b24c2400 	orr	x0, x0, #0x3ff0000000000000
     9e0:	9e670005 	fmov	d5, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     9e4:	528000c2 	mov	w2, #0x6                   	// #6
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     9e8:	1e620024 	scvtf	d4, w1
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     9ec:	1a821084 	csel	w4, w4, w2, ne  // ne = any
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     9f0:	1e7838a5 	fsub	d5, d5, d24
     9f4:	1e770884 	fmul	d4, d4, d23
     9f8:	1e7608a5 	fmul	d5, d5, d22
     9fc:	1e612884 	fadd	d4, d4, d1
     a00:	1e652884 	fadd	d4, d4, d5
     a04:	1e780098 	fcvtzs	w24, d4
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     a08:	1e620301 	scvtf	d1, w24
     a0c:	1e660824 	fmul	d4, d1, d6
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     a10:	1e750821 	fmul	d1, d1, d21
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     a14:	1e632884 	fadd	d4, d4, d3
     a18:	1e780080 	fcvtzs	w0, d4
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     a1c:	1e620003 	scvtf	d3, w0
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
     a20:	110ffc00 	add	w0, w0, #0x3ff
     a24:	9e670004 	fmov	d4, x0
     a28:	5f745484 	shl	d4, d4, #52
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     a2c:	1e740863 	fmul	d3, d3, d20
     a30:	1e633821 	fsub	d1, d1, d3
    const double z2 = z * z;
     a34:	1e610823 	fmul	d3, d1, d1
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     a38:	1e613a05 	fsub	d5, d16, d1
     a3c:	1e612821 	fadd	d1, d1, d1
     a40:	1e621862 	fdiv	d2, d3, d2
     a44:	1e712842 	fadd	d2, d2, d17
     a48:	1e621862 	fdiv	d2, d3, d2
     a4c:	1e732842 	fadd	d2, d2, d19
     a50:	1e621863 	fdiv	d3, d3, d2
     a54:	1e652863 	fadd	d3, d3, d5
     a58:	1e631821 	fdiv	d1, d1, d3
     a5c:	1e722821 	fadd	d1, d1, d18
     a60:	1e640821 	fmul	d1, d1, d4
    // correct for rounding errors
    if (value < conv.F) {
     a64:	1e672030 	fcmpe	d1, d7
     a68:	54000c4c 	b.gt	bf0 <_etoa+0x2e0>
        expval--;
        conv.F /= 10;
    }

    // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     a6c:	11018f00 	add	w0, w24, #0x63
     a70:	7103181f 	cmp	w0, #0xc6
     a74:	1a9f97fc 	cset	w28, hi  // hi = pmore
     a78:	1100139c 	add	w28, w28, #0x4

    // in "%g" mode, "prec" is the number of *significant figures* not decimals
    if (flags & FLAGS_ADAPT_EXP) {
     a7c:	36580134 	tbz	w20, #11, aa0 <_etoa+0x190>
        // do we want to fall-back to "%f" mode?
        if ((value >= 1e-4) && (value < 1e6)) {
     a80:	90000060 	adrp	x0, c000 <_reclaim_reent+0xc0>
     a84:	fd42dc02 	ldr	d2, [x0, #1464]
     a88:	1e6220f0 	fcmpe	d7, d2
     a8c:	54000d2a 	b.ge	c30 <_etoa+0x320>  // b.tcont
            // no characters in exponent
            minwidth = 0U;
            expval = 0;
        } else {
            // we use one sigfig for the whole part
            if ((prec > 0) && (flags & FLAGS_PRECISION)) {
     a90:	34000084 	cbz	w4, aa0 <_etoa+0x190>
                --prec;
     a94:	7100007f 	cmp	w3, #0x0
     a98:	1a9f07e0 	cset	w0, ne  // ne = any
     a9c:	4b000084 	sub	w4, w4, w0

    // will everything fit?
    unsigned int fwidth = width;
    if (width > minwidth) {
        // we didn't fall-back so subtract the characters required for the exponent
        fwidth -= minwidth;
     aa0:	6b16039f 	cmp	w28, w22
    } else {
        // not enough characters, so go back to default sizing
        fwidth = 0U;
    }
    if ((flags & FLAGS_LEFT) && minwidth) {
     aa4:	121f0280 	and	w0, w20, #0x2
        fwidth -= minwidth;
     aa8:	4b1c02c5 	sub	w5, w22, w28
     aac:	5280003a 	mov	w26, #0x1                   	// #1
     ab0:	1a9f30a5 	csel	w5, w5, wzr, cc  // cc = lo, ul, last
    if ((flags & FLAGS_LEFT) && minwidth) {
     ab4:	7100001f 	cmp	w0, #0x0
     ab8:	1a9f07e0 	cset	w0, ne  // ne = any
     abc:	b9007fe0 	str	w0, [sp, #124]
     ac0:	1a9f00a5 	csel	w5, w5, wzr, eq  // eq = none
        // if we're padding on the right, DON'T pad the floating part
        fwidth = 0U;
    }

    // rescale the float value
    if (expval) {
     ac4:	34000058 	cbz	w24, acc <_etoa+0x1bc>
        value /= conv.F;
     ac8:	1e6118e7 	fdiv	d7, d7, d1
    }

    // output the floating part
    const size_t start_idx = idx;
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     acc:	1e602018 	fcmpe	d0, #0.0
     ad0:	54000ac4 	b.mi	c28 <_etoa+0x318>  // b.first
     ad4:	1e6040e0 	fmov	d0, d7
     ad8:	12147a86 	and	w6, w20, #0xfffff7ff
     adc:	aa1b03e3 	mov	x3, x27
     ae0:	aa1303e2 	mov	x2, x19
     ae4:	aa1903e1 	mov	x1, x25
     ae8:	aa1703e0 	mov	x0, x23
     aec:	94000071 	bl	cb0 <_ftoa>
     af0:	aa0003f5 	mov	x21, x0

    // output the exponent part
    if (minwidth) {
     af4:	3400051a 	cbz	w26, b94 <_etoa+0x284>
        // output the exponential symbol
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     af8:	f27b029f 	tst	x20, #0x20
     afc:	528008a1 	mov	w1, #0x45                  	// #69
     b00:	aa1503e2 	mov	x2, x21
     b04:	aa1b03e3 	mov	x3, x27
     b08:	52800ca0 	mov	w0, #0x65                  	// #101
     b0c:	1a801020 	csel	w0, w1, w0, ne  // ne = any
     b10:	aa1903e1 	mov	x1, x25
     b14:	d63f02e0 	blr	x23
        // output the exponent value
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     b18:	7100031f 	cmp	w24, #0x0
     b1c:	528000a0 	mov	w0, #0x5                   	// #5
     b20:	5a98a704 	cneg	w4, w24, lt  // lt = tstop
     b24:	5100079c 	sub	w28, w28, #0x1
     b28:	b90003fc 	str	w28, [sp]
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     b2c:	910006a2 	add	x2, x21, #0x1
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     b30:	b9000be0 	str	w0, [sp, #8]
     b34:	93407c84 	sxtw	x4, w4
     b38:	531f7f05 	lsr	w5, w24, #31
     b3c:	aa1b03e3 	mov	x3, x27
     b40:	aa1903e1 	mov	x1, x25
     b44:	aa1703e0 	mov	x0, x23
     b48:	52800007 	mov	w7, #0x0                   	// #0
     b4c:	d2800146 	mov	x6, #0xa                   	// #10
     b50:	97fffebc 	bl	640 <_ntoa_long>
     b54:	aa0003f5 	mov	x21, x0
        // might need to right-pad spaces
        if (flags & FLAGS_LEFT) {
     b58:	b9407fe0 	ldr	w0, [sp, #124]
     b5c:	340001c0 	cbz	w0, b94 <_etoa+0x284>
            while (idx - start_idx < width)
     b60:	cb1302b3 	sub	x19, x21, x19
     b64:	eb1302df 	cmp	x22, x19
     b68:	54000169 	b.ls	b94 <_etoa+0x284>  // b.plast
     b6c:	d503201f 	nop
                out(' ', buffer, idx++, maxlen);
     b70:	aa1503e2 	mov	x2, x21
            while (idx - start_idx < width)
     b74:	91000673 	add	x19, x19, #0x1
                out(' ', buffer, idx++, maxlen);
     b78:	aa1b03e3 	mov	x3, x27
     b7c:	aa1903e1 	mov	x1, x25
     b80:	52800400 	mov	w0, #0x20                  	// #32
     b84:	d63f02e0 	blr	x23
     b88:	910006b5 	add	x21, x21, #0x1
            while (idx - start_idx < width)
     b8c:	eb1302df 	cmp	x22, x19
     b90:	54ffff08 	b.hi	b70 <_etoa+0x260>  // b.pmore
        }
    }
    return idx;
}
     b94:	aa1503e0 	mov	x0, x21
     b98:	a9417bfd 	ldp	x29, x30, [sp, #16]
     b9c:	a94253f3 	ldp	x19, x20, [sp, #32]
     ba0:	a9435bf5 	ldp	x21, x22, [sp, #48]
     ba4:	a94463f7 	ldp	x23, x24, [sp, #64]
     ba8:	a9456bf9 	ldp	x25, x26, [sp, #80]
     bac:	a94673fb 	ldp	x27, x28, [sp, #96]
     bb0:	910203ff 	add	sp, sp, #0x80
     bb4:	d65f03c0 	ret
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
     bb8:	2a1403e6 	mov	w6, w20
     bbc:	2a1603e5 	mov	w5, w22
     bc0:	aa1b03e3 	mov	x3, x27
     bc4:	aa1303e2 	mov	x2, x19
     bc8:	aa1903e1 	mov	x1, x25
     bcc:	aa1703e0 	mov	x0, x23
}
     bd0:	a9417bfd 	ldp	x29, x30, [sp, #16]
     bd4:	a94253f3 	ldp	x19, x20, [sp, #32]
     bd8:	a9435bf5 	ldp	x21, x22, [sp, #48]
     bdc:	a94463f7 	ldp	x23, x24, [sp, #64]
     be0:	a9456bf9 	ldp	x25, x26, [sp, #80]
     be4:	a94673fb 	ldp	x27, x28, [sp, #96]
     be8:	910203ff 	add	sp, sp, #0x80
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     bec:	14000031 	b	cb0 <_ftoa>
        conv.F /= 10;
     bf0:	1e711821 	fdiv	d1, d1, d17
        expval--;
     bf4:	51000718 	sub	w24, w24, #0x1
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     bf8:	11018f00 	add	w0, w24, #0x63
     bfc:	7103181f 	cmp	w0, #0xc6
     c00:	1a9f97fc 	cset	w28, hi  // hi = pmore
     c04:	1100139c 	add	w28, w28, #0x4
    if (flags & FLAGS_ADAPT_EXP) {
     c08:	365ff4d4 	tbz	w20, #11, aa0 <_etoa+0x190>
     c0c:	17ffff9d 	b	a80 <_etoa+0x170>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     c10:	2a0003f4 	mov	w20, w0
        fwidth = 0U;
     c14:	52800005 	mov	w5, #0x0                   	// #0
            minwidth = 0U;
     c18:	5280001c 	mov	w28, #0x0                   	// #0
            expval = 0;
     c1c:	52800018 	mov	w24, #0x0                   	// #0
    if ((flags & FLAGS_LEFT) && minwidth) {
     c20:	5280001a 	mov	w26, #0x0                   	// #0
     c24:	b9007fff 	str	wzr, [sp, #124]
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     c28:	1e6140e7 	fneg	d7, d7
     c2c:	17ffffaa 	b	ad4 <_etoa+0x1c4>
        if ((value >= 1e-4) && (value < 1e6)) {
     c30:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     c34:	f2e825c0 	movk	x0, #0x412e, lsl #48
     c38:	9e670002 	fmov	d2, x0
     c3c:	1e6220f0 	fcmpe	d7, d2
     c40:	54000044 	b.mi	c48 <_etoa+0x338>  // b.first
     c44:	17ffff93 	b	a90 <_etoa+0x180>
                prec = (unsigned)((int)prec - expval - 1);
     c48:	6b180080 	subs	w0, w4, w24
     c4c:	51000404 	sub	w4, w0, #0x1
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     c50:	32160280 	orr	w0, w20, #0x400
                prec = (unsigned)((int)prec - expval - 1);
     c54:	1a9fc084 	csel	w4, w4, wzr, gt
    if (width > minwidth) {
     c58:	35000196 	cbnz	w22, c88 <_etoa+0x378>
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     c5c:	1e602018 	fcmpe	d0, #0.0
     c60:	54fffd84 	b.mi	c10 <_etoa+0x300>  // b.first
     c64:	12147a86 	and	w6, w20, #0xfffff7ff
     c68:	1e6040e0 	fmov	d0, d7
     c6c:	321600c6 	orr	w6, w6, #0x400
     c70:	aa1b03e3 	mov	x3, x27
     c74:	aa1303e2 	mov	x2, x19
     c78:	aa1903e1 	mov	x1, x25
     c7c:	aa1703e0 	mov	x0, x23
     c80:	52800005 	mov	w5, #0x0                   	// #0
     c84:	17ffffd3 	b	bd0 <_etoa+0x2c0>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     c88:	2a0003f4 	mov	w20, w0
    if (width > minwidth) {
     c8c:	2a1603e5 	mov	w5, w22
     c90:	5280001a 	mov	w26, #0x0                   	// #0
     c94:	52800018 	mov	w24, #0x0                   	// #0
            minwidth = 0U;
     c98:	5280001c 	mov	w28, #0x0                   	// #0
    if (width > minwidth) {
     c9c:	b9007fff 	str	wzr, [sp, #124]
     ca0:	17ffff8b 	b	acc <_etoa+0x1bc>
     ca4:	d503201f 	nop
     ca8:	d503201f 	nop
     cac:	d503201f 	nop

0000000000000cb0 <_ftoa>:
    if (value != value)
     cb0:	1e602000 	fcmp	d0, d0
{
     cb4:	2a0603e7 	mov	w7, w6
    if (value != value)
     cb8:	54000e01 	b.ne	e78 <_ftoa+0x1c8>  // b.any
    if (value < -DBL_MAX)
     cbc:	92e00206 	mov	x6, #0xffefffffffffffff    	// #-4503599627370497
     cc0:	9e6700c1 	fmov	d1, x6
     cc4:	1e612010 	fcmpe	d0, d1
     cc8:	54001184 	b.mi	ef8 <_ftoa+0x248>  // b.first
     ccc:	aa0003ef 	mov	x15, x0
    if (value > DBL_MAX)
     cd0:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     cd4:	9e670001 	fmov	d1, x0
     cd8:	aa0103f0 	mov	x16, x1
     cdc:	aa0203f1 	mov	x17, x2
     ce0:	aa0303f2 	mov	x18, x3
     ce4:	1e612010 	fcmpe	d0, d1
     ce8:	54000b2c 	b.gt	e4c <_ftoa+0x19c>
    if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
     cec:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     cf0:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     cf4:	9e670001 	fmov	d1, x0
     cf8:	1e612010 	fcmpe	d0, d1
     cfc:	54000f2c 	b.gt	ee0 <_ftoa+0x230>
     d00:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     d04:	f2f839a0 	movk	x0, #0xc1cd, lsl #48
     d08:	9e670001 	fmov	d1, x0
     d0c:	1e612010 	fcmpe	d0, d1
     d10:	54000e84 	b.mi	ee0 <_ftoa+0x230>  // b.first
    if (value < 0) {
     d14:	1e602018 	fcmpe	d0, #0.0
{
     d18:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     d1c:	910003fd 	mov	x29, sp
    if (value < 0) {
     d20:	54000ca4 	b.mi	eb4 <_ftoa+0x204>  // b.first
    bool negative = false;
     d24:	52800003 	mov	w3, #0x0                   	// #0
    if (!(flags & FLAGS_PRECISION)) {
     d28:	36500ce7 	tbz	w7, #10, ec4 <_ftoa+0x214>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     d2c:	7100249f 	cmp	w4, #0x9
     d30:	910043ec 	add	x12, sp, #0x10
     d34:	d2800008 	mov	x8, #0x0                   	// #0
        buf[len++] = '0';
     d38:	52800601 	mov	w1, #0x30                  	// #48
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     d3c:	54001929 	b.ls	1060 <_ftoa+0x3b0>  // b.plast
        buf[len++] = '0';
     d40:	91000508 	add	x8, x8, #0x1
        prec--;
     d44:	51000484 	sub	w4, w4, #0x1
        buf[len++] = '0';
     d48:	8b080180 	add	x0, x12, x8
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     d4c:	f1007d1f 	cmp	x8, #0x1f
     d50:	7a499880 	ccmp	w4, #0x9, #0x0, ls  // ls = plast
        buf[len++] = '0';
     d54:	381ff001 	sturb	w1, [x0, #-1]
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     d58:	54ffff48 	b.hi	d40 <_ftoa+0x90>  // b.pmore
     d5c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     d60:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     d64:	9e670002 	fmov	d2, x0
    int whole = (int)value;
     d68:	1e78000a 	fcvtzs	w10, d0
    if (diff > 0.5) {
     d6c:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    double tmp = (value - whole) * pow10[prec];
     d70:	1e620141 	scvtf	d1, w10
     d74:	1e613801 	fsub	d1, d0, d1
     d78:	1e620821 	fmul	d1, d1, d2
    unsigned long frac = (unsigned long)tmp;
     d7c:	9e79002e 	fcvtzu	x14, d1
    diff = tmp - frac;
     d80:	9e6301c4 	ucvtf	d4, x14
     d84:	1e643821 	fsub	d1, d1, d4
    if (diff > 0.5) {
     d88:	1e632030 	fcmpe	d1, d3
     d8c:	5400112c 	b.gt	fb0 <_ftoa+0x300>
    } else if (diff < 0.5) {
     d90:	54000084 	b.mi	da0 <_ftoa+0xf0>  // b.first
    } else if ((frac == 0U) || (frac & 1U)) {
     d94:	b500154e 	cbnz	x14, 103c <_ftoa+0x38c>
        ++frac;
     d98:	910005ce 	add	x14, x14, #0x1
     d9c:	d503201f 	nop
    if (prec == 0U) {
     da0:	35000b64 	cbnz	w4, f0c <_ftoa+0x25c>
        diff = value - (double)whole;
     da4:	1e620141 	scvtf	d1, w10
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     da8:	1e6c1002 	fmov	d2, #5.000000000000000000e-01
        diff = value - (double)whole;
     dac:	1e613800 	fsub	d0, d0, d1
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     db0:	1e622010 	fcmpe	d0, d2
     db4:	540011a4 	b.mi	fe8 <_ftoa+0x338>  // b.first
            ++whole;
     db8:	12000140 	and	w0, w10, #0x1
     dbc:	0b00014a 	add	w10, w10, w0
        buf[len++] = (char)(48 + (whole % 10));
     dc0:	528ccce1 	mov	w1, #0x6667                	// #26215
     dc4:	72acccc1 	movk	w1, #0x6666, lsl #16
     dc8:	52800142 	mov	w2, #0xa                   	// #10
     dcc:	d503201f 	nop
     dd0:	9b217d49 	smull	x9, w10, w1
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
     dd4:	f100811f 	cmp	x8, #0x20
     dd8:	54000c20 	b.eq	f5c <_ftoa+0x2ac>  // b.none
        buf[len++] = (char)(48 + (whole % 10));
     ddc:	9362fd29 	asr	x9, x9, #34
     de0:	91000508 	add	x8, x8, #0x1
     de4:	4b8a7d29 	sub	w9, w9, w10, asr #31
     de8:	8b080180 	add	x0, x12, x8
     dec:	1b02a92b 	msub	w11, w9, w2, w10
        if (!(whole /= 10)) {
     df0:	2a0903ea 	mov	w10, w9
        buf[len++] = (char)(48 + (whole % 10));
     df4:	1100c169 	add	w9, w11, #0x30
     df8:	381ff009 	sturb	w9, [x0, #-1]
        if (!(whole /= 10)) {
     dfc:	35fffeaa 	cbnz	w10, dd0 <_ftoa+0x120>
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     e00:	120004e0 	and	w0, w7, #0x3
     e04:	7100041f 	cmp	w0, #0x1
     e08:	54000b00 	b.eq	f68 <_ftoa+0x2b8>  // b.none
    if (len < PRINTF_FTOA_BUFFER_SIZE) {
     e0c:	f1007d1f 	cmp	x8, #0x1f
     e10:	540000a8 	b.hi	e24 <_ftoa+0x174>  // b.pmore
        if (negative) {
     e14:	34000de3 	cbz	w3, fd0 <_ftoa+0x320>
            buf[len++] = '-';
     e18:	528005a0 	mov	w0, #0x2d                  	// #45
     e1c:	38286980 	strb	w0, [x12, x8]
     e20:	91000508 	add	x8, x8, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     e24:	2a0503e6 	mov	w6, w5
     e28:	aa0c03e4 	mov	x4, x12
     e2c:	aa0803e5 	mov	x5, x8
     e30:	aa1203e3 	mov	x3, x18
     e34:	aa1103e2 	mov	x2, x17
     e38:	aa1003e1 	mov	x1, x16
     e3c:	aa0f03e0 	mov	x0, x15
     e40:	97fffdbc 	bl	530 <_out_rev>
}
     e44:	a8c37bfd 	ldp	x29, x30, [sp], #48
     e48:	d65f03c0 	ret
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     e4c:	37100207 	tbnz	w7, #2, e8c <_ftoa+0x1dc>
     e50:	d2800060 	mov	x0, #0x3                   	// #3
     e54:	2a0503e6 	mov	w6, w5
     e58:	90000064 	adrp	x4, c000 <_reclaim_reent+0xc0>
     e5c:	91116084 	add	x4, x4, #0x458
     e60:	aa0003e5 	mov	x5, x0
     e64:	aa1203e3 	mov	x3, x18
     e68:	aa1103e2 	mov	x2, x17
     e6c:	aa1003e1 	mov	x1, x16
     e70:	aa0f03e0 	mov	x0, x15
     e74:	17fffdaf 	b	530 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
     e78:	2a0503e6 	mov	w6, w5
     e7c:	90000064 	adrp	x4, c000 <_reclaim_reent+0xc0>
     e80:	d2800065 	mov	x5, #0x3                   	// #3
     e84:	9111a084 	add	x4, x4, #0x468
     e88:	17fffdaa 	b	530 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     e8c:	d2800080 	mov	x0, #0x4                   	// #4
     e90:	2a0503e6 	mov	w6, w5
     e94:	90000064 	adrp	x4, c000 <_reclaim_reent+0xc0>
     e98:	91118084 	add	x4, x4, #0x460
     e9c:	aa0003e5 	mov	x5, x0
     ea0:	aa1203e3 	mov	x3, x18
     ea4:	aa1103e2 	mov	x2, x17
     ea8:	aa1003e1 	mov	x1, x16
     eac:	aa0f03e0 	mov	x0, x15
     eb0:	17fffda0 	b	530 <_out_rev>
        value = 0 - value;
     eb4:	2f00e401 	movi	d1, #0x0
        negative = true;
     eb8:	52800023 	mov	w3, #0x1                   	// #1
        value = 0 - value;
     ebc:	1e603820 	fsub	d0, d1, d0
    if (!(flags & FLAGS_PRECISION)) {
     ec0:	3757f367 	tbnz	w7, #10, d2c <_ftoa+0x7c>
     ec4:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     ec8:	910043ec 	add	x12, sp, #0x10
     ecc:	f2e825c0 	movk	x0, #0x412e, lsl #48
     ed0:	d2800008 	mov	x8, #0x0                   	// #0
     ed4:	9e670002 	fmov	d2, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     ed8:	528000c4 	mov	w4, #0x6                   	// #6
     edc:	17ffffa3 	b	d68 <_ftoa+0xb8>
        return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
     ee0:	2a0703e6 	mov	w6, w7
     ee4:	aa1203e3 	mov	x3, x18
     ee8:	aa1103e2 	mov	x2, x17
     eec:	aa1003e1 	mov	x1, x16
     ef0:	aa0f03e0 	mov	x0, x15
     ef4:	17fffe87 	b	910 <_etoa>
        return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
     ef8:	2a0503e6 	mov	w6, w5
     efc:	90000064 	adrp	x4, c000 <_reclaim_reent+0xc0>
     f00:	d2800085 	mov	x5, #0x4                   	// #4
     f04:	9111c084 	add	x4, x4, #0x470
     f08:	17fffd8a 	b	530 <_out_rev>
     f0c:	51008081 	sub	w1, w4, #0x20
            buf[len++] = (char)(48U + (frac % 10U));
     f10:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
     f14:	0b080021 	add	w1, w1, w8
     f18:	f29999a2 	movk	x2, #0xcccd
     f1c:	1400000d 	b	f50 <_ftoa+0x2a0>
     f20:	d343fd6b 	lsr	x11, x11, #3
            if (!(frac /= 10U)) {
     f24:	f10025df 	cmp	x14, #0x9
            --count;
     f28:	51000480 	sub	w0, w4, #0x1
            buf[len++] = (char)(48U + (frac % 10U));
     f2c:	91000509 	add	x9, x8, #0x1
     f30:	8b0b096d 	add	x13, x11, x11, lsl #2
     f34:	cb0d05cd 	sub	x13, x14, x13, lsl #1
            if (!(frac /= 10U)) {
     f38:	aa0b03ee 	mov	x14, x11
            buf[len++] = (char)(48U + (frac % 10U));
     f3c:	1100c1ab 	add	w11, w13, #0x30
     f40:	3828698b 	strb	w11, [x12, x8]
            if (!(frac /= 10U)) {
     f44:	54000569 	b.ls	ff0 <_ftoa+0x340>  // b.plast
            --count;
     f48:	2a0003e4 	mov	w4, w0
            buf[len++] = (char)(48U + (frac % 10U));
     f4c:	aa0903e8 	mov	x8, x9
     f50:	9bc27dcb 	umulh	x11, x14, x2
        while (len < PRINTF_FTOA_BUFFER_SIZE) {
     f54:	6b01009f 	cmp	w4, w1
     f58:	54fffe41 	b.ne	f20 <_ftoa+0x270>  // b.any
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     f5c:	120004e0 	and	w0, w7, #0x3
     f60:	7100041f 	cmp	w0, #0x1
     f64:	54fff601 	b.ne	e24 <_ftoa+0x174>  // b.any
        if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     f68:	34fff525 	cbz	w5, e0c <_ftoa+0x15c>
     f6c:	35000763 	cbnz	w3, 1058 <_ftoa+0x3a8>
     f70:	721e04ff 	tst	w7, #0xc
     f74:	54000721 	b.ne	1058 <_ftoa+0x3a8>  // b.any
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     f78:	2a0503e1 	mov	w1, w5
     f7c:	eb01011f 	cmp	x8, x1
     f80:	54fff462 	b.cs	e0c <_ftoa+0x15c>  // b.hs, b.nlast
     f84:	f1007d1f 	cmp	x8, #0x1f
            buf[len++] = '0';
     f88:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     f8c:	54fff4c8 	b.hi	e24 <_ftoa+0x174>  // b.pmore
            buf[len++] = '0';
     f90:	91000508 	add	x8, x8, #0x1
     f94:	8b080180 	add	x0, x12, x8
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     f98:	eb01011f 	cmp	x8, x1
            buf[len++] = '0';
     f9c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     fa0:	54fff360 	b.eq	e0c <_ftoa+0x15c>  // b.none
     fa4:	f100811f 	cmp	x8, #0x20
     fa8:	54ffff41 	b.ne	f90 <_ftoa+0x2e0>  // b.any
     fac:	17ffff9e 	b	e24 <_ftoa+0x174>
        ++frac;
     fb0:	910005ce 	add	x14, x14, #0x1
        if (frac >= pow10[prec]) {
     fb4:	9e6301c1 	ucvtf	d1, x14
     fb8:	1e622030 	fcmpe	d1, d2
     fbc:	5400004a 	b.ge	fc4 <_ftoa+0x314>  // b.tcont
     fc0:	17ffff78 	b	da0 <_ftoa+0xf0>
            ++whole;
     fc4:	1100054a 	add	w10, w10, #0x1
            frac = 0;
     fc8:	d280000e 	mov	x14, #0x0                   	// #0
     fcc:	17ffff75 	b	da0 <_ftoa+0xf0>
        } else if (flags & FLAGS_PLUS) {
     fd0:	371003c7 	tbnz	w7, #2, 1048 <_ftoa+0x398>
        } else if (flags & FLAGS_SPACE) {
     fd4:	361ff287 	tbz	w7, #3, e24 <_ftoa+0x174>
            buf[len++] = ' ';
     fd8:	52800400 	mov	w0, #0x20                  	// #32
     fdc:	38286980 	strb	w0, [x12, x8]
     fe0:	91000508 	add	x8, x8, #0x1
     fe4:	17ffff90 	b	e24 <_ftoa+0x174>
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     fe8:	54ffee8c 	b.gt	db8 <_ftoa+0x108>
     fec:	17ffff75 	b	dc0 <_ftoa+0x110>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     ff0:	f100813f 	cmp	x9, #0x20
     ff4:	54000420 	b.eq	1078 <_ftoa+0x3c8>  // b.none
     ff8:	91000901 	add	x1, x8, #0x2
     ffc:	51000884 	sub	w4, w4, #0x2
    1000:	8b040021 	add	x1, x1, x4
            buf[len++] = '0';
    1004:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1008:	34000340 	cbz	w0, 1070 <_ftoa+0x3c0>
    100c:	d503201f 	nop
            buf[len++] = '0';
    1010:	91000529 	add	x9, x9, #0x1
    1014:	8b090180 	add	x0, x12, x9
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1018:	f100813f 	cmp	x9, #0x20
            buf[len++] = '0';
    101c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1020:	540002c0 	b.eq	1078 <_ftoa+0x3c8>  // b.none
    1024:	eb01013f 	cmp	x9, x1
    1028:	54ffff41 	b.ne	1010 <_ftoa+0x360>  // b.any
            buf[len++] = '.';
    102c:	528005c0 	mov	w0, #0x2e                  	// #46
    1030:	91000428 	add	x8, x1, #0x1
    1034:	38216980 	strb	w0, [x12, x1]
    1038:	17ffff62 	b	dc0 <_ftoa+0x110>
    } else if ((frac == 0U) || (frac & 1U)) {
    103c:	3607eb2e 	tbz	w14, #0, da0 <_ftoa+0xf0>
        ++frac;
    1040:	910005ce 	add	x14, x14, #0x1
    1044:	17ffff57 	b	da0 <_ftoa+0xf0>
            buf[len++] = '+'; // ignore the space if the '+' exists
    1048:	52800560 	mov	w0, #0x2b                  	// #43
    104c:	38286980 	strb	w0, [x12, x8]
    1050:	91000508 	add	x8, x8, #0x1
    1054:	17ffff74 	b	e24 <_ftoa+0x174>
            width--;
    1058:	510004a5 	sub	w5, w5, #0x1
    105c:	17ffffc7 	b	f78 <_ftoa+0x2c8>
    double tmp = (value - whole) * pow10[prec];
    1060:	f0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    1064:	9114e000 	add	x0, x0, #0x538
    1068:	fc645802 	ldr	d2, [x0, w4, uxtw #3]
    106c:	17ffff3f 	b	d68 <_ftoa+0xb8>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1070:	aa0903e1 	mov	x1, x9
    1074:	17ffffee 	b	102c <_ftoa+0x37c>
            buf[len++] = '0';
    1078:	aa0903e8 	mov	x8, x9
    107c:	17ffffb8 	b	f5c <_ftoa+0x2ac>

0000000000001080 <_out_char>:
    if (character) {
    1080:	72001c00 	ands	w0, w0, #0xff
    1084:	54000041 	b.ne	108c <_out_char+0xc>  // b.any
}
    1088:	d65f03c0 	ret
        _putchar(character);
    108c:	17fffd05 	b	4a0 <putc>

0000000000001090 <_out_fct>:
    if (character) {
    1090:	72001c00 	ands	w0, w0, #0xff
    1094:	54000080 	b.eq	10a4 <_out_fct+0x14>  // b.none
        ((out_fct_wrap_type*)buffer)->fct(character, ((out_fct_wrap_type*)buffer)->arg);
    1098:	a9400422 	ldp	x2, x1, [x1]
    109c:	aa0203f0 	mov	x16, x2
    10a0:	d61f0200 	br	x16
}
    10a4:	d65f03c0 	ret
    10a8:	d503201f 	nop
    10ac:	d503201f 	nop

00000000000010b0 <_vsnprintf>:
#endif // PRINTF_SUPPORT_EXPONENTIAL
#endif // PRINTF_SUPPORT_FLOAT

// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
    10b0:	d102c3ff 	sub	sp, sp, #0xb0
    unsigned int flags, width, precision, n;
    size_t idx = 0U;

    if (!buffer) {
        // use null output function
        out = _out_null;
    10b4:	f100003f 	cmp	x1, #0x0
{
    10b8:	a9017bfd 	stp	x29, x30, [sp, #16]
    10bc:	910043fd 	add	x29, sp, #0x10
    10c0:	a90253f3 	stp	x19, x20, [sp, #32]
        out = _out_null;
    10c4:	f0fffff3 	adrp	x19, 0 <main>
    10c8:	91148273 	add	x19, x19, #0x520
{
    10cc:	a9056bf9 	stp	x25, x26, [sp, #80]
        out = _out_null;
    10d0:	9a800273 	csel	x19, x19, x0, eq  // eq = none
{
    10d4:	aa0103fa 	mov	x26, x1
    10d8:	a90673fb 	stp	x27, x28, [sp, #96]
    10dc:	aa0203fc 	mov	x28, x2
    }

    while (*format) {
    10e0:	d280001b 	mov	x27, #0x0                   	// #0
    10e4:	b9401880 	ldr	w0, [x4, #24]
    10e8:	b9007be0 	str	w0, [sp, #120]
    10ec:	f9400480 	ldr	x0, [x4, #8]
    10f0:	f90047e0 	str	x0, [sp, #136]
    10f4:	39400065 	ldrb	w5, [x3]
    10f8:	f9400880 	ldr	x0, [x4, #16]
    10fc:	f9004be0 	str	x0, [sp, #144]
    1100:	b9401c80 	ldr	w0, [x4, #28]
    1104:	b900abe0 	str	w0, [sp, #168]
    1108:	f9400094 	ldr	x20, [x4]
    110c:	34003ae5 	cbz	w5, 1868 <_vsnprintf+0x7b8>
    1110:	a90463f7 	stp	x23, x24, [sp, #64]
        default:
            break;
        }

        // evaluate specifier
        switch (*format) {
    1114:	f0000058 	adrp	x24, c000 <_reclaim_reent+0xc0>
    1118:	9111e300 	add	x0, x24, #0x478
    111c:	aa0303f9 	mov	x25, x3
    1120:	f90043e0 	str	x0, [sp, #128]
    1124:	f0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    1128:	91148000 	add	x0, x0, #0x520
    112c:	f9004fe0 	str	x0, [sp, #152]
    1130:	1400000a 	b	1158 <_vsnprintf+0xa8>
            out(*format, buffer, idx++, maxlen);
    1134:	91000764 	add	x4, x27, #0x1
    1138:	2a0503e0 	mov	w0, w5
            out('%', buffer, idx++, maxlen);
            format++;
            break;

        default:
            out(*format, buffer, idx++, maxlen);
    113c:	aa1b03e2 	mov	x2, x27
    1140:	aa1c03e3 	mov	x3, x28
    1144:	aa1a03e1 	mov	x1, x26
    1148:	aa0403fb 	mov	x27, x4
    114c:	d63f0260 	blr	x19
    while (*format) {
    1150:	39400325 	ldrb	w5, [x25]
    1154:	34000c85 	cbz	w5, 12e4 <_vsnprintf+0x234>
            format++;
    1158:	91000739 	add	x25, x25, #0x1
        if (*format != '%') {
    115c:	710094bf 	cmp	w5, #0x25
    1160:	54fffea1 	b.ne	1134 <_vsnprintf+0x84>  // b.any
            switch (*format) {
    1164:	aa1903e8 	mov	x8, x25
        flags = 0U;
    1168:	52800006 	mov	w6, #0x0                   	// #0
            switch (*format) {
    116c:	38401500 	ldrb	w0, [x8], #1
    1170:	7100ac1f 	cmp	w0, #0x2b
    1174:	54000180 	b.eq	11a4 <_vsnprintf+0xf4>  // b.none
    1178:	540001c8 	b.hi	11b0 <_vsnprintf+0x100>  // b.pmore
    117c:	7100801f 	cmp	w0, #0x20
    1180:	54000260 	b.eq	11cc <_vsnprintf+0x11c>  // b.none
    1184:	71008c1f 	cmp	w0, #0x23
    1188:	540002e1 	b.ne	11e4 <_vsnprintf+0x134>  // b.any
                flags |= FLAGS_HASH;
    118c:	321c00c6 	orr	w6, w6, #0x10
            format++;
    1190:	aa0803f9 	mov	x25, x8
            switch (*format) {
    1194:	aa1903e8 	mov	x8, x25
    1198:	38401500 	ldrb	w0, [x8], #1
    119c:	7100ac1f 	cmp	w0, #0x2b
    11a0:	54fffec1 	b.ne	1178 <_vsnprintf+0xc8>  // b.any
                flags |= FLAGS_PLUS;
    11a4:	321e00c6 	orr	w6, w6, #0x4
            format++;
    11a8:	aa0803f9 	mov	x25, x8
    11ac:	17fffffa 	b	1194 <_vsnprintf+0xe4>
            switch (*format) {
    11b0:	7100b41f 	cmp	w0, #0x2d
    11b4:	54000120 	b.eq	11d8 <_vsnprintf+0x128>  // b.none
    11b8:	7100c01f 	cmp	w0, #0x30
    11bc:	540062c1 	b.ne	1e14 <_vsnprintf+0xd64>  // b.any
                flags |= FLAGS_ZEROPAD;
    11c0:	320000c6 	orr	w6, w6, #0x1
            format++;
    11c4:	aa0803f9 	mov	x25, x8
    11c8:	17fffff3 	b	1194 <_vsnprintf+0xe4>
                flags |= FLAGS_SPACE;
    11cc:	321d00c6 	orr	w6, w6, #0x8
            format++;
    11d0:	aa0803f9 	mov	x25, x8
    11d4:	17fffff0 	b	1194 <_vsnprintf+0xe4>
                flags |= FLAGS_LEFT;
    11d8:	321f00c6 	orr	w6, w6, #0x2
            format++;
    11dc:	aa0803f9 	mov	x25, x8
    11e0:	17ffffed 	b	1194 <_vsnprintf+0xe4>
        } else if (*format == '*') {
    11e4:	7100a81f 	cmp	w0, #0x2a
        width = 0U;
    11e8:	52800018 	mov	w24, #0x0                   	// #0
        } else if (*format == '*') {
    11ec:	540002e0 	b.eq	1248 <_vsnprintf+0x198>  // b.none
        precision = 0U;
    11f0:	52800017 	mov	w23, #0x0                   	// #0
        switch (*format) {
    11f4:	7101b01f 	cmp	w0, #0x6c
            format++;
    11f8:	aa0803e4 	mov	x4, x8
        switch (*format) {
    11fc:	54001f20 	b.eq	15e0 <_vsnprintf+0x530>  // b.none
    1200:	54000588 	b.hi	12b0 <_vsnprintf+0x200>  // b.pmore
    1204:	7101a01f 	cmp	w0, #0x68
    1208:	54001e20 	b.eq	15cc <_vsnprintf+0x51c>  // b.none
    120c:	7101a81f 	cmp	w0, #0x6a
    1210:	54006241 	b.ne	1e58 <_vsnprintf+0xda8>  // b.any
        switch (*format) {
    1214:	39400720 	ldrb	w0, [x25, #1]
            flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    1218:	321800c6 	orr	w6, w6, #0x100
        switch (*format) {
    121c:	51009402 	sub	w2, w0, #0x25
            format++;
    1220:	91000499 	add	x25, x4, #0x1
        switch (*format) {
    1224:	71014c5f 	cmp	w2, #0x53
    1228:	54000069 	b.ls	1234 <_vsnprintf+0x184>  // b.plast
            out(*format, buffer, idx++, maxlen);
    122c:	91000764 	add	x4, x27, #0x1
    1230:	17ffffc3 	b	113c <_vsnprintf+0x8c>
        switch (*format) {
    1234:	f94043e1 	ldr	x1, [sp, #128]
    1238:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    123c:	10000062 	adr	x2, 1248 <_vsnprintf+0x198>
    1240:	8b21a841 	add	x1, x2, w1, sxth #2
    1244:	d61f0020 	br	x1
            const int w = va_arg(va, int);
    1248:	b9407be0 	ldr	w0, [sp, #120]
    124c:	37f806c0 	tbnz	w0, #31, 1324 <_vsnprintf+0x274>
    1250:	91002e82 	add	x2, x20, #0xb
    1254:	aa1403e0 	mov	x0, x20
    1258:	927df054 	and	x20, x2, #0xfffffffffffffff8
    125c:	b9400018 	ldr	w24, [x0]
            if (w < 0) {
    1260:	36f80078 	tbz	w24, #31, 126c <_vsnprintf+0x1bc>
                flags |= FLAGS_LEFT; // reverse padding
    1264:	321f00c6 	orr	w6, w6, #0x2
                width = (unsigned int)-w;
    1268:	4b1803f8 	neg	w24, w24
        if (*format == '.') {
    126c:	39400720 	ldrb	w0, [x25, #1]
            format++;
    1270:	aa0803f9 	mov	x25, x8
    1274:	91000508 	add	x8, x8, #0x1
        if (*format == '.') {
    1278:	7100b81f 	cmp	w0, #0x2e
    127c:	54fffba1 	b.ne	11f0 <_vsnprintf+0x140>  // b.any
            if (_is_digit(*format)) {
    1280:	39400720 	ldrb	w0, [x25, #1]
            flags |= FLAGS_PRECISION;
    1284:	321600c6 	orr	w6, w6, #0x400
            format++;
    1288:	aa0803e4 	mov	x4, x8
    return (ch >= '0') && (ch <= '9');
    128c:	5100c002 	sub	w2, w0, #0x30
            if (_is_digit(*format)) {
    1290:	12001c42 	and	w2, w2, #0xff
    1294:	7100245f 	cmp	w2, #0x9
    1298:	54001b29 	b.ls	15fc <_vsnprintf+0x54c>  // b.plast
            } else if (*format == '*') {
    129c:	7100a81f 	cmp	w0, #0x2a
    12a0:	54002a20 	b.eq	17e4 <_vsnprintf+0x734>  // b.none
            format++;
    12a4:	aa0803f9 	mov	x25, x8
    12a8:	91000508 	add	x8, x8, #0x1
    12ac:	17ffffd1 	b	11f0 <_vsnprintf+0x140>
        switch (*format) {
    12b0:	7101d01f 	cmp	w0, #0x74
    12b4:	54fffb00 	b.eq	1214 <_vsnprintf+0x164>  // b.none
    12b8:	7101e81f 	cmp	w0, #0x7a
    12bc:	54fffac0 	b.eq	1214 <_vsnprintf+0x164>  // b.none
        switch (*format) {
    12c0:	5101bc02 	sub	w2, w0, #0x6f
            format++;
    12c4:	aa0803f9 	mov	x25, x8
        switch (*format) {
    12c8:	7100245f 	cmp	w2, #0x9
    12cc:	54fffb08 	b.hi	122c <_vsnprintf+0x17c>  // b.pmore
    12d0:	f9404fe1 	ldr	x1, [sp, #152]
    12d4:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    12d8:	10000062 	adr	x2, 12e4 <_vsnprintf+0x234>
    12dc:	8b21a841 	add	x1, x2, w1, sxth #2
    12e0:	d61f0020 	br	x1
    12e4:	a94463f7 	ldp	x23, x24, [sp, #64]

    // termination
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);

    // return written chars without terminating \0
    return (int)idx;
    12e8:	2a1b03f4 	mov	w20, w27
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
    12ec:	eb1b039f 	cmp	x28, x27
    12f0:	d1000782 	sub	x2, x28, #0x1
    12f4:	aa1a03e1 	mov	x1, x26
    12f8:	9a9b9042 	csel	x2, x2, x27, ls  // ls = plast
    12fc:	aa1c03e3 	mov	x3, x28
    1300:	52800000 	mov	w0, #0x0                   	// #0
    1304:	d63f0260 	blr	x19
}
    1308:	2a1403e0 	mov	w0, w20
    130c:	a9417bfd 	ldp	x29, x30, [sp, #16]
    1310:	a94253f3 	ldp	x19, x20, [sp, #32]
    1314:	a9456bf9 	ldp	x25, x26, [sp, #80]
    1318:	a94673fb 	ldp	x27, x28, [sp, #96]
    131c:	9102c3ff 	add	sp, sp, #0xb0
    1320:	d65f03c0 	ret
            const int w = va_arg(va, int);
    1324:	b9407be0 	ldr	w0, [sp, #120]
    1328:	11002002 	add	w2, w0, #0x8
    132c:	7100005f 	cmp	w2, #0x0
    1330:	5400228d 	b.le	1780 <_vsnprintf+0x6d0>
    1334:	91002e84 	add	x4, x20, #0xb
    1338:	aa1403e0 	mov	x0, x20
    133c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1340:	b9007be2 	str	w2, [sp, #120]
    1344:	17ffffc6 	b	125c <_vsnprintf+0x1ac>
            if (*format == 'x' || *format == 'X') {
    1348:	121a7802 	and	w2, w0, #0xffffffdf
    134c:	7101605f 	cmp	w2, #0x58
    1350:	54001781 	b.ne	1640 <_vsnprintf+0x590>  // b.any
            if (*format == 'X') {
    1354:	7101601f 	cmp	w0, #0x58
    1358:	54003c81 	b.ne	1ae8 <_vsnprintf+0xa38>  // b.any
                flags |= FLAGS_UPPERCASE;
    135c:	321b00c6 	orr	w6, w6, #0x20
    1360:	d2800208 	mov	x8, #0x10                  	// #16
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1364:	121c74c6 	and	w6, w6, #0xfffffff3
    1368:	140000c0 	b	1668 <_vsnprintf+0x5b8>
            if ((*format == 'g') || (*format == 'G'))
    136c:	121a7802 	and	w2, w0, #0xffffffdf
            if ((*format == 'E') || (*format == 'G'))
    1370:	121e7800 	and	w0, w0, #0xfffffffd
                flags |= FLAGS_ADAPT_EXP;
    1374:	71011c5f 	cmp	w2, #0x47
    1378:	321500c2 	orr	w2, w6, #0x800
    137c:	1a860046 	csel	w6, w2, w6, eq  // eq = none
                flags |= FLAGS_UPPERCASE;
    1380:	7101141f 	cmp	w0, #0x45
    1384:	321b00c0 	orr	w0, w6, #0x20
    1388:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    138c:	b940abe0 	ldr	w0, [sp, #168]
    1390:	37f81c20 	tbnz	w0, #31, 1714 <_vsnprintf+0x664>
    1394:	91003e82 	add	x2, x20, #0xf
    1398:	aa1403e0 	mov	x0, x20
    139c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    13a0:	fd400000 	ldr	d0, [x0]
    13a4:	aa1b03e2 	mov	x2, x27
    13a8:	2a1803e5 	mov	w5, w24
    13ac:	2a1703e4 	mov	w4, w23
    13b0:	aa1c03e3 	mov	x3, x28
    13b4:	aa1a03e1 	mov	x1, x26
    13b8:	aa1303e0 	mov	x0, x19
    13bc:	97fffd55 	bl	910 <_etoa>
    13c0:	aa0003fb 	mov	x27, x0
            break;
    13c4:	17ffff63 	b	1150 <_vsnprintf+0xa0>
                flags |= FLAGS_UPPERCASE;
    13c8:	7101181f 	cmp	w0, #0x46
    13cc:	321b00c0 	orr	w0, w6, #0x20
    13d0:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    13d4:	b940abe0 	ldr	w0, [sp, #168]
    13d8:	37f818c0 	tbnz	w0, #31, 16f0 <_vsnprintf+0x640>
    13dc:	91003e82 	add	x2, x20, #0xf
    13e0:	aa1403e0 	mov	x0, x20
    13e4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    13e8:	fd400000 	ldr	d0, [x0]
    13ec:	aa1b03e2 	mov	x2, x27
    13f0:	2a1803e5 	mov	w5, w24
    13f4:	2a1703e4 	mov	w4, w23
    13f8:	aa1c03e3 	mov	x3, x28
    13fc:	aa1a03e1 	mov	x1, x26
    1400:	aa1303e0 	mov	x0, x19
    1404:	97fffe2b 	bl	cb0 <_ftoa>
    1408:	aa0003fb 	mov	x27, x0
            break;
    140c:	17ffff51 	b	1150 <_vsnprintf+0xa0>
            out('%', buffer, idx++, maxlen);
    1410:	91000760 	add	x0, x27, #0x1
    1414:	aa1b03e2 	mov	x2, x27
    1418:	aa1c03e3 	mov	x3, x28
    141c:	aa0003fb 	mov	x27, x0
    1420:	aa1a03e1 	mov	x1, x26
    1424:	528004a0 	mov	w0, #0x25                  	// #37
    1428:	d63f0260 	blr	x19
            break;
    142c:	17ffff49 	b	1150 <_vsnprintf+0xa0>
            flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
    1430:	52800420 	mov	w0, #0x21                  	// #33
    1434:	2a0000c6 	orr	w6, w6, w0
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    1438:	b9407be0 	ldr	w0, [sp, #120]
    143c:	37f817e0 	tbnz	w0, #31, 1738 <_vsnprintf+0x688>
    1440:	91003e82 	add	x2, x20, #0xf
    1444:	aa1403e0 	mov	x0, x20
    1448:	927df054 	and	x20, x2, #0xfffffffffffffff8
    144c:	2a1703e7 	mov	w7, w23
    1450:	aa1b03e2 	mov	x2, x27
    1454:	f9400004 	ldr	x4, [x0]
    1458:	52800200 	mov	w0, #0x10                  	// #16
    145c:	b90003e0 	str	w0, [sp]
    1460:	b9000be6 	str	w6, [sp, #8]
    1464:	d2800206 	mov	x6, #0x10                  	// #16
    1468:	52800005 	mov	w5, #0x0                   	// #0
    146c:	aa1c03e3 	mov	x3, x28
    1470:	aa1a03e1 	mov	x1, x26
    1474:	aa1303e0 	mov	x0, x19
    1478:	97fffc72 	bl	640 <_ntoa_long>
    147c:	aa0003fb 	mov	x27, x0
            break;
    1480:	17ffff34 	b	1150 <_vsnprintf+0xa0>
            if (!(flags & FLAGS_LEFT)) {
    1484:	a9035bf5 	stp	x21, x22, [sp, #48]
    1488:	36082306 	tbz	w6, #1, 18e8 <_vsnprintf+0x838>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    148c:	b9407be0 	ldr	w0, [sp, #120]
    1490:	37f82a20 	tbnz	w0, #31, 19d4 <_vsnprintf+0x924>
    1494:	91002e82 	add	x2, x20, #0xb
    1498:	aa1403e0 	mov	x0, x20
    149c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    14a0:	39400000 	ldrb	w0, [x0]
    14a4:	aa1b03e2 	mov	x2, x27
    14a8:	aa1c03e3 	mov	x3, x28
    14ac:	aa1a03e1 	mov	x1, x26
    14b0:	91000775 	add	x21, x27, #0x1
    14b4:	d63f0260 	blr	x19
                while (l++ < width) {
    14b8:	51000b00 	sub	w0, w24, #0x2
    14bc:	91000b6a 	add	x10, x27, #0x2
    14c0:	7100071f 	cmp	w24, #0x1
    14c4:	8b00015b 	add	x27, x10, x0
    14c8:	540007c9 	b.ls	15c0 <_vsnprintf+0x510>  // b.plast
    14cc:	d503201f 	nop
                    out(' ', buffer, idx++, maxlen);
    14d0:	aa1503e2 	mov	x2, x21
    14d4:	aa1c03e3 	mov	x3, x28
    14d8:	910006b5 	add	x21, x21, #0x1
    14dc:	aa1a03e1 	mov	x1, x26
    14e0:	52800400 	mov	w0, #0x20                  	// #32
    14e4:	d63f0260 	blr	x19
                while (l++ < width) {
    14e8:	eb1b02bf 	cmp	x21, x27
    14ec:	54ffff21 	b.ne	14d0 <_vsnprintf+0x420>  // b.any
    14f0:	a9435bf5 	ldp	x21, x22, [sp, #48]
    14f4:	17ffff17 	b	1150 <_vsnprintf+0xa0>
            const char* p = va_arg(va, char*);
    14f8:	b9407be0 	ldr	w0, [sp, #120]
    14fc:	a9035bf5 	stp	x21, x22, [sp, #48]
    1500:	37f812e0 	tbnz	w0, #31, 175c <_vsnprintf+0x6ac>
    1504:	91003e82 	add	x2, x20, #0xf
    1508:	aa1403e0 	mov	x0, x20
    150c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1510:	f9400015 	ldr	x21, [x0]
    for (s = str; *s && maxsize--; ++s)
    1514:	394002a8 	ldrb	w8, [x21]
    1518:	2a0803e0 	mov	w0, w8
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    151c:	350017d7 	cbnz	w23, 1814 <_vsnprintf+0x764>
    for (s = str; *s && maxsize--; ++s)
    1520:	92800022 	mov	x2, #0xfffffffffffffffe    	// #-2
    1524:	340035c8 	cbz	w8, 1bdc <_vsnprintf+0xb2c>
    1528:	91000456 	add	x22, x2, #0x1
    152c:	aa1503e2 	mov	x2, x21
    1530:	8b1602b6 	add	x22, x21, x22
    1534:	14000003 	b	1540 <_vsnprintf+0x490>
    1538:	eb0202df 	cmp	x22, x2
    153c:	54001900 	b.eq	185c <_vsnprintf+0x7ac>  // b.none
    1540:	38401c44 	ldrb	w4, [x2, #1]!
    1544:	35ffffa4 	cbnz	w4, 1538 <_vsnprintf+0x488>
    return (unsigned int)(s - str);
    1548:	4b150041 	sub	w1, w2, w21
    154c:	b900a3e1 	str	w1, [sp, #160]
            if (flags & FLAGS_PRECISION) {
    1550:	121600c1 	and	w1, w6, #0x400
    1554:	b9007fe1 	str	w1, [sp, #124]
    1558:	365000a6 	tbz	w6, #10, 156c <_vsnprintf+0x4bc>
                l = (l < precision ? l : precision);
    155c:	b940a3e1 	ldr	w1, [sp, #160]
    1560:	6b17003f 	cmp	w1, w23
    1564:	1a979021 	csel	w1, w1, w23, ls  // ls = plast
    1568:	b900a3e1 	str	w1, [sp, #160]
            if (!(flags & FLAGS_LEFT)) {
    156c:	121f00c1 	and	w1, w6, #0x2
    1570:	b900afe1 	str	w1, [sp, #172]
    1574:	36081826 	tbz	w6, #1, 1878 <_vsnprintf+0x7c8>
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1578:	34001108 	cbz	w8, 1798 <_vsnprintf+0x6e8>
    157c:	aa1b03e2 	mov	x2, x27
    1580:	cb1b02b6 	sub	x22, x21, x27
    1584:	14000002 	b	158c <_vsnprintf+0x4dc>
                out(*(p++), buffer, idx++, maxlen);
    1588:	aa1503e2 	mov	x2, x21
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    158c:	b9407fe1 	ldr	w1, [sp, #124]
    1590:	34000081 	cbz	w1, 15a0 <_vsnprintf+0x4f0>
    1594:	510006e4 	sub	w4, w23, #0x1
    1598:	340016d7 	cbz	w23, 1870 <_vsnprintf+0x7c0>
    159c:	2a0403f7 	mov	w23, w4
                out(*(p++), buffer, idx++, maxlen);
    15a0:	91000455 	add	x21, x2, #0x1
    15a4:	aa1c03e3 	mov	x3, x28
    15a8:	aa1a03e1 	mov	x1, x26
    15ac:	d63f0260 	blr	x19
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    15b0:	38756ac0 	ldrb	w0, [x22, x21]
    15b4:	35fffea0 	cbnz	w0, 1588 <_vsnprintf+0x4d8>
            if (flags & FLAGS_LEFT) {
    15b8:	b940afe0 	ldr	w0, [sp, #172]
    15bc:	35000ec0 	cbnz	w0, 1794 <_vsnprintf+0x6e4>
                while (l++ < width) {
    15c0:	aa1503fb 	mov	x27, x21
    15c4:	a9435bf5 	ldp	x21, x22, [sp, #48]
    15c8:	17fffee2 	b	1150 <_vsnprintf+0xa0>
            if (*format == 'h') {
    15cc:	39400720 	ldrb	w0, [x25, #1]
    15d0:	7101a01f 	cmp	w0, #0x68
    15d4:	540013c0 	b.eq	184c <_vsnprintf+0x79c>  // b.none
            flags |= FLAGS_SHORT;
    15d8:	321900c6 	orr	w6, w6, #0x80
    15dc:	17ffff10 	b	121c <_vsnprintf+0x16c>
            if (*format == 'l') {
    15e0:	39400720 	ldrb	w0, [x25, #1]
    15e4:	7101b01f 	cmp	w0, #0x6c
    15e8:	54ffe181 	b.ne	1218 <_vsnprintf+0x168>  // b.any
        switch (*format) {
    15ec:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_LONG_LONG;
    15f0:	321804c6 	orr	w6, w6, #0x300
                format++;
    15f4:	91000b24 	add	x4, x25, #0x2
    15f8:	17ffff09 	b	121c <_vsnprintf+0x16c>
    unsigned int i = 0U;
    15fc:	52800017 	mov	w23, #0x0                   	// #0
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1600:	52800148 	mov	w8, #0xa                   	// #10
    1604:	d503201f 	nop
    1608:	1b0802e7 	madd	w7, w23, w8, w0
    while (_is_digit(**str)) {
    160c:	38401c80 	ldrb	w0, [x4, #1]!
    return (ch >= '0') && (ch <= '9');
    1610:	5100c002 	sub	w2, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1614:	5100c0f7 	sub	w23, w7, #0x30
    while (_is_digit(**str)) {
    1618:	12001c42 	and	w2, w2, #0xff
    161c:	7100245f 	cmp	w2, #0x9
    1620:	54ffff49 	b.ls	1608 <_vsnprintf+0x558>  // b.plast
    1624:	aa0403f9 	mov	x25, x4
    1628:	91000488 	add	x8, x4, #0x1
    162c:	17fffef2 	b	11f4 <_vsnprintf+0x144>
            if (*format == 'x' || *format == 'X') {
    1630:	121a7802 	and	w2, w0, #0xffffffdf
    1634:	7101605f 	cmp	w2, #0x58
    1638:	54002580 	b.eq	1ae8 <_vsnprintf+0xa38>  // b.none
    163c:	d503201f 	nop
            } else if (*format == 'o') {
    1640:	7101bc1f 	cmp	w0, #0x6f
    1644:	540021a0 	b.eq	1a78 <_vsnprintf+0x9c8>  // b.none
            } else if (*format == 'b') {
    1648:	7101881f 	cmp	w0, #0x62
    164c:	54002820 	b.eq	1b50 <_vsnprintf+0xaa0>  // b.none
                flags &= ~FLAGS_HASH; // no hash for dec format
    1650:	121b78c6 	and	w6, w6, #0xffffffef
    1654:	d2800148 	mov	x8, #0xa                   	// #10
            if ((*format != 'i') && (*format != 'd')) {
    1658:	7101a41f 	cmp	w0, #0x69
    165c:	52800c82 	mov	w2, #0x64                  	// #100
    1660:	7a421004 	ccmp	w0, w2, #0x4, ne  // ne = any
    1664:	54ffe801 	b.ne	1364 <_vsnprintf+0x2b4>  // b.any
                flags &= ~FLAGS_ZEROPAD;
    1668:	f27600df 	tst	x6, #0x400
    166c:	121f78c2 	and	w2, w6, #0xfffffffe
    1670:	1a861046 	csel	w6, w2, w6, ne  // ne = any
            if ((*format == 'i') || (*format == 'd')) {
    1674:	7101a41f 	cmp	w0, #0x69
    1678:	52800c84 	mov	w4, #0x64                  	// #100
                if (flags & FLAGS_LONG_LONG) {
    167c:	121700c2 	and	w2, w6, #0x200
            if ((*format == 'i') || (*format == 'd')) {
    1680:	7a441004 	ccmp	w0, w4, #0x4, ne  // ne = any
                    const long long value = va_arg(va, long long);
    1684:	b9407be0 	ldr	w0, [sp, #120]
            if ((*format == 'i') || (*format == 'd')) {
    1688:	54000ce1 	b.ne	1824 <_vsnprintf+0x774>  // b.any
                if (flags & FLAGS_LONG_LONG) {
    168c:	35002122 	cbnz	w2, 1ab0 <_vsnprintf+0xa00>
                } else if (flags & FLAGS_LONG) {
    1690:	37402306 	tbnz	w6, #8, 1af0 <_vsnprintf+0xa40>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1694:	37301b26 	tbnz	w6, #6, 19f8 <_vsnprintf+0x948>
                                                                                                           : va_arg(va, int);
    1698:	36382926 	tbz	w6, #7, 1bbc <_vsnprintf+0xb0c>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    169c:	37f83300 	tbnz	w0, #31, 1cfc <_vsnprintf+0xc4c>
    16a0:	91002e82 	add	x2, x20, #0xb
    16a4:	aa1403e0 	mov	x0, x20
    16a8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    16ac:	79c00005 	ldrsh	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    16b0:	710000bf 	cmp	w5, #0x0
    16b4:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    16b8:	12003c84 	and	w4, w4, #0xffff
    16bc:	2a1703e7 	mov	w7, w23
    16c0:	531f7ca5 	lsr	w5, w5, #31
    16c4:	93407c84 	sxtw	x4, w4
    16c8:	aa1b03e2 	mov	x2, x27
    16cc:	b9000be6 	str	w6, [sp, #8]
    16d0:	aa0803e6 	mov	x6, x8
    16d4:	b90003f8 	str	w24, [sp]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    16d8:	aa1c03e3 	mov	x3, x28
    16dc:	aa1a03e1 	mov	x1, x26
    16e0:	aa1303e0 	mov	x0, x19
    16e4:	97fffbd7 	bl	640 <_ntoa_long>
    16e8:	aa0003fb 	mov	x27, x0
            break;
    16ec:	17fffe99 	b	1150 <_vsnprintf+0xa0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    16f0:	b940abe0 	ldr	w0, [sp, #168]
    16f4:	11004002 	add	w2, w0, #0x10
    16f8:	7100005f 	cmp	w2, #0x0
    16fc:	54001b4d 	b.le	1a64 <_vsnprintf+0x9b4>
    1700:	91003e84 	add	x4, x20, #0xf
    1704:	aa1403e0 	mov	x0, x20
    1708:	927df094 	and	x20, x4, #0xfffffffffffffff8
    170c:	b900abe2 	str	w2, [sp, #168]
    1710:	17ffff36 	b	13e8 <_vsnprintf+0x338>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1714:	b940abe0 	ldr	w0, [sp, #168]
    1718:	11004002 	add	w2, w0, #0x10
    171c:	7100005f 	cmp	w2, #0x0
    1720:	5400198d 	b.le	1a50 <_vsnprintf+0x9a0>
    1724:	91003e84 	add	x4, x20, #0xf
    1728:	aa1403e0 	mov	x0, x20
    172c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1730:	b900abe2 	str	w2, [sp, #168]
    1734:	17ffff1b 	b	13a0 <_vsnprintf+0x2f0>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    1738:	b9407be0 	ldr	w0, [sp, #120]
    173c:	11002002 	add	w2, w0, #0x8
    1740:	7100005f 	cmp	w2, #0x0
    1744:	540017cd 	b.le	1a3c <_vsnprintf+0x98c>
    1748:	91003e84 	add	x4, x20, #0xf
    174c:	aa1403e0 	mov	x0, x20
    1750:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1754:	b9007be2 	str	w2, [sp, #120]
    1758:	17ffff3d 	b	144c <_vsnprintf+0x39c>
            const char* p = va_arg(va, char*);
    175c:	b9407be0 	ldr	w0, [sp, #120]
    1760:	11002002 	add	w2, w0, #0x8
    1764:	7100005f 	cmp	w2, #0x0
    1768:	5400160d 	b.le	1a28 <_vsnprintf+0x978>
    176c:	91003e84 	add	x4, x20, #0xf
    1770:	aa1403e0 	mov	x0, x20
    1774:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1778:	b9007be2 	str	w2, [sp, #120]
    177c:	17ffff65 	b	1510 <_vsnprintf+0x460>
            const int w = va_arg(va, int);
    1780:	f94047e1 	ldr	x1, [sp, #136]
    1784:	b9407be0 	ldr	w0, [sp, #120]
    1788:	b9007be2 	str	w2, [sp, #120]
    178c:	8b20c020 	add	x0, x1, w0, sxtw
    1790:	17fffeb3 	b	125c <_vsnprintf+0x1ac>
    1794:	aa1503fb 	mov	x27, x21
                while (l++ < width) {
    1798:	b940a3e0 	ldr	w0, [sp, #160]
    179c:	6b18001f 	cmp	w0, w24
    17a0:	540009e2 	b.cs	18dc <_vsnprintf+0x82c>  // b.hs, b.nlast
    17a4:	51000704 	sub	w4, w24, #0x1
    17a8:	91000776 	add	x22, x27, #0x1
    17ac:	4b000084 	sub	w4, w4, w0
    17b0:	8b160095 	add	x21, x4, x22
    17b4:	14000002 	b	17bc <_vsnprintf+0x70c>
    17b8:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    17bc:	aa1b03e2 	mov	x2, x27
    17c0:	aa1c03e3 	mov	x3, x28
    17c4:	aa1a03e1 	mov	x1, x26
    17c8:	52800400 	mov	w0, #0x20                  	// #32
    17cc:	d63f0260 	blr	x19
    17d0:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    17d4:	eb1502df 	cmp	x22, x21
    17d8:	54ffff01 	b.ne	17b8 <_vsnprintf+0x708>  // b.any
                while (l++ < width) {
    17dc:	aa1503fb 	mov	x27, x21
    17e0:	17ffff79 	b	15c4 <_vsnprintf+0x514>
                const int prec = (int)va_arg(va, int);
    17e4:	b9407be0 	ldr	w0, [sp, #120]
    17e8:	37f80b80 	tbnz	w0, #31, 1958 <_vsnprintf+0x8a8>
    17ec:	91002e82 	add	x2, x20, #0xb
    17f0:	aa1403e0 	mov	x0, x20
    17f4:	927df054 	and	x20, x2, #0xfffffffffffffff8
                precision = prec > 0 ? (unsigned int)prec : 0U;
    17f8:	b9400007 	ldr	w7, [x0]
                format++;
    17fc:	91000b39 	add	x25, x25, #0x2
        switch (*format) {
    1800:	39400320 	ldrb	w0, [x25]
    1804:	91000728 	add	x8, x25, #0x1
                precision = prec > 0 ? (unsigned int)prec : 0U;
    1808:	710000ff 	cmp	w7, #0x0
    180c:	1a9fa0f7 	csel	w23, w7, wzr, ge  // ge = tcont
                format++;
    1810:	17fffe79 	b	11f4 <_vsnprintf+0x144>
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    1814:	2a1703e2 	mov	w2, w23
    for (s = str; *s && maxsize--; ++s)
    1818:	34001e28 	cbz	w8, 1bdc <_vsnprintf+0xb2c>
    181c:	d1000442 	sub	x2, x2, #0x1
    1820:	17ffff42 	b	1528 <_vsnprintf+0x478>
                if (flags & FLAGS_LONG_LONG) {
    1824:	35001302 	cbnz	w2, 1a84 <_vsnprintf+0x9d4>
                } else if (flags & FLAGS_LONG) {
    1828:	37401806 	tbnz	w6, #8, 1b28 <_vsnprintf+0xa78>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    182c:	37300ba6 	tbnz	w6, #6, 19a0 <_vsnprintf+0x8f0>
                                                                                                                                      : va_arg(va, unsigned int);
    1830:	36381ba6 	tbz	w6, #7, 1ba4 <_vsnprintf+0xaf4>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1834:	37f82500 	tbnz	w0, #31, 1cd4 <_vsnprintf+0xc24>
    1838:	aa1403e0 	mov	x0, x20
    183c:	91002e82 	add	x2, x20, #0xb
    1840:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1844:	79400004 	ldrh	w4, [x0]
    1848:	1400005b 	b	19b4 <_vsnprintf+0x904>
        switch (*format) {
    184c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_CHAR;
    1850:	321a04c6 	orr	w6, w6, #0xc0
                format++;
    1854:	91000b24 	add	x4, x25, #0x2
    1858:	17fffe71 	b	121c <_vsnprintf+0x16c>
    return (unsigned int)(s - str);
    185c:	4b1502c1 	sub	w1, w22, w21
    1860:	b900a3e1 	str	w1, [sp, #160]
    1864:	17ffff3b 	b	1550 <_vsnprintf+0x4a0>
    while (*format) {
    1868:	52800014 	mov	w20, #0x0                   	// #0
    186c:	17fffea0 	b	12ec <_vsnprintf+0x23c>
    1870:	aa0203f5 	mov	x21, x2
    1874:	17ffff51 	b	15b8 <_vsnprintf+0x508>
                while (l++ < width) {
    1878:	b940a3e1 	ldr	w1, [sp, #160]
    187c:	6b18003f 	cmp	w1, w24
    1880:	11000420 	add	w0, w1, #0x1
    1884:	54002242 	b.cs	1ccc <_vsnprintf+0xc1c>  // b.hs, b.nlast
    1888:	51000700 	sub	w0, w24, #0x1
    188c:	91000776 	add	x22, x27, #0x1
    1890:	4b010000 	sub	w0, w0, w1
    1894:	8b160000 	add	x0, x0, x22
    1898:	f90053e0 	str	x0, [sp, #160]
    189c:	14000002 	b	18a4 <_vsnprintf+0x7f4>
    18a0:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    18a4:	aa1b03e2 	mov	x2, x27
    18a8:	52800400 	mov	w0, #0x20                  	// #32
    18ac:	aa1c03e3 	mov	x3, x28
    18b0:	aa1a03e1 	mov	x1, x26
    18b4:	d63f0260 	blr	x19
    18b8:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    18bc:	f94053e0 	ldr	x0, [sp, #160]
    18c0:	eb16001f 	cmp	x0, x22
    18c4:	54fffee1 	b.ne	18a0 <_vsnprintf+0x7f0>  // b.any
    18c8:	394002a8 	ldrb	w8, [x21]
    18cc:	11000700 	add	w0, w24, #0x1
    18d0:	b900a3e0 	str	w0, [sp, #160]
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    18d4:	2a0803e0 	mov	w0, w8
    18d8:	35ffe528 	cbnz	w8, 157c <_vsnprintf+0x4cc>
                while (l++ < width) {
    18dc:	aa1b03f5 	mov	x21, x27
                while (l++ < width) {
    18e0:	aa1503fb 	mov	x27, x21
    18e4:	17ffff38 	b	15c4 <_vsnprintf+0x514>
                while (l++ < width) {
    18e8:	7100071f 	cmp	w24, #0x1
    18ec:	54001ec9 	b.ls	1cc4 <_vsnprintf+0xc14>  // b.plast
    18f0:	51000b05 	sub	w5, w24, #0x2
    18f4:	91000776 	add	x22, x27, #0x1
    18f8:	8b0502d5 	add	x21, x22, x5
    18fc:	14000002 	b	1904 <_vsnprintf+0x854>
    1900:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1904:	aa1b03e2 	mov	x2, x27
    1908:	aa1c03e3 	mov	x3, x28
    190c:	aa1a03e1 	mov	x1, x26
    1910:	52800400 	mov	w0, #0x20                  	// #32
    1914:	d63f0260 	blr	x19
    1918:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    191c:	eb1502df 	cmp	x22, x21
    1920:	54ffff01 	b.ne	1900 <_vsnprintf+0x850>  // b.any
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1924:	b9407be0 	ldr	w0, [sp, #120]
    1928:	37f802a0 	tbnz	w0, #31, 197c <_vsnprintf+0x8cc>
    192c:	91002e82 	add	x2, x20, #0xb
    1930:	aa1403e0 	mov	x0, x20
    1934:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1938:	39400000 	ldrb	w0, [x0]
    193c:	aa1503e2 	mov	x2, x21
    1940:	910006bb 	add	x27, x21, #0x1
    1944:	aa1c03e3 	mov	x3, x28
    1948:	aa1a03e1 	mov	x1, x26
    194c:	d63f0260 	blr	x19
            if (flags & FLAGS_LEFT) {
    1950:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1954:	17fffdff 	b	1150 <_vsnprintf+0xa0>
                const int prec = (int)va_arg(va, int);
    1958:	b9407be0 	ldr	w0, [sp, #120]
    195c:	11002002 	add	w2, w0, #0x8
    1960:	7100005f 	cmp	w2, #0x0
    1964:	5400058d 	b.le	1a14 <_vsnprintf+0x964>
    1968:	91002e84 	add	x4, x20, #0xb
    196c:	aa1403e0 	mov	x0, x20
    1970:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1974:	b9007be2 	str	w2, [sp, #120]
    1978:	17ffffa0 	b	17f8 <_vsnprintf+0x748>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    197c:	b9407be0 	ldr	w0, [sp, #120]
    1980:	11002002 	add	w2, w0, #0x8
    1984:	7100005f 	cmp	w2, #0x0
    1988:	540016ed 	b.le	1c64 <_vsnprintf+0xbb4>
    198c:	91002e84 	add	x4, x20, #0xb
    1990:	aa1403e0 	mov	x0, x20
    1994:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1998:	b9007be2 	str	w2, [sp, #120]
    199c:	17ffffe7 	b	1938 <_vsnprintf+0x888>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    19a0:	37f81220 	tbnz	w0, #31, 1be4 <_vsnprintf+0xb34>
    19a4:	91002e82 	add	x2, x20, #0xb
    19a8:	aa1403e0 	mov	x0, x20
    19ac:	927df054 	and	x20, x2, #0xfffffffffffffff8
    19b0:	39400004 	ldrb	w4, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    19b4:	2a1703e7 	mov	w7, w23
    19b8:	2a0403e4 	mov	w4, w4
    19bc:	b9000be6 	str	w6, [sp, #8]
    19c0:	aa0803e6 	mov	x6, x8
    19c4:	b90003f8 	str	w24, [sp]
    19c8:	aa1b03e2 	mov	x2, x27
    19cc:	52800005 	mov	w5, #0x0                   	// #0
    19d0:	17ffff42 	b	16d8 <_vsnprintf+0x628>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    19d4:	b9407be0 	ldr	w0, [sp, #120]
    19d8:	11002002 	add	w2, w0, #0x8
    19dc:	7100005f 	cmp	w2, #0x0
    19e0:	5400138d 	b.le	1c50 <_vsnprintf+0xba0>
    19e4:	91002e84 	add	x4, x20, #0xb
    19e8:	aa1403e0 	mov	x0, x20
    19ec:	927df094 	and	x20, x4, #0xfffffffffffffff8
    19f0:	b9007be2 	str	w2, [sp, #120]
    19f4:	17fffeab 	b	14a0 <_vsnprintf+0x3f0>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    19f8:	37f81080 	tbnz	w0, #31, 1c08 <_vsnprintf+0xb58>
    19fc:	91002e82 	add	x2, x20, #0xb
    1a00:	aa1403e0 	mov	x0, x20
    1a04:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a08:	39400005 	ldrb	w5, [x0]
    1a0c:	2a0503e4 	mov	w4, w5
    1a10:	17ffff2b 	b	16bc <_vsnprintf+0x60c>
                const int prec = (int)va_arg(va, int);
    1a14:	f94047e1 	ldr	x1, [sp, #136]
    1a18:	b9407be0 	ldr	w0, [sp, #120]
    1a1c:	b9007be2 	str	w2, [sp, #120]
    1a20:	8b20c020 	add	x0, x1, w0, sxtw
    1a24:	17ffff75 	b	17f8 <_vsnprintf+0x748>
            const char* p = va_arg(va, char*);
    1a28:	f94047e1 	ldr	x1, [sp, #136]
    1a2c:	b9407be0 	ldr	w0, [sp, #120]
    1a30:	b9007be2 	str	w2, [sp, #120]
    1a34:	8b20c020 	add	x0, x1, w0, sxtw
    1a38:	17fffeb6 	b	1510 <_vsnprintf+0x460>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    1a3c:	f94047e1 	ldr	x1, [sp, #136]
    1a40:	b9407be0 	ldr	w0, [sp, #120]
    1a44:	b9007be2 	str	w2, [sp, #120]
    1a48:	8b20c020 	add	x0, x1, w0, sxtw
    1a4c:	17fffe80 	b	144c <_vsnprintf+0x39c>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1a50:	f9404be1 	ldr	x1, [sp, #144]
    1a54:	b940abe0 	ldr	w0, [sp, #168]
    1a58:	b900abe2 	str	w2, [sp, #168]
    1a5c:	8b20c020 	add	x0, x1, w0, sxtw
    1a60:	17fffe50 	b	13a0 <_vsnprintf+0x2f0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1a64:	f9404be1 	ldr	x1, [sp, #144]
    1a68:	b940abe0 	ldr	w0, [sp, #168]
    1a6c:	b900abe2 	str	w2, [sp, #168]
    1a70:	8b20c020 	add	x0, x1, w0, sxtw
    1a74:	17fffe5d 	b	13e8 <_vsnprintf+0x338>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1a78:	121c74c6 	and	w6, w6, #0xfffffff3
    1a7c:	d2800108 	mov	x8, #0x8                   	// #8
    1a80:	17fffefa 	b	1668 <_vsnprintf+0x5b8>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1a84:	37f807e0 	tbnz	w0, #31, 1b80 <_vsnprintf+0xad0>
    1a88:	91003e82 	add	x2, x20, #0xf
    1a8c:	aa1403e0 	mov	x0, x20
    1a90:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a94:	2a1703e7 	mov	w7, w23
    1a98:	aa1b03e2 	mov	x2, x27
    1a9c:	f9400004 	ldr	x4, [x0]
    1aa0:	b90003f8 	str	w24, [sp]
    1aa4:	b9000be6 	str	w6, [sp, #8]
    1aa8:	aa0803e6 	mov	x6, x8
    1aac:	17fffe6f 	b	1468 <_vsnprintf+0x3b8>
                    const long long value = va_arg(va, long long);
    1ab0:	37f80560 	tbnz	w0, #31, 1b5c <_vsnprintf+0xaac>
    1ab4:	91003e82 	add	x2, x20, #0xf
    1ab8:	aa1403e0 	mov	x0, x20
    1abc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1ac0:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1ac4:	2a1703e7 	mov	w7, w23
    1ac8:	aa1b03e2 	mov	x2, x27
    1acc:	b90003f8 	str	w24, [sp]
    1ad0:	f10000bf 	cmp	x5, #0x0
    1ad4:	b9000be6 	str	w6, [sp, #8]
    1ad8:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    1adc:	aa0803e6 	mov	x6, x8
    1ae0:	d37ffca5 	lsr	x5, x5, #63
    1ae4:	17fffe62 	b	146c <_vsnprintf+0x3bc>
                flags &= ~FLAGS_HASH; // no hash for dec format
    1ae8:	d2800208 	mov	x8, #0x10                  	// #16
    1aec:	17fffedb 	b	1658 <_vsnprintf+0x5a8>
                    const long value = va_arg(va, long);
    1af0:	37f80c40 	tbnz	w0, #31, 1c78 <_vsnprintf+0xbc8>
    1af4:	91003e82 	add	x2, x20, #0xf
    1af8:	aa1403e0 	mov	x0, x20
    1afc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1b00:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1b04:	2a1703e7 	mov	w7, w23
    1b08:	aa1b03e2 	mov	x2, x27
    1b0c:	b90003f8 	str	w24, [sp]
    1b10:	f10000bf 	cmp	x5, #0x0
    1b14:	b9000be6 	str	w6, [sp, #8]
    1b18:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    1b1c:	aa0803e6 	mov	x6, x8
    1b20:	d37ffca5 	lsr	x5, x5, #63
    1b24:	17fffeed 	b	16d8 <_vsnprintf+0x628>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1b28:	37f80820 	tbnz	w0, #31, 1c2c <_vsnprintf+0xb7c>
    1b2c:	91003e82 	add	x2, x20, #0xf
    1b30:	aa1403e0 	mov	x0, x20
    1b34:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1b38:	2a1703e7 	mov	w7, w23
    1b3c:	f9400004 	ldr	x4, [x0]
    1b40:	b90003f8 	str	w24, [sp]
    1b44:	b9000be6 	str	w6, [sp, #8]
    1b48:	aa0803e6 	mov	x6, x8
    1b4c:	17ffff9f 	b	19c8 <_vsnprintf+0x918>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1b50:	121c74c6 	and	w6, w6, #0xfffffff3
    1b54:	d2800048 	mov	x8, #0x2                   	// #2
    1b58:	17fffec4 	b	1668 <_vsnprintf+0x5b8>
                    const long long value = va_arg(va, long long);
    1b5c:	b9407be0 	ldr	w0, [sp, #120]
    1b60:	11002002 	add	w2, w0, #0x8
    1b64:	7100005f 	cmp	w2, #0x0
    1b68:	54000a4d 	b.le	1cb0 <_vsnprintf+0xc00>
    1b6c:	91003e84 	add	x4, x20, #0xf
    1b70:	aa1403e0 	mov	x0, x20
    1b74:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1b78:	b9007be2 	str	w2, [sp, #120]
    1b7c:	17ffffd1 	b	1ac0 <_vsnprintf+0xa10>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1b80:	b9407be0 	ldr	w0, [sp, #120]
    1b84:	11002002 	add	w2, w0, #0x8
    1b88:	7100005f 	cmp	w2, #0x0
    1b8c:	5400088d 	b.le	1c9c <_vsnprintf+0xbec>
    1b90:	91003e84 	add	x4, x20, #0xf
    1b94:	aa1403e0 	mov	x0, x20
    1b98:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1b9c:	b9007be2 	str	w2, [sp, #120]
    1ba0:	17ffffbd 	b	1a94 <_vsnprintf+0x9e4>
                                                                                                                                      : va_arg(va, unsigned int);
    1ba4:	37f80d00 	tbnz	w0, #31, 1d44 <_vsnprintf+0xc94>
    1ba8:	aa1403e0 	mov	x0, x20
    1bac:	91002e82 	add	x2, x20, #0xb
    1bb0:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1bb4:	b9400004 	ldr	w4, [x0]
    1bb8:	17ffff7f 	b	19b4 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1bbc:	37f80b20 	tbnz	w0, #31, 1d20 <_vsnprintf+0xc70>
    1bc0:	91002e82 	add	x2, x20, #0xb
    1bc4:	aa1403e0 	mov	x0, x20
    1bc8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1bcc:	b9400005 	ldr	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1bd0:	710000bf 	cmp	w5, #0x0
    1bd4:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1bd8:	17fffeb9 	b	16bc <_vsnprintf+0x60c>
    for (s = str; *s && maxsize--; ++s)
    1bdc:	b900a3ff 	str	wzr, [sp, #160]
    1be0:	17fffe5c 	b	1550 <_vsnprintf+0x4a0>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1be4:	b9407be0 	ldr	w0, [sp, #120]
    1be8:	11002002 	add	w2, w0, #0x8
    1bec:	7100005f 	cmp	w2, #0x0
    1bf0:	54000bed 	b.le	1d6c <_vsnprintf+0xcbc>
    1bf4:	91002e84 	add	x4, x20, #0xb
    1bf8:	aa1403e0 	mov	x0, x20
    1bfc:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c00:	b9007be2 	str	w2, [sp, #120]
    1c04:	17ffff6b 	b	19b0 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1c08:	b9407be0 	ldr	w0, [sp, #120]
    1c0c:	11002002 	add	w2, w0, #0x8
    1c10:	7100005f 	cmp	w2, #0x0
    1c14:	54000b6d 	b.le	1d80 <_vsnprintf+0xcd0>
    1c18:	91002e84 	add	x4, x20, #0xb
    1c1c:	aa1403e0 	mov	x0, x20
    1c20:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c24:	b9007be2 	str	w2, [sp, #120]
    1c28:	17ffff78 	b	1a08 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1c2c:	b9407be0 	ldr	w0, [sp, #120]
    1c30:	11002002 	add	w2, w0, #0x8
    1c34:	7100005f 	cmp	w2, #0x0
    1c38:	54000aed 	b.le	1d94 <_vsnprintf+0xce4>
    1c3c:	91003e84 	add	x4, x20, #0xf
    1c40:	aa1403e0 	mov	x0, x20
    1c44:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c48:	b9007be2 	str	w2, [sp, #120]
    1c4c:	17ffffbb 	b	1b38 <_vsnprintf+0xa88>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1c50:	f94047e1 	ldr	x1, [sp, #136]
    1c54:	b9407be0 	ldr	w0, [sp, #120]
    1c58:	b9007be2 	str	w2, [sp, #120]
    1c5c:	8b20c020 	add	x0, x1, w0, sxtw
    1c60:	17fffe10 	b	14a0 <_vsnprintf+0x3f0>
    1c64:	f94047e1 	ldr	x1, [sp, #136]
    1c68:	b9407be0 	ldr	w0, [sp, #120]
    1c6c:	b9007be2 	str	w2, [sp, #120]
    1c70:	8b20c020 	add	x0, x1, w0, sxtw
    1c74:	17ffff31 	b	1938 <_vsnprintf+0x888>
                    const long value = va_arg(va, long);
    1c78:	b9407be0 	ldr	w0, [sp, #120]
    1c7c:	11002002 	add	w2, w0, #0x8
    1c80:	7100005f 	cmp	w2, #0x0
    1c84:	5400092d 	b.le	1da8 <_vsnprintf+0xcf8>
    1c88:	91003e84 	add	x4, x20, #0xf
    1c8c:	aa1403e0 	mov	x0, x20
    1c90:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c94:	b9007be2 	str	w2, [sp, #120]
    1c98:	17ffff9a 	b	1b00 <_vsnprintf+0xa50>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1c9c:	f94047e1 	ldr	x1, [sp, #136]
    1ca0:	b9407be0 	ldr	w0, [sp, #120]
    1ca4:	b9007be2 	str	w2, [sp, #120]
    1ca8:	8b20c020 	add	x0, x1, w0, sxtw
    1cac:	17ffff7a 	b	1a94 <_vsnprintf+0x9e4>
                    const long long value = va_arg(va, long long);
    1cb0:	f94047e1 	ldr	x1, [sp, #136]
    1cb4:	b9407be0 	ldr	w0, [sp, #120]
    1cb8:	b9007be2 	str	w2, [sp, #120]
    1cbc:	8b20c020 	add	x0, x1, w0, sxtw
    1cc0:	17ffff80 	b	1ac0 <_vsnprintf+0xa10>
                while (l++ < width) {
    1cc4:	aa1b03f5 	mov	x21, x27
    1cc8:	17ffff17 	b	1924 <_vsnprintf+0x874>
                while (l++ < width) {
    1ccc:	b900a3e0 	str	w0, [sp, #160]
    1cd0:	17ffff01 	b	18d4 <_vsnprintf+0x824>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1cd4:	b9407be0 	ldr	w0, [sp, #120]
    1cd8:	11002002 	add	w2, w0, #0x8
    1cdc:	7100005f 	cmp	w2, #0x0
    1ce0:	5400078d 	b.le	1dd0 <_vsnprintf+0xd20>
    1ce4:	aa1403e0 	mov	x0, x20
    1ce8:	91002e84 	add	x4, x20, #0xb
    1cec:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1cf0:	b9007be2 	str	w2, [sp, #120]
    1cf4:	79400004 	ldrh	w4, [x0]
    1cf8:	17ffff2f 	b	19b4 <_vsnprintf+0x904>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1cfc:	b9407be0 	ldr	w0, [sp, #120]
    1d00:	11002002 	add	w2, w0, #0x8
    1d04:	7100005f 	cmp	w2, #0x0
    1d08:	540005ad 	b.le	1dbc <_vsnprintf+0xd0c>
    1d0c:	91002e84 	add	x4, x20, #0xb
    1d10:	aa1403e0 	mov	x0, x20
    1d14:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1d18:	b9007be2 	str	w2, [sp, #120]
    1d1c:	17fffe64 	b	16ac <_vsnprintf+0x5fc>
                                                                                                           : va_arg(va, int);
    1d20:	b9407be0 	ldr	w0, [sp, #120]
    1d24:	11002002 	add	w2, w0, #0x8
    1d28:	7100005f 	cmp	w2, #0x0
    1d2c:	540005ed 	b.le	1de8 <_vsnprintf+0xd38>
    1d30:	91002e84 	add	x4, x20, #0xb
    1d34:	aa1403e0 	mov	x0, x20
    1d38:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1d3c:	b9007be2 	str	w2, [sp, #120]
    1d40:	17ffffa3 	b	1bcc <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1d44:	b9407be0 	ldr	w0, [sp, #120]
    1d48:	11002002 	add	w2, w0, #0x8
    1d4c:	7100005f 	cmp	w2, #0x0
    1d50:	5400056d 	b.le	1dfc <_vsnprintf+0xd4c>
    1d54:	aa1403e0 	mov	x0, x20
    1d58:	91002e84 	add	x4, x20, #0xb
    1d5c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1d60:	b9007be2 	str	w2, [sp, #120]
    1d64:	b9400004 	ldr	w4, [x0]
    1d68:	17ffff13 	b	19b4 <_vsnprintf+0x904>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1d6c:	f94047e1 	ldr	x1, [sp, #136]
    1d70:	b9407be0 	ldr	w0, [sp, #120]
    1d74:	b9007be2 	str	w2, [sp, #120]
    1d78:	8b20c020 	add	x0, x1, w0, sxtw
    1d7c:	17ffff0d 	b	19b0 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1d80:	f94047e1 	ldr	x1, [sp, #136]
    1d84:	b9407be0 	ldr	w0, [sp, #120]
    1d88:	b9007be2 	str	w2, [sp, #120]
    1d8c:	8b20c020 	add	x0, x1, w0, sxtw
    1d90:	17ffff1e 	b	1a08 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1d94:	f94047e1 	ldr	x1, [sp, #136]
    1d98:	b9407be0 	ldr	w0, [sp, #120]
    1d9c:	b9007be2 	str	w2, [sp, #120]
    1da0:	8b20c020 	add	x0, x1, w0, sxtw
    1da4:	17ffff65 	b	1b38 <_vsnprintf+0xa88>
                    const long value = va_arg(va, long);
    1da8:	f94047e1 	ldr	x1, [sp, #136]
    1dac:	b9407be0 	ldr	w0, [sp, #120]
    1db0:	b9007be2 	str	w2, [sp, #120]
    1db4:	8b20c020 	add	x0, x1, w0, sxtw
    1db8:	17ffff52 	b	1b00 <_vsnprintf+0xa50>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1dbc:	f94047e1 	ldr	x1, [sp, #136]
    1dc0:	b9407be0 	ldr	w0, [sp, #120]
    1dc4:	b9007be2 	str	w2, [sp, #120]
    1dc8:	8b20c020 	add	x0, x1, w0, sxtw
    1dcc:	17fffe38 	b	16ac <_vsnprintf+0x5fc>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1dd0:	f94047e1 	ldr	x1, [sp, #136]
    1dd4:	b9407be0 	ldr	w0, [sp, #120]
    1dd8:	b9007be2 	str	w2, [sp, #120]
    1ddc:	8b20c020 	add	x0, x1, w0, sxtw
    1de0:	79400004 	ldrh	w4, [x0]
    1de4:	17fffef4 	b	19b4 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1de8:	f94047e1 	ldr	x1, [sp, #136]
    1dec:	b9407be0 	ldr	w0, [sp, #120]
    1df0:	b9007be2 	str	w2, [sp, #120]
    1df4:	8b20c020 	add	x0, x1, w0, sxtw
    1df8:	17ffff75 	b	1bcc <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1dfc:	f94047e1 	ldr	x1, [sp, #136]
    1e00:	b9407be0 	ldr	w0, [sp, #120]
    1e04:	b9007be2 	str	w2, [sp, #120]
    1e08:	8b20c020 	add	x0, x1, w0, sxtw
    1e0c:	b9400004 	ldr	w4, [x0]
    1e10:	17fffee9 	b	19b4 <_vsnprintf+0x904>
    return (ch >= '0') && (ch <= '9');
    1e14:	5100c002 	sub	w2, w0, #0x30
    unsigned int i = 0U;
    1e18:	52800018 	mov	w24, #0x0                   	// #0
        if (_is_digit(*format)) {
    1e1c:	12001c42 	and	w2, w2, #0xff
    1e20:	7100245f 	cmp	w2, #0x9
    1e24:	54ffa2a8 	b.hi	1278 <_vsnprintf+0x1c8>  // b.pmore
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1e28:	52800142 	mov	w2, #0xa                   	// #10
    1e2c:	d503201f 	nop
    1e30:	1b020305 	madd	w5, w24, w2, w0
    while (_is_digit(**str)) {
    1e34:	39400100 	ldrb	w0, [x8]
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1e38:	aa0803f9 	mov	x25, x8
    1e3c:	91000508 	add	x8, x8, #0x1
    return (ch >= '0') && (ch <= '9');
    1e40:	5100c004 	sub	w4, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1e44:	5100c0b8 	sub	w24, w5, #0x30
    while (_is_digit(**str)) {
    1e48:	12001c84 	and	w4, w4, #0xff
    1e4c:	7100249f 	cmp	w4, #0x9
    1e50:	54ffff09 	b.ls	1e30 <_vsnprintf+0xd80>  // b.plast
    1e54:	17fffd09 	b	1278 <_vsnprintf+0x1c8>
        switch (*format) {
    1e58:	aa1903e4 	mov	x4, x25
    1e5c:	17fffcf0 	b	121c <_vsnprintf+0x16c>

0000000000001e60 <printf>:

///////////////////////////////////////////////////////////////////////////////

int printf(const char* format, ...)
{
    1e60:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
    1e64:	910003fd 	mov	x29, sp
    1e68:	f9000bf3 	str	x19, [sp, #16]
    1e6c:	aa0003f3 	mov	x19, x0
    1e70:	3d801fe0 	str	q0, [sp, #112]
    1e74:	3d8023e1 	str	q1, [sp, #128]
    1e78:	3d8027e2 	str	q2, [sp, #144]
    1e7c:	3d802be3 	str	q3, [sp, #160]
    1e80:	3d802fe4 	str	q4, [sp, #176]
    1e84:	3d8033e5 	str	q5, [sp, #192]
    1e88:	3d8037e6 	str	q6, [sp, #208]
    1e8c:	3d803be7 	str	q7, [sp, #224]
    1e90:	a90f8be1 	stp	x1, x2, [sp, #248]
    1e94:	a91093e3 	stp	x3, x4, [sp, #264]
    1e98:	a9119be5 	stp	x5, x6, [sp, #280]
    1e9c:	f90097e7 	str	x7, [sp, #296]
    if (!init_uart_mmio()) {
    1ea0:	97fff968 	bl	440 <init_uart_mmio>
    1ea4:	72001c1f 	tst	w0, #0xff
    1ea8:	540002e0 	b.eq	1f04 <printf+0xa4>  // b.none
        return -1;
    }
    va_list va;
    va_start(va, format);
    1eac:	9103c3e0 	add	x0, sp, #0xf0
    1eb0:	9104c3e3 	add	x3, sp, #0x130
    1eb4:	9104c3e4 	add	x4, sp, #0x130
    1eb8:	128006e2 	mov	w2, #0xffffffc8            	// #-56
    1ebc:	12800fe1 	mov	w1, #0xffffff80            	// #-128
    1ec0:	a90513e3 	stp	x3, x4, [sp, #80]
    char buffer[1];
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1ec4:	aa1303e3 	mov	x3, x19
    va_start(va, format);
    1ec8:	f90033e0 	str	x0, [sp, #96]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1ecc:	910083e4 	add	x4, sp, #0x20
    va_start(va, format);
    1ed0:	290d07e2 	stp	w2, w1, [sp, #104]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1ed4:	90000000 	adrp	x0, 1000 <_ftoa+0x350>
    1ed8:	91020000 	add	x0, x0, #0x80
    1edc:	910123e1 	add	x1, sp, #0x48
    1ee0:	a94527e8 	ldp	x8, x9, [sp, #80]
    1ee4:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    1ee8:	a9461fe6 	ldp	x6, x7, [sp, #96]
    1eec:	a90227e8 	stp	x8, x9, [sp, #32]
    1ef0:	a9031fe6 	stp	x6, x7, [sp, #48]
    1ef4:	97fffc6f 	bl	10b0 <_vsnprintf>
    va_end(va);
    return ret;
}
    1ef8:	f9400bf3 	ldr	x19, [sp, #16]
    1efc:	a8d37bfd 	ldp	x29, x30, [sp], #304
    1f00:	d65f03c0 	ret
        return -1;
    1f04:	12800000 	mov	w0, #0xffffffff            	// #-1
    1f08:	17fffffc 	b	1ef8 <printf+0x98>
    1f0c:	d503201f 	nop

0000000000001f10 <sprintf_>:

int sprintf_(char* buffer, const char* format, ...)
{
    1f10:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1f14:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    1f18:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    1f1c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1f20:	910343eb 	add	x11, sp, #0xd0
    1f24:	910403ea 	add	x10, sp, #0x100
    1f28:	a9032bea 	stp	x10, x10, [sp, #48]
{
    1f2c:	aa0103ea 	mov	x10, x1
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1f30:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1f34:	f90023eb 	str	x11, [sp, #64]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1f38:	f0ffffe0 	adrp	x0, 0 <main>
    1f3c:	91140000 	add	x0, x0, #0x500
    va_start(va, format);
    1f40:	290923e9 	stp	w9, w8, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1f44:	a94337ec 	ldp	x12, x13, [sp, #48]
    1f48:	a90137ec 	stp	x12, x13, [sp, #16]
    1f4c:	a94427e8 	ldp	x8, x9, [sp, #64]
    1f50:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1f54:	3d8017e0 	str	q0, [sp, #80]
    1f58:	3d801be1 	str	q1, [sp, #96]
    1f5c:	3d801fe2 	str	q2, [sp, #112]
    1f60:	3d8023e3 	str	q3, [sp, #128]
    1f64:	3d8027e4 	str	q4, [sp, #144]
    1f68:	3d802be5 	str	q5, [sp, #160]
    1f6c:	3d802fe6 	str	q6, [sp, #176]
    1f70:	3d8033e7 	str	q7, [sp, #192]
    1f74:	a90d0fe2 	stp	x2, x3, [sp, #208]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1f78:	aa0a03e3 	mov	x3, x10
    1f7c:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    1f80:	a90e17e4 	stp	x4, x5, [sp, #224]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1f84:	910043e4 	add	x4, sp, #0x10
{
    1f88:	a90f1fe6 	stp	x6, x7, [sp, #240]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1f8c:	97fffc49 	bl	10b0 <_vsnprintf>
    va_end(va);
    return ret;
}
    1f90:	a8d07bfd 	ldp	x29, x30, [sp], #256
    1f94:	d65f03c0 	ret
    1f98:	d503201f 	nop
    1f9c:	d503201f 	nop

0000000000001fa0 <snprintf_>:

int snprintf_(char* buffer, size_t count, const char* format, ...)
{
    1fa0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1fa4:	128004eb 	mov	w11, #0xffffffd8            	// #-40
    1fa8:	12800fe9 	mov	w9, #0xffffff80            	// #-128
{
    1fac:	910003fd 	mov	x29, sp
    va_start(va, format);
    1fb0:	910343ea 	add	x10, sp, #0xd0
    1fb4:	910403e8 	add	x8, sp, #0x100
    1fb8:	a90323e8 	stp	x8, x8, [sp, #48]
{
    1fbc:	aa0103e8 	mov	x8, x1
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1fc0:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1fc4:	f90023ea 	str	x10, [sp, #64]
{
    1fc8:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    1fcc:	290927eb 	stp	w11, w9, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1fd0:	aa0803e2 	mov	x2, x8
    1fd4:	a94337ec 	ldp	x12, x13, [sp, #48]
    1fd8:	f0ffffe0 	adrp	x0, 0 <main>
    1fdc:	a94427e8 	ldp	x8, x9, [sp, #64]
    1fe0:	91140000 	add	x0, x0, #0x500
    1fe4:	a90137ec 	stp	x12, x13, [sp, #16]
    1fe8:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1fec:	3d8017e0 	str	q0, [sp, #80]
    1ff0:	3d801be1 	str	q1, [sp, #96]
    1ff4:	3d801fe2 	str	q2, [sp, #112]
    1ff8:	3d8023e3 	str	q3, [sp, #128]
    1ffc:	3d8027e4 	str	q4, [sp, #144]
    2000:	3d802be5 	str	q5, [sp, #160]
    2004:	3d802fe6 	str	q6, [sp, #176]
    2008:	3d8033e7 	str	q7, [sp, #192]
    200c:	a90d93e3 	stp	x3, x4, [sp, #216]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    2010:	910043e4 	add	x4, sp, #0x10
    2014:	aa0a03e3 	mov	x3, x10
{
    2018:	a90e9be5 	stp	x5, x6, [sp, #232]
    201c:	f9007fe7 	str	x7, [sp, #248]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    2020:	97fffc24 	bl	10b0 <_vsnprintf>
    va_end(va);
    return ret;
}
    2024:	a8d07bfd 	ldp	x29, x30, [sp], #256
    2028:	d65f03c0 	ret
    202c:	d503201f 	nop

0000000000002030 <vprintf_>:

int vprintf_(const char* format, va_list va)
{
    2030:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    char buffer[1];
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    2034:	aa0003e3 	mov	x3, x0
    2038:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    203c:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    2040:	a9402428 	ldp	x8, x9, [x1]
    2044:	910043e4 	add	x4, sp, #0x10
    2048:	a9411c26 	ldp	x6, x7, [x1, #16]
    204c:	f0ffffe0 	adrp	x0, 1000 <_ftoa+0x350>
    2050:	9100e3e1 	add	x1, sp, #0x38
    2054:	91020000 	add	x0, x0, #0x80
    2058:	a90127e8 	stp	x8, x9, [sp, #16]
    205c:	a9021fe6 	stp	x6, x7, [sp, #32]
    2060:	97fffc14 	bl	10b0 <_vsnprintf>
}
    2064:	a8c47bfd 	ldp	x29, x30, [sp], #64
    2068:	d65f03c0 	ret
    206c:	d503201f 	nop

0000000000002070 <vsnprintf_>:

int vsnprintf_(char* buffer, size_t count, const char* format, va_list va)
{
    2070:	aa0303e4 	mov	x4, x3
    2074:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2078:	aa0103e5 	mov	x5, x1
    207c:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_buffer, buffer, count, format, va);
    2080:	a9402488 	ldp	x8, x9, [x4]
    2084:	aa0003e1 	mov	x1, x0
    2088:	a9411c86 	ldp	x6, x7, [x4, #16]
    208c:	aa0203e3 	mov	x3, x2
    2090:	910043e4 	add	x4, sp, #0x10
    2094:	aa0503e2 	mov	x2, x5
    2098:	d0ffffe0 	adrp	x0, 0 <main>
    209c:	91140000 	add	x0, x0, #0x500
    20a0:	a90127e8 	stp	x8, x9, [sp, #16]
    20a4:	a9021fe6 	stp	x6, x7, [sp, #32]
    20a8:	97fffc02 	bl	10b0 <_vsnprintf>
}
    20ac:	a8c37bfd 	ldp	x29, x30, [sp], #48
    20b0:	d65f03c0 	ret
    20b4:	d503201f 	nop
    20b8:	d503201f 	nop
    20bc:	d503201f 	nop

00000000000020c0 <fctprintf>:

int fctprintf(void (*out)(char character, void* arg), void* arg, const char* format, ...)
{
    20c0:	a9af7bfd 	stp	x29, x30, [sp, #-272]!
    va_list va;
    va_start(va, format);
    20c4:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    20c8:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    20cc:	910003fd 	mov	x29, sp
    va_start(va, format);
    20d0:	910443ea 	add	x10, sp, #0x110
    20d4:	910383eb 	add	x11, sp, #0xe0
    20d8:	f90023ea 	str	x10, [sp, #64]
{
    20dc:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    20e0:	910443e2 	add	x2, sp, #0x110
    20e4:	f90027e2 	str	x2, [sp, #72]
    20e8:	f9002beb 	str	x11, [sp, #80]
{
    20ec:	aa0003ec 	mov	x12, x0
    va_start(va, format);
    20f0:	290b23e9 	stp	w9, w8, [sp, #88]
{
    20f4:	aa0103eb 	mov	x11, x1
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    20f8:	a9443fee 	ldp	x14, x15, [sp, #64]
    20fc:	9100c3e1 	add	x1, sp, #0x30
    2100:	a94527e8 	ldp	x8, x9, [sp, #80]
    2104:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    2108:	f0ffffe0 	adrp	x0, 1000 <_ftoa+0x350>
    210c:	91024000 	add	x0, x0, #0x90
    2110:	a9013fee 	stp	x14, x15, [sp, #16]
    2114:	a90227e8 	stp	x8, x9, [sp, #32]
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    2118:	f9001bec 	str	x12, [sp, #48]
    211c:	f9001feb 	str	x11, [sp, #56]
{
    2120:	3d801be0 	str	q0, [sp, #96]
    2124:	3d801fe1 	str	q1, [sp, #112]
    2128:	3d8023e2 	str	q2, [sp, #128]
    212c:	3d8027e3 	str	q3, [sp, #144]
    2130:	3d802be4 	str	q4, [sp, #160]
    2134:	3d802fe5 	str	q5, [sp, #176]
    2138:	3d8033e6 	str	q6, [sp, #192]
    213c:	3d8037e7 	str	q7, [sp, #208]
    2140:	a90e93e3 	stp	x3, x4, [sp, #232]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    2144:	910043e4 	add	x4, sp, #0x10
    2148:	aa0a03e3 	mov	x3, x10
{
    214c:	a90f9be5 	stp	x5, x6, [sp, #248]
    2150:	f90087e7 	str	x7, [sp, #264]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    2154:	97fffbd7 	bl	10b0 <_vsnprintf>
    va_end(va);
    return ret;
    2158:	a8d17bfd 	ldp	x29, x30, [sp], #272
    215c:	d65f03c0 	ret

0000000000002160 <spawn>:
 */
#include "usyscall.h"
#include "libmem.h"

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, ipc_fsize_fn ipc_fsize, char* name, char** argv)
{
    2160:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    2164:	910003fd 	mov	x29, sp
    2168:	a90153f3 	stp	x19, x20, [sp, #16]
    216c:	a9025bf5 	stp	x21, x22, [sp, #32]
    2170:	2a0103f6 	mov	w22, w1
    2174:	a90363f7 	stp	x23, x24, [sp, #48]
    2178:	aa0203f8 	mov	x24, x2
    217c:	aa0003f7 	mov	x23, x0
    2180:	a9046bf9 	stp	x25, x26, [sp, #64]
    2184:	aa0403f9 	mov	x25, x4
    2188:	aa0503fa 	mov	x26, x5
    /* read elf image */
    int file_size = ipc_fsize(session, fd);
    218c:	d63f0060 	blr	x3
    2190:	2a0003f4 	mov	w20, w0
    void* img = malloc(file_size);
    2194:	93407c00 	sxtw	x0, w0
    2198:	9400077e 	bl	3f90 <malloc>
    int read_len = 0;
    while (read_len < file_size) {
    219c:	7100029f 	cmp	w20, #0x0
    void* img = malloc(file_size);
    21a0:	aa0003f5 	mov	x21, x0
    while (read_len < file_size) {
    21a4:	5400022d 	b.le	21e8 <spawn+0x88>
    21a8:	52800013 	mov	w19, #0x0                   	// #0
    21ac:	f9002bfb 	str	x27, [sp, #80]
    21b0:	5282001b 	mov	w27, #0x1000                	// #4096
    21b4:	d503201f 	nop
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    21b8:	4b130284 	sub	w4, w20, w19
        if (cur_read_len < 0) {
            return -1;
        }
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    21bc:	2a1303e3 	mov	w3, w19
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    21c0:	7140049f 	cmp	w4, #0x1, lsl #12
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    21c4:	8b33c2a2 	add	x2, x21, w19, sxtw
    21c8:	1a9bd084 	csel	w4, w4, w27, le
    21cc:	2a1603e1 	mov	w1, w22
    21d0:	aa1703e0 	mov	x0, x23
    21d4:	d63f0300 	blr	x24
    21d8:	0b000273 	add	w19, w19, w0
    while (read_len < file_size) {
    21dc:	6b13029f 	cmp	w20, w19
    21e0:	54fffecc 	b.gt	21b8 <spawn+0x58>
    21e4:	f9402bfb 	ldr	x27, [sp, #80]
    }
    /* sys call */
    int ret = syscall(SYSCALL_SPAWN, (uintptr_t)img, (uintptr_t)name, (uintptr_t)argv, 0);
    21e8:	aa1a03e3 	mov	x3, x26
    21ec:	aa1903e2 	mov	x2, x25
    21f0:	aa1503e1 	mov	x1, x21
    21f4:	d2800004 	mov	x4, #0x0                   	// #0
    21f8:	52800020 	mov	w0, #0x1                   	// #1
    21fc:	940000b9 	bl	24e0 <syscall>
    2200:	2a0003f3 	mov	w19, w0
    free(img);
    2204:	aa1503e0 	mov	x0, x21
    2208:	94000806 	bl	4220 <free>
    return ret;
}
    220c:	2a1303e0 	mov	w0, w19
    2210:	a94153f3 	ldp	x19, x20, [sp, #16]
    2214:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2218:	a94363f7 	ldp	x23, x24, [sp, #48]
    221c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    2220:	a8c67bfd 	ldp	x29, x30, [sp], #96
    2224:	d65f03c0 	ret
    2228:	d503201f 	nop
    222c:	d503201f 	nop

0000000000002230 <thread>:

int thread(void* entry, char* name, char** argv)
{
    2230:	aa0103e4 	mov	x4, x1
    return syscall(SYSCALL_THREAD, (uintptr_t)entry, (uintptr_t)name, (uintptr_t)argv, 0);
    2234:	aa0203e3 	mov	x3, x2
    2238:	aa0003e1 	mov	x1, x0
    223c:	aa0403e2 	mov	x2, x4
    2240:	52800120 	mov	w0, #0x9                   	// #9
    2244:	d2800004 	mov	x4, #0x0                   	// #0
    2248:	140000a6 	b	24e0 <syscall>
    224c:	d503201f 	nop

0000000000002250 <exit>:
}

void exit(int status)
{
    syscall(SYSCALL_EXIT, (uintptr_t)status, 0, 0, 0);
    2250:	93407c01 	sxtw	x1, w0
    2254:	d2800004 	mov	x4, #0x0                   	// #0
    2258:	d2800003 	mov	x3, #0x0                   	// #0
    225c:	d2800002 	mov	x2, #0x0                   	// #0
    2260:	52800040 	mov	w0, #0x2                   	// #2
    2264:	1400009f 	b	24e0 <syscall>
    2268:	d503201f 	nop
    226c:	d503201f 	nop

0000000000002270 <yield>:
}

int yield(task_yield_reason reason)
{
    return syscall(SYSCALL_YIELD, (uintptr_t)reason, 0, 0, 0);
    2270:	2a0003e1 	mov	w1, w0
    2274:	d2800004 	mov	x4, #0x0                   	// #0
    2278:	d2800003 	mov	x3, #0x0                   	// #0
    227c:	d2800002 	mov	x2, #0x0                   	// #0
    2280:	52800060 	mov	w0, #0x3                   	// #3
    2284:	14000097 	b	24e0 <syscall>
    2288:	d503201f 	nop
    228c:	d503201f 	nop

0000000000002290 <kill>:
}

int kill(int pid)
{
    return syscall(SYSCALL_KILL, (intptr_t)pid, 0, 0, 0);
    2290:	93407c01 	sxtw	x1, w0
    2294:	d2800004 	mov	x4, #0x0                   	// #0
    2298:	d2800003 	mov	x3, #0x0                   	// #0
    229c:	d2800002 	mov	x2, #0x0                   	// #0
    22a0:	52800180 	mov	w0, #0xc                   	// #12
    22a4:	1400008f 	b	24e0 <syscall>
    22a8:	d503201f 	nop
    22ac:	d503201f 	nop

00000000000022b0 <register_server>:
}

int register_server(char* name)
{
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    22b0:	aa0003e1 	mov	x1, x0
    22b4:	d2800004 	mov	x4, #0x0                   	// #0
    22b8:	d2800003 	mov	x3, #0x0                   	// #0
    22bc:	d2800002 	mov	x2, #0x0                   	// #0
    22c0:	528000a0 	mov	w0, #0x5                   	// #5
    22c4:	14000087 	b	24e0 <syscall>
    22c8:	d503201f 	nop
    22cc:	d503201f 	nop

00000000000022d0 <session>:
}

int session(char* path, int capacity, struct Session* user_session)
{
    22d0:	2a0103e4 	mov	w4, w1
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    22d4:	aa0203e3 	mov	x3, x2
    22d8:	aa0003e1 	mov	x1, x0
    22dc:	528000c0 	mov	w0, #0x6                   	// #6
    22e0:	93407c82 	sxtw	x2, w4
    22e4:	d2800004 	mov	x4, #0x0                   	// #0
    22e8:	1400007e 	b	24e0 <syscall>
    22ec:	d503201f 	nop

00000000000022f0 <poll_session>:
}

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    22f0:	93407c22 	sxtw	x2, w1
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    22f4:	d2800004 	mov	x4, #0x0                   	// #0
    22f8:	aa0003e1 	mov	x1, x0
    22fc:	d2800003 	mov	x3, #0x0                   	// #0
    2300:	528000e0 	mov	w0, #0x7                   	// #7
    2304:	14000077 	b	24e0 <syscall>
    2308:	d503201f 	nop
    230c:	d503201f 	nop

0000000000002310 <close_session>:
}

int close_session(struct Session* session)
{
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    2310:	aa0003e1 	mov	x1, x0
    2314:	d2800004 	mov	x4, #0x0                   	// #0
    2318:	d2800003 	mov	x3, #0x0                   	// #0
    231c:	d2800002 	mov	x2, #0x0                   	// #0
    2320:	52800100 	mov	w0, #0x8                   	// #8
    2324:	1400006f 	b	24e0 <syscall>
    2328:	d503201f 	nop
    232c:	d503201f 	nop

0000000000002330 <get_memblock_info>:
}

int get_memblock_info(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    2330:	aa0003e2 	mov	x2, x0
    2334:	d2800004 	mov	x4, #0x0                   	// #0
    2338:	d2800003 	mov	x3, #0x0                   	// #0
    233c:	d2800061 	mov	x1, #0x3                   	// #3
    2340:	52800140 	mov	w0, #0xa                   	// #10
    2344:	14000067 	b	24e0 <syscall>
    2348:	d503201f 	nop
    234c:	d503201f 	nop

0000000000002350 <set_priority>:
}

int set_priority(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    2350:	aa0003e2 	mov	x2, x0
    2354:	d2800004 	mov	x4, #0x0                   	// #0
    2358:	d2800003 	mov	x3, #0x0                   	// #0
    235c:	d2800021 	mov	x1, #0x1                   	// #1
    2360:	52800140 	mov	w0, #0xa                   	// #10
    2364:	1400005f 	b	24e0 <syscall>
    2368:	d503201f 	nop
    236c:	d503201f 	nop

0000000000002370 <task_heap_base>:
}

int task_heap_base()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    2370:	d2800004 	mov	x4, #0x0                   	// #0
    2374:	d2800003 	mov	x3, #0x0                   	// #0
    2378:	d2800002 	mov	x2, #0x0                   	// #0
    237c:	d2800041 	mov	x1, #0x2                   	// #2
    2380:	52800140 	mov	w0, #0xa                   	// #10
    2384:	14000057 	b	24e0 <syscall>
    2388:	d503201f 	nop
    238c:	d503201f 	nop

0000000000002390 <show_task>:
}

int show_task()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    2390:	d2800004 	mov	x4, #0x0                   	// #0
    2394:	d2800003 	mov	x3, #0x0                   	// #0
    2398:	d2800002 	mov	x2, #0x0                   	// #0
    239c:	d2800081 	mov	x1, #0x4                   	// #4
    23a0:	52800140 	mov	w0, #0xa                   	// #10
    23a4:	1400004f 	b	24e0 <syscall>
    23a8:	d503201f 	nop
    23ac:	d503201f 	nop

00000000000023b0 <show_mem>:
}

int show_mem()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    23b0:	d2800004 	mov	x4, #0x0                   	// #0
    23b4:	d2800003 	mov	x3, #0x0                   	// #0
    23b8:	d2800002 	mov	x2, #0x0                   	// #0
    23bc:	d28000a1 	mov	x1, #0x5                   	// #5
    23c0:	52800140 	mov	w0, #0xa                   	// #10
    23c4:	14000047 	b	24e0 <syscall>
    23c8:	d503201f 	nop
    23cc:	d503201f 	nop

00000000000023d0 <show_cpu>:
}

int show_cpu()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    23d0:	d2800004 	mov	x4, #0x0                   	// #0
    23d4:	d2800003 	mov	x3, #0x0                   	// #0
    23d8:	d2800002 	mov	x2, #0x0                   	// #0
    23dc:	d28000c1 	mov	x1, #0x6                   	// #6
    23e0:	52800140 	mov	w0, #0xa                   	// #10
    23e4:	1400003f 	b	24e0 <syscall>
    23e8:	d503201f 	nop
    23ec:	d503201f 	nop

00000000000023f0 <mmap>:
}

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    23f0:	2a0203e5 	mov	w5, w2
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    23f4:	92401c64 	and	x4, x3, #0xff
    23f8:	aa0103e2 	mov	x2, x1
    23fc:	aa0003e1 	mov	x1, x0
    2400:	93407ca3 	sxtw	x3, w5
    2404:	52800080 	mov	w0, #0x4                   	// #4
    2408:	14000036 	b	24e0 <syscall>
    240c:	d503201f 	nop

0000000000002410 <register_irq>:
}

int register_irq(int irq, int opcode)
{
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    2410:	93407c22 	sxtw	x2, w1
    2414:	d2800004 	mov	x4, #0x0                   	// #0
    2418:	93407c01 	sxtw	x1, w0
    241c:	d2800003 	mov	x3, #0x0                   	// #0
    2420:	52800160 	mov	w0, #0xb                   	// #11
    2424:	1400002f 	b	24e0 <syscall>
    2428:	d503201f 	nop
    242c:	d503201f 	nop

0000000000002430 <semaphore_new>:
}

int semaphore_new(int val)
{
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_NEW, (intptr_t)val, 0, 0);
    2430:	93407c02 	sxtw	x2, w0
    2434:	d2800004 	mov	x4, #0x0                   	// #0
    2438:	d2800003 	mov	x3, #0x0                   	// #0
    243c:	d2800001 	mov	x1, #0x0                   	// #0
    2440:	528001a0 	mov	w0, #0xd                   	// #13
    2444:	14000027 	b	24e0 <syscall>
    2448:	d503201f 	nop
    244c:	d503201f 	nop

0000000000002450 <semaphore_free>:
}

bool semaphore_free(int sem_id)
{
    2450:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    2454:	93407c02 	sxtw	x2, w0
    2458:	d2800004 	mov	x4, #0x0                   	// #0
{
    245c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    2460:	d2800003 	mov	x3, #0x0                   	// #0
    2464:	d2800021 	mov	x1, #0x1                   	// #1
    2468:	528001a0 	mov	w0, #0xd                   	// #13
    246c:	9400001d 	bl	24e0 <syscall>
    2470:	7100001f 	cmp	w0, #0x0
}
    2474:	1a9f07e0 	cset	w0, ne  // ne = any
    2478:	a8c17bfd 	ldp	x29, x30, [sp], #16
    247c:	d65f03c0 	ret

0000000000002480 <semaphore_wait>:

bool semaphore_wait(int sem_id)
{
    2480:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    2484:	93407c02 	sxtw	x2, w0
    2488:	d2800004 	mov	x4, #0x0                   	// #0
{
    248c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    2490:	d2800003 	mov	x3, #0x0                   	// #0
    2494:	d2800061 	mov	x1, #0x3                   	// #3
    2498:	528001a0 	mov	w0, #0xd                   	// #13
    249c:	94000011 	bl	24e0 <syscall>
    24a0:	7100001f 	cmp	w0, #0x0
}
    24a4:	1a9f07e0 	cset	w0, ne  // ne = any
    24a8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    24ac:	d65f03c0 	ret

00000000000024b0 <semaphore_signal>:

bool semaphore_signal(int sem_id)
{
    24b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    24b4:	93407c02 	sxtw	x2, w0
    24b8:	d2800004 	mov	x4, #0x0                   	// #0
{
    24bc:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    24c0:	d2800003 	mov	x3, #0x0                   	// #0
    24c4:	d2800041 	mov	x1, #0x2                   	// #2
    24c8:	528001a0 	mov	w0, #0xd                   	// #13
    24cc:	94000005 	bl	24e0 <syscall>
    24d0:	7100001f 	cmp	w0, #0x0
    24d4:	1a9f07e0 	cset	w0, ne  // ne = any
    24d8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    24dc:	d65f03c0 	ret

00000000000024e0 <syscall>:
 * See the Mulan PSL v2 for more details.
 */
#include "usyscall.h"

int syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    24e0:	2a0003e5 	mov	w5, w0
    24e4:	aa0103e6 	mov	x6, x1
    24e8:	aa0203e7 	mov	x7, x2
    24ec:	aa0303e8 	mov	x8, x3
    24f0:	aa0403e9 	mov	x9, x4
    int ret = -1;

    __asm__ volatile(
    24f4:	aa0503e0 	mov	x0, x5
    24f8:	aa0603e1 	mov	x1, x6
    24fc:	aa0703e2 	mov	x2, x7
    2500:	aa0803e3 	mov	x3, x8
    2504:	aa0903e4 	mov	x4, x9
    2508:	d4000001 	svc	#0x0
    250c:	d5033b9f 	dsb	ish
    2510:	d5033fdf 	isb
    2514:	aa0003e5 	mov	x5, x0
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    2518:	2a0503e0 	mov	w0, w5
    251c:	d65f03c0 	ret

0000000000002520 <ls>:
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
#include "libfs.h"

IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    2520:	b40006c0 	cbz	x0, 25f8 <ls+0xd8>
int ls(struct Session* session, char* path)
{
    2524:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    2528:	910003fd 	mov	x29, sp
    252c:	a90153f3 	stp	x19, x20, [sp, #16]
    2530:	aa0103f4 	mov	x20, x1
    2534:	f90013f5 	str	x21, [sp, #32]
    2538:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    253c:	aa0103e0 	mov	x0, x1
    2540:	94000930 	bl	4a00 <strlen>
    2544:	11000403 	add	w3, w0, #0x1
    2548:	9100e3e2 	add	x2, sp, #0x38
    254c:	52800021 	mov	w1, #0x1                   	// #1
    2550:	aa1503e0 	mov	x0, x21
    2554:	b9003be3 	str	w3, [sp, #56]
    2558:	94000392 	bl	33a0 <new_ipc_msg>
    255c:	aa0003f3 	mov	x19, x0
    2560:	aa1403e0 	mov	x0, x20
    2564:	94000927 	bl	4a00 <strlen>
    2568:	aa1403e2 	mov	x2, x20
    256c:	11000403 	add	w3, w0, #0x1
    2570:	52800001 	mov	w1, #0x0                   	// #0
    2574:	aa1303e0 	mov	x0, x19
    2578:	940003ca 	bl	34a0 <ipc_msg_set_nth_arg>
__attribute__((__always_inline__)) static inline bool ipc_msg_set_opcode(struct IpcMsg* msg, int opcode)
{
    if (opcode < 0 || opcode > UINT8_MAX) {
        return false;
    }
    msg->header.opcode = opcode;
    257c:	52800020 	mov	w0, #0x1                   	// #1
    2580:	39000660 	strb	w0, [x19, #1]
    2584:	aa1303e0 	mov	x0, x19
    2588:	94000436 	bl	3660 <ipc_msg_send_wait>
    258c:	aa1403e0 	mov	x0, x20
    2590:	9400091c 	bl	4a00 <strlen>
    2594:	aa1403e2 	mov	x2, x20
    2598:	11000403 	add	w3, w0, #0x1
    259c:	52800001 	mov	w1, #0x0                   	// #0
    25a0:	aa1303e0 	mov	x0, x19
    25a4:	940003f7 	bl	3580 <ipc_msg_get_nth_arg>
    25a8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    25ac:	39400260 	ldrb	w0, [x19]
    25b0:	36080280 	tbz	w0, #1, 2600 <ls+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    25b4:	91002261 	add	x1, x19, #0x8
    25b8:	d2800082 	mov	x2, #0x4                   	// #4
    25bc:	9100e3e0 	add	x0, sp, #0x38
    25c0:	94000800 	bl	45c0 <memcpy>
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    25c4:	b9800aa0 	ldrsw	x0, [x21, #8]
    25c8:	f9400aa1 	ldr	x1, [x21, #16]
    25cc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    25d0:	38606820 	ldrb	w0, [x1, x0]
    25d4:	36100080 	tbz	w0, #2, 25e4 <ls+0xc4>
        return false;
    }
    return session_free_buf(session, msg->header.len);
    25d8:	79400441 	ldrh	w1, [x2, #2]
    25dc:	aa1503e0 	mov	x0, x21
    25e0:	9400052c 	bl	3a90 <session_free_buf>
    25e4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_ls)(session, path);
}
    25e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    25ec:	f94013f5 	ldr	x21, [sp, #32]
    25f0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    25f4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    25f8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    25fc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    2600:	d0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    2604:	d0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    2608:	d0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    260c:	91170063 	add	x3, x3, #0x5c0
    2610:	9118a042 	add	x2, x2, #0x628
    2614:	91176000 	add	x0, x0, #0x5d8
    2618:	52800fc1 	mov	w1, #0x7e                  	// #126
    261c:	94000749 	bl	4340 <__assert_func>

0000000000002620 <cd>:

IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    2620:	b40006c0 	cbz	x0, 26f8 <cd+0xd8>
int cd(struct Session* session, char* path)
{
    2624:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    2628:	910003fd 	mov	x29, sp
    262c:	a90153f3 	stp	x19, x20, [sp, #16]
    2630:	aa0103f4 	mov	x20, x1
    2634:	f90013f5 	str	x21, [sp, #32]
    2638:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    263c:	aa0103e0 	mov	x0, x1
    2640:	940008f0 	bl	4a00 <strlen>
    2644:	11000403 	add	w3, w0, #0x1
    2648:	9100e3e2 	add	x2, sp, #0x38
    264c:	52800021 	mov	w1, #0x1                   	// #1
    2650:	aa1503e0 	mov	x0, x21
    2654:	b9003be3 	str	w3, [sp, #56]
    2658:	94000352 	bl	33a0 <new_ipc_msg>
    265c:	aa0003f3 	mov	x19, x0
    2660:	aa1403e0 	mov	x0, x20
    2664:	940008e7 	bl	4a00 <strlen>
    2668:	aa1403e2 	mov	x2, x20
    266c:	11000403 	add	w3, w0, #0x1
    2670:	52800001 	mov	w1, #0x0                   	// #0
    2674:	aa1303e0 	mov	x0, x19
    2678:	9400038a 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    267c:	52800040 	mov	w0, #0x2                   	// #2
    2680:	39000660 	strb	w0, [x19, #1]
    2684:	aa1303e0 	mov	x0, x19
    2688:	940003f6 	bl	3660 <ipc_msg_send_wait>
    268c:	aa1403e0 	mov	x0, x20
    2690:	940008dc 	bl	4a00 <strlen>
    2694:	aa1403e2 	mov	x2, x20
    2698:	11000403 	add	w3, w0, #0x1
    269c:	52800001 	mov	w1, #0x0                   	// #0
    26a0:	aa1303e0 	mov	x0, x19
    26a4:	940003b7 	bl	3580 <ipc_msg_get_nth_arg>
    26a8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    26ac:	39400260 	ldrb	w0, [x19]
    26b0:	36080280 	tbz	w0, #1, 2700 <cd+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    26b4:	91002261 	add	x1, x19, #0x8
    26b8:	d2800082 	mov	x2, #0x4                   	// #4
    26bc:	9100e3e0 	add	x0, sp, #0x38
    26c0:	940007c0 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    26c4:	b9800aa0 	ldrsw	x0, [x21, #8]
    26c8:	f9400aa1 	ldr	x1, [x21, #16]
    26cc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    26d0:	38606820 	ldrb	w0, [x1, x0]
    26d4:	36100080 	tbz	w0, #2, 26e4 <cd+0xc4>
    return session_free_buf(session, msg->header.len);
    26d8:	79400441 	ldrh	w1, [x2, #2]
    26dc:	aa1503e0 	mov	x0, x21
    26e0:	940004ec 	bl	3a90 <session_free_buf>
    26e4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_cd)(session, path);
}
    26e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    26ec:	f94013f5 	ldr	x21, [sp, #32]
    26f0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    26f4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    26f8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    26fc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    2700:	d0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    2704:	d0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    2708:	d0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    270c:	91170063 	add	x3, x3, #0x5c0
    2710:	9118a042 	add	x2, x2, #0x628
    2714:	91176000 	add	x0, x0, #0x5d8
    2718:	52800fc1 	mov	w1, #0x7e                  	// #126
    271c:	94000709 	bl	4340 <__assert_func>

0000000000002720 <mkdir>:

IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    2720:	b40006c0 	cbz	x0, 27f8 <mkdir+0xd8>
int mkdir(struct Session* session, char* path)
{
    2724:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    2728:	910003fd 	mov	x29, sp
    272c:	a90153f3 	stp	x19, x20, [sp, #16]
    2730:	aa0103f4 	mov	x20, x1
    2734:	f90013f5 	str	x21, [sp, #32]
    2738:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    273c:	aa0103e0 	mov	x0, x1
    2740:	940008b0 	bl	4a00 <strlen>
    2744:	11000403 	add	w3, w0, #0x1
    2748:	9100e3e2 	add	x2, sp, #0x38
    274c:	52800021 	mov	w1, #0x1                   	// #1
    2750:	aa1503e0 	mov	x0, x21
    2754:	b9003be3 	str	w3, [sp, #56]
    2758:	94000312 	bl	33a0 <new_ipc_msg>
    275c:	aa0003f3 	mov	x19, x0
    2760:	aa1403e0 	mov	x0, x20
    2764:	940008a7 	bl	4a00 <strlen>
    2768:	aa1403e2 	mov	x2, x20
    276c:	11000403 	add	w3, w0, #0x1
    2770:	52800001 	mov	w1, #0x0                   	// #0
    2774:	aa1303e0 	mov	x0, x19
    2778:	9400034a 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    277c:	52800060 	mov	w0, #0x3                   	// #3
    2780:	39000660 	strb	w0, [x19, #1]
    2784:	aa1303e0 	mov	x0, x19
    2788:	940003b6 	bl	3660 <ipc_msg_send_wait>
    278c:	aa1403e0 	mov	x0, x20
    2790:	9400089c 	bl	4a00 <strlen>
    2794:	aa1403e2 	mov	x2, x20
    2798:	11000403 	add	w3, w0, #0x1
    279c:	52800001 	mov	w1, #0x0                   	// #0
    27a0:	aa1303e0 	mov	x0, x19
    27a4:	94000377 	bl	3580 <ipc_msg_get_nth_arg>
    27a8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    27ac:	39400260 	ldrb	w0, [x19]
    27b0:	36080280 	tbz	w0, #1, 2800 <mkdir+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    27b4:	91002261 	add	x1, x19, #0x8
    27b8:	d2800082 	mov	x2, #0x4                   	// #4
    27bc:	9100e3e0 	add	x0, sp, #0x38
    27c0:	94000780 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    27c4:	b9800aa0 	ldrsw	x0, [x21, #8]
    27c8:	f9400aa1 	ldr	x1, [x21, #16]
    27cc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    27d0:	38606820 	ldrb	w0, [x1, x0]
    27d4:	36100080 	tbz	w0, #2, 27e4 <mkdir+0xc4>
    return session_free_buf(session, msg->header.len);
    27d8:	79400441 	ldrh	w1, [x2, #2]
    27dc:	aa1503e0 	mov	x0, x21
    27e0:	940004ac 	bl	3a90 <session_free_buf>
    27e4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_mkdir)(session, path);
}
    27e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    27ec:	f94013f5 	ldr	x21, [sp, #32]
    27f0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    27f4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    27f8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    27fc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    2800:	d0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    2804:	d0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    2808:	d0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    280c:	91170063 	add	x3, x3, #0x5c0
    2810:	9118a042 	add	x2, x2, #0x628
    2814:	91176000 	add	x0, x0, #0x5d8
    2818:	52800fc1 	mov	w1, #0x7e                  	// #126
    281c:	940006c9 	bl	4340 <__assert_func>

0000000000002820 <rm>:

IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    2820:	b40006c0 	cbz	x0, 28f8 <rm+0xd8>
int rm(struct Session* session, char* path)
{
    2824:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    2828:	910003fd 	mov	x29, sp
    282c:	a90153f3 	stp	x19, x20, [sp, #16]
    2830:	aa0103f4 	mov	x20, x1
    2834:	f90013f5 	str	x21, [sp, #32]
    2838:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    283c:	aa0103e0 	mov	x0, x1
    2840:	94000870 	bl	4a00 <strlen>
    2844:	11000403 	add	w3, w0, #0x1
    2848:	9100e3e2 	add	x2, sp, #0x38
    284c:	52800021 	mov	w1, #0x1                   	// #1
    2850:	aa1503e0 	mov	x0, x21
    2854:	b9003be3 	str	w3, [sp, #56]
    2858:	940002d2 	bl	33a0 <new_ipc_msg>
    285c:	aa0003f3 	mov	x19, x0
    2860:	aa1403e0 	mov	x0, x20
    2864:	94000867 	bl	4a00 <strlen>
    2868:	aa1403e2 	mov	x2, x20
    286c:	11000403 	add	w3, w0, #0x1
    2870:	52800001 	mov	w1, #0x0                   	// #0
    2874:	aa1303e0 	mov	x0, x19
    2878:	9400030a 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    287c:	52800080 	mov	w0, #0x4                   	// #4
    2880:	39000660 	strb	w0, [x19, #1]
    2884:	aa1303e0 	mov	x0, x19
    2888:	94000376 	bl	3660 <ipc_msg_send_wait>
    288c:	aa1403e0 	mov	x0, x20
    2890:	9400085c 	bl	4a00 <strlen>
    2894:	aa1403e2 	mov	x2, x20
    2898:	11000403 	add	w3, w0, #0x1
    289c:	52800001 	mov	w1, #0x0                   	// #0
    28a0:	aa1303e0 	mov	x0, x19
    28a4:	94000337 	bl	3580 <ipc_msg_get_nth_arg>
    28a8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    28ac:	39400260 	ldrb	w0, [x19]
    28b0:	36080280 	tbz	w0, #1, 2900 <rm+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    28b4:	91002261 	add	x1, x19, #0x8
    28b8:	d2800082 	mov	x2, #0x4                   	// #4
    28bc:	9100e3e0 	add	x0, sp, #0x38
    28c0:	94000740 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    28c4:	b9800aa0 	ldrsw	x0, [x21, #8]
    28c8:	f9400aa1 	ldr	x1, [x21, #16]
    28cc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    28d0:	38606820 	ldrb	w0, [x1, x0]
    28d4:	36100080 	tbz	w0, #2, 28e4 <rm+0xc4>
    return session_free_buf(session, msg->header.len);
    28d8:	79400441 	ldrh	w1, [x2, #2]
    28dc:	aa1503e0 	mov	x0, x21
    28e0:	9400046c 	bl	3a90 <session_free_buf>
    28e4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_delete)(session, path);
}
    28e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    28ec:	f94013f5 	ldr	x21, [sp, #32]
    28f0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    28f4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    28f8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    28fc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    2900:	d0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    2904:	d0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    2908:	d0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    290c:	91170063 	add	x3, x3, #0x5c0
    2910:	9118a042 	add	x2, x2, #0x628
    2914:	91176000 	add	x0, x0, #0x5d8
    2918:	52800fc1 	mov	w1, #0x7e                  	// #126
    291c:	94000689 	bl	4340 <__assert_func>

0000000000002920 <cat>:

IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    2920:	b40006c0 	cbz	x0, 29f8 <cat+0xd8>
int cat(struct Session* session, char* path)
{
    2924:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    2928:	910003fd 	mov	x29, sp
    292c:	a90153f3 	stp	x19, x20, [sp, #16]
    2930:	aa0103f4 	mov	x20, x1
    2934:	f90013f5 	str	x21, [sp, #32]
    2938:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    293c:	aa0103e0 	mov	x0, x1
    2940:	94000830 	bl	4a00 <strlen>
    2944:	11000403 	add	w3, w0, #0x1
    2948:	9100e3e2 	add	x2, sp, #0x38
    294c:	52800021 	mov	w1, #0x1                   	// #1
    2950:	aa1503e0 	mov	x0, x21
    2954:	b9003be3 	str	w3, [sp, #56]
    2958:	94000292 	bl	33a0 <new_ipc_msg>
    295c:	aa0003f3 	mov	x19, x0
    2960:	aa1403e0 	mov	x0, x20
    2964:	94000827 	bl	4a00 <strlen>
    2968:	aa1403e2 	mov	x2, x20
    296c:	11000403 	add	w3, w0, #0x1
    2970:	52800001 	mov	w1, #0x0                   	// #0
    2974:	aa1303e0 	mov	x0, x19
    2978:	940002ca 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    297c:	528000a0 	mov	w0, #0x5                   	// #5
    2980:	39000660 	strb	w0, [x19, #1]
    2984:	aa1303e0 	mov	x0, x19
    2988:	94000336 	bl	3660 <ipc_msg_send_wait>
    298c:	aa1403e0 	mov	x0, x20
    2990:	9400081c 	bl	4a00 <strlen>
    2994:	aa1403e2 	mov	x2, x20
    2998:	11000403 	add	w3, w0, #0x1
    299c:	52800001 	mov	w1, #0x0                   	// #0
    29a0:	aa1303e0 	mov	x0, x19
    29a4:	940002f7 	bl	3580 <ipc_msg_get_nth_arg>
    29a8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    29ac:	39400260 	ldrb	w0, [x19]
    29b0:	36080280 	tbz	w0, #1, 2a00 <cat+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    29b4:	91002261 	add	x1, x19, #0x8
    29b8:	d2800082 	mov	x2, #0x4                   	// #4
    29bc:	9100e3e0 	add	x0, sp, #0x38
    29c0:	94000700 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    29c4:	b9800aa0 	ldrsw	x0, [x21, #8]
    29c8:	f9400aa1 	ldr	x1, [x21, #16]
    29cc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    29d0:	38606820 	ldrb	w0, [x1, x0]
    29d4:	36100080 	tbz	w0, #2, 29e4 <cat+0xc4>
    return session_free_buf(session, msg->header.len);
    29d8:	79400441 	ldrh	w1, [x2, #2]
    29dc:	aa1503e0 	mov	x0, x21
    29e0:	9400042c 	bl	3a90 <session_free_buf>
    29e4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_cat)(session, path);
}
    29e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    29ec:	f94013f5 	ldr	x21, [sp, #32]
    29f0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    29f4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    29f8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    29fc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    2a00:	d0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    2a04:	d0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    2a08:	d0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    2a0c:	91170063 	add	x3, x3, #0x5c0
    2a10:	9118a042 	add	x2, x2, #0x628
    2a14:	91176000 	add	x0, x0, #0x5d8
    2a18:	52800fc1 	mov	w1, #0x7e                  	// #126
    2a1c:	94000649 	bl	4340 <__assert_func>

0000000000002a20 <open>:

IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    2a20:	b40006c0 	cbz	x0, 2af8 <open+0xd8>
int open(struct Session* session, char* path)
{
    2a24:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    2a28:	910003fd 	mov	x29, sp
    2a2c:	a90153f3 	stp	x19, x20, [sp, #16]
    2a30:	aa0103f4 	mov	x20, x1
    2a34:	f90013f5 	str	x21, [sp, #32]
    2a38:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    2a3c:	aa0103e0 	mov	x0, x1
    2a40:	940007f0 	bl	4a00 <strlen>
    2a44:	11000403 	add	w3, w0, #0x1
    2a48:	9100e3e2 	add	x2, sp, #0x38
    2a4c:	52800021 	mov	w1, #0x1                   	// #1
    2a50:	aa1503e0 	mov	x0, x21
    2a54:	b9003be3 	str	w3, [sp, #56]
    2a58:	94000252 	bl	33a0 <new_ipc_msg>
    2a5c:	aa0003f3 	mov	x19, x0
    2a60:	aa1403e0 	mov	x0, x20
    2a64:	940007e7 	bl	4a00 <strlen>
    2a68:	aa1403e2 	mov	x2, x20
    2a6c:	11000403 	add	w3, w0, #0x1
    2a70:	52800001 	mov	w1, #0x0                   	// #0
    2a74:	aa1303e0 	mov	x0, x19
    2a78:	9400028a 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    2a7c:	528000c0 	mov	w0, #0x6                   	// #6
    2a80:	39000660 	strb	w0, [x19, #1]
    2a84:	aa1303e0 	mov	x0, x19
    2a88:	940002f6 	bl	3660 <ipc_msg_send_wait>
    2a8c:	aa1403e0 	mov	x0, x20
    2a90:	940007dc 	bl	4a00 <strlen>
    2a94:	aa1403e2 	mov	x2, x20
    2a98:	11000403 	add	w3, w0, #0x1
    2a9c:	52800001 	mov	w1, #0x0                   	// #0
    2aa0:	aa1303e0 	mov	x0, x19
    2aa4:	940002b7 	bl	3580 <ipc_msg_get_nth_arg>
    2aa8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    2aac:	39400260 	ldrb	w0, [x19]
    2ab0:	36080280 	tbz	w0, #1, 2b00 <open+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    2ab4:	91002261 	add	x1, x19, #0x8
    2ab8:	d2800082 	mov	x2, #0x4                   	// #4
    2abc:	9100e3e0 	add	x0, sp, #0x38
    2ac0:	940006c0 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    2ac4:	b9800aa0 	ldrsw	x0, [x21, #8]
    2ac8:	f9400aa1 	ldr	x1, [x21, #16]
    2acc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    2ad0:	38606820 	ldrb	w0, [x1, x0]
    2ad4:	36100080 	tbz	w0, #2, 2ae4 <open+0xc4>
    return session_free_buf(session, msg->header.len);
    2ad8:	79400441 	ldrh	w1, [x2, #2]
    2adc:	aa1503e0 	mov	x0, x21
    2ae0:	940003ec 	bl	3a90 <session_free_buf>
    2ae4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_open)(session, path);
}
    2ae8:	a94153f3 	ldp	x19, x20, [sp, #16]
    2aec:	f94013f5 	ldr	x21, [sp, #32]
    2af0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    2af4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    2af8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    2afc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    2b00:	d0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    2b04:	d0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    2b08:	d0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    2b0c:	91170063 	add	x3, x3, #0x5c0
    2b10:	9118a042 	add	x2, x2, #0x628
    2b14:	91176000 	add	x0, x0, #0x5d8
    2b18:	52800fc1 	mov	w1, #0x7e                  	// #126
    2b1c:	94000609 	bl	4340 <__assert_func>

0000000000002b20 <close>:

IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
int close(struct Session* session, int fd)
{
    2b20:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    2b24:	910003fd 	mov	x29, sp
    2b28:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
    2b2c:	b4000560 	cbz	x0, 2bd8 <close+0xb8>
    2b30:	910123e2 	add	x2, sp, #0x48
    2b34:	52800021 	mov	w1, #0x1                   	// #1
    2b38:	a90153f3 	stp	x19, x20, [sp, #16]
    2b3c:	aa0003f4 	mov	x20, x0
    2b40:	f90013f5 	str	x21, [sp, #32]
    2b44:	52800095 	mov	w21, #0x4                   	// #4
    2b48:	b9004bf5 	str	w21, [sp, #72]
    2b4c:	94000215 	bl	33a0 <new_ipc_msg>
    2b50:	aa0003f3 	mov	x19, x0
    2b54:	2a1503e3 	mov	w3, w21
    2b58:	9100f3e2 	add	x2, sp, #0x3c
    2b5c:	52800001 	mov	w1, #0x0                   	// #0
    2b60:	94000250 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    2b64:	528000e0 	mov	w0, #0x7                   	// #7
    2b68:	39000660 	strb	w0, [x19, #1]
    2b6c:	aa1303e0 	mov	x0, x19
    2b70:	940002bc 	bl	3660 <ipc_msg_send_wait>
    2b74:	2a1503e3 	mov	w3, w21
    2b78:	9100f3e2 	add	x2, sp, #0x3c
    2b7c:	aa1303e0 	mov	x0, x19
    2b80:	52800001 	mov	w1, #0x0                   	// #0
    2b84:	9400027f 	bl	3580 <ipc_msg_get_nth_arg>
    2b88:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
    2b8c:	39400260 	ldrb	w0, [x19]
    2b90:	36080280 	tbz	w0, #1, 2be0 <close+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    2b94:	91002261 	add	x1, x19, #0x8
    2b98:	d2800082 	mov	x2, #0x4                   	// #4
    2b9c:	910123e0 	add	x0, sp, #0x48
    2ba0:	94000688 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    2ba4:	b9800a80 	ldrsw	x0, [x20, #8]
    2ba8:	f9400a81 	ldr	x1, [x20, #16]
    2bac:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    2bb0:	38606820 	ldrb	w0, [x1, x0]
    2bb4:	36100080 	tbz	w0, #2, 2bc4 <close+0xa4>
    return session_free_buf(session, msg->header.len);
    2bb8:	79400441 	ldrh	w1, [x2, #2]
    2bbc:	aa1403e0 	mov	x0, x20
    2bc0:	940003b4 	bl	3a90 <session_free_buf>
    2bc4:	a94153f3 	ldp	x19, x20, [sp, #16]
    2bc8:	b9404be0 	ldr	w0, [sp, #72]
    2bcc:	f94013f5 	ldr	x21, [sp, #32]
    return IPC_CALL(Ipc_close)(session, &fd);
}
    2bd0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    2bd4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
    2bd8:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_close)(session, &fd);
    2bdc:	17fffffd 	b	2bd0 <close+0xb0>
    assert(msg->header.done == 1);
    2be0:	d0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    2be4:	d0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    2be8:	d0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    2bec:	91170063 	add	x3, x3, #0x5c0
    2bf0:	9118a042 	add	x2, x2, #0x628
    2bf4:	91176000 	add	x0, x0, #0x5d8
    2bf8:	52800fc1 	mov	w1, #0x7e                  	// #126
    2bfc:	940005d1 	bl	4340 <__assert_func>

0000000000002c00 <read>:

IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
int read(struct Session* session, int fd, char* dst, int offset, int len)
{
    2c00:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    2c04:	910003fd 	mov	x29, sp
    2c08:	29068fe4 	stp	w4, w3, [sp, #52]
    2c0c:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    2c10:	b4000980 	cbz	x0, 2d40 <read+0x140>
    2c14:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
    2c18:	a90153f3 	stp	x19, x20, [sp, #16]
    2c1c:	52800094 	mov	w20, #0x4                   	// #4
    2c20:	2a1403e1 	mov	w1, w20
    2c24:	a9025bf5 	stp	x21, x22, [sp, #32]
    2c28:	aa0203f6 	mov	x22, x2
    2c2c:	aa0003f5 	mov	x21, x0
    2c30:	910103e2 	add	x2, sp, #0x40
    2c34:	290813f4 	stp	w20, w4, [sp, #64]
    2c38:	f90027e3 	str	x3, [sp, #72]
    2c3c:	940001d9 	bl	33a0 <new_ipc_msg>
    2c40:	2a1403e3 	mov	w3, w20
    2c44:	aa0003f3 	mov	x19, x0
    2c48:	9100f3e2 	add	x2, sp, #0x3c
    2c4c:	52800001 	mov	w1, #0x0                   	// #0
    2c50:	94000214 	bl	34a0 <ipc_msg_set_nth_arg>
    2c54:	b94037e3 	ldr	w3, [sp, #52]
    2c58:	aa1603e2 	mov	x2, x22
    2c5c:	52800021 	mov	w1, #0x1                   	// #1
    2c60:	aa1303e0 	mov	x0, x19
    2c64:	9400020f 	bl	34a0 <ipc_msg_set_nth_arg>
    2c68:	2a1403e3 	mov	w3, w20
    2c6c:	9100e3e2 	add	x2, sp, #0x38
    2c70:	52800041 	mov	w1, #0x2                   	// #2
    2c74:	aa1303e0 	mov	x0, x19
    2c78:	9400020a 	bl	34a0 <ipc_msg_set_nth_arg>
    2c7c:	2a1403e3 	mov	w3, w20
    2c80:	9100d3e2 	add	x2, sp, #0x34
    2c84:	52800061 	mov	w1, #0x3                   	// #3
    2c88:	aa1303e0 	mov	x0, x19
    2c8c:	94000205 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    2c90:	52800100 	mov	w0, #0x8                   	// #8
    2c94:	39000660 	strb	w0, [x19, #1]
    2c98:	aa1303e0 	mov	x0, x19
    2c9c:	94000271 	bl	3660 <ipc_msg_send_wait>
    2ca0:	2a1403e3 	mov	w3, w20
    2ca4:	9100f3e2 	add	x2, sp, #0x3c
    2ca8:	52800001 	mov	w1, #0x0                   	// #0
    2cac:	aa1303e0 	mov	x0, x19
    2cb0:	94000234 	bl	3580 <ipc_msg_get_nth_arg>
    2cb4:	b94037e3 	ldr	w3, [sp, #52]
    2cb8:	aa1603e2 	mov	x2, x22
    2cbc:	52800021 	mov	w1, #0x1                   	// #1
    2cc0:	aa1303e0 	mov	x0, x19
    2cc4:	9400022f 	bl	3580 <ipc_msg_get_nth_arg>
    2cc8:	2a1403e3 	mov	w3, w20
    2ccc:	9100e3e2 	add	x2, sp, #0x38
    2cd0:	52800041 	mov	w1, #0x2                   	// #2
    2cd4:	aa1303e0 	mov	x0, x19
    2cd8:	9400022a 	bl	3580 <ipc_msg_get_nth_arg>
    2cdc:	2a1403e3 	mov	w3, w20
    2ce0:	9100d3e2 	add	x2, sp, #0x34
    2ce4:	aa1303e0 	mov	x0, x19
    2ce8:	52800061 	mov	w1, #0x3                   	// #3
    2cec:	94000225 	bl	3580 <ipc_msg_get_nth_arg>
    2cf0:	b90043ff 	str	wzr, [sp, #64]
    assert(msg->header.done == 1);
    2cf4:	39400260 	ldrb	w0, [x19]
    2cf8:	36080280 	tbz	w0, #1, 2d48 <read+0x148>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    2cfc:	91002261 	add	x1, x19, #0x8
    2d00:	d2800082 	mov	x2, #0x4                   	// #4
    2d04:	910103e0 	add	x0, sp, #0x40
    2d08:	9400062e 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    2d0c:	b9800aa0 	ldrsw	x0, [x21, #8]
    2d10:	f9400aa1 	ldr	x1, [x21, #16]
    2d14:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    2d18:	38606820 	ldrb	w0, [x1, x0]
    2d1c:	36100080 	tbz	w0, #2, 2d2c <read+0x12c>
    return session_free_buf(session, msg->header.len);
    2d20:	79400441 	ldrh	w1, [x2, #2]
    2d24:	aa1503e0 	mov	x0, x21
    2d28:	9400035a 	bl	3a90 <session_free_buf>
    2d2c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2d30:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2d34:	b94043e0 	ldr	w0, [sp, #64]
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
}
    2d38:	a8c57bfd 	ldp	x29, x30, [sp], #80
    2d3c:	d65f03c0 	ret
IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    2d40:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
    2d44:	17fffffd 	b	2d38 <read+0x138>
    assert(msg->header.done == 1);
    2d48:	d0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    2d4c:	d0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    2d50:	d0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    2d54:	91170063 	add	x3, x3, #0x5c0
    2d58:	9118a042 	add	x2, x2, #0x628
    2d5c:	91176000 	add	x0, x0, #0x5d8
    2d60:	52800fc1 	mov	w1, #0x7e                  	// #126
    2d64:	94000577 	bl	4340 <__assert_func>
    2d68:	d503201f 	nop
    2d6c:	d503201f 	nop

0000000000002d70 <write>:

IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
int write(struct Session* session, int fd, char* src, int offset, int len)
{
    2d70:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    2d74:	910003fd 	mov	x29, sp
    2d78:	29068fe4 	stp	w4, w3, [sp, #52]
    2d7c:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    2d80:	b4000980 	cbz	x0, 2eb0 <write+0x140>
    2d84:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
    2d88:	a90153f3 	stp	x19, x20, [sp, #16]
    2d8c:	52800094 	mov	w20, #0x4                   	// #4
    2d90:	2a1403e1 	mov	w1, w20
    2d94:	a9025bf5 	stp	x21, x22, [sp, #32]
    2d98:	aa0203f6 	mov	x22, x2
    2d9c:	aa0003f5 	mov	x21, x0
    2da0:	910103e2 	add	x2, sp, #0x40
    2da4:	290813f4 	stp	w20, w4, [sp, #64]
    2da8:	f90027e3 	str	x3, [sp, #72]
    2dac:	9400017d 	bl	33a0 <new_ipc_msg>
    2db0:	2a1403e3 	mov	w3, w20
    2db4:	aa0003f3 	mov	x19, x0
    2db8:	9100f3e2 	add	x2, sp, #0x3c
    2dbc:	52800001 	mov	w1, #0x0                   	// #0
    2dc0:	940001b8 	bl	34a0 <ipc_msg_set_nth_arg>
    2dc4:	b94037e3 	ldr	w3, [sp, #52]
    2dc8:	aa1603e2 	mov	x2, x22
    2dcc:	52800021 	mov	w1, #0x1                   	// #1
    2dd0:	aa1303e0 	mov	x0, x19
    2dd4:	940001b3 	bl	34a0 <ipc_msg_set_nth_arg>
    2dd8:	2a1403e3 	mov	w3, w20
    2ddc:	9100e3e2 	add	x2, sp, #0x38
    2de0:	52800041 	mov	w1, #0x2                   	// #2
    2de4:	aa1303e0 	mov	x0, x19
    2de8:	940001ae 	bl	34a0 <ipc_msg_set_nth_arg>
    2dec:	2a1403e3 	mov	w3, w20
    2df0:	9100d3e2 	add	x2, sp, #0x34
    2df4:	52800061 	mov	w1, #0x3                   	// #3
    2df8:	aa1303e0 	mov	x0, x19
    2dfc:	940001a9 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    2e00:	52800120 	mov	w0, #0x9                   	// #9
    2e04:	39000660 	strb	w0, [x19, #1]
    2e08:	aa1303e0 	mov	x0, x19
    2e0c:	94000215 	bl	3660 <ipc_msg_send_wait>
    2e10:	2a1403e3 	mov	w3, w20
    2e14:	9100f3e2 	add	x2, sp, #0x3c
    2e18:	52800001 	mov	w1, #0x0                   	// #0
    2e1c:	aa1303e0 	mov	x0, x19
    2e20:	940001d8 	bl	3580 <ipc_msg_get_nth_arg>
    2e24:	b94037e3 	ldr	w3, [sp, #52]
    2e28:	aa1603e2 	mov	x2, x22
    2e2c:	52800021 	mov	w1, #0x1                   	// #1
    2e30:	aa1303e0 	mov	x0, x19
    2e34:	940001d3 	bl	3580 <ipc_msg_get_nth_arg>
    2e38:	2a1403e3 	mov	w3, w20
    2e3c:	9100e3e2 	add	x2, sp, #0x38
    2e40:	52800041 	mov	w1, #0x2                   	// #2
    2e44:	aa1303e0 	mov	x0, x19
    2e48:	940001ce 	bl	3580 <ipc_msg_get_nth_arg>
    2e4c:	2a1403e3 	mov	w3, w20
    2e50:	9100d3e2 	add	x2, sp, #0x34
    2e54:	aa1303e0 	mov	x0, x19
    2e58:	52800061 	mov	w1, #0x3                   	// #3
    2e5c:	940001c9 	bl	3580 <ipc_msg_get_nth_arg>
    2e60:	b90043ff 	str	wzr, [sp, #64]
    assert(msg->header.done == 1);
    2e64:	39400260 	ldrb	w0, [x19]
    2e68:	36080280 	tbz	w0, #1, 2eb8 <write+0x148>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    2e6c:	91002261 	add	x1, x19, #0x8
    2e70:	d2800082 	mov	x2, #0x4                   	// #4
    2e74:	910103e0 	add	x0, sp, #0x40
    2e78:	940005d2 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    2e7c:	b9800aa0 	ldrsw	x0, [x21, #8]
    2e80:	f9400aa1 	ldr	x1, [x21, #16]
    2e84:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    2e88:	38606820 	ldrb	w0, [x1, x0]
    2e8c:	36100080 	tbz	w0, #2, 2e9c <write+0x12c>
    return session_free_buf(session, msg->header.len);
    2e90:	79400441 	ldrh	w1, [x2, #2]
    2e94:	aa1503e0 	mov	x0, x21
    2e98:	940002fe 	bl	3a90 <session_free_buf>
    2e9c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2ea0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2ea4:	b94043e0 	ldr	w0, [sp, #64]
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
}
    2ea8:	a8c57bfd 	ldp	x29, x30, [sp], #80
    2eac:	d65f03c0 	ret
IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    2eb0:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
    2eb4:	17fffffd 	b	2ea8 <write+0x138>
    assert(msg->header.done == 1);
    2eb8:	d0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    2ebc:	d0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    2ec0:	d0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    2ec4:	91170063 	add	x3, x3, #0x5c0
    2ec8:	9118a042 	add	x2, x2, #0x628
    2ecc:	91176000 	add	x0, x0, #0x5d8
    2ed0:	52800fc1 	mov	w1, #0x7e                  	// #126
    2ed4:	9400051b 	bl	4340 <__assert_func>
    2ed8:	d503201f 	nop
    2edc:	d503201f 	nop

0000000000002ee0 <fsize>:

IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
int fsize(struct Session* session, int fd)
{
    2ee0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    2ee4:	910003fd 	mov	x29, sp
    2ee8:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
    2eec:	b4000560 	cbz	x0, 2f98 <fsize+0xb8>
    2ef0:	910123e2 	add	x2, sp, #0x48
    2ef4:	52800021 	mov	w1, #0x1                   	// #1
    2ef8:	a90153f3 	stp	x19, x20, [sp, #16]
    2efc:	aa0003f4 	mov	x20, x0
    2f00:	f90013f5 	str	x21, [sp, #32]
    2f04:	52800095 	mov	w21, #0x4                   	// #4
    2f08:	b9004bf5 	str	w21, [sp, #72]
    2f0c:	94000125 	bl	33a0 <new_ipc_msg>
    2f10:	aa0003f3 	mov	x19, x0
    2f14:	2a1503e3 	mov	w3, w21
    2f18:	9100f3e2 	add	x2, sp, #0x3c
    2f1c:	52800001 	mov	w1, #0x0                   	// #0
    2f20:	94000160 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    2f24:	52800140 	mov	w0, #0xa                   	// #10
    2f28:	39000660 	strb	w0, [x19, #1]
    2f2c:	aa1303e0 	mov	x0, x19
    2f30:	940001cc 	bl	3660 <ipc_msg_send_wait>
    2f34:	2a1503e3 	mov	w3, w21
    2f38:	9100f3e2 	add	x2, sp, #0x3c
    2f3c:	aa1303e0 	mov	x0, x19
    2f40:	52800001 	mov	w1, #0x0                   	// #0
    2f44:	9400018f 	bl	3580 <ipc_msg_get_nth_arg>
    2f48:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
    2f4c:	39400260 	ldrb	w0, [x19]
    2f50:	36080280 	tbz	w0, #1, 2fa0 <fsize+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    2f54:	91002261 	add	x1, x19, #0x8
    2f58:	d2800082 	mov	x2, #0x4                   	// #4
    2f5c:	910123e0 	add	x0, sp, #0x48
    2f60:	94000598 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    2f64:	b9800a80 	ldrsw	x0, [x20, #8]
    2f68:	f9400a81 	ldr	x1, [x20, #16]
    2f6c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    2f70:	38606820 	ldrb	w0, [x1, x0]
    2f74:	36100080 	tbz	w0, #2, 2f84 <fsize+0xa4>
    return session_free_buf(session, msg->header.len);
    2f78:	79400441 	ldrh	w1, [x2, #2]
    2f7c:	aa1403e0 	mov	x0, x20
    2f80:	940002c4 	bl	3a90 <session_free_buf>
    2f84:	a94153f3 	ldp	x19, x20, [sp, #16]
    2f88:	b9404be0 	ldr	w0, [sp, #72]
    2f8c:	f94013f5 	ldr	x21, [sp, #32]
    return IPC_CALL(Ipc_fsize)(session, &fd);
    2f90:	a8c57bfd 	ldp	x29, x30, [sp], #80
    2f94:	d65f03c0 	ret
IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
    2f98:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_fsize)(session, &fd);
    2f9c:	17fffffd 	b	2f90 <fsize+0xb0>
    assert(msg->header.done == 1);
    2fa0:	d0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    2fa4:	d0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    2fa8:	d0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    2fac:	91170063 	add	x3, x3, #0x5c0
    2fb0:	9118a042 	add	x2, x2, #0x628
    2fb4:	91176000 	add	x0, x0, #0x5d8
    2fb8:	52800fc1 	mov	w1, #0x7e                  	// #126
    2fbc:	940004e1 	bl	4340 <__assert_func>

0000000000002fc0 <sem_create>:

#include "libsemaphore.h"

IPC_INTERFACE(Ipc_sem_create, 2, sem, count, sizeof(sem_t), sizeof(int));
sem_err_t sem_create(struct Session* session, sem_t* sem, int count)
{
    2fc0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    2fc4:	910003fd 	mov	x29, sp
    2fc8:	b9003fe2 	str	w2, [sp, #60]
IPC_INTERFACE(Ipc_sem_create, 2, sem, count, sizeof(sem_t), sizeof(int));
    2fcc:	b40006c0 	cbz	x0, 30a4 <sem_create+0xe4>
    2fd0:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
    2fd4:	910123e2 	add	x2, sp, #0x48
    2fd8:	a90153f3 	stp	x19, x20, [sp, #16]
    2fdc:	aa0003f4 	mov	x20, x0
    2fe0:	f90013f5 	str	x21, [sp, #32]
    2fe4:	aa0103f5 	mov	x21, x1
    2fe8:	52800041 	mov	w1, #0x2                   	// #2
    2fec:	f90027e3 	str	x3, [sp, #72]
    2ff0:	940000ec 	bl	33a0 <new_ipc_msg>
    2ff4:	aa0003f3 	mov	x19, x0
    2ff8:	aa1503e2 	mov	x2, x21
    2ffc:	52800083 	mov	w3, #0x4                   	// #4
    3000:	52800001 	mov	w1, #0x0                   	// #0
    3004:	94000127 	bl	34a0 <ipc_msg_set_nth_arg>
    3008:	9100f3e2 	add	x2, sp, #0x3c
    300c:	52800083 	mov	w3, #0x4                   	// #4
    3010:	52800021 	mov	w1, #0x1                   	// #1
    3014:	aa1303e0 	mov	x0, x19
    3018:	94000122 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    301c:	52800020 	mov	w0, #0x1                   	// #1
    3020:	39000660 	strb	w0, [x19, #1]
    3024:	aa1303e0 	mov	x0, x19
    3028:	9400018e 	bl	3660 <ipc_msg_send_wait>
    302c:	aa1503e2 	mov	x2, x21
    3030:	52800083 	mov	w3, #0x4                   	// #4
    3034:	52800001 	mov	w1, #0x0                   	// #0
    3038:	aa1303e0 	mov	x0, x19
    303c:	94000151 	bl	3580 <ipc_msg_get_nth_arg>
    3040:	9100f3e2 	add	x2, sp, #0x3c
    3044:	aa1303e0 	mov	x0, x19
    3048:	52800083 	mov	w3, #0x4                   	// #4
    304c:	52800021 	mov	w1, #0x1                   	// #1
    3050:	9400014c 	bl	3580 <ipc_msg_get_nth_arg>
    3054:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
    3058:	39400260 	ldrb	w0, [x19]
    305c:	36080280 	tbz	w0, #1, 30ac <sem_create+0xec>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    3060:	91002261 	add	x1, x19, #0x8
    3064:	d2800082 	mov	x2, #0x4                   	// #4
    3068:	910123e0 	add	x0, sp, #0x48
    306c:	94000555 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    3070:	b9800a80 	ldrsw	x0, [x20, #8]
    3074:	f9400a81 	ldr	x1, [x20, #16]
    3078:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    307c:	38606820 	ldrb	w0, [x1, x0]
    3080:	36100080 	tbz	w0, #2, 3090 <sem_create+0xd0>
    return session_free_buf(session, msg->header.len);
    3084:	79400441 	ldrh	w1, [x2, #2]
    3088:	aa1403e0 	mov	x0, x20
    308c:	94000281 	bl	3a90 <session_free_buf>
    3090:	a94153f3 	ldp	x19, x20, [sp, #16]
    3094:	b9404be0 	ldr	w0, [sp, #72]
    3098:	f94013f5 	ldr	x21, [sp, #32]
    return IPC_CALL(Ipc_sem_create)(session, sem, &count);
}
    309c:	a8c57bfd 	ldp	x29, x30, [sp], #80
    30a0:	d65f03c0 	ret
IPC_INTERFACE(Ipc_sem_create, 2, sem, count, sizeof(sem_t), sizeof(int));
    30a4:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_sem_create)(session, sem, &count);
    30a8:	17fffffd 	b	309c <sem_create+0xdc>
    assert(msg->header.done == 1);
    30ac:	b0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    30b0:	b0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    30b4:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    30b8:	91170063 	add	x3, x3, #0x5c0
    30bc:	91190042 	add	x2, x2, #0x640
    30c0:	91176000 	add	x0, x0, #0x5d8
    30c4:	52800fc1 	mov	w1, #0x7e                  	// #126
    30c8:	9400049e 	bl	4340 <__assert_func>
    30cc:	d503201f 	nop

00000000000030d0 <sem_delete>:

IPC_INTERFACE(Ipc_sem_delete, 1, sem, sizeof(sem_t));
    30d0:	b40005c0 	cbz	x0, 3188 <sem_delete+0xb8>
sem_err_t sem_delete(struct Session* session, sem_t* sem)
{
    30d4:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    30d8:	910003fd 	mov	x29, sp
IPC_INTERFACE(Ipc_sem_delete, 1, sem, sizeof(sem_t));
    30dc:	9100e3e2 	add	x2, sp, #0x38
{
    30e0:	a90153f3 	stp	x19, x20, [sp, #16]
    30e4:	aa0003f4 	mov	x20, x0
    30e8:	a9025bf5 	stp	x21, x22, [sp, #32]
    30ec:	aa0103f5 	mov	x21, x1
IPC_INTERFACE(Ipc_sem_delete, 1, sem, sizeof(sem_t));
    30f0:	52800096 	mov	w22, #0x4                   	// #4
    30f4:	52800021 	mov	w1, #0x1                   	// #1
    30f8:	b9003bf6 	str	w22, [sp, #56]
    30fc:	940000a9 	bl	33a0 <new_ipc_msg>
    3100:	aa0003f3 	mov	x19, x0
    3104:	2a1603e3 	mov	w3, w22
    3108:	aa1503e2 	mov	x2, x21
    310c:	52800001 	mov	w1, #0x0                   	// #0
    3110:	940000e4 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    3114:	52800041 	mov	w1, #0x2                   	// #2
    3118:	39000661 	strb	w1, [x19, #1]
    311c:	aa1303e0 	mov	x0, x19
    3120:	94000150 	bl	3660 <ipc_msg_send_wait>
    3124:	2a1603e3 	mov	w3, w22
    3128:	aa1503e2 	mov	x2, x21
    312c:	aa1303e0 	mov	x0, x19
    3130:	52800001 	mov	w1, #0x0                   	// #0
    3134:	94000113 	bl	3580 <ipc_msg_get_nth_arg>
    3138:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    313c:	39400260 	ldrb	w0, [x19]
    3140:	36080280 	tbz	w0, #1, 3190 <sem_delete+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    3144:	91002261 	add	x1, x19, #0x8
    3148:	d2800082 	mov	x2, #0x4                   	// #4
    314c:	9100e3e0 	add	x0, sp, #0x38
    3150:	9400051c 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    3154:	b9800a80 	ldrsw	x0, [x20, #8]
    3158:	f9400a81 	ldr	x1, [x20, #16]
    315c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    3160:	38606820 	ldrb	w0, [x1, x0]
    3164:	36100080 	tbz	w0, #2, 3174 <sem_delete+0xa4>
    return session_free_buf(session, msg->header.len);
    3168:	79400441 	ldrh	w1, [x2, #2]
    316c:	aa1403e0 	mov	x0, x20
    3170:	94000248 	bl	3a90 <session_free_buf>
    3174:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_sem_delete)(session, sem);
}
    3178:	a94153f3 	ldp	x19, x20, [sp, #16]
    317c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3180:	a8c47bfd 	ldp	x29, x30, [sp], #64
    3184:	d65f03c0 	ret
IPC_INTERFACE(Ipc_sem_delete, 1, sem, sizeof(sem_t));
    3188:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    318c:	d65f03c0 	ret
    assert(msg->header.done == 1);
    3190:	b0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    3194:	b0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    3198:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    319c:	91170063 	add	x3, x3, #0x5c0
    31a0:	91190042 	add	x2, x2, #0x640
    31a4:	91176000 	add	x0, x0, #0x5d8
    31a8:	52800fc1 	mov	w1, #0x7e                  	// #126
    31ac:	94000465 	bl	4340 <__assert_func>

00000000000031b0 <sem_signal>:

IPC_INTERFACE(Ipc_sem_signal, 1, sem, sizeof(sem_t));
    31b0:	b40005c0 	cbz	x0, 3268 <sem_signal+0xb8>
int sem_signal(struct Session* session, sem_t* sem)
{
    31b4:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    31b8:	910003fd 	mov	x29, sp
IPC_INTERFACE(Ipc_sem_signal, 1, sem, sizeof(sem_t));
    31bc:	9100e3e2 	add	x2, sp, #0x38
{
    31c0:	a90153f3 	stp	x19, x20, [sp, #16]
    31c4:	aa0003f4 	mov	x20, x0
    31c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    31cc:	aa0103f5 	mov	x21, x1
IPC_INTERFACE(Ipc_sem_signal, 1, sem, sizeof(sem_t));
    31d0:	52800096 	mov	w22, #0x4                   	// #4
    31d4:	52800021 	mov	w1, #0x1                   	// #1
    31d8:	b9003bf6 	str	w22, [sp, #56]
    31dc:	94000071 	bl	33a0 <new_ipc_msg>
    31e0:	aa0003f3 	mov	x19, x0
    31e4:	2a1603e3 	mov	w3, w22
    31e8:	aa1503e2 	mov	x2, x21
    31ec:	52800001 	mov	w1, #0x0                   	// #0
    31f0:	940000ac 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    31f4:	52800061 	mov	w1, #0x3                   	// #3
    31f8:	39000661 	strb	w1, [x19, #1]
    31fc:	aa1303e0 	mov	x0, x19
    3200:	94000118 	bl	3660 <ipc_msg_send_wait>
    3204:	2a1603e3 	mov	w3, w22
    3208:	aa1503e2 	mov	x2, x21
    320c:	aa1303e0 	mov	x0, x19
    3210:	52800001 	mov	w1, #0x0                   	// #0
    3214:	940000db 	bl	3580 <ipc_msg_get_nth_arg>
    3218:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    321c:	39400260 	ldrb	w0, [x19]
    3220:	36080280 	tbz	w0, #1, 3270 <sem_signal+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    3224:	91002261 	add	x1, x19, #0x8
    3228:	d2800082 	mov	x2, #0x4                   	// #4
    322c:	9100e3e0 	add	x0, sp, #0x38
    3230:	940004e4 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    3234:	b9800a80 	ldrsw	x0, [x20, #8]
    3238:	f9400a81 	ldr	x1, [x20, #16]
    323c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    3240:	38606820 	ldrb	w0, [x1, x0]
    3244:	36100080 	tbz	w0, #2, 3254 <sem_signal+0xa4>
    return session_free_buf(session, msg->header.len);
    3248:	79400441 	ldrh	w1, [x2, #2]
    324c:	aa1403e0 	mov	x0, x20
    3250:	94000210 	bl	3a90 <session_free_buf>
    3254:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_sem_signal)(session, sem);
}
    3258:	a94153f3 	ldp	x19, x20, [sp, #16]
    325c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3260:	a8c47bfd 	ldp	x29, x30, [sp], #64
    3264:	d65f03c0 	ret
IPC_INTERFACE(Ipc_sem_signal, 1, sem, sizeof(sem_t));
    3268:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    326c:	d65f03c0 	ret
    assert(msg->header.done == 1);
    3270:	b0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    3274:	b0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    3278:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    327c:	91170063 	add	x3, x3, #0x5c0
    3280:	91190042 	add	x2, x2, #0x640
    3284:	91176000 	add	x0, x0, #0x5d8
    3288:	52800fc1 	mov	w1, #0x7e                  	// #126
    328c:	9400042d 	bl	4340 <__assert_func>

0000000000003290 <sem_wait>:

IPC_INTERFACE(Ipc_sem_wait, 2, sem, timeout, sizeof(sem_t), sizeof(int));
int sem_wait(struct Session* session, sem_t* sem, int timeout)
{
    3290:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    3294:	910003fd 	mov	x29, sp
    3298:	b9003fe2 	str	w2, [sp, #60]
IPC_INTERFACE(Ipc_sem_wait, 2, sem, timeout, sizeof(sem_t), sizeof(int));
    329c:	b40006c0 	cbz	x0, 3374 <sem_wait+0xe4>
    32a0:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
    32a4:	910123e2 	add	x2, sp, #0x48
    32a8:	a90153f3 	stp	x19, x20, [sp, #16]
    32ac:	aa0003f4 	mov	x20, x0
    32b0:	f90013f5 	str	x21, [sp, #32]
    32b4:	aa0103f5 	mov	x21, x1
    32b8:	52800041 	mov	w1, #0x2                   	// #2
    32bc:	f90027e3 	str	x3, [sp, #72]
    32c0:	94000038 	bl	33a0 <new_ipc_msg>
    32c4:	aa0003f3 	mov	x19, x0
    32c8:	aa1503e2 	mov	x2, x21
    32cc:	52800083 	mov	w3, #0x4                   	// #4
    32d0:	52800001 	mov	w1, #0x0                   	// #0
    32d4:	94000073 	bl	34a0 <ipc_msg_set_nth_arg>
    32d8:	9100f3e2 	add	x2, sp, #0x3c
    32dc:	52800083 	mov	w3, #0x4                   	// #4
    32e0:	52800021 	mov	w1, #0x1                   	// #1
    32e4:	aa1303e0 	mov	x0, x19
    32e8:	9400006e 	bl	34a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    32ec:	52800080 	mov	w0, #0x4                   	// #4
    32f0:	39000660 	strb	w0, [x19, #1]
    32f4:	aa1303e0 	mov	x0, x19
    32f8:	940000da 	bl	3660 <ipc_msg_send_wait>
    32fc:	aa1503e2 	mov	x2, x21
    3300:	52800083 	mov	w3, #0x4                   	// #4
    3304:	52800001 	mov	w1, #0x0                   	// #0
    3308:	aa1303e0 	mov	x0, x19
    330c:	9400009d 	bl	3580 <ipc_msg_get_nth_arg>
    3310:	9100f3e2 	add	x2, sp, #0x3c
    3314:	aa1303e0 	mov	x0, x19
    3318:	52800083 	mov	w3, #0x4                   	// #4
    331c:	52800021 	mov	w1, #0x1                   	// #1
    3320:	94000098 	bl	3580 <ipc_msg_get_nth_arg>
    3324:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
    3328:	39400260 	ldrb	w0, [x19]
    332c:	36080280 	tbz	w0, #1, 337c <sem_wait+0xec>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    3330:	91002261 	add	x1, x19, #0x8
    3334:	d2800082 	mov	x2, #0x4                   	// #4
    3338:	910123e0 	add	x0, sp, #0x48
    333c:	940004a1 	bl	45c0 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    3340:	b9800a80 	ldrsw	x0, [x20, #8]
    3344:	f9400a81 	ldr	x1, [x20, #16]
    3348:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    334c:	38606820 	ldrb	w0, [x1, x0]
    3350:	36100080 	tbz	w0, #2, 3360 <sem_wait+0xd0>
    return session_free_buf(session, msg->header.len);
    3354:	79400441 	ldrh	w1, [x2, #2]
    3358:	aa1403e0 	mov	x0, x20
    335c:	940001cd 	bl	3a90 <session_free_buf>
    3360:	a94153f3 	ldp	x19, x20, [sp, #16]
    3364:	b9404be0 	ldr	w0, [sp, #72]
    3368:	f94013f5 	ldr	x21, [sp, #32]
    return IPC_CALL(Ipc_sem_wait)(session, sem, &timeout);
    336c:	a8c57bfd 	ldp	x29, x30, [sp], #80
    3370:	d65f03c0 	ret
IPC_INTERFACE(Ipc_sem_wait, 2, sem, timeout, sizeof(sem_t), sizeof(int));
    3374:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_sem_wait)(session, sem, &timeout);
    3378:	17fffffd 	b	336c <sem_wait+0xdc>
    assert(msg->header.done == 1);
    337c:	b0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    3380:	b0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
    3384:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    3388:	91170063 	add	x3, x3, #0x5c0
    338c:	91190042 	add	x2, x2, #0x640
    3390:	91176000 	add	x0, x0, #0x5d8
    3394:	52800fc1 	mov	w1, #0x7e                  	// #126
    3398:	940003ea 	bl	4340 <__assert_func>
    339c:	d503201f 	nop

00000000000033a0 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    33a0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!

    int arg_info_offset = len; // start of arg info
    len += argc * sizeof(struct IpcArgInfo);

    int arg_buf_offset = len; // start of arg buffer
    for (int i = 0; i < argc; i++) {
    33a4:	7100003f 	cmp	w1, #0x0
{
    33a8:	910003fd 	mov	x29, sp
    33ac:	a90153f3 	stp	x19, x20, [sp, #16]
    len += argc * sizeof(struct IpcArgInfo);
    33b0:	528000d4 	mov	w20, #0x6                   	// #6
    33b4:	1b147c34 	mul	w20, w1, w20
{
    33b8:	a9025bf5 	stp	x21, x22, [sp, #32]
    33bc:	2a0103f5 	mov	w21, w1
    len += argc * sizeof(struct IpcArgInfo);
    33c0:	11003294 	add	w20, w20, #0xc
    for (int i = 0; i < argc; i++) {
    33c4:	5400056d 	b.le	3470 <new_ipc_msg+0xd0>
    33c8:	aa0003e3 	mov	x3, x0
    len += argc * sizeof(struct IpcArgInfo);
    33cc:	2a1403f6 	mov	w22, w20
    33d0:	aa0203f3 	mov	x19, x2
    for (int i = 0; i < argc; i++) {
    33d4:	d2800002 	mov	x2, #0x0                   	// #0
        len += arg_size[i];
    33d8:	b8627a61 	ldr	w1, [x19, x2, lsl #2]
    for (int i = 0; i < argc; i++) {
    33dc:	91000442 	add	x2, x2, #0x1
    33e0:	6b0202bf 	cmp	w21, w2
        len += arg_size[i];
    33e4:	0b0102d6 	add	w22, w22, w1
    for (int i = 0; i < argc; i++) {
    33e8:	54ffff8c 	b.gt	33d8 <new_ipc_msg+0x38>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    33ec:	aa0303e0 	mov	x0, x3
    33f0:	2a1603e1 	mov	w1, w22
    33f4:	9400016f 	bl	39b0 <session_alloc_buf>
    if (buf == NULL) {
    33f8:	b40004c0 	cbz	x0, 3490 <new_ipc_msg+0xf0>
        return NULL;
    }
    buf->header.len = len;
    33fc:	528000c5 	mov	w5, #0x6                   	// #6
    buf->header.done = 0;
    buf->header.valid = 0;
    3400:	39400001 	ldrb	w1, [x0]
    3404:	52800182 	mov	w2, #0xc                   	// #12
    3408:	aa1303e3 	mov	x3, x19
    340c:	1b057ea5 	mul	w5, w21, w5
    3410:	121e7421 	and	w1, w1, #0xfffffffc
    3414:	39000001 	strb	w1, [x0]
    3418:	0b0200a5 	add	w5, w5, w2
    buf->header.len = len;
    341c:	79000416 	strh	w22, [x0, #2]

    for (int i = 0; i < argc; i++) {
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    3420:	8b22c001 	add	x1, x0, w2, sxtw
        arg_info->len = arg_size[i];
    3424:	b9400064 	ldr	w4, [x3]
    3428:	79000424 	strh	w4, [x1, #2]
        arg_info->offset = arg_buf_offset;
    342c:	7822c814 	strh	w20, [x0, w2, sxtw]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    3430:	11001842 	add	w2, w2, #0x6
    for (int i = 0; i < argc; i++) {
    3434:	6b05005f 	cmp	w2, w5
        arg_buf_offset += arg_size[i];
    3438:	b8404461 	ldr	w1, [x3], #4
    343c:	0b010294 	add	w20, w20, w1
    for (int i = 0; i < argc; i++) {
    3440:	54ffff01 	b.ne	3420 <new_ipc_msg+0x80>  // b.any
    }
    buf->header.nr_args = argc;
    buf->header.init = 1;
    3444:	39400002 	ldrb	w2, [x0]
    3448:	531c0ea1 	ubfiz	w1, w21, #4, #4
    344c:	321e0021 	orr	w1, w1, #0x4
    3450:	52800163 	mov	w3, #0xb                   	// #11
    3454:	0a030042 	and	w2, w2, w3
    3458:	2a020021 	orr	w1, w1, w2
    345c:	39000001 	strb	w1, [x0]
    return buf;
}
    3460:	a94153f3 	ldp	x19, x20, [sp, #16]
    3464:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3468:	a8c37bfd 	ldp	x29, x30, [sp], #48
    346c:	d65f03c0 	ret
    struct IpcMsg* buf = session_alloc_buf(session, len);
    3470:	2a1403e1 	mov	w1, w20
    3474:	9400014f 	bl	39b0 <session_alloc_buf>
    if (buf == NULL) {
    3478:	b40000c0 	cbz	x0, 3490 <new_ipc_msg+0xf0>
    buf->header.valid = 0;
    347c:	39400001 	ldrb	w1, [x0]
    buf->header.len = len;
    3480:	79000414 	strh	w20, [x0, #2]
    buf->header.valid = 0;
    3484:	121e7421 	and	w1, w1, #0xfffffffc
    3488:	39000001 	strb	w1, [x0]
    for (int i = 0; i < argc; i++) {
    348c:	17ffffee 	b	3444 <new_ipc_msg+0xa4>
        return NULL;
    3490:	d2800000 	mov	x0, #0x0                   	// #0
    3494:	17fffff3 	b	3460 <new_ipc_msg+0xc0>
    3498:	d503201f 	nop
    349c:	d503201f 	nop

00000000000034a0 <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    34a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    34a4:	2a0103e4 	mov	w4, w1
    34a8:	aa0203e1 	mov	x1, x2
    34ac:	910003fd 	mov	x29, sp
    34b0:	93407c62 	sxtw	x2, w3
    if (arg_num >= msg->header.nr_args) {
    34b4:	39400003 	ldrb	w3, [x0]
    34b8:	d3441c63 	ubfx	x3, x3, #4, #4
    34bc:	6b04007f 	cmp	w3, w4
    34c0:	540003ad 	b.le	3534 <ipc_msg_set_nth_arg+0x94>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    34c4:	528000c5 	mov	w5, #0x6                   	// #6
    34c8:	d2800183 	mov	x3, #0xc                   	// #12
    34cc:	9b250c84 	smaddl	x4, w4, w5, x3
    34d0:	8b040005 	add	x5, x0, x4
    if (len < 0 || (uint32_t)len > (uint32_t)nth_arg_info->len) {
    34d4:	794004a3 	ldrh	w3, [x5, #2]
    34d8:	37f801e2 	tbnz	w2, #31, 3514 <ipc_msg_set_nth_arg+0x74>
    34dc:	6b02007f 	cmp	w3, w2
    34e0:	540001a3 	b.cc	3514 <ipc_msg_set_nth_arg+0x74>  // b.lo, b.ul, b.last
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
    34e4:	394010a3 	ldrb	w3, [x5, #4]
    34e8:	37000423 	tbnz	w3, #0, 356c <ipc_msg_set_nth_arg+0xcc>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    34ec:	78646803 	ldrh	w3, [x0, x4]
    34f0:	8b030000 	add	x0, x0, x3

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);

    // handle attributes of different params
    if (data == NULL) {
        nth_arg_info->null_ptr = 1;
    34f4:	394010a3 	ldrb	w3, [x5, #4]
    if (data == NULL) {
    34f8:	b4000301 	cbz	x1, 3558 <ipc_msg_set_nth_arg+0xb8>
        memset(buf, 0x0, len);
        return true;
    } else {
        nth_arg_info->null_ptr = 0;
    34fc:	121f7863 	and	w3, w3, #0xfffffffe
    3500:	390010a3 	strb	w3, [x5, #4]
    }

    memmove(buf, data, len);
    3504:	9400048f 	bl	4740 <memmove>
    return true;
    3508:	52800020 	mov	w0, #0x1                   	// #1
}
    350c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    3510:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %u\n", __func__, len, nth_arg_info->len);
    3514:	b0000041 	adrp	x1, c000 <_reclaim_reent+0xc0>
    3518:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    351c:	911f0021 	add	x1, x1, #0x7c0
    3520:	911a6000 	add	x0, x0, #0x698
    3524:	97fffa4f 	bl	1e60 <printf>
        return false;
    3528:	52800000 	mov	w0, #0x0                   	// #0
}
    352c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    3530:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
    3534:	2a0403e2 	mov	w2, w4
    3538:	b0000041 	adrp	x1, c000 <_reclaim_reent+0xc0>
    353c:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    3540:	911f0021 	add	x1, x1, #0x7c0
    3544:	91196000 	add	x0, x0, #0x658
    3548:	97fffa46 	bl	1e60 <printf>
        return false;
    354c:	52800000 	mov	w0, #0x0                   	// #0
}
    3550:	a8c17bfd 	ldp	x29, x30, [sp], #16
    3554:	d65f03c0 	ret
        nth_arg_info->null_ptr = 1;
    3558:	32000063 	orr	w3, w3, #0x1
    355c:	390010a3 	strb	w3, [x5, #4]
        memset(buf, 0x0, len);
    3560:	940004a8 	bl	4800 <memset>
        return true;
    3564:	52800020 	mov	w0, #0x1                   	// #1
    3568:	17ffffe9 	b	350c <ipc_msg_set_nth_arg+0x6c>
        return NULL;
    356c:	d2800000 	mov	x0, #0x0                   	// #0
    3570:	17ffffe1 	b	34f4 <ipc_msg_set_nth_arg+0x54>
    3574:	d503201f 	nop
    3578:	d503201f 	nop
    357c:	d503201f 	nop

0000000000003580 <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    3580:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3584:	aa0003e4 	mov	x4, x0
    3588:	910003fd 	mov	x29, sp
    358c:	f9000bf3 	str	x19, [sp, #16]
    if (arg_num >= msg->header.nr_args) {
    3590:	39400005 	ldrb	w5, [x0]
    3594:	d3441ca5 	ubfx	x5, x5, #4, #4
    3598:	6b0100bf 	cmp	w5, w1
    359c:	5400030d 	b.le	35fc <ipc_msg_get_nth_arg+0x7c>
        printf("[%s] IPC: arg_num out of msg range", __func__);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    35a0:	528000c5 	mov	w5, #0x6                   	// #6
    35a4:	aa0203e0 	mov	x0, x2
    35a8:	d2800182 	mov	x2, #0xc                   	// #12
    35ac:	9b250821 	smaddl	x1, w1, w5, x2
    35b0:	8b010082 	add	x2, x4, x1
    if (len > nth_arg_info->len) {
    35b4:	79400445 	ldrh	w5, [x2, #2]
    35b8:	6b0300bf 	cmp	w5, w3
    35bc:	5400036b 	b.lt	3628 <ipc_msg_get_nth_arg+0xa8>  // b.tstop
        printf("[%s] IPC: size of arg out of buffer range", __func__);
        return false;
    }

    // handle null ptr: do nothing
    if (nth_arg_info->null_ptr == 1) {
    35c0:	39401042 	ldrb	w2, [x2, #4]
        return true;
    35c4:	52800033 	mov	w19, #0x1                   	// #1
    if (nth_arg_info->null_ptr == 1) {
    35c8:	360000a2 	tbz	w2, #0, 35dc <ipc_msg_get_nth_arg+0x5c>
    }

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    memmove(data, buf, len);
    return true;
}
    35cc:	2a1303e0 	mov	w0, w19
    35d0:	f9400bf3 	ldr	x19, [sp, #16]
    35d4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    35d8:	d65f03c0 	ret
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    35dc:	78616881 	ldrh	w1, [x4, x1]
    memmove(data, buf, len);
    35e0:	93407c62 	sxtw	x2, w3
    35e4:	8b010081 	add	x1, x4, x1
    35e8:	94000456 	bl	4740 <memmove>
}
    35ec:	2a1303e0 	mov	w0, w19
    35f0:	f9400bf3 	ldr	x19, [sp, #16]
    35f4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    35f8:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range", __func__);
    35fc:	b0000041 	adrp	x1, c000 <_reclaim_reent+0xc0>
    3600:	911f0021 	add	x1, x1, #0x7c0
    3604:	91006021 	add	x1, x1, #0x18
        return false;
    3608:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: arg_num out of msg range", __func__);
    360c:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    3610:	911b8000 	add	x0, x0, #0x6e0
    3614:	97fffa13 	bl	1e60 <printf>
}
    3618:	2a1303e0 	mov	w0, w19
    361c:	f9400bf3 	ldr	x19, [sp, #16]
    3620:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3624:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    3628:	b0000041 	adrp	x1, c000 <_reclaim_reent+0xc0>
    362c:	911f0021 	add	x1, x1, #0x7c0
    3630:	91006021 	add	x1, x1, #0x18
        return false;
    3634:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    3638:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    363c:	911c2000 	add	x0, x0, #0x708
    3640:	97fffa08 	bl	1e60 <printf>
}
    3644:	2a1303e0 	mov	w0, w19
    3648:	f9400bf3 	ldr	x19, [sp, #16]
    364c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3650:	d65f03c0 	ret
    3654:	d503201f 	nop
    3658:	d503201f 	nop
    365c:	d503201f 	nop

0000000000003660 <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    3660:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    3664:	d2800021 	mov	x1, #0x1                   	// #1
    3668:	f2db9741 	movk	x1, #0xdcba, lsl #32
    366c:	f2f579a1 	movk	x1, #0xabcd, lsl #48
{
    3670:	910003fd 	mov	x29, sp
    3674:	f9000bf3 	str	x19, [sp, #16]
    3678:	aa0003f3 	mov	x19, x0
    msg->header.valid = 1;
    367c:	f9400000 	ldr	x0, [x0]
    3680:	927e7400 	and	x0, x0, #0xfffffffc
    3684:	aa010000 	orr	x0, x0, x1
    3688:	f9000260 	str	x0, [x19]
    msg->header.done = 0;
    while (msg->header.done == 0) {
    368c:	d503201f 	nop
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    3690:	52800040 	mov	w0, #0x2                   	// #2
    3694:	97fffaf7 	bl	2270 <yield>
    while (msg->header.done == 0) {
    3698:	39400261 	ldrb	w1, [x19]
    369c:	360fffa1 	tbz	w1, #1, 3690 <ipc_msg_send_wait+0x30>
    }
    assert(msg->header.done == 1);
}
    36a0:	f9400bf3 	ldr	x19, [sp, #16]
    36a4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    36a8:	d65f03c0 	ret
    36ac:	d503201f 	nop

00000000000036b0 <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    36b0:	f9400001 	ldr	x1, [x0]
    36b4:	d2800022 	mov	x2, #0x1                   	// #1
    36b8:	f2db9742 	movk	x2, #0xdcba, lsl #32
    36bc:	f2f579a2 	movk	x2, #0xabcd, lsl #48
    36c0:	927e7421 	and	x1, x1, #0xfffffffc
    36c4:	aa020021 	orr	x1, x1, x2
    36c8:	f9000001 	str	x1, [x0]
    msg->header.done = 0;
}
    36cc:	d65f03c0 	ret

00000000000036d0 <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    36d0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    36d4:	910003fd 	mov	x29, sp
    36d8:	f9000bf3 	str	x19, [sp, #16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    36dc:	b9800801 	ldrsw	x1, [x0, #8]
    36e0:	f9400800 	ldr	x0, [x0, #16]
    36e4:	8b010013 	add	x19, x0, x1
    while (msg->header.done == 0) {
    36e8:	38616800 	ldrb	w0, [x0, x1]
    36ec:	370800a0 	tbnz	w0, #1, 3700 <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    36f0:	52800040 	mov	w0, #0x2                   	// #2
    36f4:	97fffadf 	bl	2270 <yield>
    while (msg->header.done == 0) {
    36f8:	39400260 	ldrb	w0, [x19]
    36fc:	360fffa0 	tbz	w0, #1, 36f0 <ipc_session_wait+0x20>
    }
    assert(msg->header.done == 1);
    return msg->header.ret_val;
}
    3700:	b9400a60 	ldr	w0, [x19, #8]
    3704:	f9400bf3 	ldr	x19, [sp, #16]
    3708:	a8c27bfd 	ldp	x29, x30, [sp], #32
    370c:	d65f03c0 	ret

0000000000003710 <cur_session_id>:

static int cur_sess_id = -1;
static struct IpcMsg* ipc_server_loop_cur_msg = NULL;
int cur_session_id(void)
{
    return cur_sess_id;
    3710:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
}
    3714:	b94f7c00 	ldr	w0, [x0, #3964]
    3718:	d65f03c0 	ret
    371c:	d503201f 	nop

0000000000003720 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    session_delayed = true;
    3720:	f0000040 	adrp	x0, e000 <__malloc_av_+0x768>
    3724:	52800021 	mov	w1, #0x1                   	// #1
    3728:	39042001 	strb	w1, [x0, #264]
}
    372c:	d65f03c0 	ret

0000000000003730 <is_cur_session_delayed>:

bool is_cur_session_delayed(void)
{
    return session_delayed;
    3730:	f0000040 	adrp	x0, e000 <__malloc_av_+0x768>
}
    3734:	39442000 	ldrb	w0, [x0, #264]
    3738:	d65f03c0 	ret
    373c:	d503201f 	nop

0000000000003740 <is_cur_handler_been_delayed>:

bool is_cur_handler_been_delayed()
{
    if (ipc_server_loop_cur_msg == NULL) {
    3740:	f0000040 	adrp	x0, e000 <__malloc_av_+0x768>
    3744:	f9408800 	ldr	x0, [x0, #272]
    3748:	b4000080 	cbz	x0, 3758 <is_cur_handler_been_delayed+0x18>
        return false;
    }
    return ipc_server_loop_cur_msg->header.delayed == 1;
    374c:	39400000 	ldrb	w0, [x0]
    3750:	d3430c00 	ubfx	x0, x0, #3, #1
}
    3754:	d65f03c0 	ret
        return false;
    3758:	52800000 	mov	w0, #0x0                   	// #0
}
    375c:	d65f03c0 	ret

0000000000003760 <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    3760:	d10dc3ff 	sub	sp, sp, #0x370
    struct Session session_list[NR_MAX_SESSION];
    memset(session_list, 0, sizeof(session_list));
    3764:	d2806002 	mov	x2, #0x300                 	// #768
    3768:	52800001 	mov	w1, #0x0                   	// #0
{
    376c:	a9007bfd 	stp	x29, x30, [sp]
    3770:	910003fd 	mov	x29, sp
    3774:	a90153f3 	stp	x19, x20, [sp, #16]
    3778:	aa0003f3 	mov	x19, x0
    memset(session_list, 0, sizeof(session_list));
    377c:	9101c3e0 	add	x0, sp, #0x70
{
    3780:	a9025bf5 	stp	x21, x22, [sp, #32]
    3784:	b0000055 	adrp	x21, c000 <_reclaim_reent+0xc0>
    3788:	913df2b5 	add	x21, x21, #0xf7c
    378c:	a90363f7 	stp	x23, x24, [sp, #48]
    3790:	b0000056 	adrp	x22, c000 <_reclaim_reent+0xc0>
    3794:	911d82d6 	add	x22, x22, #0x760
    3798:	a9046bf9 	stp	x25, x26, [sp, #64]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                /* handle every message in current session
                    a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                    interfaces[opcode] should explicitly call delay_session() and return to delay this session
                */
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    379c:	529b9754 	mov	w20, #0xdcba                	// #56506
    37a0:	72b579b4 	movk	w20, #0xabcd, lsl #16
{
    37a4:	a90573fb 	stp	x27, x28, [sp, #80]
    memset(session_list, 0, sizeof(session_list));
    37a8:	94000416 	bl	4800 <memset>
    37ac:	f0000044 	adrp	x4, e000 <__malloc_av_+0x768>
    37b0:	9104209c 	add	x28, x4, #0x108
    37b4:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    37b8:	911ce000 	add	x0, x0, #0x738
    37bc:	f90037e0 	str	x0, [sp, #104]
    37c0:	b000005b 	adrp	x27, c000 <_reclaim_reent+0xc0>
    37c4:	911e2360 	add	x0, x27, #0x788
    37c8:	f90033e0 	str	x0, [sp, #96]
        poll_session(session_list, NR_MAX_SESSION);
    37cc:	9101c3e0 	add	x0, sp, #0x70
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    37d0:	5280001a 	mov	w26, #0x0                   	// #0
                        break;
                    }
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                }
                // stop handle this session
                cur_sess_id = -1;
    37d4:	12800018 	mov	w24, #0xffffffff            	// #-1
        poll_session(session_list, NR_MAX_SESSION);
    37d8:	52800401 	mov	w1, #0x20                  	// #32
    37dc:	97fffac5 	bl	22f0 <poll_session>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    37e0:	9101c3fb 	add	x27, sp, #0x70
    37e4:	910dc3f7 	add	x23, sp, #0x370
            has_delayed = false;
    37e8:	52800019 	mov	w25, #0x0                   	// #0
    37ec:	d503201f 	nop
                if (session_list[i].buf == NULL) {
    37f0:	f9400b60 	ldr	x0, [x27, #16]
                session_delayed = false;
    37f4:	3900039f 	strb	wzr, [x28]
                if (session_list[i].buf == NULL) {
    37f8:	b4000980 	cbz	x0, 3928 <ipc_server_loop+0x1c8>
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    37fc:	b9800b62 	ldrsw	x2, [x27, #8]
                cur_sess_id = session_list[i].id;
    3800:	b9400361 	ldr	w1, [x27]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    3804:	8b020000 	add	x0, x0, x2
                cur_sess_id = session_list[i].id;
    3808:	b90002a1 	str	w1, [x21]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    380c:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    3810:	b9400401 	ldr	w1, [x0, #4]
    3814:	6b14003f 	cmp	w1, w20
    3818:	54000340 	b.eq	3880 <ipc_server_loop+0x120>  // b.none
    381c:	14000039 	b	3900 <ipc_server_loop+0x1a0>
                        ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode](ipc_server_loop_cur_msg);
    3820:	d63f0040 	blr	x2
                        if (ipc_server_loop_cur_msg->header.done == 0) {
    3824:	f9400780 	ldr	x0, [x28, #8]
    3828:	39400001 	ldrb	w1, [x0]
    382c:	36080641 	tbz	w1, #1, 38f4 <ipc_server_loop+0x194>
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    3830:	29409b62 	ldp	w2, w6, [x27, #4]
    3834:	b9400f61 	ldr	w1, [x27, #12]
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    3838:	79400400 	ldrh	w0, [x0, #2]
    383c:	0b010041 	add	w1, w2, w1
    3840:	4b060021 	sub	w1, w1, w6
    3844:	1ac20c25 	sdiv	w5, w1, w2
    3848:	1b0284a1 	msub	w1, w5, w2, w1
    return session->capacity - session_used_size(session);
}

__attribute__((__always_inline__)) static inline int session_forward_head(struct Session* session, int len)
{
    if (len > session_used_size(session)) {
    384c:	6b01001f 	cmp	w0, w1
    3850:	5400078c 	b.gt	3940 <ipc_server_loop+0x1e0>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
        return -1;
    }
    session->head = (session->head + len) % session->capacity;
    3854:	0b060000 	add	w0, w0, w6
    3858:	1ac20c01 	sdiv	w1, w0, w2
    385c:	1b028020 	msub	w0, w1, w2, w0
    3860:	b9000b60 	str	w0, [x27, #8]
    3864:	37f804e0 	tbnz	w0, #31, 3900 <ipc_server_loop+0x1a0>
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    3868:	f9400b61 	ldr	x1, [x27, #16]
    386c:	8b20c020 	add	x0, x1, w0, sxtw
    3870:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    3874:	b9400401 	ldr	w1, [x0, #4]
    3878:	6b14003f 	cmp	w1, w20
    387c:	54000421 	b.ne	3900 <ipc_server_loop+0x1a0>  // b.any
    3880:	39400001 	ldrb	w1, [x0]
    3884:	12000421 	and	w1, w1, #0x3
    3888:	7100043f 	cmp	w1, #0x1
    388c:	540003a1 	b.ne	3900 <ipc_server_loop+0x1a0>  // b.any
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    3890:	29409761 	ldp	w1, w5, [x27, #4]
    3894:	b9400f66 	ldr	w6, [x27, #12]
    3898:	0b0100c2 	add	w2, w6, w1
    389c:	4b050042 	sub	w2, w2, w5
    38a0:	1ac10c45 	sdiv	w5, w2, w1
    38a4:	1b0188a2 	msub	w2, w5, w1, w2
                    if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    38a8:	35000122 	cbnz	w2, 38cc <ipc_server_loop+0x16c>
    38ac:	79400402 	ldrh	w2, [x0, #2]
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    38b0:	6b01005f 	cmp	w2, w1
    38b4:	5400056c 	b.gt	3960 <ipc_server_loop+0x200>
        printf("forward tail with too much size\n");
        return -1;
    }
    session->tail = (session->tail + len) % session->capacity;
    38b8:	0b060042 	add	w2, w2, w6
    38bc:	1ac10c45 	sdiv	w5, w2, w1
    38c0:	1b0188a2 	msub	w2, w5, w1, w2
    38c4:	b9000f62 	str	w2, [x27, #12]
    38c8:	37f801c2 	tbnz	w2, #31, 3900 <ipc_server_loop+0x1a0>
                    if (ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode]) {
    38cc:	39400402 	ldrb	w2, [x0, #1]
    38d0:	39400401 	ldrb	w1, [x0, #1]
    38d4:	8b020e62 	add	x2, x19, x2, lsl #3
    38d8:	f9400442 	ldr	x2, [x2, #8]
    38dc:	b5fffa22 	cbnz	x2, 3820 <ipc_server_loop+0xc0>
                        printf("Unsupport opcode(%u) for server: %s\n", ipc_server_loop_cur_msg->header.opcode, ipc_node->name);
    38e0:	f9400262 	ldr	x2, [x19]
    38e4:	aa1603e0 	mov	x0, x22
    38e8:	97fff95e 	bl	1e60 <printf>
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    38ec:	f9400780 	ldr	x0, [x28, #8]
    38f0:	17ffffd0 	b	3830 <ipc_server_loop+0xd0>
                            ipc_server_loop_cur_msg->header.delayed = 1;
    38f4:	321d0021 	orr	w1, w1, #0x8
                            has_delayed = true;
    38f8:	52800039 	mov	w25, #0x1                   	// #1
                            ipc_server_loop_cur_msg->header.delayed = 1;
    38fc:	39000001 	strb	w1, [x0]
                cur_sess_id = -1;
    3900:	b90002b8 	str	w24, [x21]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    3904:	9100637b 	add	x27, x27, #0x18
                ipc_server_loop_cur_msg = NULL;
    3908:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    390c:	eb1b02ff 	cmp	x23, x27
    3910:	54fff701 	b.ne	37f0 <ipc_server_loop+0x90>  // b.any
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    3914:	52000340 	eor	w0, w26, #0x1
    3918:	5280003a 	mov	w26, #0x1                   	// #1
    391c:	6a00033f 	tst	w25, w0
    3920:	54fff601 	b.ne	37e0 <ipc_server_loop+0x80>  // b.any
    3924:	17ffffaa 	b	37cc <ipc_server_loop+0x6c>
                    yield(SYS_TASK_YIELD_NO_REASON);
    3928:	97fffa52 	bl	2270 <yield>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    392c:	52000340 	eor	w0, w26, #0x1
    3930:	5280003a 	mov	w26, #0x1                   	// #1
    3934:	6a00033f 	tst	w25, w0
    3938:	54fff541 	b.ne	37e0 <ipc_server_loop+0x80>  // b.any
    393c:	17ffffa4 	b	37cc <ipc_server_loop+0x6c>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
    3940:	f94033e0 	ldr	x0, [sp, #96]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    3944:	9100637b 	add	x27, x27, #0x18
    3948:	97fff946 	bl	1e60 <printf>
                cur_sess_id = -1;
    394c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    3950:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    3954:	eb1b02ff 	cmp	x23, x27
    3958:	54fff4c1 	b.ne	37f0 <ipc_server_loop+0x90>  // b.any
    395c:	17ffffee 	b	3914 <ipc_server_loop+0x1b4>
        printf("forward tail with too much size\n");
    3960:	f94037e0 	ldr	x0, [sp, #104]
    3964:	9100637b 	add	x27, x27, #0x18
    3968:	97fff93e 	bl	1e60 <printf>
                cur_sess_id = -1;
    396c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    3970:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    3974:	eb1b02ff 	cmp	x23, x27
    3978:	54fff3c1 	b.ne	37f0 <ipc_server_loop+0x90>  // b.any
    397c:	17ffffe6 	b	3914 <ipc_server_loop+0x1b4>

0000000000003980 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    3980:	aa0003e3 	mov	x3, x0
    3984:	aa0103e0 	mov	x0, x1
    3988:	2a0203e1 	mov	w1, w2
    return session(_path, _capacity, _session);
    398c:	aa0303e2 	mov	x2, x3
    3990:	17fffa50 	b	22d0 <session>
    3994:	d503201f 	nop
    3998:	d503201f 	nop
    399c:	d503201f 	nop

00000000000039a0 <free_session>:
}

int free_session(struct Session* session)
{
    return close_session(session);
    39a0:	17fffa5c 	b	2310 <close_session>
    39a4:	d503201f 	nop
    39a8:	d503201f 	nop
    39ac:	d503201f 	nop

00000000000039b0 <session_alloc_buf>:
}

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    39b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    39b4:	910003fd 	mov	x29, sp
    39b8:	f90013f5 	str	x21, [sp, #32]
    if (len < 0 || len > session_remain_capacity(session)) {
    39bc:	37f80561 	tbnz	w1, #31, 3a68 <session_alloc_buf+0xb8>
    39c0:	a90153f3 	stp	x19, x20, [sp, #16]
    39c4:	2a0103f4 	mov	w20, w1
    39c8:	aa0003f3 	mov	x19, x0
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    39cc:	29408801 	ldp	w1, w2, [x0, #4]
        return NULL;
    39d0:	d2800015 	mov	x21, #0x0                   	// #0
    39d4:	b9400c03 	ldr	w3, [x0, #12]
    39d8:	0b030020 	add	w0, w1, w3
    39dc:	4b020000 	sub	w0, w0, w2
    39e0:	1ac10c02 	sdiv	w2, w0, w1
    39e4:	1b018040 	msub	w0, w2, w1, w0
    return session->capacity - session_used_size(session);
    39e8:	4b000021 	sub	w1, w1, w0
    if (len < 0 || len > session_remain_capacity(session)) {
    39ec:	6b01029f 	cmp	w20, w1
    39f0:	5400032c 	b.gt	3a54 <session_alloc_buf+0xa4>
    }
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    39f4:	f9400a75 	ldr	x21, [x19, #16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    39f8:	93407e82 	sxtw	x2, w20
    39fc:	52800001 	mov	w1, #0x0                   	// #0
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    3a00:	8b23c2b5 	add	x21, x21, w3, sxtw
    memset(buf, 0, len);
    3a04:	aa1503e0 	mov	x0, x21
    3a08:	9400037e 	bl	4800 <memset>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    3a0c:	29408e60 	ldp	w0, w3, [x19, #4]
    3a10:	b9400e61 	ldr	w1, [x19, #12]
    3a14:	0b010002 	add	w2, w0, w1
    3a18:	4b030043 	sub	w3, w2, w3
    3a1c:	1ac00c62 	sdiv	w2, w3, w0
    3a20:	1b008c42 	msub	w2, w2, w0, w3
    return session->capacity - session_used_size(session);
    3a24:	4b020002 	sub	w2, w0, w2
    if (len > session_remain_capacity(session)) {
    3a28:	6b02029f 	cmp	w20, w2
    3a2c:	5400028c 	b.gt	3a7c <session_alloc_buf+0xcc>
    session->tail = (session->tail + len) % session->capacity;
    3a30:	0b010294 	add	w20, w20, w1
    3a34:	1ac00e81 	sdiv	w1, w20, w0
    3a38:	1b00d034 	msub	w20, w1, w0, w20
    3a3c:	b9000e74 	str	w20, [x19, #12]
    return session->tail;
    3a40:	a94153f3 	ldp	x19, x20, [sp, #16]
    session_forward_tail(session, len);
    return buf;
}
    3a44:	aa1503e0 	mov	x0, x21
    3a48:	f94013f5 	ldr	x21, [sp, #32]
    3a4c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3a50:	d65f03c0 	ret
    3a54:	aa1503e0 	mov	x0, x21
    3a58:	a94153f3 	ldp	x19, x20, [sp, #16]
    3a5c:	f94013f5 	ldr	x21, [sp, #32]
    3a60:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3a64:	d65f03c0 	ret
        return NULL;
    3a68:	d2800015 	mov	x21, #0x0                   	// #0
}
    3a6c:	aa1503e0 	mov	x0, x21
    3a70:	f94013f5 	ldr	x21, [sp, #32]
    3a74:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3a78:	d65f03c0 	ret
        printf("forward tail with too much size\n");
    3a7c:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    3a80:	911ce000 	add	x0, x0, #0x738
    3a84:	97fff8f7 	bl	1e60 <printf>
        return -1;
    3a88:	a94153f3 	ldp	x19, x20, [sp, #16]
    3a8c:	17ffffee 	b	3a44 <session_alloc_buf+0x94>

0000000000003a90 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    if (len < 0 || len > session_used_size(session)) {
    3a90:	37f80241 	tbnz	w1, #31, 3ad8 <session_free_buf+0x48>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    3a94:	29409403 	ldp	w3, w5, [x0, #4]
    3a98:	aa0003e2 	mov	x2, x0
    3a9c:	b9400c00 	ldr	w0, [x0, #12]
    3aa0:	0b000060 	add	w0, w3, w0
    3aa4:	4b050000 	sub	w0, w0, w5
    3aa8:	1ac30c04 	sdiv	w4, w0, w3
    3aac:	1b038080 	msub	w0, w4, w3, w0
    3ab0:	6b00003f 	cmp	w1, w0
    3ab4:	5400012c 	b.gt	3ad8 <session_free_buf+0x48>
    session->head = (session->head + len) % session->capacity;
    3ab8:	0b050021 	add	w1, w1, w5
        return false;
    }
    assert(session_forward_head(session, len) != -1);
    return true;
    3abc:	52800020 	mov	w0, #0x1                   	// #1
    3ac0:	1ac30c24 	sdiv	w4, w1, w3
    3ac4:	1b038481 	msub	w1, w4, w3, w1
    3ac8:	b9000841 	str	w1, [x2, #8]
    assert(session_forward_head(session, len) != -1);
    3acc:	3100043f 	cmn	w1, #0x1
    3ad0:	54000080 	b.eq	3ae0 <session_free_buf+0x50>  // b.none
}
    3ad4:	d65f03c0 	ret
        return false;
    3ad8:	52800000 	mov	w0, #0x0                   	// #0
}
    3adc:	d65f03c0 	ret
{
    3ae0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    assert(session_forward_head(session, len) != -1);
    3ae4:	b0000043 	adrp	x3, c000 <_reclaim_reent+0xc0>
    3ae8:	b0000042 	adrp	x2, c000 <_reclaim_reent+0xc0>
{
    3aec:	910003fd 	mov	x29, sp
    assert(session_forward_head(session, len) != -1);
    3af0:	b0000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    3af4:	911fc063 	add	x3, x3, #0x7f0
    3af8:	9120c042 	add	x2, x2, #0x830
    3afc:	91208000 	add	x0, x0, #0x820
    3b00:	52800801 	mov	w1, #0x40                  	// #64
    3b04:	9400020f 	bl	4340 <__assert_func>
    3b08:	d503201f 	nop
    3b0c:	d503201f 	nop

0000000000003b10 <insert_node>:
    int list = 0;
    void* search_ptr = ptr;
    void* insert_ptr = NULL;

    // Select segregated list
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3b10:	f100043f 	cmp	x1, #0x1
    int list = 0;
    3b14:	52800002 	mov	w2, #0x0                   	// #0
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3b18:	540000e9 	b.ls	3b34 <insert_node+0x24>  // b.plast
    3b1c:	d503201f 	nop
        size >>= 1;
        list++;
    3b20:	11000442 	add	w2, w2, #0x1
        size >>= 1;
    3b24:	d341fc21 	lsr	x1, x1, #1
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3b28:	7100485f 	cmp	w2, #0x12
    3b2c:	fa41d820 	ccmp	x1, #0x1, #0x0, le
    3b30:	54ffff88 	b.hi	3b20 <insert_node+0x10>  // b.pmore
    }

    // Keep size ascending order and search
    search_ptr = segregated_free_lists[list];
    3b34:	93407c44 	sxtw	x4, w2
    3b38:	f0000046 	adrp	x6, e000 <__malloc_av_+0x768>
    3b3c:	910460c6 	add	x6, x6, #0x118
    void* insert_ptr = NULL;
    3b40:	d2800005 	mov	x5, #0x0                   	// #0
    search_ptr = segregated_free_lists[list];
    3b44:	f86478c2 	ldr	x2, [x6, x4, lsl #3]
    while ((search_ptr != NULL) && (size > GET_SIZE(HDRP(search_ptr)))) {
    3b48:	b50000c2 	cbnz	x2, 3b60 <insert_node+0x50>
    3b4c:	14000018 	b	3bac <insert_node+0x9c>
        insert_ptr = search_ptr;
        search_ptr = PRED(search_ptr);
    3b50:	f9400043 	ldr	x3, [x2]
    while ((search_ptr != NULL) && (size > GET_SIZE(HDRP(search_ptr)))) {
    3b54:	aa0203e5 	mov	x5, x2
    3b58:	b4000223 	cbz	x3, 3b9c <insert_node+0x8c>
    3b5c:	aa0303e2 	mov	x2, x3
    3b60:	b85fc043 	ldur	w3, [x2, #-4]
    3b64:	927d7063 	and	x3, x3, #0xfffffff8
    3b68:	eb01007f 	cmp	x3, x1
    3b6c:	54ffff23 	b.cc	3b50 <insert_node+0x40>  // b.lo, b.ul, b.last
    }

    // Set predecessor and successor
    if (search_ptr != NULL) {
        if (insert_ptr != NULL) {
    3b70:	b40000c5 	cbz	x5, 3b88 <insert_node+0x78>
            SET_PTR(PRED_PTR(ptr), search_ptr);
    3b74:	f9000002 	str	x2, [x0]
            SET_PTR(SUCC_PTR(search_ptr), ptr);
    3b78:	f8004040 	stur	x0, [x2, #4]
            SET_PTR(SUCC_PTR(ptr), insert_ptr);
    3b7c:	f8004005 	stur	x5, [x0, #4]
            SET_PTR(PRED_PTR(insert_ptr), ptr);
    3b80:	f90000a0 	str	x0, [x5]
            segregated_free_lists[list] = ptr;
        }
    }

    return;
}
    3b84:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), search_ptr);
    3b88:	f9000002 	str	x2, [x0]
            SET_PTR(SUCC_PTR(search_ptr), ptr);
    3b8c:	f8004040 	stur	x0, [x2, #4]
            SET_PTR(SUCC_PTR(ptr), NULL);
    3b90:	f800401f 	stur	xzr, [x0, #4]
            segregated_free_lists[list] = ptr;
    3b94:	f82478c0 	str	x0, [x6, x4, lsl #3]
}
    3b98:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), NULL);
    3b9c:	f900001f 	str	xzr, [x0]
            SET_PTR(SUCC_PTR(ptr), insert_ptr);
    3ba0:	f8004002 	stur	x2, [x0, #4]
            SET_PTR(PRED_PTR(insert_ptr), ptr);
    3ba4:	f9000040 	str	x0, [x2]
}
    3ba8:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), NULL);
    3bac:	f900001f 	str	xzr, [x0]
            SET_PTR(SUCC_PTR(ptr), NULL);
    3bb0:	f800401f 	stur	xzr, [x0, #4]
            segregated_free_lists[list] = ptr;
    3bb4:	f82478c0 	str	x0, [x6, x4, lsl #3]
}
    3bb8:	d65f03c0 	ret
    3bbc:	d503201f 	nop

0000000000003bc0 <delete_node>:

static void delete_node(void* ptr)
{
    int list = 0;
    size_t size = GET_SIZE(HDRP(ptr));
    3bc0:	b85fc001 	ldur	w1, [x0, #-4]
    3bc4:	121d7022 	and	w2, w1, #0xfffffff8
    3bc8:	927d7021 	and	x1, x1, #0xfffffff8

    // Select segregated list
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3bcc:	7100045f 	cmp	w2, #0x1
    int list = 0;
    3bd0:	52800002 	mov	w2, #0x0                   	// #0
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3bd4:	540000c9 	b.ls	3bec <delete_node+0x2c>  // b.plast
        size >>= 1;
        list++;
    3bd8:	11000442 	add	w2, w2, #0x1
        size >>= 1;
    3bdc:	d341fc21 	lsr	x1, x1, #1
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3be0:	7100485f 	cmp	w2, #0x12
    3be4:	fa41d820 	ccmp	x1, #0x1, #0x0, le
    3be8:	54ffff88 	b.hi	3bd8 <delete_node+0x18>  // b.pmore
    }

    if (PRED(ptr) != NULL) {
    3bec:	f9400003 	ldr	x3, [x0]
        if (SUCC(ptr) != NULL) {
    3bf0:	f8404001 	ldur	x1, [x0, #4]
    if (PRED(ptr) != NULL) {
    3bf4:	b40001a3 	cbz	x3, 3c28 <delete_node+0x68>
        if (SUCC(ptr) != NULL) {
    3bf8:	b40000c1 	cbz	x1, 3c10 <delete_node+0x50>
            SET_PTR(SUCC_PTR(PRED(ptr)), SUCC(ptr));
    3bfc:	f8004061 	stur	x1, [x3, #4]
            SET_PTR(PRED_PTR(SUCC(ptr)), PRED(ptr));
    3c00:	f8404001 	ldur	x1, [x0, #4]
    3c04:	f9400000 	ldr	x0, [x0]
    3c08:	f9000020 	str	x0, [x1]
            segregated_free_lists[list] = NULL;
        }
    }

    return;
}
    3c0c:	d65f03c0 	ret
            segregated_free_lists[list] = PRED(ptr);
    3c10:	f0000041 	adrp	x1, e000 <__malloc_av_+0x768>
    3c14:	91046021 	add	x1, x1, #0x118
            SET_PTR(SUCC_PTR(PRED(ptr)), NULL);
    3c18:	f800407f 	stur	xzr, [x3, #4]
            segregated_free_lists[list] = PRED(ptr);
    3c1c:	f9400000 	ldr	x0, [x0]
    3c20:	f822d820 	str	x0, [x1, w2, sxtw #3]
}
    3c24:	d65f03c0 	ret
        if (SUCC(ptr) != NULL) {
    3c28:	b4000061 	cbz	x1, 3c34 <delete_node+0x74>
            SET_PTR(PRED_PTR(SUCC(ptr)), NULL);
    3c2c:	f900003f 	str	xzr, [x1]
}
    3c30:	d65f03c0 	ret
            segregated_free_lists[list] = NULL;
    3c34:	f0000040 	adrp	x0, e000 <__malloc_av_+0x768>
    3c38:	91046000 	add	x0, x0, #0x118
    3c3c:	f822d81f 	str	xzr, [x0, w2, sxtw #3]
}
    3c40:	d65f03c0 	ret
    3c44:	d503201f 	nop
    3c48:	d503201f 	nop
    3c4c:	d503201f 	nop

0000000000003c50 <coalesce>:

static void* coalesce(void* ptr)
{
    3c50:	aa0003e7 	mov	x7, x0
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    3c54:	b85f8000 	ldur	w0, [x0, #-8]
    3c58:	927d7000 	and	x0, x0, #0xfffffff8
    3c5c:	cb0000e0 	sub	x0, x7, x0
    3c60:	b85fc0e2 	ldur	w2, [x7, #-4]
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
    3c64:	927d7045 	and	x5, x2, #0xfffffff8
    3c68:	121d7044 	and	w4, w2, #0xfffffff8
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    3c6c:	b85fc000 	ldur	w0, [x0, #-4]
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
    3c70:	8b0500e3 	add	x3, x7, x5
    3c74:	b85fc062 	ldur	w2, [x3, #-4]
    size_t size = GET_SIZE(HDRP(ptr));

    // Do not coalesce with previous block if the previous block is tagged with Reallocation tag
    if (GET_TAG(HDRP(PREV_BLKP(ptr))))
    3c78:	37080600 	tbnz	w0, #1, 3d38 <coalesce+0xe8>
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    3c7c:	92400003 	and	x3, x0, #0x1
        prev_alloc = 1;

    if (prev_alloc && next_alloc) { // Case 1
    3c80:	72000041 	ands	w1, w2, #0x1
    3c84:	12000000 	and	w0, w0, #0x1
    3c88:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    3c8c:	54000601 	b.ne	3d4c <coalesce+0xfc>  // b.any
{
    3c90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
        return ptr;
    } else if (prev_alloc && !next_alloc) { // Case 2
    3c94:	6a22001f 	bics	wzr, w0, w2
{
    3c98:	910003fd 	mov	x29, sp
    } else if (prev_alloc && !next_alloc) { // Case 2
    3c9c:	540005c1 	b.ne	3d54 <coalesce+0x104>  // b.any
        delete_node(ptr);
        delete_node(NEXT_BLKP(ptr));
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        PUT(HDRP(ptr), PACK(size, 0));
        PUT(FTRP(ptr), PACK(size, 0));
    } else if (!prev_alloc && next_alloc) { // Case 3
    3ca0:	52000063 	eor	w3, w3, #0x1
        delete_node(ptr);
    3ca4:	aa0703e0 	mov	x0, x7
    } else if (!prev_alloc && next_alloc) { // Case 3
    3ca8:	6a03003f 	tst	w1, w3
    3cac:	540008a0 	b.eq	3dc0 <coalesce+0x170>  // b.none
        delete_node(ptr);
    3cb0:	97ffffc4 	bl	3bc0 <delete_node>
        delete_node(PREV_BLKP(ptr));
    3cb4:	b85f80e0 	ldur	w0, [x7, #-8]
    3cb8:	927d7000 	and	x0, x0, #0xfffffff8
    3cbc:	cb0000e0 	sub	x0, x7, x0
    3cc0:	97ffffc0 	bl	3bc0 <delete_node>
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
        PUT(FTRP(ptr), PACK(size, 0));
    3cc4:	297f00e1 	ldp	w1, w0, [x7, #-8]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    3cc8:	92800063 	mov	x3, #0xfffffffffffffffc    	// #-4
    3ccc:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(FTRP(ptr), PACK(size, 0));
    3cd0:	927d7000 	and	x0, x0, #0xfffffff8
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    3cd4:	cb010061 	sub	x1, x3, x1
        PUT(FTRP(ptr), PACK(size, 0));
    3cd8:	d1002000 	sub	x0, x0, #0x8
    3cdc:	b86168e1 	ldr	w1, [x7, x1]
    3ce0:	b86068e6 	ldr	w6, [x7, x0]
    3ce4:	121d7022 	and	w2, w1, #0xfffffff8
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    3ce8:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(FTRP(ptr), PACK(size, 0));
    3cec:	0b020084 	add	w4, w4, w2
    3cf0:	121f00c6 	and	w6, w6, #0x2
    3cf4:	2a0400c6 	orr	w6, w6, w4
    3cf8:	b82068e6 	str	w6, [x7, x0]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    3cfc:	8b050021 	add	x1, x1, x5
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    3d00:	b85f80e0 	ldur	w0, [x7, #-8]
    3d04:	927d7000 	and	x0, x0, #0xfffffff8
    3d08:	cb000060 	sub	x0, x3, x0
    3d0c:	b86068e2 	ldr	w2, [x7, x0]
    3d10:	121f0042 	and	w2, w2, #0x2
        delete_node(ptr);
        delete_node(PREV_BLKP(ptr));
        delete_node(NEXT_BLKP(ptr));
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
        PUT(FTRP(NEXT_BLKP(ptr)), PACK(size, 0));
    3d14:	2a020082 	orr	w2, w4, w2
    3d18:	b82068e2 	str	w2, [x7, x0]
        ptr = PREV_BLKP(ptr);
    3d1c:	b85f80e0 	ldur	w0, [x7, #-8]
    3d20:	927d7000 	and	x0, x0, #0xfffffff8
    3d24:	cb0000e7 	sub	x7, x7, x0
    }

    insert_node(ptr, size);
    3d28:	aa0703e0 	mov	x0, x7
    3d2c:	97ffff79 	bl	3b10 <insert_node>

    return ptr;
}
    3d30:	a8c17bfd 	ldp	x29, x30, [sp], #16
    3d34:	d65f03c0 	ret
    if (prev_alloc && next_alloc) { // Case 1
    3d38:	72000041 	ands	w1, w2, #0x1
    3d3c:	52800020 	mov	w0, #0x1                   	// #1
        prev_alloc = 1;
    3d40:	d2800023 	mov	x3, #0x1                   	// #1
    if (prev_alloc && next_alloc) { // Case 1
    3d44:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    3d48:	54fffa40 	b.eq	3c90 <coalesce+0x40>  // b.none
}
    3d4c:	aa0703e0 	mov	x0, x7
    3d50:	d65f03c0 	ret
        delete_node(ptr);
    3d54:	aa0703e0 	mov	x0, x7
    3d58:	97ffff9a 	bl	3bc0 <delete_node>
        delete_node(NEXT_BLKP(ptr));
    3d5c:	b85fc0e0 	ldur	w0, [x7, #-4]
    3d60:	927d7000 	and	x0, x0, #0xfffffff8
    3d64:	8b0000e0 	add	x0, x7, x0
    3d68:	97ffff96 	bl	3bc0 <delete_node>
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    3d6c:	b85fc0e0 	ldur	w0, [x7, #-4]
    3d70:	927d7001 	and	x1, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(size, 0));
    3d74:	121f0000 	and	w0, w0, #0x2
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    3d78:	8b0100e1 	add	x1, x7, x1
    3d7c:	b85fc021 	ldur	w1, [x1, #-4]
    3d80:	121d7022 	and	w2, w1, #0xfffffff8
    3d84:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(HDRP(ptr), PACK(size, 0));
    3d88:	0b020084 	add	w4, w4, w2
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    3d8c:	8b050021 	add	x1, x1, x5
        PUT(HDRP(ptr), PACK(size, 0));
    3d90:	2a040000 	orr	w0, w0, w4
    3d94:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(size, 0));
    3d98:	927d7000 	and	x0, x0, #0xfffffff8
    3d9c:	d1002000 	sub	x0, x0, #0x8
    3da0:	b86068e2 	ldr	w2, [x7, x0]
    3da4:	121f0042 	and	w2, w2, #0x2
    3da8:	2a040042 	orr	w2, w2, w4
    3dac:	b82068e2 	str	w2, [x7, x0]
    insert_node(ptr, size);
    3db0:	aa0703e0 	mov	x0, x7
    3db4:	97ffff57 	bl	3b10 <insert_node>
}
    3db8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    3dbc:	d65f03c0 	ret
        delete_node(ptr);
    3dc0:	97ffff80 	bl	3bc0 <delete_node>
        delete_node(PREV_BLKP(ptr));
    3dc4:	b85f80e0 	ldur	w0, [x7, #-8]
    3dc8:	927d7000 	and	x0, x0, #0xfffffff8
    3dcc:	cb0000e0 	sub	x0, x7, x0
    3dd0:	97ffff7c 	bl	3bc0 <delete_node>
        delete_node(NEXT_BLKP(ptr));
    3dd4:	b85fc0e0 	ldur	w0, [x7, #-4]
    3dd8:	927d7000 	and	x0, x0, #0xfffffff8
    3ddc:	8b0000e0 	add	x0, x7, x0
    3de0:	97ffff78 	bl	3bc0 <delete_node>
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    3de4:	297f04e0 	ldp	w0, w1, [x7, #-8]
    3de8:	92800063 	mov	x3, #0xfffffffffffffffc    	// #-4
    3dec:	927d7000 	and	x0, x0, #0xfffffff8
    3df0:	927d7021 	and	x1, x1, #0xfffffff8
    3df4:	cb000063 	sub	x3, x3, x0
    3df8:	8b0100e1 	add	x1, x7, x1
    3dfc:	b86368e0 	ldr	w0, [x7, x3]
    3e00:	b85fc021 	ldur	w1, [x1, #-4]
    3e04:	121d7002 	and	w2, w0, #0xfffffff8
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    3e08:	121f0000 	and	w0, w0, #0x2
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    3e0c:	121d7021 	and	w1, w1, #0xfffffff8
    3e10:	0b020021 	add	w1, w1, w2
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    3e14:	0b040022 	add	w2, w1, w4
    3e18:	2a020000 	orr	w0, w0, w2
    3e1c:	b82368e0 	str	w0, [x7, x3]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    3e20:	8b2140a1 	add	x1, x5, w1, uxtw
        PUT(FTRP(NEXT_BLKP(ptr)), PACK(size, 0));
    3e24:	b85fc0e0 	ldur	w0, [x7, #-4]
    3e28:	927d7000 	and	x0, x0, #0xfffffff8
    3e2c:	8b0000e4 	add	x4, x7, x0
    3e30:	d1002003 	sub	x3, x0, #0x8
    3e34:	b85fc080 	ldur	w0, [x4, #-4]
    3e38:	927d7000 	and	x0, x0, #0xfffffff8
    3e3c:	8b030000 	add	x0, x0, x3
    3e40:	b86068e4 	ldr	w4, [x7, x0]
    3e44:	121f0084 	and	w4, w4, #0x2
    3e48:	17ffffb3 	b	3d14 <coalesce+0xc4>
    3e4c:	d503201f 	nop

0000000000003e50 <mem_sbrk>:
{
    3e50:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3e54:	910003fd 	mov	x29, sp
    3e58:	a90153f3 	stp	x19, x20, [sp, #16]
    uintptr_t userland_heap_size = userland_heap_top - userland_heap_base;
    3e5c:	f0000053 	adrp	x19, e000 <__malloc_av_+0x768>
    3e60:	91046273 	add	x19, x19, #0x118
{
    3e64:	aa0003f4 	mov	x20, x0
    uintptr_t userland_heap_size = userland_heap_top - userland_heap_base;
    3e68:	a94a0660 	ldp	x0, x1, [x19, #160]
    if (userland_heap_size - requested_heap_size >= size) {
    3e6c:	f9405a62 	ldr	x2, [x19, #176]
    3e70:	8b020021 	add	x1, x1, x2
    3e74:	cb010003 	sub	x3, x0, x1
    3e78:	eb03029f 	cmp	x20, x3
    3e7c:	540001a9 	b.ls	3eb0 <mem_sbrk+0x60>  // b.plast
    uintptr_t size_needed = size - (userland_heap_size - requested_heap_size);
    3e80:	cb000282 	sub	x2, x20, x0
    userland_heap_top = mmap(userland_heap_top, (uintptr_t)NULL, size_needed, false);
    3e84:	52800003 	mov	w3, #0x0                   	// #0
    3e88:	0b020022 	add	w2, w1, w2
    3e8c:	d2800001 	mov	x1, #0x0                   	// #0
    3e90:	97fff958 	bl	23f0 <mmap>
    3e94:	93407c00 	sxtw	x0, w0
    if (userland_heap_size - requested_heap_size >= size) {
    3e98:	a94a8a61 	ldp	x1, x2, [x19, #168]
    userland_heap_top = mmap(userland_heap_top, (uintptr_t)NULL, size_needed, false);
    3e9c:	f9005260 	str	x0, [x19, #160]
    if (userland_heap_size - requested_heap_size >= size) {
    3ea0:	8b020021 	add	x1, x1, x2
    3ea4:	cb010003 	sub	x3, x0, x1
    3ea8:	eb14007f 	cmp	x3, x20
    3eac:	54fffea3 	b.cc	3e80 <mem_sbrk+0x30>  // b.lo, b.ul, b.last
        requested_heap_size += size;
    3eb0:	8b020294 	add	x20, x20, x2
}
    3eb4:	aa0103e0 	mov	x0, x1
        requested_heap_size += size;
    3eb8:	f9005a74 	str	x20, [x19, #176]
}
    3ebc:	a94153f3 	ldp	x19, x20, [sp, #16]
    3ec0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3ec4:	d65f03c0 	ret
    3ec8:	d503201f 	nop
    3ecc:	d503201f 	nop

0000000000003ed0 <mm_init>:
    return ptr;
}

static bool malloc_inited = false;
int mm_init(void)
{
    3ed0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3ed4:	910003fd 	mov	x29, sp
    3ed8:	f9000bf3 	str	x19, [sp, #16]
    // init heap
    userland_heap_base = task_heap_base();
    3edc:	f0000053 	adrp	x19, e000 <__malloc_av_+0x768>
    3ee0:	91046273 	add	x19, x19, #0x118
    3ee4:	97fff923 	bl	2370 <task_heap_base>
    3ee8:	aa1303e1 	mov	x1, x19
    3eec:	91028262 	add	x2, x19, #0xa0
    3ef0:	93407c00 	sxtw	x0, w0
    3ef4:	a90a0260 	stp	x0, x0, [x19, #160]
    userland_heap_top = userland_heap_base;
    requested_heap_size = 0;
    3ef8:	f9005a7f 	str	xzr, [x19, #176]

    int list;
    char* heap_start; // Pointer to beginning of heap

    // Initialize segregated free lists
    for (list = 0; list < LISTLIMIT; list++) {
    3efc:	d503201f 	nop
        segregated_free_lists[list] = NULL;
    3f00:	f800843f 	str	xzr, [x1], #8
    for (list = 0; list < LISTLIMIT; list++) {
    3f04:	eb02003f 	cmp	x1, x2
    3f08:	54ffffc1 	b.ne	3f00 <mm_init+0x30>  // b.any
    }

    // Allocate memory for the initial empty heap
    if ((long)(heap_start = mem_sbrk(4 * WSIZE)) == -1)
    3f0c:	d2800200 	mov	x0, #0x10                  	// #16
    3f10:	97ffffd0 	bl	3e50 <mem_sbrk>
    3f14:	aa0003e1 	mov	x1, x0
    3f18:	b100041f 	cmn	x0, #0x1
    3f1c:	54000300 	b.eq	3f7c <mm_init+0xac>  // b.none
        return -1;

    PUT_NOTAG(heap_start, 0); /* Alignment padding */
    PUT_NOTAG(heap_start + (1 * WSIZE), PACK(DSIZE, 1)); /* Prologue header */
    PUT_NOTAG(heap_start + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    3f20:	d2800122 	mov	x2, #0x9                   	// #9
    PUT_NOTAG(heap_start, 0); /* Alignment padding */
    3f24:	d2c00120 	mov	x0, #0x900000000           	// #38654705664
    PUT_NOTAG(heap_start + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    3f28:	f2c00022 	movk	x2, #0x1, lsl #32
    3f2c:	a9000820 	stp	x0, x2, [x1]
    if ((ptr = mem_sbrk(asize)) == (void*)-1)
    3f30:	d2800800 	mov	x0, #0x40                  	// #64
    3f34:	97ffffc7 	bl	3e50 <mem_sbrk>
    3f38:	b100041f 	cmn	x0, #0x1
    3f3c:	54000200 	b.eq	3f7c <mm_init+0xac>  // b.none
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    3f40:	d2800803 	mov	x3, #0x40                  	// #64
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    3f44:	52800804 	mov	w4, #0x40                  	// #64
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    3f48:	f2c00023 	movk	x3, #0x1, lsl #32
    insert_node(ptr, asize);
    3f4c:	d2800801 	mov	x1, #0x40                  	// #64
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    3f50:	b81fc004 	stur	w4, [x0, #-4]
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    3f54:	f9001c03 	str	x3, [x0, #56]
    insert_node(ptr, asize);
    3f58:	97fffeee 	bl	3b10 <insert_node>
    return coalesce(ptr);
    3f5c:	97ffff3d 	bl	3c50 <coalesce>
    PUT_NOTAG(heap_start + (3 * WSIZE), PACK(0, 1)); /* Epilogue header */

    if (extend_heap(INITCHUNKSIZE) == NULL)
    3f60:	b40000e0 	cbz	x0, 3f7c <mm_init+0xac>
        return -1;

    malloc_inited = true;
    3f64:	52800021 	mov	w1, #0x1                   	// #1
    return 0;
    3f68:	52800000 	mov	w0, #0x0                   	// #0
    malloc_inited = true;
    3f6c:	3902e261 	strb	w1, [x19, #184]
}
    3f70:	f9400bf3 	ldr	x19, [sp, #16]
    3f74:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3f78:	d65f03c0 	ret
        return -1;
    3f7c:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    3f80:	f9400bf3 	ldr	x19, [sp, #16]
    3f84:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3f88:	d65f03c0 	ret
    3f8c:	d503201f 	nop

0000000000003f90 <malloc>:

void* malloc(size_t size)
{
    3f90:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    3f94:	910003fd 	mov	x29, sp
    3f98:	a90153f3 	stp	x19, x20, [sp, #16]
    while (!malloc_inited) {
    3f9c:	f0000054 	adrp	x20, e000 <__malloc_av_+0x768>
    3fa0:	91046294 	add	x20, x20, #0x118
{
    3fa4:	aa0003f3 	mov	x19, x0
    while (!malloc_inited) {
    3fa8:	3942e280 	ldrb	w0, [x20, #184]
    3fac:	35000080 	cbnz	w0, 3fbc <malloc+0x2c>
        mm_init();
    3fb0:	97ffffc8 	bl	3ed0 <mm_init>
    while (!malloc_inited) {
    3fb4:	3942e281 	ldrb	w1, [x20, #184]
    3fb8:	34ffffc1 	cbz	w1, 3fb0 <malloc+0x20>
    size_t asize; /* Adjusted block size */
    size_t extendsize; /* Amount to extend heap if no fit */
    void* ptr = NULL; /* Pointer */

    // Ignore size 0 cases
    if (size == 0)
    3fbc:	b4000e73 	cbz	x19, 4188 <malloc+0x1f8>

    // Align block size
    if (size <= DSIZE) {
        asize = 2 * DSIZE;
    } else {
        asize = ALIGN(size + DSIZE);
    3fc0:	91003e60 	add	x0, x19, #0xf
    3fc4:	f100227f 	cmp	x19, #0x8
    3fc8:	927df013 	and	x19, x0, #0xfffffffffffffff8
    3fcc:	d2800200 	mov	x0, #0x10                  	// #16
    3fd0:	9a808273 	csel	x19, x19, x0, hi  // hi = pmore
        asize = 2 * DSIZE;
    3fd4:	d2800002 	mov	x2, #0x0                   	// #0
    3fd8:	aa1303e3 	mov	x3, x19
    3fdc:	14000005 	b	3ff0 <malloc+0x60>
    }

    int list = 0;
    size_t searchsize = asize;
    // Search for free block in segregated list
    while (list < LISTLIMIT) {
    3fe0:	91000442 	add	x2, x2, #0x1
            }
            if (ptr != NULL)
                break;
        }

        searchsize >>= 1;
    3fe4:	d341fc63 	lsr	x3, x3, #1
    while (list < LISTLIMIT) {
    3fe8:	f100505f 	cmp	x2, #0x14
    3fec:	54000720 	b.eq	40d0 <malloc+0x140>  // b.none
        if ((list == LISTLIMIT - 1) || ((searchsize <= 1) && (segregated_free_lists[list] != NULL))) {
    3ff0:	f1004c5f 	cmp	x2, #0x13
    3ff4:	540006a0 	b.eq	40c8 <malloc+0x138>  // b.none
    3ff8:	f100047f 	cmp	x3, #0x1
    3ffc:	54ffff28 	b.hi	3fe0 <malloc+0x50>  // b.pmore
    4000:	f8627a87 	ldr	x7, [x20, x2, lsl #3]
    4004:	b4fffee7 	cbz	x7, 3fe0 <malloc+0x50>
    4008:	14000003 	b	4014 <malloc+0x84>
                ptr = PRED(ptr);
    400c:	f94000e7 	ldr	x7, [x7]
            while ((ptr != NULL) && ((asize > GET_SIZE(HDRP(ptr))) || (GET_TAG(HDRP(ptr))))) {
    4010:	b4fffe87 	cbz	x7, 3fe0 <malloc+0x50>
    4014:	b85fc0e0 	ldur	w0, [x7, #-4]
    4018:	927d7001 	and	x1, x0, #0xfffffff8
    401c:	121d7005 	and	w5, w0, #0xfffffff8
    4020:	eb13003f 	cmp	x1, x19
    4024:	54ffff43 	b.cc	400c <malloc+0x7c>  // b.lo, b.ul, b.last
    4028:	370fff20 	tbnz	w0, #1, 400c <malloc+0x7c>
    size_t remainder = ptr_size - asize;
    402c:	cb130024 	sub	x4, x1, x19
    delete_node(ptr);
    4030:	aa0703e0 	mov	x0, x7
    4034:	97fffee3 	bl	3bc0 <delete_node>
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    4038:	b85fc0e0 	ldur	w0, [x7, #-4]
    if (remainder <= DSIZE * 2) {
    403c:	f100409f 	cmp	x4, #0x10
    4040:	54000849 	b.ls	4148 <malloc+0x1b8>  // b.plast
    else if (asize >= 100) {
    4044:	f1018e7f 	cmp	x19, #0x63
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    4048:	121f0000 	and	w0, w0, #0x2
    else if (asize >= 100) {
    404c:	54000a88 	b.hi	419c <malloc+0x20c>  // b.pmore
        PUT(HDRP(ptr), PACK(asize, 1));
    4050:	2a130000 	orr	w0, w0, w19
        insert_node(NEXT_BLKP(ptr), remainder);
    4054:	aa0403e1 	mov	x1, x4
        PUT(FTRP(ptr), PACK(asize, 1));
    4058:	927d7002 	and	x2, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(asize, 1));
    405c:	32000000 	orr	w0, w0, #0x1
        PUT(FTRP(ptr), PACK(asize, 1));
    4060:	d1002042 	sub	x2, x2, #0x8
        PUT(HDRP(ptr), PACK(asize, 1));
    4064:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(asize, 1));
    4068:	b86268e0 	ldr	w0, [x7, x2]
    406c:	121f0000 	and	w0, w0, #0x2
    4070:	2a130000 	orr	w0, w0, w19
    4074:	32000000 	orr	w0, w0, #0x1
    4078:	b82268e0 	str	w0, [x7, x2]
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(remainder, 0));
    407c:	b85fc0e0 	ldur	w0, [x7, #-4]
    4080:	927d7000 	and	x0, x0, #0xfffffff8
    4084:	8b0000e0 	add	x0, x7, x0
    4088:	b81fc004 	stur	w4, [x0, #-4]
        PUT_NOTAG(FTRP(NEXT_BLKP(ptr)), PACK(remainder, 0));
    408c:	b85fc0e0 	ldur	w0, [x7, #-4]
    4090:	927d7000 	and	x0, x0, #0xfffffff8
    4094:	8b0000e0 	add	x0, x7, x0
    4098:	b85fc002 	ldur	w2, [x0, #-4]
    409c:	927d7042 	and	x2, x2, #0xfffffff8
    40a0:	8b020000 	add	x0, x0, x2
    40a4:	b81f8004 	stur	w4, [x0, #-8]
        insert_node(NEXT_BLKP(ptr), remainder);
    40a8:	b85fc0e0 	ldur	w0, [x7, #-4]
    40ac:	927d7000 	and	x0, x0, #0xfffffff8
    40b0:	8b0000e0 	add	x0, x7, x0
    40b4:	97fffe97 	bl	3b10 <insert_node>
    // Place and divide block
    ptr = place(ptr, asize);

    // Return pointer to newly allocated block
    return ptr;
}
    40b8:	aa0703e0 	mov	x0, x7
    40bc:	a94153f3 	ldp	x19, x20, [sp, #16]
    40c0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    40c4:	d65f03c0 	ret
            ptr = segregated_free_lists[list];
    40c8:	f9404e87 	ldr	x7, [x20, #152]
            while ((ptr != NULL) && ((asize > GET_SIZE(HDRP(ptr))) || (GET_TAG(HDRP(ptr))))) {
    40cc:	b5fffa47 	cbnz	x7, 4014 <malloc+0x84>
        extendsize = MAX(asize, CHUNKSIZE);
    40d0:	f140067f 	cmp	x19, #0x1, lsl #12
    40d4:	d2820000 	mov	x0, #0x1000                	// #4096
    40d8:	9a802260 	csel	x0, x19, x0, cs  // cs = hs, nlast
    40dc:	f90013f5 	str	x21, [sp, #32]
    asize = ALIGN(size);
    40e0:	91001c14 	add	x20, x0, #0x7
    40e4:	aa0003f5 	mov	x21, x0
    if ((ptr = mem_sbrk(asize)) == (void*)-1)
    40e8:	97ffff5a 	bl	3e50 <mem_sbrk>
    40ec:	aa0003e3 	mov	x3, x0
    40f0:	b100041f 	cmn	x0, #0x1
    40f4:	54000480 	b.eq	4184 <malloc+0x1f4>  // b.none
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    40f8:	927d7282 	and	x2, x20, #0xfffffff8
    insert_node(ptr, asize);
    40fc:	aa1503e1 	mov	x1, x21
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    4100:	8b020062 	add	x2, x3, x2
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    4104:	b81fc075 	stur	w21, [x3, #-4]
    PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(0, 1));
    4108:	52800023 	mov	w3, #0x1                   	// #1
    410c:	293f0c55 	stp	w21, w3, [x2, #-8]
    insert_node(ptr, asize);
    4110:	97fffe80 	bl	3b10 <insert_node>
    return coalesce(ptr);
    4114:	97fffecf 	bl	3c50 <coalesce>
    4118:	aa0003e7 	mov	x7, x0
        if ((ptr = extend_heap(extendsize)) == NULL)
    411c:	b4000340 	cbz	x0, 4184 <malloc+0x1f4>
    4120:	b85fc001 	ldur	w1, [x0, #-4]
    delete_node(ptr);
    4124:	aa0703e0 	mov	x0, x7
    size_t ptr_size = GET_SIZE(HDRP(ptr));
    4128:	f94013f5 	ldr	x21, [sp, #32]
    size_t remainder = ptr_size - asize;
    412c:	121d7025 	and	w5, w1, #0xfffffff8
    size_t ptr_size = GET_SIZE(HDRP(ptr));
    4130:	927d7021 	and	x1, x1, #0xfffffff8
    size_t remainder = ptr_size - asize;
    4134:	cb130024 	sub	x4, x1, x19
    delete_node(ptr);
    4138:	97fffea2 	bl	3bc0 <delete_node>
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    413c:	b85fc0e0 	ldur	w0, [x7, #-4]
    if (remainder <= DSIZE * 2) {
    4140:	f100409f 	cmp	x4, #0x10
    4144:	54fff808 	b.hi	4044 <malloc+0xb4>  // b.pmore
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    4148:	121f0000 	and	w0, w0, #0x2
    414c:	2a050000 	orr	w0, w0, w5
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    4150:	927d7001 	and	x1, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    4154:	32000000 	orr	w0, w0, #0x1
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    4158:	d1002021 	sub	x1, x1, #0x8
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    415c:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    4160:	b86168e0 	ldr	w0, [x7, x1]
    4164:	121f0000 	and	w0, w0, #0x2
    4168:	2a050000 	orr	w0, w0, w5
    416c:	32000000 	orr	w0, w0, #0x1
    4170:	b82168e0 	str	w0, [x7, x1]
}
    4174:	aa0703e0 	mov	x0, x7
    4178:	a94153f3 	ldp	x19, x20, [sp, #16]
    417c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4180:	d65f03c0 	ret
    4184:	f94013f5 	ldr	x21, [sp, #32]
        return NULL;
    4188:	d2800007 	mov	x7, #0x0                   	// #0
}
    418c:	aa0703e0 	mov	x0, x7
    4190:	a94153f3 	ldp	x19, x20, [sp, #16]
    4194:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4198:	d65f03c0 	ret
        PUT(HDRP(ptr), PACK(remainder, 0));
    419c:	2a040000 	orr	w0, w0, w4
    41a0:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(remainder, 0));
    41a4:	927d7000 	and	x0, x0, #0xfffffff8
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    41a8:	32000273 	orr	w19, w19, #0x1
        PUT(FTRP(ptr), PACK(remainder, 0));
    41ac:	d1002002 	sub	x2, x0, #0x8
        insert_node(ptr, remainder);
    41b0:	aa0703e0 	mov	x0, x7
    41b4:	aa0403e1 	mov	x1, x4
        PUT(FTRP(ptr), PACK(remainder, 0));
    41b8:	b86268e3 	ldr	w3, [x7, x2]
    41bc:	121f0063 	and	w3, w3, #0x2
    41c0:	2a040063 	orr	w3, w3, w4
    41c4:	b82268e3 	str	w3, [x7, x2]
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    41c8:	b85fc0e2 	ldur	w2, [x7, #-4]
    41cc:	927d7042 	and	x2, x2, #0xfffffff8
    41d0:	8b0200e2 	add	x2, x7, x2
    41d4:	b81fc053 	stur	w19, [x2, #-4]
        PUT_NOTAG(FTRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    41d8:	b85fc0e2 	ldur	w2, [x7, #-4]
    41dc:	927d7042 	and	x2, x2, #0xfffffff8
    41e0:	8b0200e2 	add	x2, x7, x2
    41e4:	b85fc043 	ldur	w3, [x2, #-4]
    41e8:	927d7063 	and	x3, x3, #0xfffffff8
    41ec:	8b030042 	add	x2, x2, x3
    41f0:	b81f8053 	stur	w19, [x2, #-8]
        insert_node(ptr, remainder);
    41f4:	97fffe47 	bl	3b10 <insert_node>
        return NEXT_BLKP(ptr);
    41f8:	b85fc0e0 	ldur	w0, [x7, #-4]
}
    41fc:	a94153f3 	ldp	x19, x20, [sp, #16]
        return NEXT_BLKP(ptr);
    4200:	927d7000 	and	x0, x0, #0xfffffff8
    4204:	8b0000e7 	add	x7, x7, x0
}
    4208:	aa0703e0 	mov	x0, x7
    420c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4210:	d65f03c0 	ret
    4214:	d503201f 	nop
    4218:	d503201f 	nop
    421c:	d503201f 	nop

0000000000004220 <free>:

void free(void* ptr)
{
    4220:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    4224:	910003fd 	mov	x29, sp
    4228:	b85fc004 	ldur	w4, [x0, #-4]
    size_t size = GET_SIZE(HDRP(ptr));
    422c:	927d7081 	and	x1, x4, #0xfffffff8

    REMOVE_RATAG(HDRP(NEXT_BLKP(ptr)));
    4230:	121d7085 	and	w5, w4, #0xfffffff8
    4234:	d1001024 	sub	x4, x1, #0x4
    4238:	b8646802 	ldr	w2, [x0, x4]
    423c:	121e7842 	and	w2, w2, #0xfffffffd
    4240:	b8246802 	str	w2, [x0, x4]
    PUT(HDRP(ptr), PACK(size, 0));
    4244:	b85fc002 	ldur	w2, [x0, #-4]
    4248:	121f0042 	and	w2, w2, #0x2
    424c:	2a050042 	orr	w2, w2, w5
    4250:	b81fc002 	stur	w2, [x0, #-4]
    PUT(FTRP(ptr), PACK(size, 0));
    4254:	927d7042 	and	x2, x2, #0xfffffff8
    4258:	d1002042 	sub	x2, x2, #0x8
    425c:	b8626804 	ldr	w4, [x0, x2]
    4260:	121f0084 	and	w4, w4, #0x2
    4264:	2a050084 	orr	w4, w4, w5
    4268:	b8226804 	str	w4, [x0, x2]

    insert_node(ptr, size);
    426c:	97fffe29 	bl	3b10 <insert_node>
    coalesce(ptr);

    return;
}
    4270:	a8c17bfd 	ldp	x29, x30, [sp], #16
    coalesce(ptr);
    4274:	17fffe77 	b	3c50 <coalesce>
    4278:	d503201f 	nop
    427c:	d503201f 	nop

0000000000004280 <_exit>:
#include <sys/types.h>

// _exit: 用于退出程序
void _exit(int status)
{
    while (1) { }
    4280:	14000000 	b	4280 <_exit>
    4284:	d503201f 	nop
    4288:	d503201f 	nop
    428c:	d503201f 	nop

0000000000004290 <_sbrk>:
{
    extern char end; /* Defined by the linker */
    static char* heap_end;
    char* prev_heap_end;

    if (heap_end == 0) {
    4290:	d0000043 	adrp	x3, e000 <__malloc_av_+0x768>
    4294:	f940ec61 	ldr	x1, [x3, #472]
    4298:	d0000042 	adrp	x2, e000 <__malloc_av_+0x768>
    429c:	91138042 	add	x2, x2, #0x4e0
    42a0:	f100003f 	cmp	x1, #0x0
    42a4:	9a810041 	csel	x1, x2, x1, eq  // eq = none
    prev_heap_end = heap_end;

    // 在这里，你应该添加一些检查来确保堆不会与栈或其他内存区域冲突
    // 例如，检查 incr 是否会导致堆超出预定的内存区域

    heap_end += incr;
    42a8:	8b000022 	add	x2, x1, x0
    return (void*)prev_heap_end;
}
    42ac:	aa0103e0 	mov	x0, x1
    heap_end += incr;
    42b0:	f900ec62 	str	x2, [x3, #472]
}
    42b4:	d65f03c0 	ret
    42b8:	d503201f 	nop
    42bc:	d503201f 	nop

00000000000042c0 <_write>:

// _write: 用于将数据写入文件描述符
ssize_t _write(int file, const void* ptr, size_t len)
{
    42c0:	aa0203e0 	mov	x0, x2
    // 在这里，你需要实现将数据写入文件描述符的逻辑
    // 如果你的系统不支持文件系统，你可以将数据发送到串口或其他输出

    return len; // 假设所有数据都被写入
}
    42c4:	d65f03c0 	ret
    42c8:	d503201f 	nop
    42cc:	d503201f 	nop

00000000000042d0 <_close>:

// _close: 用于关闭文件描述符
int _close(int file)
{
    return -1; // 表示失败，因为没有实际关闭文件的功能
}
    42d0:	12800000 	mov	w0, #0xffffffff            	// #-1
    42d4:	d65f03c0 	ret
    42d8:	d503201f 	nop
    42dc:	d503201f 	nop

00000000000042e0 <_fstat>:

// _fstat: 用于获取文件状态
int _fstat(int file, struct stat* st)
{
    return 0; // 表示成功
}
    42e0:	52800000 	mov	w0, #0x0                   	// #0
    42e4:	d65f03c0 	ret
    42e8:	d503201f 	nop
    42ec:	d503201f 	nop

00000000000042f0 <_isatty>:

// _isatty: 检查文件描述符是否指向TTY设备
int _isatty(int file)
{
    return 1; // 表示是TTY设备
}
    42f0:	52800020 	mov	w0, #0x1                   	// #1
    42f4:	d65f03c0 	ret
    42f8:	d503201f 	nop
    42fc:	d503201f 	nop

0000000000004300 <_lseek>:

// _lseek: 用于重新定位文件读/写的位置
off_t _lseek(int file, off_t offset, int whence)
{
    return -1; // 表示失败，因为不支持文件定位
}
    4300:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    4304:	d65f03c0 	ret
    4308:	d503201f 	nop
    430c:	d503201f 	nop

0000000000004310 <_read>:

// _read: 用于从文件描述符读取数据
ssize_t _read(int file, void* ptr, size_t len)
{
    return 0; // 表示没有数据被读取
}
    4310:	d2800000 	mov	x0, #0x0                   	// #0
    4314:	d65f03c0 	ret
    4318:	d503201f 	nop
    431c:	d503201f 	nop

0000000000004320 <_kill>:

// _kill: 发送信号给进程
int _kill(int pid, int sig)
{
    return -1; // 表示失败，因为不支持信号
}
    4320:	12800000 	mov	w0, #0xffffffff            	// #-1
    4324:	d65f03c0 	ret
    4328:	d503201f 	nop
    432c:	d503201f 	nop

0000000000004330 <_getpid>:

// _getpid: 获取进程ID
int _getpid()
{
    return 1; // 返回假设的进程ID
}
    4330:	52800020 	mov	w0, #0x1                   	// #1
    4334:	d65f03c0 	ret
    4338:	d503201f 	nop
    433c:	d503201f 	nop

0000000000004340 <__assert_func>:
    4340:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    4344:	90000044 	adrp	x4, c000 <_reclaim_reent+0xc0>
    4348:	aa0003e7 	mov	x7, x0
    434c:	910003fd 	mov	x29, sp
    4350:	f947c085 	ldr	x5, [x4, #3968]
    4354:	aa0203e6 	mov	x6, x2
    4358:	2a0103e4 	mov	w4, w1
    435c:	aa0303e2 	mov	x2, x3
    4360:	f9400ca0 	ldr	x0, [x5, #24]
    4364:	b4000106 	cbz	x6, 4384 <__assert_func+0x44>
    4368:	90000045 	adrp	x5, c000 <_reclaim_reent+0xc0>
    436c:	912120a5 	add	x5, x5, #0x848
    4370:	aa0703e3 	mov	x3, x7
    4374:	90000041 	adrp	x1, c000 <_reclaim_reent+0xc0>
    4378:	91216021 	add	x1, x1, #0x858
    437c:	94000049 	bl	44a0 <fiprintf>
    4380:	940009fc 	bl	6b70 <abort>
    4384:	90000045 	adrp	x5, c000 <_reclaim_reent+0xc0>
    4388:	9110e0a5 	add	x5, x5, #0x438
    438c:	aa0503e6 	mov	x6, x5
    4390:	17fffff8 	b	4370 <__assert_func+0x30>
    4394:	d503201f 	nop
    4398:	d503201f 	nop
    439c:	d503201f 	nop

00000000000043a0 <__assert>:
    43a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    43a4:	aa0203e3 	mov	x3, x2
    43a8:	d2800002 	mov	x2, #0x0                   	// #0
    43ac:	910003fd 	mov	x29, sp
    43b0:	97ffffe4 	bl	4340 <__assert_func>
    43b4:	d503201f 	nop
    43b8:	d503201f 	nop
    43bc:	d503201f 	nop

00000000000043c0 <atexit>:
    43c0:	aa0003e1 	mov	x1, x0
    43c4:	d2800003 	mov	x3, #0x0                   	// #0
    43c8:	d2800002 	mov	x2, #0x0                   	// #0
    43cc:	52800000 	mov	w0, #0x0                   	// #0
    43d0:	140009f0 	b	6b90 <__register_exitproc>
    43d4:	d503201f 	nop
    43d8:	d503201f 	nop
    43dc:	d503201f 	nop

00000000000043e0 <__libc_fini_array>:
    43e0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    43e4:	90000041 	adrp	x1, c000 <_reclaim_reent+0xc0>
    43e8:	90000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    43ec:	910003fd 	mov	x29, sp
    43f0:	a90153f3 	stp	x19, x20, [sp, #16]
    43f4:	f9444433 	ldr	x19, [x1, #2184]
    43f8:	f9444814 	ldr	x20, [x0, #2192]
    43fc:	cb140273 	sub	x19, x19, x20
    4400:	9343fe73 	asr	x19, x19, #3
    4404:	b40000b3 	cbz	x19, 4418 <__libc_fini_array+0x38>
    4408:	d1000673 	sub	x19, x19, #0x1
    440c:	f8737a80 	ldr	x0, [x20, x19, lsl #3]
    4410:	d63f0000 	blr	x0
    4414:	b5ffffb3 	cbnz	x19, 4408 <__libc_fini_array+0x28>
    4418:	a94153f3 	ldp	x19, x20, [sp, #16]
    441c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    4420:	14001f95 	b	c274 <_fini>
    4424:	d503201f 	nop
    4428:	d503201f 	nop
    442c:	d503201f 	nop

0000000000004430 <_fiprintf_r>:
    4430:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    4434:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    4438:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    443c:	910003fd 	mov	x29, sp
    4440:	910343ea 	add	x10, sp, #0xd0
    4444:	910403eb 	add	x11, sp, #0x100
    4448:	a9032feb 	stp	x11, x11, [sp, #48]
    444c:	f90023ea 	str	x10, [sp, #64]
    4450:	290923e9 	stp	w9, w8, [sp, #72]
    4454:	a9432fea 	ldp	x10, x11, [sp, #48]
    4458:	a9012fea 	stp	x10, x11, [sp, #16]
    445c:	a94427e8 	ldp	x8, x9, [sp, #64]
    4460:	a90227e8 	stp	x8, x9, [sp, #32]
    4464:	3d8017e0 	str	q0, [sp, #80]
    4468:	3d801be1 	str	q1, [sp, #96]
    446c:	3d801fe2 	str	q2, [sp, #112]
    4470:	3d8023e3 	str	q3, [sp, #128]
    4474:	3d8027e4 	str	q4, [sp, #144]
    4478:	3d802be5 	str	q5, [sp, #160]
    447c:	3d802fe6 	str	q6, [sp, #176]
    4480:	3d8033e7 	str	q7, [sp, #192]
    4484:	a90d93e3 	stp	x3, x4, [sp, #216]
    4488:	910043e3 	add	x3, sp, #0x10
    448c:	a90e9be5 	stp	x5, x6, [sp, #232]
    4490:	f9007fe7 	str	x7, [sp, #248]
    4494:	940001eb 	bl	4c40 <_vfiprintf_r>
    4498:	a8d07bfd 	ldp	x29, x30, [sp], #256
    449c:	d65f03c0 	ret

00000000000044a0 <fiprintf>:
    44a0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    44a4:	90000048 	adrp	x8, c000 <_reclaim_reent+0xc0>
    44a8:	aa0003eb 	mov	x11, x0
    44ac:	910003fd 	mov	x29, sp
    44b0:	910343ec 	add	x12, sp, #0xd0
    44b4:	910403ea 	add	x10, sp, #0x100
    44b8:	f947c100 	ldr	x0, [x8, #3968]
    44bc:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    44c0:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    44c4:	a9032bea 	stp	x10, x10, [sp, #48]
    44c8:	aa0103ea 	mov	x10, x1
    44cc:	f90023ec 	str	x12, [sp, #64]
    44d0:	aa0b03e1 	mov	x1, x11
    44d4:	290923e9 	stp	w9, w8, [sp, #72]
    44d8:	a94337ec 	ldp	x12, x13, [sp, #48]
    44dc:	a90137ec 	stp	x12, x13, [sp, #16]
    44e0:	a94427e8 	ldp	x8, x9, [sp, #64]
    44e4:	a90227e8 	stp	x8, x9, [sp, #32]
    44e8:	3d8017e0 	str	q0, [sp, #80]
    44ec:	3d801be1 	str	q1, [sp, #96]
    44f0:	3d801fe2 	str	q2, [sp, #112]
    44f4:	3d8023e3 	str	q3, [sp, #128]
    44f8:	3d8027e4 	str	q4, [sp, #144]
    44fc:	3d802be5 	str	q5, [sp, #160]
    4500:	3d802fe6 	str	q6, [sp, #176]
    4504:	3d8033e7 	str	q7, [sp, #192]
    4508:	a90d0fe2 	stp	x2, x3, [sp, #208]
    450c:	910043e3 	add	x3, sp, #0x10
    4510:	aa0a03e2 	mov	x2, x10
    4514:	a90e17e4 	stp	x4, x5, [sp, #224]
    4518:	a90f1fe6 	stp	x6, x7, [sp, #240]
    451c:	940001c9 	bl	4c40 <_vfiprintf_r>
    4520:	a8d07bfd 	ldp	x29, x30, [sp], #256
    4524:	d65f03c0 	ret
    4528:	d503201f 	nop
    452c:	d503201f 	nop

0000000000004530 <__libc_init_array>:
    4530:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    4534:	90000041 	adrp	x1, c000 <_reclaim_reent+0xc0>
    4538:	90000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    453c:	910003fd 	mov	x29, sp
    4540:	a90153f3 	stp	x19, x20, [sp, #16]
    4544:	f9445034 	ldr	x20, [x1, #2208]
    4548:	f90013f5 	str	x21, [sp, #32]
    454c:	f9445415 	ldr	x21, [x0, #2216]
    4550:	cb150294 	sub	x20, x20, x21
    4554:	9343fe94 	asr	x20, x20, #3
    4558:	b40000f4 	cbz	x20, 4574 <__libc_init_array+0x44>
    455c:	d2800013 	mov	x19, #0x0                   	// #0
    4560:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    4564:	91000673 	add	x19, x19, #0x1
    4568:	d63f0000 	blr	x0
    456c:	eb13029f 	cmp	x20, x19
    4570:	54ffff81 	b.ne	4560 <__libc_init_array+0x30>  // b.any
    4574:	940feea3 	bl	400000 <_init>
    4578:	90000041 	adrp	x1, c000 <_reclaim_reent+0xc0>
    457c:	90000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    4580:	f9445834 	ldr	x20, [x1, #2224]
    4584:	f9445c15 	ldr	x21, [x0, #2232]
    4588:	cb150294 	sub	x20, x20, x21
    458c:	9343fe94 	asr	x20, x20, #3
    4590:	b40000f4 	cbz	x20, 45ac <__libc_init_array+0x7c>
    4594:	d2800013 	mov	x19, #0x0                   	// #0
    4598:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    459c:	91000673 	add	x19, x19, #0x1
    45a0:	d63f0000 	blr	x0
    45a4:	eb13029f 	cmp	x20, x19
    45a8:	54ffff81 	b.ne	4598 <__libc_init_array+0x68>  // b.any
    45ac:	a94153f3 	ldp	x19, x20, [sp, #16]
    45b0:	f94013f5 	ldr	x21, [sp, #32]
    45b4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    45b8:	d65f03c0 	ret
    45bc:	d503201f 	nop

00000000000045c0 <memcpy>:
    45c0:	f9800020 	prfm	pldl1keep, [x1]
    45c4:	8b020024 	add	x4, x1, x2
    45c8:	8b020005 	add	x5, x0, x2
    45cc:	f100405f 	cmp	x2, #0x10
    45d0:	54000209 	b.ls	4610 <memcpy+0x50>  // b.plast
    45d4:	f101805f 	cmp	x2, #0x60
    45d8:	54000648 	b.hi	46a0 <memcpy+0xe0>  // b.pmore
    45dc:	d1000449 	sub	x9, x2, #0x1
    45e0:	a9401c26 	ldp	x6, x7, [x1]
    45e4:	37300469 	tbnz	w9, #6, 4670 <memcpy+0xb0>
    45e8:	a97f348c 	ldp	x12, x13, [x4, #-16]
    45ec:	362800a9 	tbz	w9, #5, 4600 <memcpy+0x40>
    45f0:	a9412428 	ldp	x8, x9, [x1, #16]
    45f4:	a97e2c8a 	ldp	x10, x11, [x4, #-32]
    45f8:	a9012408 	stp	x8, x9, [x0, #16]
    45fc:	a93e2caa 	stp	x10, x11, [x5, #-32]
    4600:	a9001c06 	stp	x6, x7, [x0]
    4604:	a93f34ac 	stp	x12, x13, [x5, #-16]
    4608:	d65f03c0 	ret
    460c:	d503201f 	nop
    4610:	f100205f 	cmp	x2, #0x8
    4614:	540000e3 	b.cc	4630 <memcpy+0x70>  // b.lo, b.ul, b.last
    4618:	f9400026 	ldr	x6, [x1]
    461c:	f85f8087 	ldur	x7, [x4, #-8]
    4620:	f9000006 	str	x6, [x0]
    4624:	f81f80a7 	stur	x7, [x5, #-8]
    4628:	d65f03c0 	ret
    462c:	d503201f 	nop
    4630:	361000c2 	tbz	w2, #2, 4648 <memcpy+0x88>
    4634:	b9400026 	ldr	w6, [x1]
    4638:	b85fc087 	ldur	w7, [x4, #-4]
    463c:	b9000006 	str	w6, [x0]
    4640:	b81fc0a7 	stur	w7, [x5, #-4]
    4644:	d65f03c0 	ret
    4648:	b4000102 	cbz	x2, 4668 <memcpy+0xa8>
    464c:	d341fc49 	lsr	x9, x2, #1
    4650:	39400026 	ldrb	w6, [x1]
    4654:	385ff087 	ldurb	w7, [x4, #-1]
    4658:	38696828 	ldrb	w8, [x1, x9]
    465c:	39000006 	strb	w6, [x0]
    4660:	38296808 	strb	w8, [x0, x9]
    4664:	381ff0a7 	sturb	w7, [x5, #-1]
    4668:	d65f03c0 	ret
    466c:	d503201f 	nop
    4670:	a9412428 	ldp	x8, x9, [x1, #16]
    4674:	a9422c2a 	ldp	x10, x11, [x1, #32]
    4678:	a943342c 	ldp	x12, x13, [x1, #48]
    467c:	a97e0881 	ldp	x1, x2, [x4, #-32]
    4680:	a97f0c84 	ldp	x4, x3, [x4, #-16]
    4684:	a9001c06 	stp	x6, x7, [x0]
    4688:	a9012408 	stp	x8, x9, [x0, #16]
    468c:	a9022c0a 	stp	x10, x11, [x0, #32]
    4690:	a903340c 	stp	x12, x13, [x0, #48]
    4694:	a93e08a1 	stp	x1, x2, [x5, #-32]
    4698:	a93f0ca4 	stp	x4, x3, [x5, #-16]
    469c:	d65f03c0 	ret
    46a0:	92400c09 	and	x9, x0, #0xf
    46a4:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    46a8:	a940342c 	ldp	x12, x13, [x1]
    46ac:	cb090021 	sub	x1, x1, x9
    46b0:	8b090042 	add	x2, x2, x9
    46b4:	a9411c26 	ldp	x6, x7, [x1, #16]
    46b8:	a900340c 	stp	x12, x13, [x0]
    46bc:	a9422428 	ldp	x8, x9, [x1, #32]
    46c0:	a9432c2a 	ldp	x10, x11, [x1, #48]
    46c4:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    46c8:	f1024042 	subs	x2, x2, #0x90
    46cc:	54000169 	b.ls	46f8 <memcpy+0x138>  // b.plast
    46d0:	a9011c66 	stp	x6, x7, [x3, #16]
    46d4:	a9411c26 	ldp	x6, x7, [x1, #16]
    46d8:	a9022468 	stp	x8, x9, [x3, #32]
    46dc:	a9422428 	ldp	x8, x9, [x1, #32]
    46e0:	a9032c6a 	stp	x10, x11, [x3, #48]
    46e4:	a9432c2a 	ldp	x10, x11, [x1, #48]
    46e8:	a984346c 	stp	x12, x13, [x3, #64]!
    46ec:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    46f0:	f1010042 	subs	x2, x2, #0x40
    46f4:	54fffee8 	b.hi	46d0 <memcpy+0x110>  // b.pmore
    46f8:	a97c0881 	ldp	x1, x2, [x4, #-64]
    46fc:	a9011c66 	stp	x6, x7, [x3, #16]
    4700:	a97d1c86 	ldp	x6, x7, [x4, #-48]
    4704:	a9022468 	stp	x8, x9, [x3, #32]
    4708:	a97e2488 	ldp	x8, x9, [x4, #-32]
    470c:	a9032c6a 	stp	x10, x11, [x3, #48]
    4710:	a97f2c8a 	ldp	x10, x11, [x4, #-16]
    4714:	a904346c 	stp	x12, x13, [x3, #64]
    4718:	a93c08a1 	stp	x1, x2, [x5, #-64]
    471c:	a93d1ca6 	stp	x6, x7, [x5, #-48]
    4720:	a93e24a8 	stp	x8, x9, [x5, #-32]
    4724:	a93f2caa 	stp	x10, x11, [x5, #-16]
    4728:	d65f03c0 	ret
    472c:	d503201f 	nop
    4730:	d503201f 	nop
    4734:	d503201f 	nop
    4738:	d503201f 	nop
    473c:	d503201f 	nop

0000000000004740 <memmove>:
    4740:	cb010005 	sub	x5, x0, x1
    4744:	f101805f 	cmp	x2, #0x60
    4748:	fa4280a2 	ccmp	x5, x2, #0x2, hi  // hi = pmore
    474c:	54fff3a2 	b.cs	45c0 <memcpy>  // b.hs, b.nlast
    4750:	b40004c5 	cbz	x5, 47e8 <memmove+0xa8>
    4754:	8b020004 	add	x4, x0, x2
    4758:	8b020023 	add	x3, x1, x2
    475c:	92400c85 	and	x5, x4, #0xf
    4760:	a97f346c 	ldp	x12, x13, [x3, #-16]
    4764:	cb050063 	sub	x3, x3, x5
    4768:	cb050042 	sub	x2, x2, x5
    476c:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    4770:	a93f348c 	stp	x12, x13, [x4, #-16]
    4774:	a97e2468 	ldp	x8, x9, [x3, #-32]
    4778:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    477c:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    4780:	cb050084 	sub	x4, x4, x5
    4784:	f1020042 	subs	x2, x2, #0x80
    4788:	54000189 	b.ls	47b8 <memmove+0x78>  // b.plast
    478c:	d503201f 	nop
    4790:	a93f1c86 	stp	x6, x7, [x4, #-16]
    4794:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    4798:	a93e2488 	stp	x8, x9, [x4, #-32]
    479c:	a97e2468 	ldp	x8, x9, [x3, #-32]
    47a0:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    47a4:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    47a8:	a9bc348c 	stp	x12, x13, [x4, #-64]!
    47ac:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    47b0:	f1010042 	subs	x2, x2, #0x40
    47b4:	54fffee8 	b.hi	4790 <memmove+0x50>  // b.pmore
    47b8:	a9431422 	ldp	x2, x5, [x1, #48]
    47bc:	a93f1c86 	stp	x6, x7, [x4, #-16]
    47c0:	a9421c26 	ldp	x6, x7, [x1, #32]
    47c4:	a93e2488 	stp	x8, x9, [x4, #-32]
    47c8:	a9412428 	ldp	x8, x9, [x1, #16]
    47cc:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    47d0:	a9402c2a 	ldp	x10, x11, [x1]
    47d4:	a93c348c 	stp	x12, x13, [x4, #-64]
    47d8:	a9031402 	stp	x2, x5, [x0, #48]
    47dc:	a9021c06 	stp	x6, x7, [x0, #32]
    47e0:	a9012408 	stp	x8, x9, [x0, #16]
    47e4:	a9002c0a 	stp	x10, x11, [x0]
    47e8:	d65f03c0 	ret
    47ec:	d503201f 	nop
    47f0:	d503201f 	nop
    47f4:	d503201f 	nop
    47f8:	d503201f 	nop
    47fc:	d503201f 	nop

0000000000004800 <memset>:
    4800:	4e010c20 	dup	v0.16b, w1
    4804:	8b020004 	add	x4, x0, x2
    4808:	f101805f 	cmp	x2, #0x60
    480c:	540003c8 	b.hi	4884 <memset+0x84>  // b.pmore
    4810:	f100405f 	cmp	x2, #0x10
    4814:	54000202 	b.cs	4854 <memset+0x54>  // b.hs, b.nlast
    4818:	4e083c01 	mov	x1, v0.d[0]
    481c:	361800a2 	tbz	w2, #3, 4830 <memset+0x30>
    4820:	f9000001 	str	x1, [x0]
    4824:	f81f8081 	stur	x1, [x4, #-8]
    4828:	d65f03c0 	ret
    482c:	d503201f 	nop
    4830:	36100082 	tbz	w2, #2, 4840 <memset+0x40>
    4834:	b9000001 	str	w1, [x0]
    4838:	b81fc081 	stur	w1, [x4, #-4]
    483c:	d65f03c0 	ret
    4840:	b4000082 	cbz	x2, 4850 <memset+0x50>
    4844:	39000001 	strb	w1, [x0]
    4848:	36080042 	tbz	w2, #1, 4850 <memset+0x50>
    484c:	781fe081 	sturh	w1, [x4, #-2]
    4850:	d65f03c0 	ret
    4854:	3d800000 	str	q0, [x0]
    4858:	373000c2 	tbnz	w2, #6, 4870 <memset+0x70>
    485c:	3c9f0080 	stur	q0, [x4, #-16]
    4860:	36280062 	tbz	w2, #5, 486c <memset+0x6c>
    4864:	3d800400 	str	q0, [x0, #16]
    4868:	3c9e0080 	stur	q0, [x4, #-32]
    486c:	d65f03c0 	ret
    4870:	3d800400 	str	q0, [x0, #16]
    4874:	ad010000 	stp	q0, q0, [x0, #32]
    4878:	ad3f0080 	stp	q0, q0, [x4, #-32]
    487c:	d65f03c0 	ret
    4880:	d503201f 	nop
    4884:	12001c21 	and	w1, w1, #0xff
    4888:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    488c:	3d800000 	str	q0, [x0]
    4890:	f104005f 	cmp	x2, #0x100
    4894:	7a402820 	ccmp	w1, #0x0, #0x0, cs  // cs = hs, nlast
    4898:	54000180 	b.eq	48c8 <memset+0xc8>  // b.none
    489c:	cb030082 	sub	x2, x4, x3
    48a0:	d1004063 	sub	x3, x3, #0x10
    48a4:	d1014042 	sub	x2, x2, #0x50
    48a8:	ad010060 	stp	q0, q0, [x3, #32]
    48ac:	ad820060 	stp	q0, q0, [x3, #64]!
    48b0:	f1010042 	subs	x2, x2, #0x40
    48b4:	54ffffa8 	b.hi	48a8 <memset+0xa8>  // b.pmore
    48b8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    48bc:	ad3f0080 	stp	q0, q0, [x4, #-32]
    48c0:	d65f03c0 	ret
    48c4:	d503201f 	nop
    48c8:	d53b00e5 	mrs	x5, dczid_el0
    48cc:	3727fe85 	tbnz	w5, #4, 489c <memset+0x9c>
    48d0:	12000ca5 	and	w5, w5, #0xf
    48d4:	710010bf 	cmp	w5, #0x4
    48d8:	54000281 	b.ne	4928 <memset+0x128>  // b.any
    48dc:	3d800460 	str	q0, [x3, #16]
    48e0:	ad010060 	stp	q0, q0, [x3, #32]
    48e4:	927ae463 	and	x3, x3, #0xffffffffffffffc0
    48e8:	ad020060 	stp	q0, q0, [x3, #64]
    48ec:	ad030060 	stp	q0, q0, [x3, #96]
    48f0:	cb030082 	sub	x2, x4, x3
    48f4:	d1040042 	sub	x2, x2, #0x100
    48f8:	91020063 	add	x3, x3, #0x80
    48fc:	d503201f 	nop
    4900:	d50b7423 	dc	zva, x3
    4904:	91010063 	add	x3, x3, #0x40
    4908:	f1010042 	subs	x2, x2, #0x40
    490c:	54ffffa8 	b.hi	4900 <memset+0x100>  // b.pmore
    4910:	ad000060 	stp	q0, q0, [x3]
    4914:	ad010060 	stp	q0, q0, [x3, #32]
    4918:	ad3e0080 	stp	q0, q0, [x4, #-64]
    491c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    4920:	d65f03c0 	ret
    4924:	d503201f 	nop
    4928:	710014bf 	cmp	w5, #0x5
    492c:	54000241 	b.ne	4974 <memset+0x174>  // b.any
    4930:	3d800460 	str	q0, [x3, #16]
    4934:	ad010060 	stp	q0, q0, [x3, #32]
    4938:	ad020060 	stp	q0, q0, [x3, #64]
    493c:	ad030060 	stp	q0, q0, [x3, #96]
    4940:	9279e063 	and	x3, x3, #0xffffffffffffff80
    4944:	cb030082 	sub	x2, x4, x3
    4948:	d1040042 	sub	x2, x2, #0x100
    494c:	91020063 	add	x3, x3, #0x80
    4950:	d50b7423 	dc	zva, x3
    4954:	91020063 	add	x3, x3, #0x80
    4958:	f1020042 	subs	x2, x2, #0x80
    495c:	54ffffa8 	b.hi	4950 <memset+0x150>  // b.pmore
    4960:	ad3c0080 	stp	q0, q0, [x4, #-128]
    4964:	ad3d0080 	stp	q0, q0, [x4, #-96]
    4968:	ad3e0080 	stp	q0, q0, [x4, #-64]
    496c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    4970:	d65f03c0 	ret
    4974:	52800086 	mov	w6, #0x4                   	// #4
    4978:	1ac520c7 	lsl	w7, w6, w5
    497c:	910100e5 	add	x5, x7, #0x40
    4980:	eb05005f 	cmp	x2, x5
    4984:	54fff8c3 	b.cc	489c <memset+0x9c>  // b.lo, b.ul, b.last
    4988:	d10004e6 	sub	x6, x7, #0x1
    498c:	8b070065 	add	x5, x3, x7
    4990:	91004063 	add	x3, x3, #0x10
    4994:	eb0300a2 	subs	x2, x5, x3
    4998:	8a2600a5 	bic	x5, x5, x6
    499c:	540000a0 	b.eq	49b0 <memset+0x1b0>  // b.none
    49a0:	ac820060 	stp	q0, q0, [x3], #64
    49a4:	ad3f0060 	stp	q0, q0, [x3, #-32]
    49a8:	f1010042 	subs	x2, x2, #0x40
    49ac:	54ffffa8 	b.hi	49a0 <memset+0x1a0>  // b.pmore
    49b0:	aa0503e3 	mov	x3, x5
    49b4:	cb050082 	sub	x2, x4, x5
    49b8:	eb070042 	subs	x2, x2, x7
    49bc:	540000a3 	b.cc	49d0 <memset+0x1d0>  // b.lo, b.ul, b.last
    49c0:	d50b7423 	dc	zva, x3
    49c4:	8b070063 	add	x3, x3, x7
    49c8:	eb070042 	subs	x2, x2, x7
    49cc:	54ffffa2 	b.cs	49c0 <memset+0x1c0>  // b.hs, b.nlast
    49d0:	8b070042 	add	x2, x2, x7
    49d4:	d1008063 	sub	x3, x3, #0x20
    49d8:	17ffffb6 	b	48b0 <memset+0xb0>
    49dc:	d503201f 	nop
    49e0:	d503201f 	nop
    49e4:	d503201f 	nop
    49e8:	d503201f 	nop
    49ec:	d503201f 	nop
    49f0:	d503201f 	nop
    49f4:	d503201f 	nop
    49f8:	d503201f 	nop
    49fc:	d503201f 	nop

0000000000004a00 <strlen>:
    4a00:	92402c04 	and	x4, x0, #0xfff
    4a04:	b200c3e8 	mov	x8, #0x101010101010101     	// #72340172838076673
    4a08:	f13fc09f 	cmp	x4, #0xff0
    4a0c:	5400082c 	b.gt	4b10 <strlen+0x110>
    4a10:	a9400c02 	ldp	x2, x3, [x0]
    4a14:	cb080044 	sub	x4, x2, x8
    4a18:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    4a1c:	cb080066 	sub	x6, x3, x8
    4a20:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    4a24:	ea250084 	bics	x4, x4, x5
    4a28:	8a2700c5 	bic	x5, x6, x7
    4a2c:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    4a30:	54000100 	b.eq	4a50 <strlen+0x50>  // b.none
    4a34:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    4a38:	d2800100 	mov	x0, #0x8                   	// #8
    4a3c:	dac00c84 	rev	x4, x4
    4a40:	dac01084 	clz	x4, x4
    4a44:	9a8033e0 	csel	x0, xzr, x0, cc  // cc = lo, ul, last
    4a48:	8b440c00 	add	x0, x0, x4, lsr #3
    4a4c:	d65f03c0 	ret
    4a50:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    4a54:	d1004021 	sub	x1, x1, #0x10
    4a58:	a9c20c22 	ldp	x2, x3, [x1, #32]!
    4a5c:	cb080044 	sub	x4, x2, x8
    4a60:	cb080066 	sub	x6, x3, x8
    4a64:	aa060085 	orr	x5, x4, x6
    4a68:	ea081cbf 	tst	x5, x8, lsl #7
    4a6c:	54000101 	b.ne	4a8c <strlen+0x8c>  // b.any
    4a70:	a9410c22 	ldp	x2, x3, [x1, #16]
    4a74:	cb080044 	sub	x4, x2, x8
    4a78:	cb080066 	sub	x6, x3, x8
    4a7c:	aa060085 	orr	x5, x4, x6
    4a80:	ea081cbf 	tst	x5, x8, lsl #7
    4a84:	54fffea0 	b.eq	4a58 <strlen+0x58>  // b.none
    4a88:	91004021 	add	x1, x1, #0x10
    4a8c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    4a90:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    4a94:	ea250084 	bics	x4, x4, x5
    4a98:	8a2700c5 	bic	x5, x6, x7
    4a9c:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    4aa0:	54000120 	b.eq	4ac4 <strlen+0xc4>  // b.none
    4aa4:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    4aa8:	cb000020 	sub	x0, x1, x0
    4aac:	dac00c84 	rev	x4, x4
    4ab0:	91002005 	add	x5, x0, #0x8
    4ab4:	dac01084 	clz	x4, x4
    4ab8:	9a853000 	csel	x0, x0, x5, cc  // cc = lo, ul, last
    4abc:	8b440c00 	add	x0, x0, x4, lsr #3
    4ac0:	d65f03c0 	ret
    4ac4:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    4ac8:	cb080044 	sub	x4, x2, x8
    4acc:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    4ad0:	cb080066 	sub	x6, x3, x8
    4ad4:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    4ad8:	ea250084 	bics	x4, x4, x5
    4adc:	8a2700c5 	bic	x5, x6, x7
    4ae0:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    4ae4:	54fffe01 	b.ne	4aa4 <strlen+0xa4>  // b.any
    4ae8:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    4aec:	cb080044 	sub	x4, x2, x8
    4af0:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    4af4:	cb080066 	sub	x6, x3, x8
    4af8:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    4afc:	ea250084 	bics	x4, x4, x5
    4b00:	8a2700c5 	bic	x5, x6, x7
    4b04:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    4b08:	54fffde0 	b.eq	4ac4 <strlen+0xc4>  // b.none
    4b0c:	17ffffe6 	b	4aa4 <strlen+0xa4>
    4b10:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    4b14:	a9400c22 	ldp	x2, x3, [x1]
    4b18:	d37df004 	lsl	x4, x0, #3
    4b1c:	92800007 	mov	x7, #0xffffffffffffffff    	// #-1
    4b20:	9ac420e4 	lsl	x4, x7, x4
    4b24:	b201c084 	orr	x4, x4, #0x8080808080808080
    4b28:	aa240042 	orn	x2, x2, x4
    4b2c:	aa240065 	orn	x5, x3, x4
    4b30:	f27d001f 	tst	x0, #0x8
    4b34:	9a870042 	csel	x2, x2, x7, eq  // eq = none
    4b38:	9a850063 	csel	x3, x3, x5, eq  // eq = none
    4b3c:	17ffffc8 	b	4a5c <strlen+0x5c>

0000000000004b40 <__sprint_r.part.0>:
    4b40:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    4b44:	910003fd 	mov	x29, sp
    4b48:	b940ac23 	ldr	w3, [x1, #172]
    4b4c:	a90363f7 	stp	x23, x24, [sp, #48]
    4b50:	aa0203f8 	mov	x24, x2
    4b54:	36680563 	tbz	w3, #13, 4c00 <__sprint_r.part.0+0xc0>
    4b58:	a9025bf5 	stp	x21, x22, [sp, #32]
    4b5c:	aa0003f5 	mov	x21, x0
    4b60:	f9400840 	ldr	x0, [x2, #16]
    4b64:	a90153f3 	stp	x19, x20, [sp, #16]
    4b68:	aa0103f4 	mov	x20, x1
    4b6c:	a9046bf9 	stp	x25, x26, [sp, #64]
    4b70:	f940005a 	ldr	x26, [x2]
    4b74:	b40003c0 	cbz	x0, 4bec <__sprint_r.part.0+0xac>
    4b78:	a9406756 	ldp	x22, x25, [x26]
    4b7c:	d342ff39 	lsr	x25, x25, #2
    4b80:	2a1903f7 	mov	w23, w25
    4b84:	7100033f 	cmp	w25, #0x0
    4b88:	540002ad 	b.le	4bdc <__sprint_r.part.0+0x9c>
    4b8c:	d2800013 	mov	x19, #0x0                   	// #0
    4b90:	14000003 	b	4b9c <__sprint_r.part.0+0x5c>
    4b94:	6b1302ff 	cmp	w23, w19
    4b98:	5400020d 	b.le	4bd8 <__sprint_r.part.0+0x98>
    4b9c:	b8737ac1 	ldr	w1, [x22, x19, lsl #2]
    4ba0:	aa1403e2 	mov	x2, x20
    4ba4:	aa1503e0 	mov	x0, x21
    4ba8:	91000673 	add	x19, x19, #0x1
    4bac:	94000a15 	bl	7400 <_fputwc_r>
    4bb0:	3100041f 	cmn	w0, #0x1
    4bb4:	54ffff01 	b.ne	4b94 <__sprint_r.part.0+0x54>  // b.any
    4bb8:	a94153f3 	ldp	x19, x20, [sp, #16]
    4bbc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4bc0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    4bc4:	b9000b1f 	str	wzr, [x24, #8]
    4bc8:	f9000b1f 	str	xzr, [x24, #16]
    4bcc:	a94363f7 	ldp	x23, x24, [sp, #48]
    4bd0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    4bd4:	d65f03c0 	ret
    4bd8:	f9400b00 	ldr	x0, [x24, #16]
    4bdc:	cb39c800 	sub	x0, x0, w25, sxtw #2
    4be0:	f9000b00 	str	x0, [x24, #16]
    4be4:	9100435a 	add	x26, x26, #0x10
    4be8:	b5fffc80 	cbnz	x0, 4b78 <__sprint_r.part.0+0x38>
    4bec:	52800000 	mov	w0, #0x0                   	// #0
    4bf0:	a94153f3 	ldp	x19, x20, [sp, #16]
    4bf4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4bf8:	a9446bf9 	ldp	x25, x26, [sp, #64]
    4bfc:	17fffff2 	b	4bc4 <__sprint_r.part.0+0x84>
    4c00:	94000b2c 	bl	78b0 <__sfvwrite_r>
    4c04:	b9000b1f 	str	wzr, [x24, #8]
    4c08:	f9000b1f 	str	xzr, [x24, #16]
    4c0c:	a94363f7 	ldp	x23, x24, [sp, #48]
    4c10:	a8c57bfd 	ldp	x29, x30, [sp], #80
    4c14:	d65f03c0 	ret
    4c18:	d503201f 	nop
    4c1c:	d503201f 	nop

0000000000004c20 <__sprint_r>:
    4c20:	f9400844 	ldr	x4, [x2, #16]
    4c24:	b4000044 	cbz	x4, 4c2c <__sprint_r+0xc>
    4c28:	17ffffc6 	b	4b40 <__sprint_r.part.0>
    4c2c:	52800000 	mov	w0, #0x0                   	// #0
    4c30:	b900085f 	str	wzr, [x2, #8]
    4c34:	d65f03c0 	ret
    4c38:	d503201f 	nop
    4c3c:	d503201f 	nop

0000000000004c40 <_vfiprintf_r>:
    4c40:	d10843ff 	sub	sp, sp, #0x210
    4c44:	a9007bfd 	stp	x29, x30, [sp]
    4c48:	910003fd 	mov	x29, sp
    4c4c:	a9025bf5 	stp	x21, x22, [sp, #32]
    4c50:	aa0303f5 	mov	x21, x3
    4c54:	f9400063 	ldr	x3, [x3]
    4c58:	f90037e3 	str	x3, [sp, #104]
    4c5c:	f94006a3 	ldr	x3, [x21, #8]
    4c60:	f90043e3 	str	x3, [sp, #128]
    4c64:	b9401aa3 	ldr	w3, [x21, #24]
    4c68:	a90153f3 	stp	x19, x20, [sp, #16]
    4c6c:	aa0003f3 	mov	x19, x0
    4c70:	aa0203f4 	mov	x20, x2
    4c74:	9103e3e0 	add	x0, sp, #0xf8
    4c78:	d2800102 	mov	x2, #0x8                   	// #8
    4c7c:	a9046bf9 	stp	x25, x26, [sp, #64]
    4c80:	aa0103f9 	mov	x25, x1
    4c84:	52800001 	mov	w1, #0x0                   	// #0
    4c88:	b900b3e3 	str	w3, [sp, #176]
    4c8c:	97fffedd 	bl	4800 <memset>
    4c90:	b4000073 	cbz	x19, 4c9c <_vfiprintf_r+0x5c>
    4c94:	b9405260 	ldr	w0, [x19, #80]
    4c98:	34002020 	cbz	w0, 509c <_vfiprintf_r+0x45c>
    4c9c:	79c02321 	ldrsh	w1, [x25, #16]
    4ca0:	12003c20 	and	w0, w1, #0xffff
    4ca4:	376800e1 	tbnz	w1, #13, 4cc0 <_vfiprintf_r+0x80>
    4ca8:	b940af22 	ldr	w2, [x25, #172]
    4cac:	32130021 	orr	w1, w1, #0x2000
    4cb0:	12003c20 	and	w0, w1, #0xffff
    4cb4:	79002321 	strh	w1, [x25, #16]
    4cb8:	12127841 	and	w1, w2, #0xffffdfff
    4cbc:	b900af21 	str	w1, [x25, #172]
    4cc0:	36180520 	tbz	w0, #3, 4d64 <_vfiprintf_r+0x124>
    4cc4:	f9400f21 	ldr	x1, [x25, #24]
    4cc8:	b40004e1 	cbz	x1, 4d64 <_vfiprintf_r+0x124>
    4ccc:	52800341 	mov	w1, #0x1a                  	// #26
    4cd0:	0a010000 	and	w0, w0, w1
    4cd4:	7100281f 	cmp	w0, #0xa
    4cd8:	54000580 	b.eq	4d88 <_vfiprintf_r+0x148>  // b.none
    4cdc:	a90573fb 	stp	x27, x28, [sp, #80]
    4ce0:	910643fc 	add	x28, sp, #0x190
    4ce4:	b0000055 	adrp	x21, d000 <impure_data+0x78>
    4ce8:	aa1c03fb 	mov	x27, x28
    4cec:	911bc2b5 	add	x21, x21, #0x6f0
    4cf0:	90000040 	adrp	x0, c000 <_reclaim_reent+0xc0>
    4cf4:	9123e000 	add	x0, x0, #0x8f8
    4cf8:	a90363f7 	stp	x23, x24, [sp, #48]
    4cfc:	b90067ff 	str	wzr, [sp, #100]
    4d00:	f9003fe0 	str	x0, [sp, #120]
    4d04:	f90047ff 	str	xzr, [sp, #136]
    4d08:	a909ffff 	stp	xzr, xzr, [sp, #152]
    4d0c:	f90057ff 	str	xzr, [sp, #168]
    4d10:	f9008bfc 	str	x28, [sp, #272]
    4d14:	b9011bff 	str	wzr, [sp, #280]
    4d18:	f90093ff 	str	xzr, [sp, #288]
    4d1c:	aa1403f7 	mov	x23, x20
    4d20:	f94076b6 	ldr	x22, [x21, #232]
    4d24:	94000fa7 	bl	8bc0 <__locale_mb_cur_max>
    4d28:	9103e3e4 	add	x4, sp, #0xf8
    4d2c:	93407c03 	sxtw	x3, w0
    4d30:	aa1703e2 	mov	x2, x23
    4d34:	9103d3e1 	add	x1, sp, #0xf4
    4d38:	aa1303e0 	mov	x0, x19
    4d3c:	d63f02c0 	blr	x22
    4d40:	7100001f 	cmp	w0, #0x0
    4d44:	340004a0 	cbz	w0, 4dd8 <_vfiprintf_r+0x198>
    4d48:	540003ab 	b.lt	4dbc <_vfiprintf_r+0x17c>  // b.tstop
    4d4c:	b940f7e1 	ldr	w1, [sp, #244]
    4d50:	7100943f 	cmp	w1, #0x25
    4d54:	54001720 	b.eq	5038 <_vfiprintf_r+0x3f8>  // b.none
    4d58:	93407c00 	sxtw	x0, w0
    4d5c:	8b0002f7 	add	x23, x23, x0
    4d60:	17fffff0 	b	4d20 <_vfiprintf_r+0xe0>
    4d64:	aa1903e1 	mov	x1, x25
    4d68:	aa1303e0 	mov	x0, x19
    4d6c:	9400072d 	bl	6a20 <__swsetup_r>
    4d70:	3500b220 	cbnz	w0, 63b4 <_vfiprintf_r+0x1774>
    4d74:	79402320 	ldrh	w0, [x25, #16]
    4d78:	52800341 	mov	w1, #0x1a                  	// #26
    4d7c:	0a010000 	and	w0, w0, w1
    4d80:	7100281f 	cmp	w0, #0xa
    4d84:	54fffac1 	b.ne	4cdc <_vfiprintf_r+0x9c>  // b.any
    4d88:	79c02720 	ldrsh	w0, [x25, #18]
    4d8c:	37fffa80 	tbnz	w0, #31, 4cdc <_vfiprintf_r+0x9c>
    4d90:	a9401ea6 	ldp	x6, x7, [x21]
    4d94:	aa1403e2 	mov	x2, x20
    4d98:	a94116a4 	ldp	x4, x5, [x21, #16]
    4d9c:	aa1903e1 	mov	x1, x25
    4da0:	aa1303e0 	mov	x0, x19
    4da4:	910303e3 	add	x3, sp, #0xc0
    4da8:	a90c1fe6 	stp	x6, x7, [sp, #192]
    4dac:	a90d17e4 	stp	x4, x5, [sp, #208]
    4db0:	9400068c 	bl	67e0 <__sbprintf>
    4db4:	b90067e0 	str	w0, [sp, #100]
    4db8:	140000b2 	b	5080 <_vfiprintf_r+0x440>
    4dbc:	9103e3e0 	add	x0, sp, #0xf8
    4dc0:	d2800102 	mov	x2, #0x8                   	// #8
    4dc4:	52800001 	mov	w1, #0x0                   	// #0
    4dc8:	97fffe8e 	bl	4800 <memset>
    4dcc:	d2800020 	mov	x0, #0x1                   	// #1
    4dd0:	8b0002f7 	add	x23, x23, x0
    4dd4:	17ffffd3 	b	4d20 <_vfiprintf_r+0xe0>
    4dd8:	2a0003f6 	mov	w22, w0
    4ddc:	cb1402e0 	sub	x0, x23, x20
    4de0:	2a0003f8 	mov	w24, w0
    4de4:	34008d60 	cbz	w0, 5f90 <_vfiprintf_r+0x1350>
    4de8:	f94093e2 	ldr	x2, [sp, #288]
    4dec:	93407f01 	sxtw	x1, w24
    4df0:	b9411be0 	ldr	w0, [sp, #280]
    4df4:	8b020022 	add	x2, x1, x2
    4df8:	a9000774 	stp	x20, x1, [x27]
    4dfc:	11000400 	add	w0, w0, #0x1
    4e00:	b9011be0 	str	w0, [sp, #280]
    4e04:	f90093e2 	str	x2, [sp, #288]
    4e08:	71001c1f 	cmp	w0, #0x7
    4e0c:	5400120d 	b.le	504c <_vfiprintf_r+0x40c>
    4e10:	b4006222 	cbz	x2, 5a54 <_vfiprintf_r+0xe14>
    4e14:	910443e2 	add	x2, sp, #0x110
    4e18:	aa1903e1 	mov	x1, x25
    4e1c:	aa1303e0 	mov	x0, x19
    4e20:	97ffff48 	bl	4b40 <__sprint_r.part.0>
    4e24:	35001260 	cbnz	w0, 5070 <_vfiprintf_r+0x430>
    4e28:	910643fb 	add	x27, sp, #0x190
    4e2c:	b94067e0 	ldr	w0, [sp, #100]
    4e30:	0b180000 	add	w0, w0, w24
    4e34:	b90067e0 	str	w0, [sp, #100]
    4e38:	34008ad6 	cbz	w22, 5f90 <_vfiprintf_r+0x1350>
    4e3c:	394006e0 	ldrb	w0, [x23, #1]
    4e40:	12800004 	mov	w4, #0xffffffff            	// #-1
    4e44:	910006f4 	add	x20, x23, #0x1
    4e48:	2a0403f6 	mov	w22, w4
    4e4c:	5280001c 	mov	w28, #0x0                   	// #0
    4e50:	b90063ff 	str	wzr, [sp, #96]
    4e54:	3903bfff 	strb	wzr, [sp, #239]
    4e58:	91000694 	add	x20, x20, #0x1
    4e5c:	51008001 	sub	w1, w0, #0x20
    4e60:	7101683f 	cmp	w1, #0x5a
    4e64:	54000c49 	b.ls	4fec <_vfiprintf_r+0x3ac>  // b.plast
    4e68:	34008940 	cbz	w0, 5f90 <_vfiprintf_r+0x1350>
    4e6c:	52800036 	mov	w22, #0x1                   	// #1
    4e70:	9104a3fa 	add	x26, sp, #0x128
    4e74:	2a1603f7 	mov	w23, w22
    4e78:	3903bfff 	strb	wzr, [sp, #239]
    4e7c:	3904a3e0 	strb	w0, [sp, #296]
    4e80:	52800004 	mov	w4, #0x0                   	// #0
    4e84:	f9003bff 	str	xzr, [sp, #112]
    4e88:	b9411be1 	ldr	w1, [sp, #280]
    4e8c:	11000ac0 	add	w0, w22, #0x2
    4e90:	721f038a 	ands	w10, w28, #0x2
    4e94:	52801098 	mov	w24, #0x84                  	// #132
    4e98:	11000422 	add	w2, w1, #0x1
    4e9c:	1a961016 	csel	w22, w0, w22, ne  // ne = any
    4ea0:	2a0203e8 	mov	w8, w2
    4ea4:	6a180398 	ands	w24, w28, w24
    4ea8:	f94093e0 	ldr	x0, [sp, #288]
    4eac:	540000a1 	b.ne	4ec0 <_vfiprintf_r+0x280>  // b.any
    4eb0:	b94063e3 	ldr	w3, [sp, #96]
    4eb4:	4b160069 	sub	w9, w3, w22
    4eb8:	7100013f 	cmp	w9, #0x0
    4ebc:	5400496c 	b.gt	57e8 <_vfiprintf_r+0xba8>
    4ec0:	3943bfe2 	ldrb	w2, [sp, #239]
    4ec4:	340001a2 	cbz	w2, 4ef8 <_vfiprintf_r+0x2b8>
    4ec8:	9103bfe1 	add	x1, sp, #0xef
    4ecc:	91000400 	add	x0, x0, #0x1
    4ed0:	f9000361 	str	x1, [x27]
    4ed4:	d2800021 	mov	x1, #0x1                   	// #1
    4ed8:	f9000761 	str	x1, [x27, #8]
    4edc:	b9011be8 	str	w8, [sp, #280]
    4ee0:	f90093e0 	str	x0, [sp, #288]
    4ee4:	71001d1f 	cmp	w8, #0x7
    4ee8:	540044cc 	b.gt	5780 <_vfiprintf_r+0xb40>
    4eec:	2a0803e1 	mov	w1, w8
    4ef0:	9100437b 	add	x27, x27, #0x10
    4ef4:	11000508 	add	w8, w8, #0x1
    4ef8:	340002ca 	cbz	w10, 4f50 <_vfiprintf_r+0x310>
    4efc:	91000800 	add	x0, x0, #0x2
    4f00:	9103c3e2 	add	x2, sp, #0xf0
    4f04:	d2800041 	mov	x1, #0x2                   	// #2
    4f08:	a9000762 	stp	x2, x1, [x27]
    4f0c:	b9011be8 	str	w8, [sp, #280]
    4f10:	f90093e0 	str	x0, [sp, #288]
    4f14:	71001d1f 	cmp	w8, #0x7
    4f18:	5400460d 	b.le	57d8 <_vfiprintf_r+0xb98>
    4f1c:	b4005b20 	cbz	x0, 5a80 <_vfiprintf_r+0xe40>
    4f20:	910443e2 	add	x2, sp, #0x110
    4f24:	aa1903e1 	mov	x1, x25
    4f28:	aa1303e0 	mov	x0, x19
    4f2c:	b90093e4 	str	w4, [sp, #144]
    4f30:	97ffff04 	bl	4b40 <__sprint_r.part.0>
    4f34:	35000940 	cbnz	w0, 505c <_vfiprintf_r+0x41c>
    4f38:	b9411be1 	ldr	w1, [sp, #280]
    4f3c:	910643fb 	add	x27, sp, #0x190
    4f40:	b94093e4 	ldr	w4, [sp, #144]
    4f44:	f94093e0 	ldr	x0, [sp, #288]
    4f48:	11000428 	add	w8, w1, #0x1
    4f4c:	d503201f 	nop
    4f50:	7102031f 	cmp	w24, #0x80
    4f54:	54002f80 	b.eq	5544 <_vfiprintf_r+0x904>  // b.none
    4f58:	4b170098 	sub	w24, w4, w23
    4f5c:	7100031f 	cmp	w24, #0x0
    4f60:	540038cc 	b.gt	5678 <_vfiprintf_r+0xa38>
    4f64:	93407ef7 	sxtw	x23, w23
    4f68:	a9005f7a 	stp	x26, x23, [x27]
    4f6c:	8b0002e0 	add	x0, x23, x0
    4f70:	b9011be8 	str	w8, [sp, #280]
    4f74:	f90093e0 	str	x0, [sp, #288]
    4f78:	71001d1f 	cmp	w8, #0x7
    4f7c:	540029ad 	b.le	54b0 <_vfiprintf_r+0x870>
    4f80:	b4004ba0 	cbz	x0, 58f4 <_vfiprintf_r+0xcb4>
    4f84:	910443e2 	add	x2, sp, #0x110
    4f88:	aa1903e1 	mov	x1, x25
    4f8c:	aa1303e0 	mov	x0, x19
    4f90:	97fffeec 	bl	4b40 <__sprint_r.part.0>
    4f94:	35000640 	cbnz	w0, 505c <_vfiprintf_r+0x41c>
    4f98:	f94093e0 	ldr	x0, [sp, #288]
    4f9c:	910643e5 	add	x5, sp, #0x190
    4fa0:	361000bc 	tbz	w28, #2, 4fb4 <_vfiprintf_r+0x374>
    4fa4:	b94063e1 	ldr	w1, [sp, #96]
    4fa8:	4b160037 	sub	w23, w1, w22
    4fac:	710002ff 	cmp	w23, #0x0
    4fb0:	54004b0c 	b.gt	5910 <_vfiprintf_r+0xcd0>
    4fb4:	b94063e1 	ldr	w1, [sp, #96]
    4fb8:	6b16003f 	cmp	w1, w22
    4fbc:	1a96a023 	csel	w3, w1, w22, ge  // ge = tcont
    4fc0:	b94067e1 	ldr	w1, [sp, #100]
    4fc4:	0b030021 	add	w1, w1, w3
    4fc8:	b90067e1 	str	w1, [sp, #100]
    4fcc:	b5003c60 	cbnz	x0, 5758 <_vfiprintf_r+0xb18>
    4fd0:	f9403be1 	ldr	x1, [sp, #112]
    4fd4:	b9011bff 	str	wzr, [sp, #280]
    4fd8:	910643fb 	add	x27, sp, #0x190
    4fdc:	b4ffea01 	cbz	x1, 4d1c <_vfiprintf_r+0xdc>
    4fe0:	aa1303e0 	mov	x0, x19
    4fe4:	94000977 	bl	75c0 <_free_r>
    4fe8:	17ffff4d 	b	4d1c <_vfiprintf_r+0xdc>
    4fec:	f9403fe2 	ldr	x2, [sp, #120]
    4ff0:	78615841 	ldrh	w1, [x2, w1, uxtw #1]
    4ff4:	10000062 	adr	x2, 5000 <_vfiprintf_r+0x3c0>
    4ff8:	8b21a841 	add	x1, x2, w1, sxth #2
    4ffc:	d61f0020 	br	x1
    5000:	5100c001 	sub	w1, w0, #0x30
    5004:	b90063ff 	str	wzr, [sp, #96]
    5008:	b94063e0 	ldr	w0, [sp, #96]
    500c:	0b000802 	add	w2, w0, w0, lsl #2
    5010:	38401680 	ldrb	w0, [x20], #1
    5014:	0b020421 	add	w1, w1, w2, lsl #1
    5018:	b90063e1 	str	w1, [sp, #96]
    501c:	5100c001 	sub	w1, w0, #0x30
    5020:	7100243f 	cmp	w1, #0x9
    5024:	54ffff29 	b.ls	5008 <_vfiprintf_r+0x3c8>  // b.plast
    5028:	17ffff8d 	b	4e5c <_vfiprintf_r+0x21c>
    502c:	39400280 	ldrb	w0, [x20]
    5030:	321c039c 	orr	w28, w28, #0x10
    5034:	17ffff89 	b	4e58 <_vfiprintf_r+0x218>
    5038:	2a0003f6 	mov	w22, w0
    503c:	cb1402e0 	sub	x0, x23, x20
    5040:	2a0003f8 	mov	w24, w0
    5044:	34ffefc0 	cbz	w0, 4e3c <_vfiprintf_r+0x1fc>
    5048:	17ffff68 	b	4de8 <_vfiprintf_r+0x1a8>
    504c:	9100437b 	add	x27, x27, #0x10
    5050:	17ffff77 	b	4e2c <_vfiprintf_r+0x1ec>
    5054:	aa1903f3 	mov	x19, x25
    5058:	aa1403f9 	mov	x25, x20
    505c:	f9403be0 	ldr	x0, [sp, #112]
    5060:	b4000080 	cbz	x0, 5070 <_vfiprintf_r+0x430>
    5064:	f9403be1 	ldr	x1, [sp, #112]
    5068:	aa1303e0 	mov	x0, x19
    506c:	94000955 	bl	75c0 <_free_r>
    5070:	79c02320 	ldrsh	w0, [x25, #16]
    5074:	a94363f7 	ldp	x23, x24, [sp, #48]
    5078:	a94573fb 	ldp	x27, x28, [sp, #80]
    507c:	373099c0 	tbnz	w0, #6, 63b4 <_vfiprintf_r+0x1774>
    5080:	b94067e0 	ldr	w0, [sp, #100]
    5084:	a9407bfd 	ldp	x29, x30, [sp]
    5088:	a94153f3 	ldp	x19, x20, [sp, #16]
    508c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    5090:	a9446bf9 	ldp	x25, x26, [sp, #64]
    5094:	910843ff 	add	sp, sp, #0x210
    5098:	d65f03c0 	ret
    509c:	aa1303e0 	mov	x0, x19
    50a0:	94000870 	bl	7260 <__sinit>
    50a4:	17fffefe 	b	4c9c <_vfiprintf_r+0x5c>
    50a8:	b940b3e1 	ldr	w1, [sp, #176]
    50ac:	2a1603e4 	mov	w4, w22
    50b0:	37f856c1 	tbnz	w1, #31, 5b88 <_vfiprintf_r+0xf48>
    50b4:	f94037e1 	ldr	x1, [sp, #104]
    50b8:	91003c38 	add	x24, x1, #0xf
    50bc:	927df318 	and	x24, x24, #0xfffffffffffffff8
    50c0:	f94037e1 	ldr	x1, [sp, #104]
    50c4:	3903bfff 	strb	wzr, [sp, #239]
    50c8:	f940003a 	ldr	x26, [x1]
    50cc:	b400753a 	cbz	x26, 5f70 <_vfiprintf_r+0x1330>
    50d0:	71014c1f 	cmp	w0, #0x53
    50d4:	54006740 	b.eq	5dbc <_vfiprintf_r+0x117c>  // b.none
    50d8:	3720673c 	tbnz	w28, #4, 5dbc <_vfiprintf_r+0x117c>
    50dc:	3100049f 	cmn	w4, #0x1
    50e0:	54009520 	b.eq	6384 <_vfiprintf_r+0x1744>  // b.none
    50e4:	93407c82 	sxtw	x2, w4
    50e8:	aa1a03e0 	mov	x0, x26
    50ec:	52800001 	mov	w1, #0x0                   	// #0
    50f0:	b9006be4 	str	w4, [sp, #104]
    50f4:	94001324 	bl	9d84 <memchr>
    50f8:	f9003be0 	str	x0, [sp, #112]
    50fc:	b9406be4 	ldr	w4, [sp, #104]
    5100:	b40090a0 	cbz	x0, 6314 <_vfiprintf_r+0x16d4>
    5104:	cb1a0003 	sub	x3, x0, x26
    5108:	52800004 	mov	w4, #0x0                   	// #0
    510c:	7100007f 	cmp	w3, #0x0
    5110:	2a0303f7 	mov	w23, w3
    5114:	1a9fa076 	csel	w22, w3, wzr, ge  // ge = tcont
    5118:	a906fff8 	stp	x24, xzr, [sp, #104]
    511c:	14000060 	b	529c <_vfiprintf_r+0x65c>
    5120:	71010c1f 	cmp	w0, #0x43
    5124:	54000040 	b.eq	512c <_vfiprintf_r+0x4ec>  // b.none
    5128:	3620569c 	tbz	w28, #4, 5bf8 <_vfiprintf_r+0xfb8>
    512c:	910423e0 	add	x0, sp, #0x108
    5130:	d2800102 	mov	x2, #0x8                   	// #8
    5134:	52800001 	mov	w1, #0x0                   	// #0
    5138:	97fffdb2 	bl	4800 <memset>
    513c:	b940b3e0 	ldr	w0, [sp, #176]
    5140:	37f87a20 	tbnz	w0, #31, 6084 <_vfiprintf_r+0x1444>
    5144:	f94037e0 	ldr	x0, [sp, #104]
    5148:	91002c01 	add	x1, x0, #0xb
    514c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5150:	f90037e1 	str	x1, [sp, #104]
    5154:	b9400002 	ldr	w2, [x0]
    5158:	9104a3fa 	add	x26, sp, #0x128
    515c:	910423e3 	add	x3, sp, #0x108
    5160:	aa1a03e1 	mov	x1, x26
    5164:	aa1303e0 	mov	x0, x19
    5168:	940005d2 	bl	68b0 <_wcrtomb_r>
    516c:	2a0003f7 	mov	w23, w0
    5170:	3100041f 	cmn	w0, #0x1
    5174:	54009260 	b.eq	63c0 <_vfiprintf_r+0x1780>  // b.none
    5178:	7100001f 	cmp	w0, #0x0
    517c:	3903bfff 	strb	wzr, [sp, #239]
    5180:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    5184:	17ffff3f 	b	4e80 <_vfiprintf_r+0x240>
    5188:	b94063e1 	ldr	w1, [sp, #96]
    518c:	f90037e0 	str	x0, [sp, #104]
    5190:	4b0103e1 	neg	w1, w1
    5194:	b90063e1 	str	w1, [sp, #96]
    5198:	39400280 	ldrb	w0, [x20]
    519c:	321e039c 	orr	w28, w28, #0x4
    51a0:	17ffff2e 	b	4e58 <_vfiprintf_r+0x218>
    51a4:	aa1403e2 	mov	x2, x20
    51a8:	38401440 	ldrb	w0, [x2], #1
    51ac:	7100a81f 	cmp	w0, #0x2a
    51b0:	5400a6a0 	b.eq	6684 <_vfiprintf_r+0x1a44>  // b.none
    51b4:	5100c001 	sub	w1, w0, #0x30
    51b8:	aa0203f4 	mov	x20, x2
    51bc:	52800016 	mov	w22, #0x0                   	// #0
    51c0:	7100243f 	cmp	w1, #0x9
    51c4:	54ffe4c8 	b.hi	4e5c <_vfiprintf_r+0x21c>  // b.pmore
    51c8:	38401680 	ldrb	w0, [x20], #1
    51cc:	0b160ac4 	add	w4, w22, w22, lsl #2
    51d0:	0b040436 	add	w22, w1, w4, lsl #1
    51d4:	5100c001 	sub	w1, w0, #0x30
    51d8:	7100243f 	cmp	w1, #0x9
    51dc:	54ffff69 	b.ls	51c8 <_vfiprintf_r+0x588>  // b.plast
    51e0:	17ffff1f 	b	4e5c <_vfiprintf_r+0x21c>
    51e4:	52800560 	mov	w0, #0x2b                  	// #43
    51e8:	3903bfe0 	strb	w0, [sp, #239]
    51ec:	39400280 	ldrb	w0, [x20]
    51f0:	17ffff1a 	b	4e58 <_vfiprintf_r+0x218>
    51f4:	b940b3e0 	ldr	w0, [sp, #176]
    51f8:	37f84da0 	tbnz	w0, #31, 5bac <_vfiprintf_r+0xf6c>
    51fc:	f94037e0 	ldr	x0, [sp, #104]
    5200:	91002c00 	add	x0, x0, #0xb
    5204:	927df000 	and	x0, x0, #0xfffffffffffffff8
    5208:	f94037e1 	ldr	x1, [sp, #104]
    520c:	b9400021 	ldr	w1, [x1]
    5210:	b90063e1 	str	w1, [sp, #96]
    5214:	37fffba1 	tbnz	w1, #31, 5188 <_vfiprintf_r+0x548>
    5218:	f90037e0 	str	x0, [sp, #104]
    521c:	39400280 	ldrb	w0, [x20]
    5220:	17ffff0e 	b	4e58 <_vfiprintf_r+0x218>
    5224:	2a1603e4 	mov	w4, w22
    5228:	321c0396 	orr	w22, w28, #0x10
    522c:	b940b3e0 	ldr	w0, [sp, #176]
    5230:	37280056 	tbnz	w22, #5, 5238 <_vfiprintf_r+0x5f8>
    5234:	36204876 	tbz	w22, #4, 5b40 <_vfiprintf_r+0xf00>
    5238:	37f85a40 	tbnz	w0, #31, 5d80 <_vfiprintf_r+0x1140>
    523c:	f94037e1 	ldr	x1, [sp, #104]
    5240:	91003c20 	add	x0, x1, #0xf
    5244:	927df000 	and	x0, x0, #0xfffffffffffffff8
    5248:	f90037e0 	str	x0, [sp, #104]
    524c:	f9400021 	ldr	x1, [x1]
    5250:	52800020 	mov	w0, #0x1                   	// #1
    5254:	3903bfff 	strb	wzr, [sp, #239]
    5258:	3100049f 	cmn	w4, #0x1
    525c:	54001320 	b.eq	54c0 <_vfiprintf_r+0x880>  // b.none
    5260:	f100003f 	cmp	x1, #0x0
    5264:	12187adc 	and	w28, w22, #0xffffff7f
    5268:	7a400880 	ccmp	w4, #0x0, #0x0, eq  // eq = none
    526c:	54001261 	b.ne	54b8 <_vfiprintf_r+0x878>  // b.any
    5270:	35000660 	cbnz	w0, 533c <_vfiprintf_r+0x6fc>
    5274:	120002d7 	and	w23, w22, #0x1
    5278:	36003f56 	tbz	w22, #0, 5a60 <_vfiprintf_r+0xe20>
    527c:	91062ffa 	add	x26, sp, #0x18b
    5280:	52800600 	mov	w0, #0x30                  	// #48
    5284:	52800004 	mov	w4, #0x0                   	// #0
    5288:	39062fe0 	strb	w0, [sp, #395]
    528c:	d503201f 	nop
    5290:	6b17009f 	cmp	w4, w23
    5294:	f9003bff 	str	xzr, [sp, #112]
    5298:	1a97a096 	csel	w22, w4, w23, ge  // ge = tcont
    529c:	3943bfe0 	ldrb	w0, [sp, #239]
    52a0:	7100001f 	cmp	w0, #0x0
    52a4:	1a9606d6 	cinc	w22, w22, ne  // ne = any
    52a8:	17fffef8 	b	4e88 <_vfiprintf_r+0x248>
    52ac:	39400280 	ldrb	w0, [x20]
    52b0:	3219039c 	orr	w28, w28, #0x80
    52b4:	17fffee9 	b	4e58 <_vfiprintf_r+0x218>
    52b8:	2a1603e4 	mov	w4, w22
    52bc:	321c039c 	orr	w28, w28, #0x10
    52c0:	b940b3e0 	ldr	w0, [sp, #176]
    52c4:	3728005c 	tbnz	w28, #5, 52cc <_vfiprintf_r+0x68c>
    52c8:	362042dc 	tbz	w28, #4, 5b20 <_vfiprintf_r+0xee0>
    52cc:	37f85460 	tbnz	w0, #31, 5d58 <_vfiprintf_r+0x1118>
    52d0:	f94037e0 	ldr	x0, [sp, #104]
    52d4:	91003c01 	add	x1, x0, #0xf
    52d8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    52dc:	f90037e1 	str	x1, [sp, #104]
    52e0:	f9400001 	ldr	x1, [x0]
    52e4:	12157b96 	and	w22, w28, #0xfffffbff
    52e8:	52800000 	mov	w0, #0x0                   	// #0
    52ec:	17ffffda 	b	5254 <_vfiprintf_r+0x614>
    52f0:	2a1603e4 	mov	w4, w22
    52f4:	321c039c 	orr	w28, w28, #0x10
    52f8:	b940b3e0 	ldr	w0, [sp, #176]
    52fc:	3728005c 	tbnz	w28, #5, 5304 <_vfiprintf_r+0x6c4>
    5300:	36203ffc 	tbz	w28, #4, 5afc <_vfiprintf_r+0xebc>
    5304:	37f85160 	tbnz	w0, #31, 5d30 <_vfiprintf_r+0x10f0>
    5308:	f94037e0 	ldr	x0, [sp, #104]
    530c:	91003c01 	add	x1, x0, #0xf
    5310:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5314:	f90037e1 	str	x1, [sp, #104]
    5318:	f9400000 	ldr	x0, [x0]
    531c:	aa0003e1 	mov	x1, x0
    5320:	b7f83b80 	tbnz	x0, #63, 5a90 <_vfiprintf_r+0xe50>
    5324:	3100049f 	cmn	w4, #0x1
    5328:	540036e0 	b.eq	5a04 <_vfiprintf_r+0xdc4>  // b.none
    532c:	7100009f 	cmp	w4, #0x0
    5330:	12187b9c 	and	w28, w28, #0xffffff7f
    5334:	fa400820 	ccmp	x1, #0x0, #0x0, eq  // eq = none
    5338:	54003661 	b.ne	5a04 <_vfiprintf_r+0xdc4>  // b.any
    533c:	910633fa 	add	x26, sp, #0x18c
    5340:	52800004 	mov	w4, #0x0                   	// #0
    5344:	52800017 	mov	w23, #0x0                   	// #0
    5348:	17ffffd2 	b	5290 <_vfiprintf_r+0x650>
    534c:	aa1303e0 	mov	x0, x19
    5350:	94000adc 	bl	7ec0 <_localeconv_r>
    5354:	f9400400 	ldr	x0, [x0, #8]
    5358:	f90053e0 	str	x0, [sp, #160]
    535c:	97fffda9 	bl	4a00 <strlen>
    5360:	aa0003e1 	mov	x1, x0
    5364:	aa0103f7 	mov	x23, x1
    5368:	aa1303e0 	mov	x0, x19
    536c:	f90057e1 	str	x1, [sp, #168]
    5370:	94000ad4 	bl	7ec0 <_localeconv_r>
    5374:	f9400800 	ldr	x0, [x0, #16]
    5378:	f9004fe0 	str	x0, [sp, #152]
    537c:	f10002ff 	cmp	x23, #0x0
    5380:	fa401804 	ccmp	x0, #0x0, #0x4, ne  // ne = any
    5384:	54003b80 	b.eq	5af4 <_vfiprintf_r+0xeb4>  // b.none
    5388:	39400000 	ldrb	w0, [x0]
    538c:	32160381 	orr	w1, w28, #0x400
    5390:	7100001f 	cmp	w0, #0x0
    5394:	39400280 	ldrb	w0, [x20]
    5398:	1a9c103c 	csel	w28, w1, w28, ne  // ne = any
    539c:	17fffeaf 	b	4e58 <_vfiprintf_r+0x218>
    53a0:	39400280 	ldrb	w0, [x20]
    53a4:	3200039c 	orr	w28, w28, #0x1
    53a8:	17fffeac 	b	4e58 <_vfiprintf_r+0x218>
    53ac:	3943bfe1 	ldrb	w1, [sp, #239]
    53b0:	39400280 	ldrb	w0, [x20]
    53b4:	35ffd521 	cbnz	w1, 4e58 <_vfiprintf_r+0x218>
    53b8:	52800401 	mov	w1, #0x20                  	// #32
    53bc:	3903bfe1 	strb	w1, [sp, #239]
    53c0:	17fffea6 	b	4e58 <_vfiprintf_r+0x218>
    53c4:	b940b3e0 	ldr	w0, [sp, #176]
    53c8:	372801bc 	tbnz	w28, #5, 53fc <_vfiprintf_r+0x7bc>
    53cc:	3720019c 	tbnz	w28, #4, 53fc <_vfiprintf_r+0x7bc>
    53d0:	37306cfc 	tbnz	w28, #6, 616c <_vfiprintf_r+0x152c>
    53d4:	364889bc 	tbz	w28, #9, 6508 <_vfiprintf_r+0x18c8>
    53d8:	37f89040 	tbnz	w0, #31, 65e0 <_vfiprintf_r+0x19a0>
    53dc:	f94037e0 	ldr	x0, [sp, #104]
    53e0:	91003c01 	add	x1, x0, #0xf
    53e4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    53e8:	f90037e1 	str	x1, [sp, #104]
    53ec:	f9400000 	ldr	x0, [x0]
    53f0:	394193e1 	ldrb	w1, [sp, #100]
    53f4:	39000001 	strb	w1, [x0]
    53f8:	17fffe49 	b	4d1c <_vfiprintf_r+0xdc>
    53fc:	37f84180 	tbnz	w0, #31, 5c2c <_vfiprintf_r+0xfec>
    5400:	f94037e0 	ldr	x0, [sp, #104]
    5404:	91003c01 	add	x1, x0, #0xf
    5408:	927df021 	and	x1, x1, #0xfffffffffffffff8
    540c:	f90037e1 	str	x1, [sp, #104]
    5410:	f9400000 	ldr	x0, [x0]
    5414:	b98067e1 	ldrsw	x1, [sp, #100]
    5418:	f9000001 	str	x1, [x0]
    541c:	17fffe40 	b	4d1c <_vfiprintf_r+0xdc>
    5420:	39400280 	ldrb	w0, [x20]
    5424:	7101b01f 	cmp	w0, #0x6c
    5428:	54005960 	b.eq	5f54 <_vfiprintf_r+0x1314>  // b.none
    542c:	321c039c 	orr	w28, w28, #0x10
    5430:	17fffe8a 	b	4e58 <_vfiprintf_r+0x218>
    5434:	39400280 	ldrb	w0, [x20]
    5438:	7101a01f 	cmp	w0, #0x68
    543c:	54005840 	b.eq	5f44 <_vfiprintf_r+0x1304>  // b.none
    5440:	321a039c 	orr	w28, w28, #0x40
    5444:	17fffe85 	b	4e58 <_vfiprintf_r+0x218>
    5448:	39400280 	ldrb	w0, [x20]
    544c:	321b039c 	orr	w28, w28, #0x20
    5450:	17fffe82 	b	4e58 <_vfiprintf_r+0x218>
    5454:	b940b3e0 	ldr	w0, [sp, #176]
    5458:	2a1603e4 	mov	w4, w22
    545c:	37f83ba0 	tbnz	w0, #31, 5bd0 <_vfiprintf_r+0xf90>
    5460:	f94037e2 	ldr	x2, [sp, #104]
    5464:	91003c40 	add	x0, x2, #0xf
    5468:	927df000 	and	x0, x0, #0xfffffffffffffff8
    546c:	f90037e0 	str	x0, [sp, #104]
    5470:	528f0600 	mov	w0, #0x7830                	// #30768
    5474:	f0000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    5478:	91230021 	add	x1, x1, #0x8c0
    547c:	321f0396 	orr	w22, w28, #0x2
    5480:	f90047e1 	str	x1, [sp, #136]
    5484:	7901e3e0 	strh	w0, [sp, #240]
    5488:	52800040 	mov	w0, #0x2                   	// #2
    548c:	f9400041 	ldr	x1, [x2]
    5490:	17ffff71 	b	5254 <_vfiprintf_r+0x614>
    5494:	910643fb 	add	x27, sp, #0x190
    5498:	93407ee0 	sxtw	x0, w23
    549c:	52800021 	mov	w1, #0x1                   	// #1
    54a0:	b9011be1 	str	w1, [sp, #280]
    54a4:	f90093e0 	str	x0, [sp, #288]
    54a8:	a91903fa 	stp	x26, x0, [sp, #400]
    54ac:	d503201f 	nop
    54b0:	91004365 	add	x5, x27, #0x10
    54b4:	17fffebb 	b	4fa0 <_vfiprintf_r+0x360>
    54b8:	2a1c03f6 	mov	w22, w28
    54bc:	d503201f 	nop
    54c0:	7100041f 	cmp	w0, #0x1
    54c4:	54002a20 	b.eq	5a08 <_vfiprintf_r+0xdc8>  // b.none
    54c8:	910633f7 	add	x23, sp, #0x18c
    54cc:	aa1703fa 	mov	x26, x23
    54d0:	7100081f 	cmp	w0, #0x2
    54d4:	54000161 	b.ne	5500 <_vfiprintf_r+0x8c0>  // b.any
    54d8:	f94047e2 	ldr	x2, [sp, #136]
    54dc:	d503201f 	nop
    54e0:	92400c20 	and	x0, x1, #0xf
    54e4:	d344fc21 	lsr	x1, x1, #4
    54e8:	38606840 	ldrb	w0, [x2, x0]
    54ec:	381fff40 	strb	w0, [x26, #-1]!
    54f0:	b5ffff81 	cbnz	x1, 54e0 <_vfiprintf_r+0x8a0>
    54f4:	4b1a02f7 	sub	w23, w23, w26
    54f8:	2a1603fc 	mov	w28, w22
    54fc:	17ffff65 	b	5290 <_vfiprintf_r+0x650>
    5500:	12000820 	and	w0, w1, #0x7
    5504:	aa1a03e2 	mov	x2, x26
    5508:	1100c000 	add	w0, w0, #0x30
    550c:	381fff40 	strb	w0, [x26, #-1]!
    5510:	d343fc21 	lsr	x1, x1, #3
    5514:	b5ffff61 	cbnz	x1, 5500 <_vfiprintf_r+0x8c0>
    5518:	7100c01f 	cmp	w0, #0x30
    551c:	1a9f07e0 	cset	w0, ne  // ne = any
    5520:	6a0002df 	tst	w22, w0
    5524:	54fffe80 	b.eq	54f4 <_vfiprintf_r+0x8b4>  // b.none
    5528:	d1000842 	sub	x2, x2, #0x2
    552c:	52800600 	mov	w0, #0x30                  	// #48
    5530:	2a1603fc 	mov	w28, w22
    5534:	4b0202f7 	sub	w23, w23, w2
    5538:	381ff340 	sturb	w0, [x26, #-1]
    553c:	aa0203fa 	mov	x26, x2
    5540:	17ffff54 	b	5290 <_vfiprintf_r+0x650>
    5544:	b94063e2 	ldr	w2, [sp, #96]
    5548:	4b160058 	sub	w24, w2, w22
    554c:	7100031f 	cmp	w24, #0x0
    5550:	54ffd04d 	b.le	4f58 <_vfiprintf_r+0x318>
    5554:	7100431f 	cmp	w24, #0x10
    5558:	540073cd 	b.le	63d0 <_vfiprintf_r+0x1790>
    555c:	2a0103e3 	mov	w3, w1
    5560:	f0000029 	adrp	x9, c000 <_reclaim_reent+0xc0>
    5564:	aa1403e1 	mov	x1, x20
    5568:	91270129 	add	x9, x9, #0x9c0
    556c:	aa1303f4 	mov	x20, x19
    5570:	d2800208 	mov	x8, #0x10                  	// #16
    5574:	2a1803f3 	mov	w19, w24
    5578:	aa0103f8 	mov	x24, x1
    557c:	b90093e4 	str	w4, [sp, #144]
    5580:	b900b7f6 	str	w22, [sp, #180]
    5584:	aa1903f6 	mov	x22, x25
    5588:	aa0903f9 	mov	x25, x9
    558c:	14000007 	b	55a8 <_vfiprintf_r+0x968>
    5590:	1100086a 	add	w10, w3, #0x2
    5594:	9100437b 	add	x27, x27, #0x10
    5598:	2a0203e3 	mov	w3, w2
    559c:	51004273 	sub	w19, w19, #0x10
    55a0:	7100427f 	cmp	w19, #0x10
    55a4:	540002cd 	b.le	55fc <_vfiprintf_r+0x9bc>
    55a8:	91004000 	add	x0, x0, #0x10
    55ac:	11000462 	add	w2, w3, #0x1
    55b0:	a9002379 	stp	x25, x8, [x27]
    55b4:	b9011be2 	str	w2, [sp, #280]
    55b8:	f90093e0 	str	x0, [sp, #288]
    55bc:	71001c5f 	cmp	w2, #0x7
    55c0:	54fffe8d 	b.le	5590 <_vfiprintf_r+0x950>
    55c4:	b4000d60 	cbz	x0, 5770 <_vfiprintf_r+0xb30>
    55c8:	910443e2 	add	x2, sp, #0x110
    55cc:	aa1603e1 	mov	x1, x22
    55d0:	aa1403e0 	mov	x0, x20
    55d4:	97fffd5b 	bl	4b40 <__sprint_r.part.0>
    55d8:	35004c60 	cbnz	w0, 5f64 <_vfiprintf_r+0x1324>
    55dc:	b9411be3 	ldr	w3, [sp, #280]
    55e0:	51004273 	sub	w19, w19, #0x10
    55e4:	910643fb 	add	x27, sp, #0x190
    55e8:	d2800208 	mov	x8, #0x10                  	// #16
    55ec:	1100046a 	add	w10, w3, #0x1
    55f0:	f94093e0 	ldr	x0, [sp, #288]
    55f4:	7100427f 	cmp	w19, #0x10
    55f8:	54fffd8c 	b.gt	55a8 <_vfiprintf_r+0x968>
    55fc:	aa1803e1 	mov	x1, x24
    5600:	aa1903e9 	mov	x9, x25
    5604:	b94093e4 	ldr	w4, [sp, #144]
    5608:	aa1603f9 	mov	x25, x22
    560c:	b940b7f6 	ldr	w22, [sp, #180]
    5610:	2a1303f8 	mov	w24, w19
    5614:	aa1403f3 	mov	x19, x20
    5618:	aa0103f4 	mov	x20, x1
    561c:	93407f01 	sxtw	x1, w24
    5620:	a9000769 	stp	x9, x1, [x27]
    5624:	8b010000 	add	x0, x0, x1
    5628:	b9011bea 	str	w10, [sp, #280]
    562c:	f90093e0 	str	x0, [sp, #288]
    5630:	71001d5f 	cmp	w10, #0x7
    5634:	5400258d 	b.le	5ae4 <_vfiprintf_r+0xea4>
    5638:	b4005920 	cbz	x0, 615c <_vfiprintf_r+0x151c>
    563c:	910443e2 	add	x2, sp, #0x110
    5640:	aa1903e1 	mov	x1, x25
    5644:	aa1303e0 	mov	x0, x19
    5648:	b90093e4 	str	w4, [sp, #144]
    564c:	97fffd3d 	bl	4b40 <__sprint_r.part.0>
    5650:	35ffd060 	cbnz	w0, 505c <_vfiprintf_r+0x41c>
    5654:	b94093e4 	ldr	w4, [sp, #144]
    5658:	910643fb 	add	x27, sp, #0x190
    565c:	b9411be1 	ldr	w1, [sp, #280]
    5660:	4b170098 	sub	w24, w4, w23
    5664:	11000428 	add	w8, w1, #0x1
    5668:	f94093e0 	ldr	x0, [sp, #288]
    566c:	7100031f 	cmp	w24, #0x0
    5670:	54ffc7ad 	b.le	4f64 <_vfiprintf_r+0x324>
    5674:	d503201f 	nop
    5678:	f0000029 	adrp	x9, c000 <_reclaim_reent+0xc0>
    567c:	91270129 	add	x9, x9, #0x9c0
    5680:	7100431f 	cmp	w24, #0x10
    5684:	540004ed 	b.le	5720 <_vfiprintf_r+0xae0>
    5688:	2a0103e3 	mov	w3, w1
    568c:	d2800204 	mov	x4, #0x10                  	// #16
    5690:	f9004bf4 	str	x20, [sp, #144]
    5694:	aa1903f4 	mov	x20, x25
    5698:	aa1303f9 	mov	x25, x19
    569c:	aa0903f3 	mov	x19, x9
    56a0:	14000007 	b	56bc <_vfiprintf_r+0xa7c>
    56a4:	11000868 	add	w8, w3, #0x2
    56a8:	9100437b 	add	x27, x27, #0x10
    56ac:	2a0203e3 	mov	w3, w2
    56b0:	51004318 	sub	w24, w24, #0x10
    56b4:	7100431f 	cmp	w24, #0x10
    56b8:	540002cd 	b.le	5710 <_vfiprintf_r+0xad0>
    56bc:	91004000 	add	x0, x0, #0x10
    56c0:	11000462 	add	w2, w3, #0x1
    56c4:	a9001373 	stp	x19, x4, [x27]
    56c8:	b9011be2 	str	w2, [sp, #280]
    56cc:	f90093e0 	str	x0, [sp, #288]
    56d0:	71001c5f 	cmp	w2, #0x7
    56d4:	54fffe8d 	b.le	56a4 <_vfiprintf_r+0xa64>
    56d8:	b4000380 	cbz	x0, 5748 <_vfiprintf_r+0xb08>
    56dc:	910443e2 	add	x2, sp, #0x110
    56e0:	aa1403e1 	mov	x1, x20
    56e4:	aa1903e0 	mov	x0, x25
    56e8:	97fffd16 	bl	4b40 <__sprint_r.part.0>
    56ec:	35ffcb40 	cbnz	w0, 5054 <_vfiprintf_r+0x414>
    56f0:	b9411be3 	ldr	w3, [sp, #280]
    56f4:	51004318 	sub	w24, w24, #0x10
    56f8:	910643fb 	add	x27, sp, #0x190
    56fc:	d2800204 	mov	x4, #0x10                  	// #16
    5700:	11000468 	add	w8, w3, #0x1
    5704:	f94093e0 	ldr	x0, [sp, #288]
    5708:	7100431f 	cmp	w24, #0x10
    570c:	54fffd8c 	b.gt	56bc <_vfiprintf_r+0xa7c>
    5710:	aa1303e9 	mov	x9, x19
    5714:	aa1903f3 	mov	x19, x25
    5718:	aa1403f9 	mov	x25, x20
    571c:	f9404bf4 	ldr	x20, [sp, #144]
    5720:	93407f18 	sxtw	x24, w24
    5724:	8b180000 	add	x0, x0, x24
    5728:	a9006369 	stp	x9, x24, [x27]
    572c:	b9011be8 	str	w8, [sp, #280]
    5730:	f90093e0 	str	x0, [sp, #288]
    5734:	71001d1f 	cmp	w8, #0x7
    5738:	5400178c 	b.gt	5a28 <_vfiprintf_r+0xde8>
    573c:	9100437b 	add	x27, x27, #0x10
    5740:	11000508 	add	w8, w8, #0x1
    5744:	17fffe08 	b	4f64 <_vfiprintf_r+0x324>
    5748:	910643fb 	add	x27, sp, #0x190
    574c:	52800028 	mov	w8, #0x1                   	// #1
    5750:	52800003 	mov	w3, #0x0                   	// #0
    5754:	17ffffd7 	b	56b0 <_vfiprintf_r+0xa70>
    5758:	910443e2 	add	x2, sp, #0x110
    575c:	aa1903e1 	mov	x1, x25
    5760:	aa1303e0 	mov	x0, x19
    5764:	97fffcf7 	bl	4b40 <__sprint_r.part.0>
    5768:	34ffc340 	cbz	w0, 4fd0 <_vfiprintf_r+0x390>
    576c:	17fffe3c 	b	505c <_vfiprintf_r+0x41c>
    5770:	910643fb 	add	x27, sp, #0x190
    5774:	5280002a 	mov	w10, #0x1                   	// #1
    5778:	52800003 	mov	w3, #0x0                   	// #0
    577c:	17ffff88 	b	559c <_vfiprintf_r+0x95c>
    5780:	b4001760 	cbz	x0, 5a6c <_vfiprintf_r+0xe2c>
    5784:	910443e2 	add	x2, sp, #0x110
    5788:	aa1903e1 	mov	x1, x25
    578c:	aa1303e0 	mov	x0, x19
    5790:	b90093ea 	str	w10, [sp, #144]
    5794:	b900b7e4 	str	w4, [sp, #180]
    5798:	97fffcea 	bl	4b40 <__sprint_r.part.0>
    579c:	35ffc600 	cbnz	w0, 505c <_vfiprintf_r+0x41c>
    57a0:	b9411be1 	ldr	w1, [sp, #280]
    57a4:	910643fb 	add	x27, sp, #0x190
    57a8:	b94093ea 	ldr	w10, [sp, #144]
    57ac:	b940b7e4 	ldr	w4, [sp, #180]
    57b0:	11000428 	add	w8, w1, #0x1
    57b4:	f94093e0 	ldr	x0, [sp, #288]
    57b8:	17fffdd0 	b	4ef8 <_vfiprintf_r+0x2b8>
    57bc:	9103c3e0 	add	x0, sp, #0xf0
    57c0:	d2800041 	mov	x1, #0x2                   	// #2
    57c4:	910643fb 	add	x27, sp, #0x190
    57c8:	a91907e0 	stp	x0, x1, [sp, #400]
    57cc:	aa0103e0 	mov	x0, x1
    57d0:	52800028 	mov	w8, #0x1                   	// #1
    57d4:	d503201f 	nop
    57d8:	2a0803e1 	mov	w1, w8
    57dc:	9100437b 	add	x27, x27, #0x10
    57e0:	11000428 	add	w8, w1, #0x1
    57e4:	17fffddb 	b	4f50 <_vfiprintf_r+0x310>
    57e8:	7100413f 	cmp	w9, #0x10
    57ec:	54005c4d 	b.le	6374 <_vfiprintf_r+0x1734>
    57f0:	f0000028 	adrp	x8, c000 <_reclaim_reent+0xc0>
    57f4:	9126c108 	add	x8, x8, #0x9b0
    57f8:	aa1b03e3 	mov	x3, x27
    57fc:	d280020c 	mov	x12, #0x10                  	// #16
    5800:	2a1703fb 	mov	w27, w23
    5804:	2a1603f7 	mov	w23, w22
    5808:	aa0803f6 	mov	x22, x8
    580c:	b90093ea 	str	w10, [sp, #144]
    5810:	b900b7e4 	str	w4, [sp, #180]
    5814:	2a0103e4 	mov	w4, w1
    5818:	f9005ff4 	str	x20, [sp, #184]
    581c:	aa1903f4 	mov	x20, x25
    5820:	2a0903f9 	mov	w25, w9
    5824:	14000008 	b	5844 <_vfiprintf_r+0xc04>
    5828:	1100088b 	add	w11, w4, #0x2
    582c:	91004063 	add	x3, x3, #0x10
    5830:	2a0203e4 	mov	w4, w2
    5834:	51004339 	sub	w25, w25, #0x10
    5838:	7100433f 	cmp	w25, #0x10
    583c:	540002cd 	b.le	5894 <_vfiprintf_r+0xc54>
    5840:	11000482 	add	w2, w4, #0x1
    5844:	91004000 	add	x0, x0, #0x10
    5848:	a9003076 	stp	x22, x12, [x3]
    584c:	b9011be2 	str	w2, [sp, #280]
    5850:	f90093e0 	str	x0, [sp, #288]
    5854:	71001c5f 	cmp	w2, #0x7
    5858:	54fffe8d 	b.le	5828 <_vfiprintf_r+0xbe8>
    585c:	b4000440 	cbz	x0, 58e4 <_vfiprintf_r+0xca4>
    5860:	910443e2 	add	x2, sp, #0x110
    5864:	aa1403e1 	mov	x1, x20
    5868:	aa1303e0 	mov	x0, x19
    586c:	97fffcb5 	bl	4b40 <__sprint_r.part.0>
    5870:	35ffbf40 	cbnz	w0, 5058 <_vfiprintf_r+0x418>
    5874:	b9411be4 	ldr	w4, [sp, #280]
    5878:	51004339 	sub	w25, w25, #0x10
    587c:	910643e3 	add	x3, sp, #0x190
    5880:	d280020c 	mov	x12, #0x10                  	// #16
    5884:	1100048b 	add	w11, w4, #0x1
    5888:	f94093e0 	ldr	x0, [sp, #288]
    588c:	7100433f 	cmp	w25, #0x10
    5890:	54fffd8c 	b.gt	5840 <_vfiprintf_r+0xc00>
    5894:	2a1903e9 	mov	w9, w25
    5898:	b94093ea 	ldr	w10, [sp, #144]
    589c:	aa1403f9 	mov	x25, x20
    58a0:	b940b7e4 	ldr	w4, [sp, #180]
    58a4:	f9405ff4 	ldr	x20, [sp, #184]
    58a8:	aa1603e8 	mov	x8, x22
    58ac:	2a1703f6 	mov	w22, w23
    58b0:	2a1b03f7 	mov	w23, w27
    58b4:	aa0303fb 	mov	x27, x3
    58b8:	93407d21 	sxtw	x1, w9
    58bc:	a9000768 	stp	x8, x1, [x27]
    58c0:	8b010000 	add	x0, x0, x1
    58c4:	b9011beb 	str	w11, [sp, #280]
    58c8:	f90093e0 	str	x0, [sp, #288]
    58cc:	71001d7f 	cmp	w11, #0x7
    58d0:	54000ecc 	b.gt	5aa8 <_vfiprintf_r+0xe68>
    58d4:	9100437b 	add	x27, x27, #0x10
    58d8:	11000568 	add	w8, w11, #0x1
    58dc:	2a0b03e1 	mov	w1, w11
    58e0:	17fffd78 	b	4ec0 <_vfiprintf_r+0x280>
    58e4:	910643e3 	add	x3, sp, #0x190
    58e8:	52800004 	mov	w4, #0x0                   	// #0
    58ec:	5280002b 	mov	w11, #0x1                   	// #1
    58f0:	17ffffd1 	b	5834 <_vfiprintf_r+0xbf4>
    58f4:	b9011bff 	str	wzr, [sp, #280]
    58f8:	3610079c 	tbz	w28, #2, 59e8 <_vfiprintf_r+0xda8>
    58fc:	b94063e1 	ldr	w1, [sp, #96]
    5900:	4b160037 	sub	w23, w1, w22
    5904:	710002ff 	cmp	w23, #0x0
    5908:	5400070d 	b.le	59e8 <_vfiprintf_r+0xda8>
    590c:	910643e5 	add	x5, sp, #0x190
    5910:	b9411be2 	ldr	w2, [sp, #280]
    5914:	710042ff 	cmp	w23, #0x10
    5918:	5400546d 	b.le	63a4 <_vfiprintf_r+0x1764>
    591c:	f0000028 	adrp	x8, c000 <_reclaim_reent+0xc0>
    5920:	9126c108 	add	x8, x8, #0x9b0
    5924:	aa0803fa 	mov	x26, x8
    5928:	d2800218 	mov	x24, #0x10                  	// #16
    592c:	14000007 	b	5948 <_vfiprintf_r+0xd08>
    5930:	11000844 	add	w4, w2, #0x2
    5934:	910040a5 	add	x5, x5, #0x10
    5938:	2a0303e2 	mov	w2, w3
    593c:	510042f7 	sub	w23, w23, #0x10
    5940:	710042ff 	cmp	w23, #0x10
    5944:	540002ad 	b.le	5998 <_vfiprintf_r+0xd58>
    5948:	91004000 	add	x0, x0, #0x10
    594c:	11000443 	add	w3, w2, #0x1
    5950:	a90060ba 	stp	x26, x24, [x5]
    5954:	b9011be3 	str	w3, [sp, #280]
    5958:	f90093e0 	str	x0, [sp, #288]
    595c:	71001c7f 	cmp	w3, #0x7
    5960:	54fffe8d 	b.le	5930 <_vfiprintf_r+0xcf0>
    5964:	b40003a0 	cbz	x0, 59d8 <_vfiprintf_r+0xd98>
    5968:	910443e2 	add	x2, sp, #0x110
    596c:	aa1903e1 	mov	x1, x25
    5970:	aa1303e0 	mov	x0, x19
    5974:	97fffc73 	bl	4b40 <__sprint_r.part.0>
    5978:	35ffb720 	cbnz	w0, 505c <_vfiprintf_r+0x41c>
    597c:	b9411be2 	ldr	w2, [sp, #280]
    5980:	510042f7 	sub	w23, w23, #0x10
    5984:	910643e5 	add	x5, sp, #0x190
    5988:	11000444 	add	w4, w2, #0x1
    598c:	f94093e0 	ldr	x0, [sp, #288]
    5990:	710042ff 	cmp	w23, #0x10
    5994:	54fffdac 	b.gt	5948 <_vfiprintf_r+0xd08>
    5998:	aa1a03e8 	mov	x8, x26
    599c:	93407ef7 	sxtw	x23, w23
    59a0:	a9005ca8 	stp	x8, x23, [x5]
    59a4:	8b170000 	add	x0, x0, x23
    59a8:	b9011be4 	str	w4, [sp, #280]
    59ac:	f90093e0 	str	x0, [sp, #288]
    59b0:	71001c9f 	cmp	w4, #0x7
    59b4:	54ffb00d 	b.le	4fb4 <_vfiprintf_r+0x374>
    59b8:	b4000180 	cbz	x0, 59e8 <_vfiprintf_r+0xda8>
    59bc:	910443e2 	add	x2, sp, #0x110
    59c0:	aa1903e1 	mov	x1, x25
    59c4:	aa1303e0 	mov	x0, x19
    59c8:	97fffc5e 	bl	4b40 <__sprint_r.part.0>
    59cc:	35ffb480 	cbnz	w0, 505c <_vfiprintf_r+0x41c>
    59d0:	f94093e0 	ldr	x0, [sp, #288]
    59d4:	17fffd78 	b	4fb4 <_vfiprintf_r+0x374>
    59d8:	910643e5 	add	x5, sp, #0x190
    59dc:	52800024 	mov	w4, #0x1                   	// #1
    59e0:	52800002 	mov	w2, #0x0                   	// #0
    59e4:	17ffffd6 	b	593c <_vfiprintf_r+0xcfc>
    59e8:	b94063e0 	ldr	w0, [sp, #96]
    59ec:	6b16001f 	cmp	w0, w22
    59f0:	1a96a003 	csel	w3, w0, w22, ge  // ge = tcont
    59f4:	b94067e0 	ldr	w0, [sp, #100]
    59f8:	0b030000 	add	w0, w0, w3
    59fc:	b90067e0 	str	w0, [sp, #100]
    5a00:	17fffd74 	b	4fd0 <_vfiprintf_r+0x390>
    5a04:	2a1c03f6 	mov	w22, w28
    5a08:	f100243f 	cmp	x1, #0x9
    5a0c:	540024c8 	b.hi	5ea4 <_vfiprintf_r+0x1264>  // b.pmore
    5a10:	1100c021 	add	w1, w1, #0x30
    5a14:	2a1603fc 	mov	w28, w22
    5a18:	91062ffa 	add	x26, sp, #0x18b
    5a1c:	52800037 	mov	w23, #0x1                   	// #1
    5a20:	39062fe1 	strb	w1, [sp, #395]
    5a24:	17fffe1b 	b	5290 <_vfiprintf_r+0x650>
    5a28:	b4ffd360 	cbz	x0, 5494 <_vfiprintf_r+0x854>
    5a2c:	910443e2 	add	x2, sp, #0x110
    5a30:	aa1903e1 	mov	x1, x25
    5a34:	aa1303e0 	mov	x0, x19
    5a38:	97fffc42 	bl	4b40 <__sprint_r.part.0>
    5a3c:	35ffb100 	cbnz	w0, 505c <_vfiprintf_r+0x41c>
    5a40:	b9411be8 	ldr	w8, [sp, #280]
    5a44:	910643fb 	add	x27, sp, #0x190
    5a48:	f94093e0 	ldr	x0, [sp, #288]
    5a4c:	11000508 	add	w8, w8, #0x1
    5a50:	17fffd45 	b	4f64 <_vfiprintf_r+0x324>
    5a54:	910643fb 	add	x27, sp, #0x190
    5a58:	b9011bff 	str	wzr, [sp, #280]
    5a5c:	17fffcf4 	b	4e2c <_vfiprintf_r+0x1ec>
    5a60:	910633fa 	add	x26, sp, #0x18c
    5a64:	52800004 	mov	w4, #0x0                   	// #0
    5a68:	17fffe0a 	b	5290 <_vfiprintf_r+0x650>
    5a6c:	350007ca 	cbnz	w10, 5b64 <_vfiprintf_r+0xf24>
    5a70:	910643fb 	add	x27, sp, #0x190
    5a74:	52800001 	mov	w1, #0x0                   	// #0
    5a78:	52800028 	mov	w8, #0x1                   	// #1
    5a7c:	17fffd35 	b	4f50 <_vfiprintf_r+0x310>
    5a80:	910643fb 	add	x27, sp, #0x190
    5a84:	52800028 	mov	w8, #0x1                   	// #1
    5a88:	52800001 	mov	w1, #0x0                   	// #0
    5a8c:	17fffd31 	b	4f50 <_vfiprintf_r+0x310>
    5a90:	528005a0 	mov	w0, #0x2d                  	// #45
    5a94:	cb0103e1 	neg	x1, x1
    5a98:	2a1c03f6 	mov	w22, w28
    5a9c:	3903bfe0 	strb	w0, [sp, #239]
    5aa0:	52800020 	mov	w0, #0x1                   	// #1
    5aa4:	17fffded 	b	5258 <_vfiprintf_r+0x618>
    5aa8:	b4000d60 	cbz	x0, 5c54 <_vfiprintf_r+0x1014>
    5aac:	910443e2 	add	x2, sp, #0x110
    5ab0:	aa1903e1 	mov	x1, x25
    5ab4:	aa1303e0 	mov	x0, x19
    5ab8:	b90093ea 	str	w10, [sp, #144]
    5abc:	b900b7e4 	str	w4, [sp, #180]
    5ac0:	97fffc20 	bl	4b40 <__sprint_r.part.0>
    5ac4:	35ffacc0 	cbnz	w0, 505c <_vfiprintf_r+0x41c>
    5ac8:	b9411be1 	ldr	w1, [sp, #280]
    5acc:	910643fb 	add	x27, sp, #0x190
    5ad0:	b94093ea 	ldr	w10, [sp, #144]
    5ad4:	b940b7e4 	ldr	w4, [sp, #180]
    5ad8:	11000428 	add	w8, w1, #0x1
    5adc:	f94093e0 	ldr	x0, [sp, #288]
    5ae0:	17fffcf8 	b	4ec0 <_vfiprintf_r+0x280>
    5ae4:	9100437b 	add	x27, x27, #0x10
    5ae8:	11000548 	add	w8, w10, #0x1
    5aec:	2a0a03e1 	mov	w1, w10
    5af0:	17fffd1a 	b	4f58 <_vfiprintf_r+0x318>
    5af4:	39400280 	ldrb	w0, [x20]
    5af8:	17fffcd8 	b	4e58 <_vfiprintf_r+0x218>
    5afc:	36302a9c 	tbz	w28, #6, 604c <_vfiprintf_r+0x140c>
    5b00:	37f83d20 	tbnz	w0, #31, 62a4 <_vfiprintf_r+0x1664>
    5b04:	f94037e0 	ldr	x0, [sp, #104]
    5b08:	91002c01 	add	x1, x0, #0xb
    5b0c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5b10:	f90037e1 	str	x1, [sp, #104]
    5b14:	79800001 	ldrsh	x1, [x0]
    5b18:	aa0103e0 	mov	x0, x1
    5b1c:	17fffe01 	b	5320 <_vfiprintf_r+0x6e0>
    5b20:	3630247c 	tbz	w28, #6, 5fac <_vfiprintf_r+0x136c>
    5b24:	37f83960 	tbnz	w0, #31, 6250 <_vfiprintf_r+0x1610>
    5b28:	f94037e0 	ldr	x0, [sp, #104]
    5b2c:	91002c01 	add	x1, x0, #0xb
    5b30:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5b34:	f90037e1 	str	x1, [sp, #104]
    5b38:	79400001 	ldrh	w1, [x0]
    5b3c:	17fffdea 	b	52e4 <_vfiprintf_r+0x6a4>
    5b40:	36302476 	tbz	w22, #6, 5fcc <_vfiprintf_r+0x138c>
    5b44:	37f839c0 	tbnz	w0, #31, 627c <_vfiprintf_r+0x163c>
    5b48:	f94037e0 	ldr	x0, [sp, #104]
    5b4c:	91002c01 	add	x1, x0, #0xb
    5b50:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5b54:	f90037e1 	str	x1, [sp, #104]
    5b58:	79400001 	ldrh	w1, [x0]
    5b5c:	52800020 	mov	w0, #0x1                   	// #1
    5b60:	17fffdbd 	b	5254 <_vfiprintf_r+0x614>
    5b64:	9103c3e0 	add	x0, sp, #0xf0
    5b68:	d2800042 	mov	x2, #0x2                   	// #2
    5b6c:	910643fb 	add	x27, sp, #0x190
    5b70:	52800021 	mov	w1, #0x1                   	// #1
    5b74:	a9190be0 	stp	x0, x2, [sp, #400]
    5b78:	aa0203e0 	mov	x0, x2
    5b7c:	17ffff18 	b	57dc <_vfiprintf_r+0xb9c>
    5b80:	2a1603e4 	mov	w4, w22
    5b84:	17fffddd 	b	52f8 <_vfiprintf_r+0x6b8>
    5b88:	b940b3e1 	ldr	w1, [sp, #176]
    5b8c:	11002021 	add	w1, w1, #0x8
    5b90:	7100003f 	cmp	w1, #0x0
    5b94:	54002d6d 	b.le	6140 <_vfiprintf_r+0x1500>
    5b98:	f94037e2 	ldr	x2, [sp, #104]
    5b9c:	b900b3e1 	str	w1, [sp, #176]
    5ba0:	91003c58 	add	x24, x2, #0xf
    5ba4:	927df318 	and	x24, x24, #0xfffffffffffffff8
    5ba8:	17fffd46 	b	50c0 <_vfiprintf_r+0x480>
    5bac:	b940b3e0 	ldr	w0, [sp, #176]
    5bb0:	11002001 	add	w1, w0, #0x8
    5bb4:	7100003f 	cmp	w1, #0x0
    5bb8:	54002a2d 	b.le	60fc <_vfiprintf_r+0x14bc>
    5bbc:	f94037e0 	ldr	x0, [sp, #104]
    5bc0:	b900b3e1 	str	w1, [sp, #176]
    5bc4:	91002c00 	add	x0, x0, #0xb
    5bc8:	927df000 	and	x0, x0, #0xfffffffffffffff8
    5bcc:	17fffd8f 	b	5208 <_vfiprintf_r+0x5c8>
    5bd0:	b940b3e0 	ldr	w0, [sp, #176]
    5bd4:	11002000 	add	w0, w0, #0x8
    5bd8:	7100001f 	cmp	w0, #0x0
    5bdc:	5400286d 	b.le	60e8 <_vfiprintf_r+0x14a8>
    5be0:	f94037e2 	ldr	x2, [sp, #104]
    5be4:	b900b3e0 	str	w0, [sp, #176]
    5be8:	91003c41 	add	x1, x2, #0xf
    5bec:	927df020 	and	x0, x1, #0xfffffffffffffff8
    5bf0:	f90037e0 	str	x0, [sp, #104]
    5bf4:	17fffe1f 	b	5470 <_vfiprintf_r+0x830>
    5bf8:	b940b3e0 	ldr	w0, [sp, #176]
    5bfc:	37f828e0 	tbnz	w0, #31, 6118 <_vfiprintf_r+0x14d8>
    5c00:	f94037e0 	ldr	x0, [sp, #104]
    5c04:	91002c01 	add	x1, x0, #0xb
    5c08:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5c0c:	f90037e1 	str	x1, [sp, #104]
    5c10:	b9400000 	ldr	w0, [x0]
    5c14:	52800036 	mov	w22, #0x1                   	// #1
    5c18:	9104a3fa 	add	x26, sp, #0x128
    5c1c:	2a1603f7 	mov	w23, w22
    5c20:	3903bfff 	strb	wzr, [sp, #239]
    5c24:	3904a3e0 	strb	w0, [sp, #296]
    5c28:	17fffc96 	b	4e80 <_vfiprintf_r+0x240>
    5c2c:	b940b3e0 	ldr	w0, [sp, #176]
    5c30:	11002001 	add	w1, w0, #0x8
    5c34:	7100003f 	cmp	w1, #0x0
    5c38:	5400394d 	b.le	6360 <_vfiprintf_r+0x1720>
    5c3c:	f94037e0 	ldr	x0, [sp, #104]
    5c40:	b900b3e1 	str	w1, [sp, #176]
    5c44:	91003c02 	add	x2, x0, #0xf
    5c48:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5c4c:	f90037e1 	str	x1, [sp, #104]
    5c50:	17fffdf0 	b	5410 <_vfiprintf_r+0x7d0>
    5c54:	3943bfe1 	ldrb	w1, [sp, #239]
    5c58:	35002d81 	cbnz	w1, 6208 <_vfiprintf_r+0x15c8>
    5c5c:	35ffdb0a 	cbnz	w10, 57bc <_vfiprintf_r+0xb7c>
    5c60:	910643fb 	add	x27, sp, #0x190
    5c64:	52800001 	mov	w1, #0x0                   	// #0
    5c68:	52800028 	mov	w8, #0x1                   	// #1
    5c6c:	17fffcbb 	b	4f58 <_vfiprintf_r+0x318>
    5c70:	2a1603e4 	mov	w4, w22
    5c74:	2a1c03f6 	mov	w22, w28
    5c78:	17fffd6d 	b	522c <_vfiprintf_r+0x5ec>
    5c7c:	2a1603e4 	mov	w4, w22
    5c80:	f0000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    5c84:	91230021 	add	x1, x1, #0x8c0
    5c88:	f90047e1 	str	x1, [sp, #136]
    5c8c:	b940b3e1 	ldr	w1, [sp, #176]
    5c90:	3728023c 	tbnz	w28, #5, 5cd4 <_vfiprintf_r+0x1094>
    5c94:	3720021c 	tbnz	w28, #4, 5cd4 <_vfiprintf_r+0x1094>
    5c98:	36301b7c 	tbz	w28, #6, 6004 <_vfiprintf_r+0x13c4>
    5c9c:	37f82c41 	tbnz	w1, #31, 6224 <_vfiprintf_r+0x15e4>
    5ca0:	f94037e1 	ldr	x1, [sp, #104]
    5ca4:	91002c22 	add	x2, x1, #0xb
    5ca8:	927df042 	and	x2, x2, #0xfffffffffffffff8
    5cac:	79400021 	ldrh	w1, [x1]
    5cb0:	f90037e2 	str	x2, [sp, #104]
    5cb4:	1400000e 	b	5cec <_vfiprintf_r+0x10ac>
    5cb8:	f0000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    5cbc:	2a1603e4 	mov	w4, w22
    5cc0:	91236021 	add	x1, x1, #0x8d8
    5cc4:	f90047e1 	str	x1, [sp, #136]
    5cc8:	17fffff1 	b	5c8c <_vfiprintf_r+0x104c>
    5ccc:	2a1603e4 	mov	w4, w22
    5cd0:	17fffd7c 	b	52c0 <_vfiprintf_r+0x680>
    5cd4:	37f801a1 	tbnz	w1, #31, 5d08 <_vfiprintf_r+0x10c8>
    5cd8:	f94037e1 	ldr	x1, [sp, #104]
    5cdc:	91003c22 	add	x2, x1, #0xf
    5ce0:	927df042 	and	x2, x2, #0xfffffffffffffff8
    5ce4:	f90037e2 	str	x2, [sp, #104]
    5ce8:	f9400021 	ldr	x1, [x1]
    5cec:	f100003f 	cmp	x1, #0x0
    5cf0:	1a9f07e2 	cset	w2, ne  // ne = any
    5cf4:	6a02039f 	tst	w28, w2
    5cf8:	54000581 	b.ne	5da8 <_vfiprintf_r+0x1168>  // b.any
    5cfc:	12157b96 	and	w22, w28, #0xfffffbff
    5d00:	52800040 	mov	w0, #0x2                   	// #2
    5d04:	17fffd54 	b	5254 <_vfiprintf_r+0x614>
    5d08:	b940b3e1 	ldr	w1, [sp, #176]
    5d0c:	11002022 	add	w2, w1, #0x8
    5d10:	7100005f 	cmp	w2, #0x0
    5d14:	540016ed 	b.le	5ff0 <_vfiprintf_r+0x13b0>
    5d18:	f94037e1 	ldr	x1, [sp, #104]
    5d1c:	b900b3e2 	str	w2, [sp, #176]
    5d20:	91003c23 	add	x3, x1, #0xf
    5d24:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5d28:	f90037e2 	str	x2, [sp, #104]
    5d2c:	17ffffef 	b	5ce8 <_vfiprintf_r+0x10a8>
    5d30:	b940b3e0 	ldr	w0, [sp, #176]
    5d34:	11002001 	add	w1, w0, #0x8
    5d38:	7100003f 	cmp	w1, #0x0
    5d3c:	540017ed 	b.le	6038 <_vfiprintf_r+0x13f8>
    5d40:	f94037e0 	ldr	x0, [sp, #104]
    5d44:	b900b3e1 	str	w1, [sp, #176]
    5d48:	91003c02 	add	x2, x0, #0xf
    5d4c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5d50:	f90037e1 	str	x1, [sp, #104]
    5d54:	17fffd71 	b	5318 <_vfiprintf_r+0x6d8>
    5d58:	b940b3e0 	ldr	w0, [sp, #176]
    5d5c:	11002001 	add	w1, w0, #0x8
    5d60:	7100003f 	cmp	w1, #0x0
    5d64:	5400186d 	b.le	6070 <_vfiprintf_r+0x1430>
    5d68:	f94037e0 	ldr	x0, [sp, #104]
    5d6c:	b900b3e1 	str	w1, [sp, #176]
    5d70:	91003c02 	add	x2, x0, #0xf
    5d74:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5d78:	f90037e1 	str	x1, [sp, #104]
    5d7c:	17fffd59 	b	52e0 <_vfiprintf_r+0x6a0>
    5d80:	b940b3e0 	ldr	w0, [sp, #176]
    5d84:	11002000 	add	w0, w0, #0x8
    5d88:	7100001f 	cmp	w0, #0x0
    5d8c:	540014cd 	b.le	6024 <_vfiprintf_r+0x13e4>
    5d90:	f94037e1 	ldr	x1, [sp, #104]
    5d94:	b900b3e0 	str	w0, [sp, #176]
    5d98:	91003c22 	add	x2, x1, #0xf
    5d9c:	927df040 	and	x0, x2, #0xfffffffffffffff8
    5da0:	f90037e0 	str	x0, [sp, #104]
    5da4:	17fffd2a 	b	524c <_vfiprintf_r+0x60c>
    5da8:	321f039c 	orr	w28, w28, #0x2
    5dac:	3903c7e0 	strb	w0, [sp, #241]
    5db0:	52800600 	mov	w0, #0x30                  	// #48
    5db4:	3903c3e0 	strb	w0, [sp, #240]
    5db8:	17ffffd1 	b	5cfc <_vfiprintf_r+0x10bc>
    5dbc:	910403e0 	add	x0, sp, #0x100
    5dc0:	d2800102 	mov	x2, #0x8                   	// #8
    5dc4:	52800001 	mov	w1, #0x0                   	// #0
    5dc8:	b9006be4 	str	w4, [sp, #104]
    5dcc:	f90087fa 	str	x26, [sp, #264]
    5dd0:	97fffa8c 	bl	4800 <memset>
    5dd4:	b9406be4 	ldr	w4, [sp, #104]
    5dd8:	3100049f 	cmn	w4, #0x1
    5ddc:	54001680 	b.eq	60ac <_vfiprintf_r+0x146c>  // b.none
    5de0:	d2800016 	mov	x22, #0x0                   	// #0
    5de4:	52800017 	mov	w23, #0x0                   	// #0
    5de8:	aa1603e0 	mov	x0, x22
    5dec:	2a1703f6 	mov	w22, w23
    5df0:	aa0003f7 	mov	x23, x0
    5df4:	f90037f4 	str	x20, [sp, #104]
    5df8:	2a0403f4 	mov	w20, w4
    5dfc:	1400000d 	b	5e30 <_vfiprintf_r+0x11f0>
    5e00:	910403e3 	add	x3, sp, #0x100
    5e04:	9104a3e1 	add	x1, sp, #0x128
    5e08:	aa1303e0 	mov	x0, x19
    5e0c:	940002a9 	bl	68b0 <_wcrtomb_r>
    5e10:	3100041f 	cmn	w0, #0x1
    5e14:	54002d60 	b.eq	63c0 <_vfiprintf_r+0x1780>  // b.none
    5e18:	0b0002c0 	add	w0, w22, w0
    5e1c:	6b14001f 	cmp	w0, w20
    5e20:	540000ec 	b.gt	5e3c <_vfiprintf_r+0x11fc>
    5e24:	910012f7 	add	x23, x23, #0x4
    5e28:	54003820 	b.eq	652c <_vfiprintf_r+0x18ec>  // b.none
    5e2c:	2a0003f6 	mov	w22, w0
    5e30:	f94087e0 	ldr	x0, [sp, #264]
    5e34:	b8776802 	ldr	w2, [x0, x23]
    5e38:	35fffe42 	cbnz	w2, 5e00 <_vfiprintf_r+0x11c0>
    5e3c:	f94037f4 	ldr	x20, [sp, #104]
    5e40:	2a1603f7 	mov	w23, w22
    5e44:	340014b7 	cbz	w23, 60d8 <_vfiprintf_r+0x1498>
    5e48:	71018eff 	cmp	w23, #0x63
    5e4c:	540024ac 	b.gt	62e0 <_vfiprintf_r+0x16a0>
    5e50:	9104a3fa 	add	x26, sp, #0x128
    5e54:	f9003bff 	str	xzr, [sp, #112]
    5e58:	93407ef6 	sxtw	x22, w23
    5e5c:	d2800102 	mov	x2, #0x8                   	// #8
    5e60:	52800001 	mov	w1, #0x0                   	// #0
    5e64:	910403e0 	add	x0, sp, #0x100
    5e68:	97fffa66 	bl	4800 <memset>
    5e6c:	910403e4 	add	x4, sp, #0x100
    5e70:	aa1603e3 	mov	x3, x22
    5e74:	910423e2 	add	x2, sp, #0x108
    5e78:	aa1a03e1 	mov	x1, x26
    5e7c:	aa1303e0 	mov	x0, x19
    5e80:	940002d8 	bl	69e0 <_wcsrtombs_r>
    5e84:	eb0002df 	cmp	x22, x0
    5e88:	54004761 	b.ne	6774 <_vfiprintf_r+0x1b34>  // b.any
    5e8c:	710002ff 	cmp	w23, #0x0
    5e90:	52800004 	mov	w4, #0x0                   	// #0
    5e94:	1a9fa2f6 	csel	w22, w23, wzr, ge  // ge = tcont
    5e98:	3837cb5f 	strb	wzr, [x26, w23, sxtw]
    5e9c:	f90037f8 	str	x24, [sp, #104]
    5ea0:	17fffcff 	b	529c <_vfiprintf_r+0x65c>
    5ea4:	910633f7 	add	x23, sp, #0x18c
    5ea8:	121602c6 	and	w6, w22, #0x400
    5eac:	b202e7fc 	mov	x28, #0xcccccccccccccccc    	// #-3689348814741910324
    5eb0:	aa1703e2 	mov	x2, x23
    5eb4:	aa1403e3 	mov	x3, x20
    5eb8:	aa1703e5 	mov	x5, x23
    5ebc:	52800008 	mov	w8, #0x0                   	// #0
    5ec0:	aa1303f7 	mov	x23, x19
    5ec4:	f29999bc 	movk	x28, #0xcccd
    5ec8:	2a0603f3 	mov	w19, w6
    5ecc:	f9404ff4 	ldr	x20, [sp, #152]
    5ed0:	14000007 	b	5eec <_vfiprintf_r+0x12ac>
    5ed4:	9bdc7c38 	umulh	x24, x1, x28
    5ed8:	d343ff18 	lsr	x24, x24, #3
    5edc:	f100243f 	cmp	x1, #0x9
    5ee0:	54000249 	b.ls	5f28 <_vfiprintf_r+0x12e8>  // b.plast
    5ee4:	aa1803e1 	mov	x1, x24
    5ee8:	aa1a03e2 	mov	x2, x26
    5eec:	9bdc7c38 	umulh	x24, x1, x28
    5ef0:	11000508 	add	w8, w8, #0x1
    5ef4:	d100045a 	sub	x26, x2, #0x1
    5ef8:	d343ff18 	lsr	x24, x24, #3
    5efc:	8b180b00 	add	x0, x24, x24, lsl #2
    5f00:	cb000420 	sub	x0, x1, x0, lsl #1
    5f04:	1100c000 	add	w0, w0, #0x30
    5f08:	381ff040 	sturb	w0, [x2, #-1]
    5f0c:	34fffe53 	cbz	w19, 5ed4 <_vfiprintf_r+0x1294>
    5f10:	39400280 	ldrb	w0, [x20]
    5f14:	7103fc1f 	cmp	w0, #0xff
    5f18:	7a481000 	ccmp	w0, w8, #0x0, ne  // ne = any
    5f1c:	54fffdc1 	b.ne	5ed4 <_vfiprintf_r+0x1294>  // b.any
    5f20:	f100243f 	cmp	x1, #0x9
    5f24:	54002028 	b.hi	6328 <_vfiprintf_r+0x16e8>  // b.pmore
    5f28:	aa1703f3 	mov	x19, x23
    5f2c:	aa0503f7 	mov	x23, x5
    5f30:	4b1a02f7 	sub	w23, w23, w26
    5f34:	2a1603fc 	mov	w28, w22
    5f38:	f9004ff4 	str	x20, [sp, #152]
    5f3c:	aa0303f4 	mov	x20, x3
    5f40:	17fffcd4 	b	5290 <_vfiprintf_r+0x650>
    5f44:	39400680 	ldrb	w0, [x20, #1]
    5f48:	3217039c 	orr	w28, w28, #0x200
    5f4c:	91000694 	add	x20, x20, #0x1
    5f50:	17fffbc2 	b	4e58 <_vfiprintf_r+0x218>
    5f54:	39400680 	ldrb	w0, [x20, #1]
    5f58:	321b039c 	orr	w28, w28, #0x20
    5f5c:	91000694 	add	x20, x20, #0x1
    5f60:	17fffbbe 	b	4e58 <_vfiprintf_r+0x218>
    5f64:	aa1403f3 	mov	x19, x20
    5f68:	aa1603f9 	mov	x25, x22
    5f6c:	17fffc3c 	b	505c <_vfiprintf_r+0x41c>
    5f70:	7100189f 	cmp	w4, #0x6
    5f74:	528000d7 	mov	w23, #0x6                   	// #6
    5f78:	1a979097 	csel	w23, w4, w23, ls  // ls = plast
    5f7c:	f0000027 	adrp	x7, c000 <_reclaim_reent+0xc0>
    5f80:	2a1703f6 	mov	w22, w23
    5f84:	9123c0fa 	add	x26, x7, #0x8f0
    5f88:	f90037f8 	str	x24, [sp, #104]
    5f8c:	17fffbbd 	b	4e80 <_vfiprintf_r+0x240>
    5f90:	f94093e0 	ldr	x0, [sp, #288]
    5f94:	b4ff86e0 	cbz	x0, 5070 <_vfiprintf_r+0x430>
    5f98:	aa1303e0 	mov	x0, x19
    5f9c:	910443e2 	add	x2, sp, #0x110
    5fa0:	aa1903e1 	mov	x1, x25
    5fa4:	97fffae7 	bl	4b40 <__sprint_r.part.0>
    5fa8:	17fffc32 	b	5070 <_vfiprintf_r+0x430>
    5fac:	3648101c 	tbz	w28, #9, 61ac <_vfiprintf_r+0x156c>
    5fb0:	37f822e0 	tbnz	w0, #31, 640c <_vfiprintf_r+0x17cc>
    5fb4:	f94037e0 	ldr	x0, [sp, #104]
    5fb8:	91002c01 	add	x1, x0, #0xb
    5fbc:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5fc0:	f90037e1 	str	x1, [sp, #104]
    5fc4:	39400001 	ldrb	w1, [x0]
    5fc8:	17fffcc7 	b	52e4 <_vfiprintf_r+0x6a4>
    5fcc:	364810f6 	tbz	w22, #9, 61e8 <_vfiprintf_r+0x15a8>
    5fd0:	37f82880 	tbnz	w0, #31, 64e0 <_vfiprintf_r+0x18a0>
    5fd4:	f94037e0 	ldr	x0, [sp, #104]
    5fd8:	91002c01 	add	x1, x0, #0xb
    5fdc:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5fe0:	f90037e1 	str	x1, [sp, #104]
    5fe4:	39400001 	ldrb	w1, [x0]
    5fe8:	52800020 	mov	w0, #0x1                   	// #1
    5fec:	17fffc9a 	b	5254 <_vfiprintf_r+0x614>
    5ff0:	f94043e3 	ldr	x3, [sp, #128]
    5ff4:	b940b3e1 	ldr	w1, [sp, #176]
    5ff8:	b900b3e2 	str	w2, [sp, #176]
    5ffc:	8b21c061 	add	x1, x3, w1, sxtw
    6000:	17ffff3a 	b	5ce8 <_vfiprintf_r+0x10a8>
    6004:	36480c7c 	tbz	w28, #9, 6190 <_vfiprintf_r+0x1550>
    6008:	37f82421 	tbnz	w1, #31, 648c <_vfiprintf_r+0x184c>
    600c:	f94037e1 	ldr	x1, [sp, #104]
    6010:	91002c22 	add	x2, x1, #0xb
    6014:	927df042 	and	x2, x2, #0xfffffffffffffff8
    6018:	39400021 	ldrb	w1, [x1]
    601c:	f90037e2 	str	x2, [sp, #104]
    6020:	17ffff33 	b	5cec <_vfiprintf_r+0x10ac>
    6024:	f94043e2 	ldr	x2, [sp, #128]
    6028:	b940b3e1 	ldr	w1, [sp, #176]
    602c:	b900b3e0 	str	w0, [sp, #176]
    6030:	8b21c041 	add	x1, x2, w1, sxtw
    6034:	17fffc86 	b	524c <_vfiprintf_r+0x60c>
    6038:	f94043e2 	ldr	x2, [sp, #128]
    603c:	b940b3e0 	ldr	w0, [sp, #176]
    6040:	b900b3e1 	str	w1, [sp, #176]
    6044:	8b20c040 	add	x0, x2, w0, sxtw
    6048:	17fffcb4 	b	5318 <_vfiprintf_r+0x6d8>
    604c:	36480bfc 	tbz	w28, #9, 61c8 <_vfiprintf_r+0x1588>
    6050:	37f820a0 	tbnz	w0, #31, 6464 <_vfiprintf_r+0x1824>
    6054:	f94037e0 	ldr	x0, [sp, #104]
    6058:	91002c01 	add	x1, x0, #0xb
    605c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    6060:	f90037e1 	str	x1, [sp, #104]
    6064:	39800001 	ldrsb	x1, [x0]
    6068:	aa0103e0 	mov	x0, x1
    606c:	17fffcad 	b	5320 <_vfiprintf_r+0x6e0>
    6070:	f94043e2 	ldr	x2, [sp, #128]
    6074:	b940b3e0 	ldr	w0, [sp, #176]
    6078:	b900b3e1 	str	w1, [sp, #176]
    607c:	8b20c040 	add	x0, x2, w0, sxtw
    6080:	17fffc98 	b	52e0 <_vfiprintf_r+0x6a0>
    6084:	b940b3e0 	ldr	w0, [sp, #176]
    6088:	11002001 	add	w1, w0, #0x8
    608c:	7100003f 	cmp	w1, #0x0
    6090:	540011ed 	b.le	62cc <_vfiprintf_r+0x168c>
    6094:	f94037e0 	ldr	x0, [sp, #104]
    6098:	b900b3e1 	str	w1, [sp, #176]
    609c:	91002c02 	add	x2, x0, #0xb
    60a0:	927df041 	and	x1, x2, #0xfffffffffffffff8
    60a4:	f90037e1 	str	x1, [sp, #104]
    60a8:	17fffc2b 	b	5154 <_vfiprintf_r+0x514>
    60ac:	910403e4 	add	x4, sp, #0x100
    60b0:	910423e2 	add	x2, sp, #0x108
    60b4:	aa1303e0 	mov	x0, x19
    60b8:	d2800003 	mov	x3, #0x0                   	// #0
    60bc:	d2800001 	mov	x1, #0x0                   	// #0
    60c0:	94000248 	bl	69e0 <_wcsrtombs_r>
    60c4:	2a0003f7 	mov	w23, w0
    60c8:	3100041f 	cmn	w0, #0x1
    60cc:	540017a0 	b.eq	63c0 <_vfiprintf_r+0x1780>  // b.none
    60d0:	f90087fa 	str	x26, [sp, #264]
    60d4:	17ffff5c 	b	5e44 <_vfiprintf_r+0x1204>
    60d8:	52800016 	mov	w22, #0x0                   	// #0
    60dc:	52800004 	mov	w4, #0x0                   	// #0
    60e0:	a906fff8 	stp	x24, xzr, [sp, #104]
    60e4:	17fffc6e 	b	529c <_vfiprintf_r+0x65c>
    60e8:	f94043e2 	ldr	x2, [sp, #128]
    60ec:	b940b3e1 	ldr	w1, [sp, #176]
    60f0:	b900b3e0 	str	w0, [sp, #176]
    60f4:	8b21c042 	add	x2, x2, w1, sxtw
    60f8:	17fffcde 	b	5470 <_vfiprintf_r+0x830>
    60fc:	f94043e2 	ldr	x2, [sp, #128]
    6100:	b940b3e0 	ldr	w0, [sp, #176]
    6104:	b900b3e1 	str	w1, [sp, #176]
    6108:	8b20c042 	add	x2, x2, w0, sxtw
    610c:	f94037e0 	ldr	x0, [sp, #104]
    6110:	f90037e2 	str	x2, [sp, #104]
    6114:	17fffc3d 	b	5208 <_vfiprintf_r+0x5c8>
    6118:	b940b3e0 	ldr	w0, [sp, #176]
    611c:	11002001 	add	w1, w0, #0x8
    6120:	7100003f 	cmp	w1, #0x0
    6124:	54000eed 	b.le	6300 <_vfiprintf_r+0x16c0>
    6128:	f94037e0 	ldr	x0, [sp, #104]
    612c:	b900b3e1 	str	w1, [sp, #176]
    6130:	91002c02 	add	x2, x0, #0xb
    6134:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6138:	f90037e1 	str	x1, [sp, #104]
    613c:	17fffeb5 	b	5c10 <_vfiprintf_r+0xfd0>
    6140:	f94043e3 	ldr	x3, [sp, #128]
    6144:	b940b3e2 	ldr	w2, [sp, #176]
    6148:	b900b3e1 	str	w1, [sp, #176]
    614c:	f94037f8 	ldr	x24, [sp, #104]
    6150:	8b22c062 	add	x2, x3, w2, sxtw
    6154:	f90037e2 	str	x2, [sp, #104]
    6158:	17fffbda 	b	50c0 <_vfiprintf_r+0x480>
    615c:	910643fb 	add	x27, sp, #0x190
    6160:	52800028 	mov	w8, #0x1                   	// #1
    6164:	52800001 	mov	w1, #0x0                   	// #0
    6168:	17fffb7c 	b	4f58 <_vfiprintf_r+0x318>
    616c:	37f81e60 	tbnz	w0, #31, 6538 <_vfiprintf_r+0x18f8>
    6170:	f94037e0 	ldr	x0, [sp, #104]
    6174:	91003c01 	add	x1, x0, #0xf
    6178:	927df021 	and	x1, x1, #0xfffffffffffffff8
    617c:	f90037e1 	str	x1, [sp, #104]
    6180:	f9400000 	ldr	x0, [x0]
    6184:	7940cbe1 	ldrh	w1, [sp, #100]
    6188:	79000001 	strh	w1, [x0]
    618c:	17fffae4 	b	4d1c <_vfiprintf_r+0xdc>
    6190:	37f81281 	tbnz	w1, #31, 63e0 <_vfiprintf_r+0x17a0>
    6194:	f94037e1 	ldr	x1, [sp, #104]
    6198:	91002c22 	add	x2, x1, #0xb
    619c:	927df042 	and	x2, x2, #0xfffffffffffffff8
    61a0:	b9400021 	ldr	w1, [x1]
    61a4:	f90037e2 	str	x2, [sp, #104]
    61a8:	17fffed1 	b	5cec <_vfiprintf_r+0x10ac>
    61ac:	37f81460 	tbnz	w0, #31, 6438 <_vfiprintf_r+0x17f8>
    61b0:	f94037e0 	ldr	x0, [sp, #104]
    61b4:	91002c01 	add	x1, x0, #0xb
    61b8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    61bc:	f90037e1 	str	x1, [sp, #104]
    61c0:	b9400001 	ldr	w1, [x0]
    61c4:	17fffc48 	b	52e4 <_vfiprintf_r+0x6a4>
    61c8:	37f81cc0 	tbnz	w0, #31, 6560 <_vfiprintf_r+0x1920>
    61cc:	f94037e0 	ldr	x0, [sp, #104]
    61d0:	91002c01 	add	x1, x0, #0xb
    61d4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    61d8:	f90037e1 	str	x1, [sp, #104]
    61dc:	b9800001 	ldrsw	x1, [x0]
    61e0:	aa0103e0 	mov	x0, x1
    61e4:	17fffc4f 	b	5320 <_vfiprintf_r+0x6e0>
    61e8:	37f81680 	tbnz	w0, #31, 64b8 <_vfiprintf_r+0x1878>
    61ec:	f94037e0 	ldr	x0, [sp, #104]
    61f0:	91002c01 	add	x1, x0, #0xb
    61f4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    61f8:	f90037e1 	str	x1, [sp, #104]
    61fc:	b9400001 	ldr	w1, [x0]
    6200:	52800020 	mov	w0, #0x1                   	// #1
    6204:	17fffc14 	b	5254 <_vfiprintf_r+0x614>
    6208:	9103bfe0 	add	x0, sp, #0xef
    620c:	910643fb 	add	x27, sp, #0x190
    6210:	52800028 	mov	w8, #0x1                   	// #1
    6214:	f900cbe0 	str	x0, [sp, #400]
    6218:	d2800020 	mov	x0, #0x1                   	// #1
    621c:	f900cfe0 	str	x0, [sp, #408]
    6220:	17fffb33 	b	4eec <_vfiprintf_r+0x2ac>
    6224:	b940b3e1 	ldr	w1, [sp, #176]
    6228:	11002022 	add	w2, w1, #0x8
    622c:	7100005f 	cmp	w2, #0x0
    6230:	54001b6d 	b.le	659c <_vfiprintf_r+0x195c>
    6234:	f94037e1 	ldr	x1, [sp, #104]
    6238:	b900b3e2 	str	w2, [sp, #176]
    623c:	91002c23 	add	x3, x1, #0xb
    6240:	927df062 	and	x2, x3, #0xfffffffffffffff8
    6244:	79400021 	ldrh	w1, [x1]
    6248:	f90037e2 	str	x2, [sp, #104]
    624c:	17fffea8 	b	5cec <_vfiprintf_r+0x10ac>
    6250:	b940b3e0 	ldr	w0, [sp, #176]
    6254:	11002001 	add	w1, w0, #0x8
    6258:	7100003f 	cmp	w1, #0x0
    625c:	54001b6d 	b.le	65c8 <_vfiprintf_r+0x1988>
    6260:	f94037e0 	ldr	x0, [sp, #104]
    6264:	b900b3e1 	str	w1, [sp, #176]
    6268:	91002c02 	add	x2, x0, #0xb
    626c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6270:	f90037e1 	str	x1, [sp, #104]
    6274:	79400001 	ldrh	w1, [x0]
    6278:	17fffc1b 	b	52e4 <_vfiprintf_r+0x6a4>
    627c:	b940b3e0 	ldr	w0, [sp, #176]
    6280:	11002001 	add	w1, w0, #0x8
    6284:	7100003f 	cmp	w1, #0x0
    6288:	5400196d 	b.le	65b4 <_vfiprintf_r+0x1974>
    628c:	f94037e0 	ldr	x0, [sp, #104]
    6290:	b900b3e1 	str	w1, [sp, #176]
    6294:	91002c02 	add	x2, x0, #0xb
    6298:	927df041 	and	x1, x2, #0xfffffffffffffff8
    629c:	f90037e1 	str	x1, [sp, #104]
    62a0:	17fffe2e 	b	5b58 <_vfiprintf_r+0xf18>
    62a4:	b940b3e0 	ldr	w0, [sp, #176]
    62a8:	11002001 	add	w1, w0, #0x8
    62ac:	7100003f 	cmp	w1, #0x0
    62b0:	540016cd 	b.le	6588 <_vfiprintf_r+0x1948>
    62b4:	f94037e0 	ldr	x0, [sp, #104]
    62b8:	b900b3e1 	str	w1, [sp, #176]
    62bc:	91002c02 	add	x2, x0, #0xb
    62c0:	927df041 	and	x1, x2, #0xfffffffffffffff8
    62c4:	f90037e1 	str	x1, [sp, #104]
    62c8:	17fffe13 	b	5b14 <_vfiprintf_r+0xed4>
    62cc:	f94043e2 	ldr	x2, [sp, #128]
    62d0:	b940b3e0 	ldr	w0, [sp, #176]
    62d4:	b900b3e1 	str	w1, [sp, #176]
    62d8:	8b20c040 	add	x0, x2, w0, sxtw
    62dc:	17fffb9e 	b	5154 <_vfiprintf_r+0x514>
    62e0:	110006e1 	add	w1, w23, #0x1
    62e4:	aa1303e0 	mov	x0, x19
    62e8:	93407c21 	sxtw	x1, w1
    62ec:	94000ad5 	bl	8e40 <_malloc_r>
    62f0:	aa0003fa 	mov	x26, x0
    62f4:	b4000660 	cbz	x0, 63c0 <_vfiprintf_r+0x1780>
    62f8:	f9003be0 	str	x0, [sp, #112]
    62fc:	17fffed7 	b	5e58 <_vfiprintf_r+0x1218>
    6300:	f94043e2 	ldr	x2, [sp, #128]
    6304:	b940b3e0 	ldr	w0, [sp, #176]
    6308:	b900b3e1 	str	w1, [sp, #176]
    630c:	8b20c040 	add	x0, x2, w0, sxtw
    6310:	17fffe40 	b	5c10 <_vfiprintf_r+0xfd0>
    6314:	2a0403f6 	mov	w22, w4
    6318:	2a0403f7 	mov	w23, w4
    631c:	52800004 	mov	w4, #0x0                   	// #0
    6320:	f90037f8 	str	x24, [sp, #104]
    6324:	17fffbde 	b	529c <_vfiprintf_r+0x65c>
    6328:	a94a03e1 	ldp	x1, x0, [sp, #160]
    632c:	b90073e4 	str	w4, [sp, #112]
    6330:	a90917e3 	stp	x3, x5, [sp, #144]
    6334:	cb00035a 	sub	x26, x26, x0
    6338:	aa0003e2 	mov	x2, x0
    633c:	aa1a03e0 	mov	x0, x26
    6340:	9400133c 	bl	b030 <strncpy>
    6344:	39400680 	ldrb	w0, [x20, #1]
    6348:	52800008 	mov	w8, #0x0                   	// #0
    634c:	b94073e4 	ldr	w4, [sp, #112]
    6350:	7100001f 	cmp	w0, #0x0
    6354:	9a940694 	cinc	x20, x20, ne  // ne = any
    6358:	a94917e3 	ldp	x3, x5, [sp, #144]
    635c:	17fffee2 	b	5ee4 <_vfiprintf_r+0x12a4>
    6360:	f94043e2 	ldr	x2, [sp, #128]
    6364:	b940b3e0 	ldr	w0, [sp, #176]
    6368:	b900b3e1 	str	w1, [sp, #176]
    636c:	8b20c040 	add	x0, x2, w0, sxtw
    6370:	17fffc28 	b	5410 <_vfiprintf_r+0x7d0>
    6374:	d0000028 	adrp	x8, c000 <_reclaim_reent+0xc0>
    6378:	2a0203eb 	mov	w11, w2
    637c:	9126c108 	add	x8, x8, #0x9b0
    6380:	17fffd4e 	b	58b8 <_vfiprintf_r+0xc78>
    6384:	aa1a03e0 	mov	x0, x26
    6388:	97fff99e 	bl	4a00 <strlen>
    638c:	7100001f 	cmp	w0, #0x0
    6390:	2a0003f7 	mov	w23, w0
    6394:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    6398:	52800004 	mov	w4, #0x0                   	// #0
    639c:	a906fff8 	stp	x24, xzr, [sp, #104]
    63a0:	17fffbbf 	b	529c <_vfiprintf_r+0x65c>
    63a4:	d0000028 	adrp	x8, c000 <_reclaim_reent+0xc0>
    63a8:	11000444 	add	w4, w2, #0x1
    63ac:	9126c108 	add	x8, x8, #0x9b0
    63b0:	17fffd7b 	b	599c <_vfiprintf_r+0xd5c>
    63b4:	12800000 	mov	w0, #0xffffffff            	// #-1
    63b8:	b90067e0 	str	w0, [sp, #100]
    63bc:	17fffb31 	b	5080 <_vfiprintf_r+0x440>
    63c0:	79c02320 	ldrsh	w0, [x25, #16]
    63c4:	321a0000 	orr	w0, w0, #0x40
    63c8:	79002320 	strh	w0, [x25, #16]
    63cc:	17fffb2a 	b	5074 <_vfiprintf_r+0x434>
    63d0:	d0000029 	adrp	x9, c000 <_reclaim_reent+0xc0>
    63d4:	2a0803ea 	mov	w10, w8
    63d8:	91270129 	add	x9, x9, #0x9c0
    63dc:	17fffc90 	b	561c <_vfiprintf_r+0x9dc>
    63e0:	b940b3e1 	ldr	w1, [sp, #176]
    63e4:	11002022 	add	w2, w1, #0x8
    63e8:	7100005f 	cmp	w2, #0x0
    63ec:	540019cd 	b.le	6724 <_vfiprintf_r+0x1ae4>
    63f0:	f94037e1 	ldr	x1, [sp, #104]
    63f4:	b900b3e2 	str	w2, [sp, #176]
    63f8:	91002c23 	add	x3, x1, #0xb
    63fc:	927df062 	and	x2, x3, #0xfffffffffffffff8
    6400:	b9400021 	ldr	w1, [x1]
    6404:	f90037e2 	str	x2, [sp, #104]
    6408:	17fffe39 	b	5cec <_vfiprintf_r+0x10ac>
    640c:	b940b3e0 	ldr	w0, [sp, #176]
    6410:	11002001 	add	w1, w0, #0x8
    6414:	7100003f 	cmp	w1, #0x0
    6418:	540010cd 	b.le	6630 <_vfiprintf_r+0x19f0>
    641c:	f94037e0 	ldr	x0, [sp, #104]
    6420:	b900b3e1 	str	w1, [sp, #176]
    6424:	91002c02 	add	x2, x0, #0xb
    6428:	927df041 	and	x1, x2, #0xfffffffffffffff8
    642c:	f90037e1 	str	x1, [sp, #104]
    6430:	39400001 	ldrb	w1, [x0]
    6434:	17fffbac 	b	52e4 <_vfiprintf_r+0x6a4>
    6438:	b940b3e0 	ldr	w0, [sp, #176]
    643c:	11002001 	add	w1, w0, #0x8
    6440:	7100003f 	cmp	w1, #0x0
    6444:	540015ad 	b.le	66f8 <_vfiprintf_r+0x1ab8>
    6448:	f94037e0 	ldr	x0, [sp, #104]
    644c:	b900b3e1 	str	w1, [sp, #176]
    6450:	91002c02 	add	x2, x0, #0xb
    6454:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6458:	f90037e1 	str	x1, [sp, #104]
    645c:	b9400001 	ldr	w1, [x0]
    6460:	17fffba1 	b	52e4 <_vfiprintf_r+0x6a4>
    6464:	b940b3e0 	ldr	w0, [sp, #176]
    6468:	11002001 	add	w1, w0, #0x8
    646c:	7100003f 	cmp	w1, #0x0
    6470:	54000f6d 	b.le	665c <_vfiprintf_r+0x1a1c>
    6474:	f94037e0 	ldr	x0, [sp, #104]
    6478:	b900b3e1 	str	w1, [sp, #176]
    647c:	91002c02 	add	x2, x0, #0xb
    6480:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6484:	f90037e1 	str	x1, [sp, #104]
    6488:	17fffef7 	b	6064 <_vfiprintf_r+0x1424>
    648c:	b940b3e1 	ldr	w1, [sp, #176]
    6490:	11002022 	add	w2, w1, #0x8
    6494:	7100005f 	cmp	w2, #0x0
    6498:	5400152d 	b.le	673c <_vfiprintf_r+0x1afc>
    649c:	f94037e1 	ldr	x1, [sp, #104]
    64a0:	b900b3e2 	str	w2, [sp, #176]
    64a4:	91002c23 	add	x3, x1, #0xb
    64a8:	927df062 	and	x2, x3, #0xfffffffffffffff8
    64ac:	39400021 	ldrb	w1, [x1]
    64b0:	f90037e2 	str	x2, [sp, #104]
    64b4:	17fffe0e 	b	5cec <_vfiprintf_r+0x10ac>
    64b8:	b940b3e0 	ldr	w0, [sp, #176]
    64bc:	11002001 	add	w1, w0, #0x8
    64c0:	7100003f 	cmp	w1, #0x0
    64c4:	5400106d 	b.le	66d0 <_vfiprintf_r+0x1a90>
    64c8:	f94037e0 	ldr	x0, [sp, #104]
    64cc:	b900b3e1 	str	w1, [sp, #176]
    64d0:	91002c02 	add	x2, x0, #0xb
    64d4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    64d8:	f90037e1 	str	x1, [sp, #104]
    64dc:	17ffff48 	b	61fc <_vfiprintf_r+0x15bc>
    64e0:	b940b3e0 	ldr	w0, [sp, #176]
    64e4:	11002001 	add	w1, w0, #0x8
    64e8:	7100003f 	cmp	w1, #0x0
    64ec:	54000e8d 	b.le	66bc <_vfiprintf_r+0x1a7c>
    64f0:	f94037e0 	ldr	x0, [sp, #104]
    64f4:	b900b3e1 	str	w1, [sp, #176]
    64f8:	91002c02 	add	x2, x0, #0xb
    64fc:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6500:	f90037e1 	str	x1, [sp, #104]
    6504:	17fffeb8 	b	5fe4 <_vfiprintf_r+0x13a4>
    6508:	37f80800 	tbnz	w0, #31, 6608 <_vfiprintf_r+0x19c8>
    650c:	f94037e0 	ldr	x0, [sp, #104]
    6510:	91003c01 	add	x1, x0, #0xf
    6514:	927df021 	and	x1, x1, #0xfffffffffffffff8
    6518:	f90037e1 	str	x1, [sp, #104]
    651c:	f9400000 	ldr	x0, [x0]
    6520:	b94067e1 	ldr	w1, [sp, #100]
    6524:	b9000001 	str	w1, [x0]
    6528:	17fff9fd 	b	4d1c <_vfiprintf_r+0xdc>
    652c:	2a1403f7 	mov	w23, w20
    6530:	f94037f4 	ldr	x20, [sp, #104]
    6534:	17fffe44 	b	5e44 <_vfiprintf_r+0x1204>
    6538:	b940b3e0 	ldr	w0, [sp, #176]
    653c:	11002001 	add	w1, w0, #0x8
    6540:	7100003f 	cmp	w1, #0x0
    6544:	54000d0d 	b.le	66e4 <_vfiprintf_r+0x1aa4>
    6548:	f94037e0 	ldr	x0, [sp, #104]
    654c:	b900b3e1 	str	w1, [sp, #176]
    6550:	91003c02 	add	x2, x0, #0xf
    6554:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6558:	f90037e1 	str	x1, [sp, #104]
    655c:	17ffff09 	b	6180 <_vfiprintf_r+0x1540>
    6560:	b940b3e0 	ldr	w0, [sp, #176]
    6564:	11002001 	add	w1, w0, #0x8
    6568:	7100003f 	cmp	w1, #0x0
    656c:	540006ed 	b.le	6648 <_vfiprintf_r+0x1a08>
    6570:	f94037e0 	ldr	x0, [sp, #104]
    6574:	b900b3e1 	str	w1, [sp, #176]
    6578:	91002c02 	add	x2, x0, #0xb
    657c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6580:	f90037e1 	str	x1, [sp, #104]
    6584:	17ffff16 	b	61dc <_vfiprintf_r+0x159c>
    6588:	f94043e2 	ldr	x2, [sp, #128]
    658c:	b940b3e0 	ldr	w0, [sp, #176]
    6590:	b900b3e1 	str	w1, [sp, #176]
    6594:	8b20c040 	add	x0, x2, w0, sxtw
    6598:	17fffd5f 	b	5b14 <_vfiprintf_r+0xed4>
    659c:	f94043e3 	ldr	x3, [sp, #128]
    65a0:	b940b3e1 	ldr	w1, [sp, #176]
    65a4:	b900b3e2 	str	w2, [sp, #176]
    65a8:	8b21c061 	add	x1, x3, w1, sxtw
    65ac:	79400021 	ldrh	w1, [x1]
    65b0:	17fffdcf 	b	5cec <_vfiprintf_r+0x10ac>
    65b4:	f94043e2 	ldr	x2, [sp, #128]
    65b8:	b940b3e0 	ldr	w0, [sp, #176]
    65bc:	b900b3e1 	str	w1, [sp, #176]
    65c0:	8b20c040 	add	x0, x2, w0, sxtw
    65c4:	17fffd65 	b	5b58 <_vfiprintf_r+0xf18>
    65c8:	f94043e2 	ldr	x2, [sp, #128]
    65cc:	b940b3e0 	ldr	w0, [sp, #176]
    65d0:	b900b3e1 	str	w1, [sp, #176]
    65d4:	8b20c040 	add	x0, x2, w0, sxtw
    65d8:	79400001 	ldrh	w1, [x0]
    65dc:	17fffb42 	b	52e4 <_vfiprintf_r+0x6a4>
    65e0:	b940b3e0 	ldr	w0, [sp, #176]
    65e4:	11002001 	add	w1, w0, #0x8
    65e8:	7100003f 	cmp	w1, #0x0
    65ec:	5400092d 	b.le	6710 <_vfiprintf_r+0x1ad0>
    65f0:	f94037e0 	ldr	x0, [sp, #104]
    65f4:	b900b3e1 	str	w1, [sp, #176]
    65f8:	91003c02 	add	x2, x0, #0xf
    65fc:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6600:	f90037e1 	str	x1, [sp, #104]
    6604:	17fffb7a 	b	53ec <_vfiprintf_r+0x7ac>
    6608:	b940b3e0 	ldr	w0, [sp, #176]
    660c:	11002001 	add	w1, w0, #0x8
    6610:	7100003f 	cmp	w1, #0x0
    6614:	540002ed 	b.le	6670 <_vfiprintf_r+0x1a30>
    6618:	f94037e0 	ldr	x0, [sp, #104]
    661c:	b900b3e1 	str	w1, [sp, #176]
    6620:	91003c02 	add	x2, x0, #0xf
    6624:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6628:	f90037e1 	str	x1, [sp, #104]
    662c:	17ffffbc 	b	651c <_vfiprintf_r+0x18dc>
    6630:	f94043e2 	ldr	x2, [sp, #128]
    6634:	b940b3e0 	ldr	w0, [sp, #176]
    6638:	b900b3e1 	str	w1, [sp, #176]
    663c:	8b20c040 	add	x0, x2, w0, sxtw
    6640:	39400001 	ldrb	w1, [x0]
    6644:	17fffb28 	b	52e4 <_vfiprintf_r+0x6a4>
    6648:	f94043e2 	ldr	x2, [sp, #128]
    664c:	b940b3e0 	ldr	w0, [sp, #176]
    6650:	b900b3e1 	str	w1, [sp, #176]
    6654:	8b20c040 	add	x0, x2, w0, sxtw
    6658:	17fffee1 	b	61dc <_vfiprintf_r+0x159c>
    665c:	f94043e2 	ldr	x2, [sp, #128]
    6660:	b940b3e0 	ldr	w0, [sp, #176]
    6664:	b900b3e1 	str	w1, [sp, #176]
    6668:	8b20c040 	add	x0, x2, w0, sxtw
    666c:	17fffe7e 	b	6064 <_vfiprintf_r+0x1424>
    6670:	f94043e2 	ldr	x2, [sp, #128]
    6674:	b940b3e0 	ldr	w0, [sp, #176]
    6678:	b900b3e1 	str	w1, [sp, #176]
    667c:	8b20c040 	add	x0, x2, w0, sxtw
    6680:	17ffffa7 	b	651c <_vfiprintf_r+0x18dc>
    6684:	b940b3e0 	ldr	w0, [sp, #176]
    6688:	37f80660 	tbnz	w0, #31, 6754 <_vfiprintf_r+0x1b14>
    668c:	f94037e1 	ldr	x1, [sp, #104]
    6690:	91002c21 	add	x1, x1, #0xb
    6694:	927df021 	and	x1, x1, #0xfffffffffffffff8
    6698:	f94037e3 	ldr	x3, [sp, #104]
    669c:	f90037e1 	str	x1, [sp, #104]
    66a0:	b900b3e0 	str	w0, [sp, #176]
    66a4:	39400680 	ldrb	w0, [x20, #1]
    66a8:	aa0203f4 	mov	x20, x2
    66ac:	b9400064 	ldr	w4, [x3]
    66b0:	7100009f 	cmp	w4, #0x0
    66b4:	5a9fa096 	csinv	w22, w4, wzr, ge  // ge = tcont
    66b8:	17fff9e8 	b	4e58 <_vfiprintf_r+0x218>
    66bc:	f94043e2 	ldr	x2, [sp, #128]
    66c0:	b940b3e0 	ldr	w0, [sp, #176]
    66c4:	b900b3e1 	str	w1, [sp, #176]
    66c8:	8b20c040 	add	x0, x2, w0, sxtw
    66cc:	17fffe46 	b	5fe4 <_vfiprintf_r+0x13a4>
    66d0:	f94043e2 	ldr	x2, [sp, #128]
    66d4:	b940b3e0 	ldr	w0, [sp, #176]
    66d8:	b900b3e1 	str	w1, [sp, #176]
    66dc:	8b20c040 	add	x0, x2, w0, sxtw
    66e0:	17fffec7 	b	61fc <_vfiprintf_r+0x15bc>
    66e4:	f94043e2 	ldr	x2, [sp, #128]
    66e8:	b940b3e0 	ldr	w0, [sp, #176]
    66ec:	b900b3e1 	str	w1, [sp, #176]
    66f0:	8b20c040 	add	x0, x2, w0, sxtw
    66f4:	17fffea3 	b	6180 <_vfiprintf_r+0x1540>
    66f8:	f94043e2 	ldr	x2, [sp, #128]
    66fc:	b940b3e0 	ldr	w0, [sp, #176]
    6700:	b900b3e1 	str	w1, [sp, #176]
    6704:	8b20c040 	add	x0, x2, w0, sxtw
    6708:	b9400001 	ldr	w1, [x0]
    670c:	17fffaf6 	b	52e4 <_vfiprintf_r+0x6a4>
    6710:	f94043e2 	ldr	x2, [sp, #128]
    6714:	b940b3e0 	ldr	w0, [sp, #176]
    6718:	b900b3e1 	str	w1, [sp, #176]
    671c:	8b20c040 	add	x0, x2, w0, sxtw
    6720:	17fffb33 	b	53ec <_vfiprintf_r+0x7ac>
    6724:	f94043e3 	ldr	x3, [sp, #128]
    6728:	b940b3e1 	ldr	w1, [sp, #176]
    672c:	b900b3e2 	str	w2, [sp, #176]
    6730:	8b21c061 	add	x1, x3, w1, sxtw
    6734:	b9400021 	ldr	w1, [x1]
    6738:	17fffd6d 	b	5cec <_vfiprintf_r+0x10ac>
    673c:	f94043e3 	ldr	x3, [sp, #128]
    6740:	b940b3e1 	ldr	w1, [sp, #176]
    6744:	b900b3e2 	str	w2, [sp, #176]
    6748:	8b21c061 	add	x1, x3, w1, sxtw
    674c:	39400021 	ldrb	w1, [x1]
    6750:	17fffd67 	b	5cec <_vfiprintf_r+0x10ac>
    6754:	b940b3e0 	ldr	w0, [sp, #176]
    6758:	f94037e1 	ldr	x1, [sp, #104]
    675c:	11002000 	add	w0, w0, #0x8
    6760:	7100001f 	cmp	w0, #0x0
    6764:	5400010d 	b.le	6784 <_vfiprintf_r+0x1b44>
    6768:	91002c21 	add	x1, x1, #0xb
    676c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    6770:	17ffffca 	b	6698 <_vfiprintf_r+0x1a58>
    6774:	79402320 	ldrh	w0, [x25, #16]
    6778:	321a0000 	orr	w0, w0, #0x40
    677c:	79002320 	strh	w0, [x25, #16]
    6780:	17fffa37 	b	505c <_vfiprintf_r+0x41c>
    6784:	f94043e4 	ldr	x4, [sp, #128]
    6788:	b940b3e3 	ldr	w3, [sp, #176]
    678c:	8b23c083 	add	x3, x4, w3, sxtw
    6790:	f90037e3 	str	x3, [sp, #104]
    6794:	17ffffc1 	b	6698 <_vfiprintf_r+0x1a58>
    6798:	d503201f 	nop
    679c:	d503201f 	nop

00000000000067a0 <vfiprintf>:
    67a0:	aa0203e4 	mov	x4, x2
    67a4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    67a8:	d0000023 	adrp	x3, c000 <_reclaim_reent+0xc0>
    67ac:	910003fd 	mov	x29, sp
    67b0:	a9401c46 	ldp	x6, x7, [x2]
    67b4:	aa0003e8 	mov	x8, x0
    67b8:	a9411484 	ldp	x4, x5, [x4, #16]
    67bc:	aa0103e2 	mov	x2, x1
    67c0:	f947c060 	ldr	x0, [x3, #3968]
    67c4:	aa0803e1 	mov	x1, x8
    67c8:	910043e3 	add	x3, sp, #0x10
    67cc:	a9011fe6 	stp	x6, x7, [sp, #16]
    67d0:	a90217e4 	stp	x4, x5, [sp, #32]
    67d4:	97fff91b 	bl	4c40 <_vfiprintf_r>
    67d8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    67dc:	d65f03c0 	ret

00000000000067e0 <__sbprintf>:
    67e0:	d11403ff 	sub	sp, sp, #0x500
    67e4:	52808005 	mov	w5, #0x400                 	// #1024
    67e8:	910403e6 	add	x6, sp, #0x100
    67ec:	a9007bfd 	stp	x29, x30, [sp]
    67f0:	910003fd 	mov	x29, sp
    67f4:	a90153f3 	stp	x19, x20, [sp, #16]
    67f8:	aa0103f3 	mov	x19, x1
    67fc:	aa0303e1 	mov	x1, x3
    6800:	9100c3e3 	add	x3, sp, #0x30
    6804:	f9002be6 	str	x6, [sp, #80]
    6808:	79402264 	ldrh	w4, [x19, #16]
    680c:	a9403c2e 	ldp	x14, x15, [x1]
    6810:	121e7884 	and	w4, w4, #0xfffffffd
    6814:	7940266c 	ldrh	w12, [x19, #18]
    6818:	a9412428 	ldp	x8, x9, [x1, #16]
    681c:	910143e1 	add	x1, sp, #0x50
    6820:	f9401a6b 	ldr	x11, [x19, #48]
    6824:	b9005fe5 	str	w5, [sp, #92]
    6828:	f940226a 	ldr	x10, [x19, #64]
    682c:	a9033fee 	stp	x14, x15, [sp, #48]
    6830:	b940ae67 	ldr	w7, [x19, #172]
    6834:	f90013f5 	str	x21, [sp, #32]
    6838:	aa0003f5 	mov	x21, x0
    683c:	a90427e8 	stp	x8, x9, [sp, #64]
    6840:	7900c3e4 	strh	w4, [sp, #96]
    6844:	7900c7ec 	strh	w12, [sp, #98]
    6848:	f90037e6 	str	x6, [sp, #104]
    684c:	b90073e5 	str	w5, [sp, #112]
    6850:	b9007bff 	str	wzr, [sp, #120]
    6854:	f90043eb 	str	x11, [sp, #128]
    6858:	f9004bea 	str	x10, [sp, #144]
    685c:	b900ffe7 	str	w7, [sp, #252]
    6860:	97fff8f8 	bl	4c40 <_vfiprintf_r>
    6864:	2a0003f4 	mov	w20, w0
    6868:	37f800c0 	tbnz	w0, #31, 6880 <__sbprintf+0xa0>
    686c:	910143e1 	add	x1, sp, #0x50
    6870:	aa1503e0 	mov	x0, x21
    6874:	9400017b 	bl	6e60 <_fflush_r>
    6878:	7100001f 	cmp	w0, #0x0
    687c:	5a9f0294 	csinv	w20, w20, wzr, eq  // eq = none
    6880:	7940c3e0 	ldrh	w0, [sp, #96]
    6884:	36300080 	tbz	w0, #6, 6894 <__sbprintf+0xb4>
    6888:	79402260 	ldrh	w0, [x19, #16]
    688c:	321a0000 	orr	w0, w0, #0x40
    6890:	79002260 	strh	w0, [x19, #16]
    6894:	2a1403e0 	mov	w0, w20
    6898:	a9407bfd 	ldp	x29, x30, [sp]
    689c:	a94153f3 	ldp	x19, x20, [sp, #16]
    68a0:	f94013f5 	ldr	x21, [sp, #32]
    68a4:	911403ff 	add	sp, sp, #0x500
    68a8:	d65f03c0 	ret
    68ac:	d503201f 	nop

00000000000068b0 <_wcrtomb_r>:
    68b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    68b4:	91055004 	add	x4, x0, #0x154
    68b8:	910003fd 	mov	x29, sp
    68bc:	a90153f3 	stp	x19, x20, [sp, #16]
    68c0:	aa0303f3 	mov	x19, x3
    68c4:	f100027f 	cmp	x19, #0x0
    68c8:	f0000023 	adrp	x3, d000 <impure_data+0x78>
    68cc:	9a930093 	csel	x19, x4, x19, eq  // eq = none
    68d0:	aa0003f4 	mov	x20, x0
    68d4:	f943e864 	ldr	x4, [x3, #2000]
    68d8:	aa1303e3 	mov	x3, x19
    68dc:	b4000121 	cbz	x1, 6900 <_wcrtomb_r+0x50>
    68e0:	d63f0080 	blr	x4
    68e4:	2a0003e1 	mov	w1, w0
    68e8:	93407c20 	sxtw	x0, w1
    68ec:	3100043f 	cmn	w1, #0x1
    68f0:	54000160 	b.eq	691c <_wcrtomb_r+0x6c>  // b.none
    68f4:	a94153f3 	ldp	x19, x20, [sp, #16]
    68f8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    68fc:	d65f03c0 	ret
    6900:	910083e1 	add	x1, sp, #0x20
    6904:	52800002 	mov	w2, #0x0                   	// #0
    6908:	d63f0080 	blr	x4
    690c:	2a0003e1 	mov	w1, w0
    6910:	93407c20 	sxtw	x0, w1
    6914:	3100043f 	cmn	w1, #0x1
    6918:	54fffee1 	b.ne	68f4 <_wcrtomb_r+0x44>  // b.any
    691c:	b900027f 	str	wzr, [x19]
    6920:	52801141 	mov	w1, #0x8a                  	// #138
    6924:	b9000281 	str	w1, [x20]
    6928:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    692c:	a94153f3 	ldp	x19, x20, [sp, #16]
    6930:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6934:	d65f03c0 	ret
    6938:	d503201f 	nop
    693c:	d503201f 	nop

0000000000006940 <wcrtomb>:
    6940:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6944:	d0000024 	adrp	x4, c000 <_reclaim_reent+0xc0>
    6948:	f0000023 	adrp	x3, d000 <impure_data+0x78>
    694c:	910003fd 	mov	x29, sp
    6950:	a90153f3 	stp	x19, x20, [sp, #16]
    6954:	f100005f 	cmp	x2, #0x0
    6958:	f947c094 	ldr	x20, [x4, #3968]
    695c:	91055284 	add	x4, x20, #0x154
    6960:	9a820093 	csel	x19, x4, x2, eq  // eq = none
    6964:	f943e864 	ldr	x4, [x3, #2000]
    6968:	b40001a0 	cbz	x0, 699c <wcrtomb+0x5c>
    696c:	2a0103e2 	mov	w2, w1
    6970:	aa0003e1 	mov	x1, x0
    6974:	aa1303e3 	mov	x3, x19
    6978:	aa1403e0 	mov	x0, x20
    697c:	d63f0080 	blr	x4
    6980:	2a0003e1 	mov	w1, w0
    6984:	93407c20 	sxtw	x0, w1
    6988:	3100043f 	cmn	w1, #0x1
    698c:	540001a0 	b.eq	69c0 <wcrtomb+0x80>  // b.none
    6990:	a94153f3 	ldp	x19, x20, [sp, #16]
    6994:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6998:	d65f03c0 	ret
    699c:	910083e1 	add	x1, sp, #0x20
    69a0:	aa1303e3 	mov	x3, x19
    69a4:	aa1403e0 	mov	x0, x20
    69a8:	52800002 	mov	w2, #0x0                   	// #0
    69ac:	d63f0080 	blr	x4
    69b0:	2a0003e1 	mov	w1, w0
    69b4:	93407c20 	sxtw	x0, w1
    69b8:	3100043f 	cmn	w1, #0x1
    69bc:	54fffea1 	b.ne	6990 <wcrtomb+0x50>  // b.any
    69c0:	b900027f 	str	wzr, [x19]
    69c4:	52801141 	mov	w1, #0x8a                  	// #138
    69c8:	b9000281 	str	w1, [x20]
    69cc:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    69d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    69d4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    69d8:	d65f03c0 	ret
    69dc:	d503201f 	nop

00000000000069e0 <_wcsrtombs_r>:
    69e0:	aa0403e5 	mov	x5, x4
    69e4:	aa0303e4 	mov	x4, x3
    69e8:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    69ec:	14001315 	b	b640 <_wcsnrtombs_r>

00000000000069f0 <wcsrtombs>:
    69f0:	d0000026 	adrp	x6, c000 <_reclaim_reent+0xc0>
    69f4:	aa0003e4 	mov	x4, x0
    69f8:	aa0103e5 	mov	x5, x1
    69fc:	aa0403e1 	mov	x1, x4
    6a00:	f947c0c0 	ldr	x0, [x6, #3968]
    6a04:	aa0203e4 	mov	x4, x2
    6a08:	aa0503e2 	mov	x2, x5
    6a0c:	aa0303e5 	mov	x5, x3
    6a10:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    6a14:	1400130b 	b	b640 <_wcsnrtombs_r>
    6a18:	d503201f 	nop
    6a1c:	d503201f 	nop

0000000000006a20 <__swsetup_r>:
    6a20:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    6a24:	d0000022 	adrp	x2, c000 <_reclaim_reent+0xc0>
    6a28:	910003fd 	mov	x29, sp
    6a2c:	a90153f3 	stp	x19, x20, [sp, #16]
    6a30:	aa0003f4 	mov	x20, x0
    6a34:	aa0103f3 	mov	x19, x1
    6a38:	f947c040 	ldr	x0, [x2, #3968]
    6a3c:	b4000060 	cbz	x0, 6a48 <__swsetup_r+0x28>
    6a40:	b9405001 	ldr	w1, [x0, #80]
    6a44:	340004e1 	cbz	w1, 6ae0 <__swsetup_r+0xc0>
    6a48:	79c02262 	ldrsh	w2, [x19, #16]
    6a4c:	12003c41 	and	w1, w2, #0xffff
    6a50:	36180502 	tbz	w2, #3, 6af0 <__swsetup_r+0xd0>
    6a54:	f9400e63 	ldr	x3, [x19, #24]
    6a58:	b40002c3 	cbz	x3, 6ab0 <__swsetup_r+0x90>
    6a5c:	36000141 	tbz	w1, #0, 6a84 <__swsetup_r+0x64>
    6a60:	b9402260 	ldr	w0, [x19, #32]
    6a64:	b9000e7f 	str	wzr, [x19, #12]
    6a68:	4b0003e0 	neg	w0, w0
    6a6c:	b9002a60 	str	w0, [x19, #40]
    6a70:	52800000 	mov	w0, #0x0                   	// #0
    6a74:	b4000143 	cbz	x3, 6a9c <__swsetup_r+0x7c>
    6a78:	a94153f3 	ldp	x19, x20, [sp, #16]
    6a7c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6a80:	d65f03c0 	ret
    6a84:	52800000 	mov	w0, #0x0                   	// #0
    6a88:	37080041 	tbnz	w1, #1, 6a90 <__swsetup_r+0x70>
    6a8c:	b9402260 	ldr	w0, [x19, #32]
    6a90:	b9000e60 	str	w0, [x19, #12]
    6a94:	52800000 	mov	w0, #0x0                   	// #0
    6a98:	b5ffff03 	cbnz	x3, 6a78 <__swsetup_r+0x58>
    6a9c:	363ffee1 	tbz	w1, #7, 6a78 <__swsetup_r+0x58>
    6aa0:	321a0042 	orr	w2, w2, #0x40
    6aa4:	12800000 	mov	w0, #0xffffffff            	// #-1
    6aa8:	79002262 	strh	w2, [x19, #16]
    6aac:	17fffff3 	b	6a78 <__swsetup_r+0x58>
    6ab0:	52805000 	mov	w0, #0x280                 	// #640
    6ab4:	0a000020 	and	w0, w1, w0
    6ab8:	7108001f 	cmp	w0, #0x200
    6abc:	54fffd00 	b.eq	6a5c <__swsetup_r+0x3c>  // b.none
    6ac0:	aa1303e1 	mov	x1, x19
    6ac4:	aa1403e0 	mov	x0, x20
    6ac8:	9400085a 	bl	8c30 <__smakebuf_r>
    6acc:	79c02262 	ldrsh	w2, [x19, #16]
    6ad0:	f9400e63 	ldr	x3, [x19, #24]
    6ad4:	12003c41 	and	w1, w2, #0xffff
    6ad8:	3607fd61 	tbz	w1, #0, 6a84 <__swsetup_r+0x64>
    6adc:	17ffffe1 	b	6a60 <__swsetup_r+0x40>
    6ae0:	940001e0 	bl	7260 <__sinit>
    6ae4:	79c02262 	ldrsh	w2, [x19, #16]
    6ae8:	12003c41 	and	w1, w2, #0xffff
    6aec:	371ffb42 	tbnz	w2, #3, 6a54 <__swsetup_r+0x34>
    6af0:	362002e1 	tbz	w1, #4, 6b4c <__swsetup_r+0x12c>
    6af4:	371000e1 	tbnz	w1, #2, 6b10 <__swsetup_r+0xf0>
    6af8:	f9400e63 	ldr	x3, [x19, #24]
    6afc:	321d0042 	orr	w2, w2, #0x8
    6b00:	79002262 	strh	w2, [x19, #16]
    6b04:	12003c41 	and	w1, w2, #0xffff
    6b08:	b5fffaa3 	cbnz	x3, 6a5c <__swsetup_r+0x3c>
    6b0c:	17ffffe9 	b	6ab0 <__swsetup_r+0x90>
    6b10:	f9402e61 	ldr	x1, [x19, #88]
    6b14:	b4000101 	cbz	x1, 6b34 <__swsetup_r+0x114>
    6b18:	9101d260 	add	x0, x19, #0x74
    6b1c:	eb00003f 	cmp	x1, x0
    6b20:	54000080 	b.eq	6b30 <__swsetup_r+0x110>  // b.none
    6b24:	aa1403e0 	mov	x0, x20
    6b28:	940002a6 	bl	75c0 <_free_r>
    6b2c:	79c02262 	ldrsh	w2, [x19, #16]
    6b30:	f9002e7f 	str	xzr, [x19, #88]
    6b34:	f9400e63 	ldr	x3, [x19, #24]
    6b38:	12800480 	mov	w0, #0xffffffdb            	// #-37
    6b3c:	0a000042 	and	w2, w2, w0
    6b40:	f9000263 	str	x3, [x19]
    6b44:	b9000a7f 	str	wzr, [x19, #8]
    6b48:	17ffffed 	b	6afc <__swsetup_r+0xdc>
    6b4c:	52800120 	mov	w0, #0x9                   	// #9
    6b50:	b9000280 	str	w0, [x20]
    6b54:	321a0042 	orr	w2, w2, #0x40
    6b58:	12800000 	mov	w0, #0xffffffff            	// #-1
    6b5c:	79002262 	strh	w2, [x19, #16]
    6b60:	17ffffc6 	b	6a78 <__swsetup_r+0x58>
    6b64:	d503201f 	nop
    6b68:	d503201f 	nop
    6b6c:	d503201f 	nop

0000000000006b70 <abort>:
    6b70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    6b74:	528000c0 	mov	w0, #0x6                   	// #6
    6b78:	910003fd 	mov	x29, sp
    6b7c:	94000ec1 	bl	a680 <raise>
    6b80:	52800020 	mov	w0, #0x1                   	// #1
    6b84:	97fff5bf 	bl	4280 <_exit>
    6b88:	d503201f 	nop
    6b8c:	d503201f 	nop

0000000000006b90 <__register_exitproc>:
    6b90:	d0000024 	adrp	x4, c000 <_reclaim_reent+0xc0>
    6b94:	f9444c84 	ldr	x4, [x4, #2200]
    6b98:	f940fc85 	ldr	x5, [x4, #504]
    6b9c:	b4000405 	cbz	x5, 6c1c <__register_exitproc+0x8c>
    6ba0:	b94008a4 	ldr	w4, [x5, #8]
    6ba4:	71007c9f 	cmp	w4, #0x1f
    6ba8:	5400040c 	b.gt	6c28 <__register_exitproc+0x98>
    6bac:	93407c86 	sxtw	x6, w4
    6bb0:	350000e0 	cbnz	w0, 6bcc <__register_exitproc+0x3c>
    6bb4:	910008c2 	add	x2, x6, #0x2
    6bb8:	11000484 	add	w4, w4, #0x1
    6bbc:	b90008a4 	str	w4, [x5, #8]
    6bc0:	52800000 	mov	w0, #0x0                   	// #0
    6bc4:	f82278a1 	str	x1, [x5, x2, lsl #3]
    6bc8:	d65f03c0 	ret
    6bcc:	8b24cca7 	add	x7, x5, w4, sxtw #3
    6bd0:	52800028 	mov	w8, #0x1                   	// #1
    6bd4:	1ac42108 	lsl	w8, w8, w4
    6bd8:	93407c86 	sxtw	x6, w4
    6bdc:	f90088e2 	str	x2, [x7, #272]
    6be0:	b94310a2 	ldr	w2, [x5, #784]
    6be4:	2a080042 	orr	w2, w2, w8
    6be8:	b90310a2 	str	w2, [x5, #784]
    6bec:	f90108e3 	str	x3, [x7, #528]
    6bf0:	7100081f 	cmp	w0, #0x2
    6bf4:	54fffe01 	b.ne	6bb4 <__register_exitproc+0x24>  // b.any
    6bf8:	b94314a0 	ldr	w0, [x5, #788]
    6bfc:	910008c2 	add	x2, x6, #0x2
    6c00:	11000484 	add	w4, w4, #0x1
    6c04:	b90008a4 	str	w4, [x5, #8]
    6c08:	2a080008 	orr	w8, w0, w8
    6c0c:	b90314a8 	str	w8, [x5, #788]
    6c10:	52800000 	mov	w0, #0x0                   	// #0
    6c14:	f82278a1 	str	x1, [x5, x2, lsl #3]
    6c18:	17ffffec 	b	6bc8 <__register_exitproc+0x38>
    6c1c:	91080085 	add	x5, x4, #0x200
    6c20:	f900fc85 	str	x5, [x4, #504]
    6c24:	17ffffdf 	b	6ba0 <__register_exitproc+0x10>
    6c28:	12800000 	mov	w0, #0xffffffff            	// #-1
    6c2c:	d65f03c0 	ret

0000000000006c30 <__sflush_r>:
    6c30:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6c34:	910003fd 	mov	x29, sp
    6c38:	a9025bf5 	stp	x21, x22, [sp, #32]
    6c3c:	aa0003f6 	mov	x22, x0
    6c40:	79c02020 	ldrsh	w0, [x1, #16]
    6c44:	a90153f3 	stp	x19, x20, [sp, #16]
    6c48:	aa0103f3 	mov	x19, x1
    6c4c:	37180560 	tbnz	w0, #3, 6cf8 <__sflush_r+0xc8>
    6c50:	32150000 	orr	w0, w0, #0x800
    6c54:	79002020 	strh	w0, [x1, #16]
    6c58:	b9400821 	ldr	w1, [x1, #8]
    6c5c:	7100003f 	cmp	w1, #0x0
    6c60:	5400092d 	b.le	6d84 <__sflush_r+0x154>
    6c64:	f9402664 	ldr	x4, [x19, #72]
    6c68:	b4000944 	cbz	x4, 6d90 <__sflush_r+0x160>
    6c6c:	b94002d4 	ldr	w20, [x22]
    6c70:	12003c01 	and	w1, w0, #0xffff
    6c74:	b90002df 	str	wzr, [x22]
    6c78:	37600960 	tbnz	w0, #12, 6da4 <__sflush_r+0x174>
    6c7c:	f9401a61 	ldr	x1, [x19, #48]
    6c80:	d2800002 	mov	x2, #0x0                   	// #0
    6c84:	aa1603e0 	mov	x0, x22
    6c88:	52800023 	mov	w3, #0x1                   	// #1
    6c8c:	d63f0080 	blr	x4
    6c90:	aa0003e2 	mov	x2, x0
    6c94:	b100041f 	cmn	x0, #0x1
    6c98:	54000d00 	b.eq	6e38 <__sflush_r+0x208>  // b.none
    6c9c:	79402261 	ldrh	w1, [x19, #16]
    6ca0:	f9402664 	ldr	x4, [x19, #72]
    6ca4:	361000e1 	tbz	w1, #2, 6cc0 <__sflush_r+0x90>
    6ca8:	f9402e60 	ldr	x0, [x19, #88]
    6cac:	b9800a61 	ldrsw	x1, [x19, #8]
    6cb0:	cb010042 	sub	x2, x2, x1
    6cb4:	b4000060 	cbz	x0, 6cc0 <__sflush_r+0x90>
    6cb8:	b9807260 	ldrsw	x0, [x19, #112]
    6cbc:	cb000042 	sub	x2, x2, x0
    6cc0:	f9401a61 	ldr	x1, [x19, #48]
    6cc4:	aa1603e0 	mov	x0, x22
    6cc8:	52800003 	mov	w3, #0x0                   	// #0
    6ccc:	d63f0080 	blr	x4
    6cd0:	b100041f 	cmn	x0, #0x1
    6cd4:	540006c1 	b.ne	6dac <__sflush_r+0x17c>  // b.any
    6cd8:	b94002c2 	ldr	w2, [x22]
    6cdc:	7100745f 	cmp	w2, #0x1d
    6ce0:	54000929 	b.ls	6e04 <__sflush_r+0x1d4>  // b.plast
    6ce4:	79c02261 	ldrsh	w1, [x19, #16]
    6ce8:	321a0021 	orr	w1, w1, #0x40
    6cec:	12800000 	mov	w0, #0xffffffff            	// #-1
    6cf0:	79002261 	strh	w1, [x19, #16]
    6cf4:	14000028 	b	6d94 <__sflush_r+0x164>
    6cf8:	f9400c35 	ldr	x21, [x1, #24]
    6cfc:	b40004b5 	cbz	x21, 6d90 <__sflush_r+0x160>
    6d00:	12003c01 	and	w1, w0, #0xffff
    6d04:	52800002 	mov	w2, #0x0                   	// #0
    6d08:	f9400260 	ldr	x0, [x19]
    6d0c:	f9000275 	str	x21, [x19]
    6d10:	cb150000 	sub	x0, x0, x21
    6d14:	2a0003f4 	mov	w20, w0
    6d18:	f240043f 	tst	x1, #0x3
    6d1c:	54000041 	b.ne	6d24 <__sflush_r+0xf4>  // b.any
    6d20:	b9402262 	ldr	w2, [x19, #32]
    6d24:	b9000e62 	str	w2, [x19, #12]
    6d28:	7100001f 	cmp	w0, #0x0
    6d2c:	540000ac 	b.gt	6d40 <__sflush_r+0x110>
    6d30:	14000018 	b	6d90 <__sflush_r+0x160>
    6d34:	8b20c2b5 	add	x21, x21, w0, sxtw
    6d38:	7100029f 	cmp	w20, #0x0
    6d3c:	540002ad 	b.le	6d90 <__sflush_r+0x160>
    6d40:	f9401a61 	ldr	x1, [x19, #48]
    6d44:	2a1403e3 	mov	w3, w20
    6d48:	f9402264 	ldr	x4, [x19, #64]
    6d4c:	aa1503e2 	mov	x2, x21
    6d50:	aa1603e0 	mov	x0, x22
    6d54:	d63f0080 	blr	x4
    6d58:	4b000294 	sub	w20, w20, w0
    6d5c:	7100001f 	cmp	w0, #0x0
    6d60:	54fffeac 	b.gt	6d34 <__sflush_r+0x104>
    6d64:	79402261 	ldrh	w1, [x19, #16]
    6d68:	12800000 	mov	w0, #0xffffffff            	// #-1
    6d6c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6d70:	321a0021 	orr	w1, w1, #0x40
    6d74:	79002261 	strh	w1, [x19, #16]
    6d78:	a94153f3 	ldp	x19, x20, [sp, #16]
    6d7c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6d80:	d65f03c0 	ret
    6d84:	b9407261 	ldr	w1, [x19, #112]
    6d88:	7100003f 	cmp	w1, #0x0
    6d8c:	54fff6cc 	b.gt	6c64 <__sflush_r+0x34>
    6d90:	52800000 	mov	w0, #0x0                   	// #0
    6d94:	a94153f3 	ldp	x19, x20, [sp, #16]
    6d98:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6d9c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6da0:	d65f03c0 	ret
    6da4:	f9404a62 	ldr	x2, [x19, #144]
    6da8:	17ffffbf 	b	6ca4 <__sflush_r+0x74>
    6dac:	79c02261 	ldrsh	w1, [x19, #16]
    6db0:	f9400e62 	ldr	x2, [x19, #24]
    6db4:	12147821 	and	w1, w1, #0xfffff7ff
    6db8:	f9000262 	str	x2, [x19]
    6dbc:	b9000a7f 	str	wzr, [x19, #8]
    6dc0:	79002261 	strh	w1, [x19, #16]
    6dc4:	36600041 	tbz	w1, #12, 6dcc <__sflush_r+0x19c>
    6dc8:	f9004a60 	str	x0, [x19, #144]
    6dcc:	f9402e61 	ldr	x1, [x19, #88]
    6dd0:	b90002d4 	str	w20, [x22]
    6dd4:	b4fffde1 	cbz	x1, 6d90 <__sflush_r+0x160>
    6dd8:	9101d260 	add	x0, x19, #0x74
    6ddc:	eb00003f 	cmp	x1, x0
    6de0:	54000060 	b.eq	6dec <__sflush_r+0x1bc>  // b.none
    6de4:	aa1603e0 	mov	x0, x22
    6de8:	940001f6 	bl	75c0 <_free_r>
    6dec:	f9002e7f 	str	xzr, [x19, #88]
    6df0:	52800000 	mov	w0, #0x0                   	// #0
    6df4:	a94153f3 	ldp	x19, x20, [sp, #16]
    6df8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6dfc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6e00:	d65f03c0 	ret
    6e04:	d2800023 	mov	x3, #0x1                   	// #1
    6e08:	79c02261 	ldrsh	w1, [x19, #16]
    6e0c:	f2a40803 	movk	x3, #0x2040, lsl #16
    6e10:	9ac22463 	lsr	x3, x3, x2
    6e14:	3607f6a3 	tbz	w3, #0, 6ce8 <__sflush_r+0xb8>
    6e18:	f9400e63 	ldr	x3, [x19, #24]
    6e1c:	12147821 	and	w1, w1, #0xfffff7ff
    6e20:	f9000263 	str	x3, [x19]
    6e24:	b9000a7f 	str	wzr, [x19, #8]
    6e28:	79002261 	strh	w1, [x19, #16]
    6e2c:	3667fd01 	tbz	w1, #12, 6dcc <__sflush_r+0x19c>
    6e30:	35fffce2 	cbnz	w2, 6dcc <__sflush_r+0x19c>
    6e34:	17ffffe5 	b	6dc8 <__sflush_r+0x198>
    6e38:	b94002c0 	ldr	w0, [x22]
    6e3c:	34fff300 	cbz	w0, 6c9c <__sflush_r+0x6c>
    6e40:	7100741f 	cmp	w0, #0x1d
    6e44:	7a561804 	ccmp	w0, #0x16, #0x4, ne  // ne = any
    6e48:	54fff8e1 	b.ne	6d64 <__sflush_r+0x134>  // b.any
    6e4c:	52800000 	mov	w0, #0x0                   	// #0
    6e50:	b90002d4 	str	w20, [x22]
    6e54:	17ffffd0 	b	6d94 <__sflush_r+0x164>
    6e58:	d503201f 	nop
    6e5c:	d503201f 	nop

0000000000006e60 <_fflush_r>:
    6e60:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6e64:	910003fd 	mov	x29, sp
    6e68:	f9000bf3 	str	x19, [sp, #16]
    6e6c:	aa0003f3 	mov	x19, x0
    6e70:	b4000060 	cbz	x0, 6e7c <_fflush_r+0x1c>
    6e74:	b9405002 	ldr	w2, [x0, #80]
    6e78:	340000e2 	cbz	w2, 6e94 <_fflush_r+0x34>
    6e7c:	79c02020 	ldrsh	w0, [x1, #16]
    6e80:	35000140 	cbnz	w0, 6ea8 <_fflush_r+0x48>
    6e84:	52800000 	mov	w0, #0x0                   	// #0
    6e88:	f9400bf3 	ldr	x19, [sp, #16]
    6e8c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6e90:	d65f03c0 	ret
    6e94:	f90017e1 	str	x1, [sp, #40]
    6e98:	940000f2 	bl	7260 <__sinit>
    6e9c:	f94017e1 	ldr	x1, [sp, #40]
    6ea0:	79c02020 	ldrsh	w0, [x1, #16]
    6ea4:	34ffff00 	cbz	w0, 6e84 <_fflush_r+0x24>
    6ea8:	aa1303e0 	mov	x0, x19
    6eac:	f9400bf3 	ldr	x19, [sp, #16]
    6eb0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6eb4:	17ffff5f 	b	6c30 <__sflush_r>
    6eb8:	d503201f 	nop
    6ebc:	d503201f 	nop

0000000000006ec0 <fflush>:
    6ec0:	b4000340 	cbz	x0, 6f28 <fflush+0x68>
    6ec4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    6ec8:	910003fd 	mov	x29, sp
    6ecc:	a90153f3 	stp	x19, x20, [sp, #16]
    6ed0:	aa0003f3 	mov	x19, x0
    6ed4:	d0000020 	adrp	x0, c000 <_reclaim_reent+0xc0>
    6ed8:	f947c014 	ldr	x20, [x0, #3968]
    6edc:	b4000074 	cbz	x20, 6ee8 <fflush+0x28>
    6ee0:	b9405280 	ldr	w0, [x20, #80]
    6ee4:	34000180 	cbz	w0, 6f14 <fflush+0x54>
    6ee8:	79c02260 	ldrsh	w0, [x19, #16]
    6eec:	350000a0 	cbnz	w0, 6f00 <fflush+0x40>
    6ef0:	52800000 	mov	w0, #0x0                   	// #0
    6ef4:	a94153f3 	ldp	x19, x20, [sp, #16]
    6ef8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6efc:	d65f03c0 	ret
    6f00:	aa1303e1 	mov	x1, x19
    6f04:	aa1403e0 	mov	x0, x20
    6f08:	a94153f3 	ldp	x19, x20, [sp, #16]
    6f0c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6f10:	17ffff48 	b	6c30 <__sflush_r>
    6f14:	aa1403e0 	mov	x0, x20
    6f18:	940000d2 	bl	7260 <__sinit>
    6f1c:	79c02260 	ldrsh	w0, [x19, #16]
    6f20:	34fffe80 	cbz	w0, 6ef0 <fflush+0x30>
    6f24:	17fffff7 	b	6f00 <fflush+0x40>
    6f28:	d0000020 	adrp	x0, c000 <_reclaim_reent+0xc0>
    6f2c:	90000001 	adrp	x1, 6000 <_vfiprintf_r+0x13c0>
    6f30:	91398021 	add	x1, x1, #0xe60
    6f34:	f9444c00 	ldr	x0, [x0, #2200]
    6f38:	140003b2 	b	7e00 <_fwalk_reent>
    6f3c:	d503201f 	nop

0000000000006f40 <__fp_lock>:
    6f40:	52800000 	mov	w0, #0x0                   	// #0
    6f44:	d65f03c0 	ret
    6f48:	d503201f 	nop
    6f4c:	d503201f 	nop

0000000000006f50 <_cleanup_r>:
    6f50:	b0000021 	adrp	x1, b000 <strncasecmp+0x60>
    6f54:	912d8021 	add	x1, x1, #0xb60
    6f58:	140003aa 	b	7e00 <_fwalk_reent>
    6f5c:	d503201f 	nop

0000000000006f60 <__fp_unlock>:
    6f60:	52800000 	mov	w0, #0x0                   	// #0
    6f64:	d65f03c0 	ret
    6f68:	d503201f 	nop
    6f6c:	d503201f 	nop

0000000000006f70 <__sinit.part.0>:
    6f70:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    6f74:	52800065 	mov	w5, #0x3                   	// #3
    6f78:	90000001 	adrp	x1, 6000 <_vfiprintf_r+0x13c0>
    6f7c:	910003fd 	mov	x29, sp
    6f80:	a9025bf5 	stp	x21, x22, [sp, #32]
    6f84:	aa0003f5 	mov	x21, x0
    6f88:	9114e2a4 	add	x4, x21, #0x538
    6f8c:	a90153f3 	stp	x19, x20, [sp, #16]
    6f90:	913d4020 	add	x0, x1, #0xf50
    6f94:	52800083 	mov	w3, #0x4                   	// #4
    6f98:	f94006b3 	ldr	x19, [x21, #8]
    6f9c:	a90363f7 	stp	x23, x24, [sp, #48]
    6fa0:	d2800102 	mov	x2, #0x8                   	// #8
    6fa4:	f90023f9 	str	x25, [sp, #64]
    6fa8:	52800001 	mov	w1, #0x0                   	// #0
    6fac:	f9002ea0 	str	x0, [x21, #88]
    6fb0:	91029260 	add	x0, x19, #0xa4
    6fb4:	f90292bf 	str	xzr, [x21, #1312]
    6fb8:	90000038 	adrp	x24, a000 <_realloc_r+0x180>
    6fbc:	b9052aa5 	str	w5, [x21, #1320]
    6fc0:	91270318 	add	x24, x24, #0x9c0
    6fc4:	f9029aa4 	str	x4, [x21, #1328]
    6fc8:	90000037 	adrp	x23, a000 <_realloc_r+0x180>
    6fcc:	a9007e7f 	stp	xzr, xzr, [x19]
    6fd0:	9128c2f7 	add	x23, x23, #0xa30
    6fd4:	90000036 	adrp	x22, a000 <_realloc_r+0x180>
    6fd8:	b9001263 	str	w3, [x19, #16]
    6fdc:	912a02d6 	add	x22, x22, #0xa80
    6fe0:	f9000e7f 	str	xzr, [x19, #24]
    6fe4:	90000039 	adrp	x25, a000 <_realloc_r+0x180>
    6fe8:	b900227f 	str	wzr, [x19, #32]
    6fec:	91258339 	add	x25, x25, #0x960
    6ff0:	b9002a7f 	str	wzr, [x19, #40]
    6ff4:	b900ae7f 	str	wzr, [x19, #172]
    6ff8:	97fff602 	bl	4800 <memset>
    6ffc:	f9400ab4 	ldr	x20, [x21, #16]
    7000:	52800123 	mov	w3, #0x9                   	// #9
    7004:	a9036673 	stp	x19, x25, [x19, #48]
    7008:	72a00023 	movk	w3, #0x1, lsl #16
    700c:	91029280 	add	x0, x20, #0xa4
    7010:	a9045e78 	stp	x24, x23, [x19, #64]
    7014:	d2800102 	mov	x2, #0x8                   	// #8
    7018:	52800001 	mov	w1, #0x0                   	// #0
    701c:	f9002a76 	str	x22, [x19, #80]
    7020:	a9007e9f 	stp	xzr, xzr, [x20]
    7024:	b9001283 	str	w3, [x20, #16]
    7028:	f9000e9f 	str	xzr, [x20, #24]
    702c:	b900229f 	str	wzr, [x20, #32]
    7030:	b9002a9f 	str	wzr, [x20, #40]
    7034:	b900ae9f 	str	wzr, [x20, #172]
    7038:	97fff5f2 	bl	4800 <memset>
    703c:	f9400eb3 	ldr	x19, [x21, #24]
    7040:	52800243 	mov	w3, #0x12                  	// #18
    7044:	a9036694 	stp	x20, x25, [x20, #48]
    7048:	72a00043 	movk	w3, #0x2, lsl #16
    704c:	91029260 	add	x0, x19, #0xa4
    7050:	a9045e98 	stp	x24, x23, [x20, #64]
    7054:	d2800102 	mov	x2, #0x8                   	// #8
    7058:	52800001 	mov	w1, #0x0                   	// #0
    705c:	f9002a96 	str	x22, [x20, #80]
    7060:	a9007e7f 	stp	xzr, xzr, [x19]
    7064:	b9001263 	str	w3, [x19, #16]
    7068:	f9000e7f 	str	xzr, [x19, #24]
    706c:	b900227f 	str	wzr, [x19, #32]
    7070:	b9002a7f 	str	wzr, [x19, #40]
    7074:	b900ae7f 	str	wzr, [x19, #172]
    7078:	97fff5e2 	bl	4800 <memset>
    707c:	a9036673 	stp	x19, x25, [x19, #48]
    7080:	52800020 	mov	w0, #0x1                   	// #1
    7084:	a9045e78 	stp	x24, x23, [x19, #64]
    7088:	f9002a76 	str	x22, [x19, #80]
    708c:	a94153f3 	ldp	x19, x20, [sp, #16]
    7090:	a94363f7 	ldp	x23, x24, [sp, #48]
    7094:	f94023f9 	ldr	x25, [sp, #64]
    7098:	b90052a0 	str	w0, [x21, #80]
    709c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    70a0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    70a4:	d65f03c0 	ret
    70a8:	d503201f 	nop
    70ac:	d503201f 	nop

00000000000070b0 <__sfmoreglue>:
    70b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    70b4:	52801602 	mov	w2, #0xb0                  	// #176
    70b8:	910003fd 	mov	x29, sp
    70bc:	a90153f3 	stp	x19, x20, [sp, #16]
    70c0:	51000434 	sub	w20, w1, #0x1
    70c4:	f90013f5 	str	x21, [sp, #32]
    70c8:	2a0103f5 	mov	w21, w1
    70cc:	9b227e94 	smull	x20, w20, w2
    70d0:	91032281 	add	x1, x20, #0xc8
    70d4:	9400075b 	bl	8e40 <_malloc_r>
    70d8:	aa0003f3 	mov	x19, x0
    70dc:	b4000100 	cbz	x0, 70fc <__sfmoreglue+0x4c>
    70e0:	91006000 	add	x0, x0, #0x18
    70e4:	f900027f 	str	xzr, [x19]
    70e8:	b9000a75 	str	w21, [x19, #8]
    70ec:	9102c282 	add	x2, x20, #0xb0
    70f0:	f9000a60 	str	x0, [x19, #16]
    70f4:	52800001 	mov	w1, #0x0                   	// #0
    70f8:	97fff5c2 	bl	4800 <memset>
    70fc:	aa1303e0 	mov	x0, x19
    7100:	a94153f3 	ldp	x19, x20, [sp, #16]
    7104:	f94013f5 	ldr	x21, [sp, #32]
    7108:	a8c37bfd 	ldp	x29, x30, [sp], #48
    710c:	d65f03c0 	ret

0000000000007110 <__sfp>:
    7110:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    7114:	b0000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    7118:	910003fd 	mov	x29, sp
    711c:	a90153f3 	stp	x19, x20, [sp, #16]
    7120:	f9444c34 	ldr	x20, [x1, #2200]
    7124:	f9001fe0 	str	x0, [sp, #56]
    7128:	f90013f5 	str	x21, [sp, #32]
    712c:	b9405280 	ldr	w0, [x20, #80]
    7130:	34000560 	cbz	w0, 71dc <__sfp+0xcc>
    7134:	91148294 	add	x20, x20, #0x520
    7138:	52800095 	mov	w21, #0x4                   	// #4
    713c:	b9400a80 	ldr	w0, [x20, #8]
    7140:	f9400a93 	ldr	x19, [x20, #16]
    7144:	7100001f 	cmp	w0, #0x0
    7148:	5400042d 	b.le	71cc <__sfp+0xbc>
    714c:	51000400 	sub	w0, w0, #0x1
    7150:	91000400 	add	x0, x0, #0x1
    7154:	8b000401 	add	x1, x0, x0, lsl #1
    7158:	d37ef421 	lsl	x1, x1, #2
    715c:	cb000021 	sub	x1, x1, x0
    7160:	8b011261 	add	x1, x19, x1, lsl #4
    7164:	14000004 	b	7174 <__sfp+0x64>
    7168:	9102c273 	add	x19, x19, #0xb0
    716c:	eb01027f 	cmp	x19, x1
    7170:	540002e0 	b.eq	71cc <__sfp+0xbc>  // b.none
    7174:	79c02260 	ldrsh	w0, [x19, #16]
    7178:	35ffff80 	cbnz	w0, 7168 <__sfp+0x58>
    717c:	129fffc0 	mov	w0, #0xffff0001            	// #-65535
    7180:	a9007e7f 	stp	xzr, xzr, [x19]
    7184:	d2800102 	mov	x2, #0x8                   	// #8
    7188:	b9001260 	str	w0, [x19, #16]
    718c:	52800001 	mov	w1, #0x0                   	// #0
    7190:	f9000e7f 	str	xzr, [x19, #24]
    7194:	91029260 	add	x0, x19, #0xa4
    7198:	b900227f 	str	wzr, [x19, #32]
    719c:	b9002a7f 	str	wzr, [x19, #40]
    71a0:	b900ae7f 	str	wzr, [x19, #172]
    71a4:	97fff597 	bl	4800 <memset>
    71a8:	f9002e7f 	str	xzr, [x19, #88]
    71ac:	b900627f 	str	wzr, [x19, #96]
    71b0:	f9003e7f 	str	xzr, [x19, #120]
    71b4:	b900827f 	str	wzr, [x19, #128]
    71b8:	aa1303e0 	mov	x0, x19
    71bc:	a94153f3 	ldp	x19, x20, [sp, #16]
    71c0:	f94013f5 	ldr	x21, [sp, #32]
    71c4:	a8c47bfd 	ldp	x29, x30, [sp], #64
    71c8:	d65f03c0 	ret
    71cc:	f9400293 	ldr	x19, [x20]
    71d0:	b40000d3 	cbz	x19, 71e8 <__sfp+0xd8>
    71d4:	aa1303f4 	mov	x20, x19
    71d8:	17ffffd9 	b	713c <__sfp+0x2c>
    71dc:	aa1403e0 	mov	x0, x20
    71e0:	97ffff64 	bl	6f70 <__sinit.part.0>
    71e4:	17ffffd4 	b	7134 <__sfp+0x24>
    71e8:	f9401fe0 	ldr	x0, [sp, #56]
    71ec:	d2805b01 	mov	x1, #0x2d8                 	// #728
    71f0:	94000714 	bl	8e40 <_malloc_r>
    71f4:	aa0003f3 	mov	x19, x0
    71f8:	b4000160 	cbz	x0, 7224 <__sfp+0x114>
    71fc:	91006000 	add	x0, x0, #0x18
    7200:	f900027f 	str	xzr, [x19]
    7204:	b9000a75 	str	w21, [x19, #8]
    7208:	d2805802 	mov	x2, #0x2c0                 	// #704
    720c:	f9000a60 	str	x0, [x19, #16]
    7210:	52800001 	mov	w1, #0x0                   	// #0
    7214:	97fff57b 	bl	4800 <memset>
    7218:	f9000293 	str	x19, [x20]
    721c:	aa1303f4 	mov	x20, x19
    7220:	17ffffc7 	b	713c <__sfp+0x2c>
    7224:	f9401fe1 	ldr	x1, [sp, #56]
    7228:	f900029f 	str	xzr, [x20]
    722c:	52800180 	mov	w0, #0xc                   	// #12
    7230:	b9000020 	str	w0, [x1]
    7234:	17ffffe1 	b	71b8 <__sfp+0xa8>
    7238:	d503201f 	nop
    723c:	d503201f 	nop

0000000000007240 <_cleanup>:
    7240:	b0000020 	adrp	x0, c000 <_reclaim_reent+0xc0>
    7244:	90000021 	adrp	x1, b000 <strncasecmp+0x60>
    7248:	912d8021 	add	x1, x1, #0xb60
    724c:	f9444c00 	ldr	x0, [x0, #2200]
    7250:	140002ec 	b	7e00 <_fwalk_reent>
    7254:	d503201f 	nop
    7258:	d503201f 	nop
    725c:	d503201f 	nop

0000000000007260 <__sinit>:
    7260:	b9405001 	ldr	w1, [x0, #80]
    7264:	34000041 	cbz	w1, 726c <__sinit+0xc>
    7268:	d65f03c0 	ret
    726c:	17ffff41 	b	6f70 <__sinit.part.0>

0000000000007270 <__sfp_lock_acquire>:
    7270:	d65f03c0 	ret
    7274:	d503201f 	nop
    7278:	d503201f 	nop
    727c:	d503201f 	nop

0000000000007280 <__sfp_lock_release>:
    7280:	d65f03c0 	ret
    7284:	d503201f 	nop
    7288:	d503201f 	nop
    728c:	d503201f 	nop

0000000000007290 <__sinit_lock_acquire>:
    7290:	d65f03c0 	ret
    7294:	d503201f 	nop
    7298:	d503201f 	nop
    729c:	d503201f 	nop

00000000000072a0 <__sinit_lock_release>:
    72a0:	d65f03c0 	ret
    72a4:	d503201f 	nop
    72a8:	d503201f 	nop
    72ac:	d503201f 	nop

00000000000072b0 <__fp_lock_all>:
    72b0:	b0000020 	adrp	x0, c000 <_reclaim_reent+0xc0>
    72b4:	f0ffffe1 	adrp	x1, 6000 <_vfiprintf_r+0x13c0>
    72b8:	913d0021 	add	x1, x1, #0xf40
    72bc:	f947c000 	ldr	x0, [x0, #3968]
    72c0:	140002a8 	b	7d60 <_fwalk>
    72c4:	d503201f 	nop
    72c8:	d503201f 	nop
    72cc:	d503201f 	nop

00000000000072d0 <__fp_unlock_all>:
    72d0:	b0000020 	adrp	x0, c000 <_reclaim_reent+0xc0>
    72d4:	f0ffffe1 	adrp	x1, 6000 <_vfiprintf_r+0x13c0>
    72d8:	913d8021 	add	x1, x1, #0xf60
    72dc:	f947c000 	ldr	x0, [x0, #3968]
    72e0:	140002a0 	b	7d60 <_fwalk>
    72e4:	d503201f 	nop
    72e8:	d503201f 	nop
    72ec:	d503201f 	nop

00000000000072f0 <__fputwc>:
    72f0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    72f4:	910003fd 	mov	x29, sp
    72f8:	a90153f3 	stp	x19, x20, [sp, #16]
    72fc:	aa0203f3 	mov	x19, x2
    7300:	a9025bf5 	stp	x21, x22, [sp, #32]
    7304:	2a0103f6 	mov	w22, w1
    7308:	a90363f7 	stp	x23, x24, [sp, #48]
    730c:	aa0003f7 	mov	x23, x0
    7310:	9400062c 	bl	8bc0 <__locale_mb_cur_max>
    7314:	7100041f 	cmp	w0, #0x1
    7318:	54000081 	b.ne	7328 <__fputwc+0x38>  // b.any
    731c:	510006c0 	sub	w0, w22, #0x1
    7320:	7103f81f 	cmp	w0, #0xfe
    7324:	54000509 	b.ls	73c4 <__fputwc+0xd4>  // b.plast
    7328:	91029263 	add	x3, x19, #0xa4
    732c:	2a1603e2 	mov	w2, w22
    7330:	910123e1 	add	x1, sp, #0x48
    7334:	aa1703e0 	mov	x0, x23
    7338:	97fffd5e 	bl	68b0 <_wcrtomb_r>
    733c:	aa0003f5 	mov	x21, x0
    7340:	b100041f 	cmn	x0, #0x1
    7344:	54000540 	b.eq	73ec <__fputwc+0xfc>  // b.none
    7348:	b4000460 	cbz	x0, 73d4 <__fputwc+0xe4>
    734c:	394123e1 	ldrb	w1, [sp, #72]
    7350:	910123f8 	add	x24, sp, #0x48
    7354:	d2800014 	mov	x20, #0x0                   	// #0
    7358:	14000009 	b	737c <__fputwc+0x8c>
    735c:	f9400263 	ldr	x3, [x19]
    7360:	91000464 	add	x4, x3, #0x1
    7364:	f9000264 	str	x4, [x19]
    7368:	39000061 	strb	w1, [x3]
    736c:	91000694 	add	x20, x20, #0x1
    7370:	eb15029f 	cmp	x20, x21
    7374:	54000302 	b.cs	73d4 <__fputwc+0xe4>  // b.hs, b.nlast
    7378:	38786a81 	ldrb	w1, [x20, x24]
    737c:	b9400e63 	ldr	w3, [x19, #12]
    7380:	51000463 	sub	w3, w3, #0x1
    7384:	b9000e63 	str	w3, [x19, #12]
    7388:	36fffea3 	tbz	w3, #31, 735c <__fputwc+0x6c>
    738c:	b9402a64 	ldr	w4, [x19, #40]
    7390:	aa1303e2 	mov	x2, x19
    7394:	aa1703e0 	mov	x0, x23
    7398:	6b04007f 	cmp	w3, w4
    739c:	7a4aa824 	ccmp	w1, #0xa, #0x4, ge  // ge = tcont
    73a0:	54fffde1 	b.ne	735c <__fputwc+0x6c>  // b.any
    73a4:	94000fe3 	bl	b330 <__swbuf_r>
    73a8:	3100041f 	cmn	w0, #0x1
    73ac:	54fffe01 	b.ne	736c <__fputwc+0x7c>  // b.any
    73b0:	a94153f3 	ldp	x19, x20, [sp, #16]
    73b4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    73b8:	a94363f7 	ldp	x23, x24, [sp, #48]
    73bc:	a8c57bfd 	ldp	x29, x30, [sp], #80
    73c0:	d65f03c0 	ret
    73c4:	12001ec1 	and	w1, w22, #0xff
    73c8:	d2800035 	mov	x21, #0x1                   	// #1
    73cc:	390123e1 	strb	w1, [sp, #72]
    73d0:	17ffffe0 	b	7350 <__fputwc+0x60>
    73d4:	2a1603e0 	mov	w0, w22
    73d8:	a94153f3 	ldp	x19, x20, [sp, #16]
    73dc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    73e0:	a94363f7 	ldp	x23, x24, [sp, #48]
    73e4:	a8c57bfd 	ldp	x29, x30, [sp], #80
    73e8:	d65f03c0 	ret
    73ec:	79402261 	ldrh	w1, [x19, #16]
    73f0:	321a0021 	orr	w1, w1, #0x40
    73f4:	79002261 	strh	w1, [x19, #16]
    73f8:	17ffffee 	b	73b0 <__fputwc+0xc0>
    73fc:	d503201f 	nop

0000000000007400 <_fputwc_r>:
    7400:	79c02043 	ldrsh	w3, [x2, #16]
    7404:	376800c3 	tbnz	w3, #13, 741c <_fputwc_r+0x1c>
    7408:	b940ac44 	ldr	w4, [x2, #172]
    740c:	32130063 	orr	w3, w3, #0x2000
    7410:	79002043 	strh	w3, [x2, #16]
    7414:	32130083 	orr	w3, w4, #0x2000
    7418:	b900ac43 	str	w3, [x2, #172]
    741c:	17ffffb5 	b	72f0 <__fputwc>

0000000000007420 <fputwc>:
    7420:	b0000023 	adrp	x3, c000 <_reclaim_reent+0xc0>
    7424:	aa0103e2 	mov	x2, x1
    7428:	2a0003e1 	mov	w1, w0
    742c:	f947c060 	ldr	x0, [x3, #3968]
    7430:	b4000060 	cbz	x0, 743c <fputwc+0x1c>
    7434:	b9405003 	ldr	w3, [x0, #80]
    7438:	34000123 	cbz	w3, 745c <fputwc+0x3c>
    743c:	79c02043 	ldrsh	w3, [x2, #16]
    7440:	376800c3 	tbnz	w3, #13, 7458 <fputwc+0x38>
    7444:	b940ac44 	ldr	w4, [x2, #172]
    7448:	32130063 	orr	w3, w3, #0x2000
    744c:	79002043 	strh	w3, [x2, #16]
    7450:	32130083 	orr	w3, w4, #0x2000
    7454:	b900ac43 	str	w3, [x2, #172]
    7458:	17ffffa6 	b	72f0 <__fputwc>
    745c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    7460:	910003fd 	mov	x29, sp
    7464:	f9000fe0 	str	x0, [sp, #24]
    7468:	b90027e1 	str	w1, [sp, #36]
    746c:	f90017e2 	str	x2, [sp, #40]
    7470:	97ffff7c 	bl	7260 <__sinit>
    7474:	f94017e2 	ldr	x2, [sp, #40]
    7478:	b94027e1 	ldr	w1, [sp, #36]
    747c:	f9400fe0 	ldr	x0, [sp, #24]
    7480:	79c02043 	ldrsh	w3, [x2, #16]
    7484:	376800c3 	tbnz	w3, #13, 749c <fputwc+0x7c>
    7488:	b940ac44 	ldr	w4, [x2, #172]
    748c:	32130063 	orr	w3, w3, #0x2000
    7490:	79002043 	strh	w3, [x2, #16]
    7494:	32130083 	orr	w3, w4, #0x2000
    7498:	b900ac43 	str	w3, [x2, #172]
    749c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    74a0:	17ffff94 	b	72f0 <__fputwc>
    74a4:	d503201f 	nop
    74a8:	d503201f 	nop
    74ac:	d503201f 	nop

00000000000074b0 <_malloc_trim_r>:
    74b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    74b4:	910003fd 	mov	x29, sp
    74b8:	a9025bf5 	stp	x21, x22, [sp, #32]
    74bc:	d0000036 	adrp	x22, d000 <impure_data+0x78>
    74c0:	912262d6 	add	x22, x22, #0x898
    74c4:	aa0003f5 	mov	x21, x0
    74c8:	a90153f3 	stp	x19, x20, [sp, #16]
    74cc:	aa0103f3 	mov	x19, x1
    74d0:	94000a64 	bl	9e60 <__malloc_lock>
    74d4:	f9400ac0 	ldr	x0, [x22, #16]
    74d8:	f9400414 	ldr	x20, [x0, #8]
    74dc:	927ef694 	and	x20, x20, #0xfffffffffffffffc
    74e0:	cb130293 	sub	x19, x20, x19
    74e4:	913f7e73 	add	x19, x19, #0xfdf
    74e8:	9274ce73 	and	x19, x19, #0xfffffffffffff000
    74ec:	d1400673 	sub	x19, x19, #0x1, lsl #12
    74f0:	f13ffe7f 	cmp	x19, #0xfff
    74f4:	5400010d 	b.le	7514 <_malloc_trim_r+0x64>
    74f8:	d2800001 	mov	x1, #0x0                   	// #0
    74fc:	aa1503e0 	mov	x0, x21
    7500:	94000bb0 	bl	a3c0 <_sbrk_r>
    7504:	f9400ac1 	ldr	x1, [x22, #16]
    7508:	8b140021 	add	x1, x1, x20
    750c:	eb01001f 	cmp	x0, x1
    7510:	54000100 	b.eq	7530 <_malloc_trim_r+0x80>  // b.none
    7514:	aa1503e0 	mov	x0, x21
    7518:	94000a56 	bl	9e70 <__malloc_unlock>
    751c:	52800000 	mov	w0, #0x0                   	// #0
    7520:	a94153f3 	ldp	x19, x20, [sp, #16]
    7524:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7528:	a8c37bfd 	ldp	x29, x30, [sp], #48
    752c:	d65f03c0 	ret
    7530:	cb1303e1 	neg	x1, x19
    7534:	aa1503e0 	mov	x0, x21
    7538:	94000ba2 	bl	a3c0 <_sbrk_r>
    753c:	b100041f 	cmn	x0, #0x1
    7540:	54000200 	b.eq	7580 <_malloc_trim_r+0xd0>  // b.none
    7544:	f0000022 	adrp	x2, e000 <__malloc_av_+0x768>
    7548:	cb130294 	sub	x20, x20, x19
    754c:	f9400ac3 	ldr	x3, [x22, #16]
    7550:	b2400294 	orr	x20, x20, #0x1
    7554:	b9449041 	ldr	w1, [x2, #1168]
    7558:	aa1503e0 	mov	x0, x21
    755c:	f9000474 	str	x20, [x3, #8]
    7560:	4b130033 	sub	w19, w1, w19
    7564:	b9049053 	str	w19, [x2, #1168]
    7568:	94000a42 	bl	9e70 <__malloc_unlock>
    756c:	52800020 	mov	w0, #0x1                   	// #1
    7570:	a94153f3 	ldp	x19, x20, [sp, #16]
    7574:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7578:	a8c37bfd 	ldp	x29, x30, [sp], #48
    757c:	d65f03c0 	ret
    7580:	d2800001 	mov	x1, #0x0                   	// #0
    7584:	aa1503e0 	mov	x0, x21
    7588:	94000b8e 	bl	a3c0 <_sbrk_r>
    758c:	f9400ac2 	ldr	x2, [x22, #16]
    7590:	cb020001 	sub	x1, x0, x2
    7594:	f1007c3f 	cmp	x1, #0x1f
    7598:	54fffbed 	b.le	7514 <_malloc_trim_r+0x64>
    759c:	f0000024 	adrp	x4, e000 <__malloc_av_+0x768>
    75a0:	b2400021 	orr	x1, x1, #0x1
    75a4:	f9000441 	str	x1, [x2, #8]
    75a8:	f0000023 	adrp	x3, e000 <__malloc_av_+0x768>
    75ac:	f9405481 	ldr	x1, [x4, #168]
    75b0:	cb010000 	sub	x0, x0, x1
    75b4:	b9049060 	str	w0, [x3, #1168]
    75b8:	17ffffd7 	b	7514 <_malloc_trim_r+0x64>
    75bc:	d503201f 	nop

00000000000075c0 <_free_r>:
    75c0:	b4000a21 	cbz	x1, 7704 <_free_r+0x144>
    75c4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    75c8:	910003fd 	mov	x29, sp
    75cc:	a90153f3 	stp	x19, x20, [sp, #16]
    75d0:	aa0103f3 	mov	x19, x1
    75d4:	aa0003f4 	mov	x20, x0
    75d8:	94000a22 	bl	9e60 <__malloc_lock>
    75dc:	f85f8265 	ldur	x5, [x19, #-8]
    75e0:	d1004263 	sub	x3, x19, #0x10
    75e4:	d0000020 	adrp	x0, d000 <impure_data+0x78>
    75e8:	91226000 	add	x0, x0, #0x898
    75ec:	927ff8a2 	and	x2, x5, #0xfffffffffffffffe
    75f0:	8b020064 	add	x4, x3, x2
    75f4:	f9400806 	ldr	x6, [x0, #16]
    75f8:	f9400481 	ldr	x1, [x4, #8]
    75fc:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    7600:	eb0400df 	cmp	x6, x4
    7604:	54000c60 	b.eq	7790 <_free_r+0x1d0>  // b.none
    7608:	f9000481 	str	x1, [x4, #8]
    760c:	8b010086 	add	x6, x4, x1
    7610:	37000345 	tbnz	w5, #0, 7678 <_free_r+0xb8>
    7614:	f85f0267 	ldur	x7, [x19, #-16]
    7618:	d0000025 	adrp	x5, d000 <impure_data+0x78>
    761c:	f94004c6 	ldr	x6, [x6, #8]
    7620:	cb070063 	sub	x3, x3, x7
    7624:	8b070042 	add	x2, x2, x7
    7628:	9122a0a5 	add	x5, x5, #0x8a8
    762c:	924000c6 	and	x6, x6, #0x1
    7630:	f9400867 	ldr	x7, [x3, #16]
    7634:	eb0500ff 	cmp	x7, x5
    7638:	54000940 	b.eq	7760 <_free_r+0x1a0>  // b.none
    763c:	f9400c68 	ldr	x8, [x3, #24]
    7640:	f9000ce8 	str	x8, [x7, #24]
    7644:	f9000907 	str	x7, [x8, #16]
    7648:	b50001c6 	cbnz	x6, 7680 <_free_r+0xc0>
    764c:	8b010042 	add	x2, x2, x1
    7650:	f9400881 	ldr	x1, [x4, #16]
    7654:	b2400046 	orr	x6, x2, #0x1
    7658:	eb05003f 	cmp	x1, x5
    765c:	54000ee0 	b.eq	7838 <_free_r+0x278>  // b.none
    7660:	f9400c84 	ldr	x4, [x4, #24]
    7664:	f9000c24 	str	x4, [x1, #24]
    7668:	f9000881 	str	x1, [x4, #16]
    766c:	f9000466 	str	x6, [x3, #8]
    7670:	f8226862 	str	x2, [x3, x2]
    7674:	14000006 	b	768c <_free_r+0xcc>
    7678:	f94004c5 	ldr	x5, [x6, #8]
    767c:	36000465 	tbz	w5, #0, 7708 <_free_r+0x148>
    7680:	b2400041 	orr	x1, x2, #0x1
    7684:	f9000461 	str	x1, [x3, #8]
    7688:	f9000082 	str	x2, [x4]
    768c:	f107fc5f 	cmp	x2, #0x1ff
    7690:	54000449 	b.ls	7718 <_free_r+0x158>  // b.plast
    7694:	d349fc41 	lsr	x1, x2, #9
    7698:	f127fc5f 	cmp	x2, #0x9ff
    769c:	54000a28 	b.hi	77e0 <_free_r+0x220>  // b.pmore
    76a0:	d346fc41 	lsr	x1, x2, #6
    76a4:	1100e424 	add	w4, w1, #0x39
    76a8:	1100e025 	add	w5, w1, #0x38
    76ac:	531f7884 	lsl	w4, w4, #1
    76b0:	937d7c84 	sbfiz	x4, x4, #3, #32
    76b4:	8b040004 	add	x4, x0, x4
    76b8:	f85f0481 	ldr	x1, [x4], #-16
    76bc:	eb01009f 	cmp	x4, x1
    76c0:	54000ae0 	b.eq	781c <_free_r+0x25c>  // b.none
    76c4:	d503201f 	nop
    76c8:	f9400420 	ldr	x0, [x1, #8]
    76cc:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    76d0:	eb02001f 	cmp	x0, x2
    76d4:	54000089 	b.ls	76e4 <_free_r+0x124>  // b.plast
    76d8:	f9400821 	ldr	x1, [x1, #16]
    76dc:	eb01009f 	cmp	x4, x1
    76e0:	54ffff41 	b.ne	76c8 <_free_r+0x108>  // b.any
    76e4:	f9400c24 	ldr	x4, [x1, #24]
    76e8:	a9011061 	stp	x1, x4, [x3, #16]
    76ec:	aa1403e0 	mov	x0, x20
    76f0:	f9000883 	str	x3, [x4, #16]
    76f4:	f9000c23 	str	x3, [x1, #24]
    76f8:	a94153f3 	ldp	x19, x20, [sp, #16]
    76fc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    7700:	140009dc 	b	9e70 <__malloc_unlock>
    7704:	d65f03c0 	ret
    7708:	d0000025 	adrp	x5, d000 <impure_data+0x78>
    770c:	8b010042 	add	x2, x2, x1
    7710:	9122a0a5 	add	x5, x5, #0x8a8
    7714:	17ffffcf 	b	7650 <_free_r+0x90>
    7718:	d343fc42 	lsr	x2, x2, #3
    771c:	d2800024 	mov	x4, #0x1                   	// #1
    7720:	11000441 	add	w1, w2, #0x1
    7724:	f9400405 	ldr	x5, [x0, #8]
    7728:	531f7821 	lsl	w1, w1, #1
    772c:	13027c42 	asr	w2, w2, #2
    7730:	8b21cc01 	add	x1, x0, w1, sxtw #3
    7734:	9ac22082 	lsl	x2, x4, x2
    7738:	aa050042 	orr	x2, x2, x5
    773c:	f9000402 	str	x2, [x0, #8]
    7740:	f85f0420 	ldr	x0, [x1], #-16
    7744:	a9010460 	stp	x0, x1, [x3, #16]
    7748:	f9000823 	str	x3, [x1, #16]
    774c:	f9000c03 	str	x3, [x0, #24]
    7750:	aa1403e0 	mov	x0, x20
    7754:	a94153f3 	ldp	x19, x20, [sp, #16]
    7758:	a8c27bfd 	ldp	x29, x30, [sp], #32
    775c:	140009c5 	b	9e70 <__malloc_unlock>
    7760:	b50009c6 	cbnz	x6, 7898 <_free_r+0x2d8>
    7764:	a9410085 	ldp	x5, x0, [x4, #16]
    7768:	8b020021 	add	x1, x1, x2
    776c:	f9000ca0 	str	x0, [x5, #24]
    7770:	b2400022 	orr	x2, x1, #0x1
    7774:	f9000805 	str	x5, [x0, #16]
    7778:	aa1403e0 	mov	x0, x20
    777c:	f9000462 	str	x2, [x3, #8]
    7780:	f8216861 	str	x1, [x3, x1]
    7784:	a94153f3 	ldp	x19, x20, [sp, #16]
    7788:	a8c27bfd 	ldp	x29, x30, [sp], #32
    778c:	140009b9 	b	9e70 <__malloc_unlock>
    7790:	8b010041 	add	x1, x2, x1
    7794:	370000e5 	tbnz	w5, #0, 77b0 <_free_r+0x1f0>
    7798:	f85f0262 	ldur	x2, [x19, #-16]
    779c:	cb020063 	sub	x3, x3, x2
    77a0:	8b020021 	add	x1, x1, x2
    77a4:	a9410864 	ldp	x4, x2, [x3, #16]
    77a8:	f9000c82 	str	x2, [x4, #24]
    77ac:	f9000844 	str	x4, [x2, #16]
    77b0:	f0000022 	adrp	x2, e000 <__malloc_av_+0x768>
    77b4:	b2400024 	orr	x4, x1, #0x1
    77b8:	f9000464 	str	x4, [x3, #8]
    77bc:	f9405842 	ldr	x2, [x2, #176]
    77c0:	f9000803 	str	x3, [x0, #16]
    77c4:	eb01005f 	cmp	x2, x1
    77c8:	54fffc48 	b.hi	7750 <_free_r+0x190>  // b.pmore
    77cc:	f0000021 	adrp	x1, e000 <__malloc_av_+0x768>
    77d0:	aa1403e0 	mov	x0, x20
    77d4:	f9426421 	ldr	x1, [x1, #1224]
    77d8:	97ffff36 	bl	74b0 <_malloc_trim_r>
    77dc:	17ffffdd 	b	7750 <_free_r+0x190>
    77e0:	f100503f 	cmp	x1, #0x14
    77e4:	54000129 	b.ls	7808 <_free_r+0x248>  // b.plast
    77e8:	f101503f 	cmp	x1, #0x54
    77ec:	54000308 	b.hi	784c <_free_r+0x28c>  // b.pmore
    77f0:	d34cfc41 	lsr	x1, x2, #12
    77f4:	1101bc24 	add	w4, w1, #0x6f
    77f8:	1101b825 	add	w5, w1, #0x6e
    77fc:	531f7884 	lsl	w4, w4, #1
    7800:	937d7c84 	sbfiz	x4, x4, #3, #32
    7804:	17ffffac 	b	76b4 <_free_r+0xf4>
    7808:	11017024 	add	w4, w1, #0x5c
    780c:	11016c25 	add	w5, w1, #0x5b
    7810:	531f7884 	lsl	w4, w4, #1
    7814:	937d7c84 	sbfiz	x4, x4, #3, #32
    7818:	17ffffa7 	b	76b4 <_free_r+0xf4>
    781c:	f9400406 	ldr	x6, [x0, #8]
    7820:	13027ca5 	asr	w5, w5, #2
    7824:	d2800022 	mov	x2, #0x1                   	// #1
    7828:	9ac52045 	lsl	x5, x2, x5
    782c:	aa0600a5 	orr	x5, x5, x6
    7830:	f9000405 	str	x5, [x0, #8]
    7834:	17ffffad 	b	76e8 <_free_r+0x128>
    7838:	a9020c03 	stp	x3, x3, [x0, #32]
    783c:	a9009466 	stp	x6, x5, [x3, #8]
    7840:	f9000c65 	str	x5, [x3, #24]
    7844:	f8226862 	str	x2, [x3, x2]
    7848:	17ffffc2 	b	7750 <_free_r+0x190>
    784c:	f105503f 	cmp	x1, #0x154
    7850:	540000e8 	b.hi	786c <_free_r+0x2ac>  // b.pmore
    7854:	d34ffc41 	lsr	x1, x2, #15
    7858:	1101e024 	add	w4, w1, #0x78
    785c:	1101dc25 	add	w5, w1, #0x77
    7860:	531f7884 	lsl	w4, w4, #1
    7864:	937d7c84 	sbfiz	x4, x4, #3, #32
    7868:	17ffff93 	b	76b4 <_free_r+0xf4>
    786c:	f115503f 	cmp	x1, #0x554
    7870:	540000e8 	b.hi	788c <_free_r+0x2cc>  // b.pmore
    7874:	d352fc41 	lsr	x1, x2, #18
    7878:	1101f424 	add	w4, w1, #0x7d
    787c:	1101f025 	add	w5, w1, #0x7c
    7880:	531f7884 	lsl	w4, w4, #1
    7884:	937d7c84 	sbfiz	x4, x4, #3, #32
    7888:	17ffff8b 	b	76b4 <_free_r+0xf4>
    788c:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    7890:	52800fc5 	mov	w5, #0x7e                  	// #126
    7894:	17ffff88 	b	76b4 <_free_r+0xf4>
    7898:	b2400040 	orr	x0, x2, #0x1
    789c:	f9000460 	str	x0, [x3, #8]
    78a0:	f9000082 	str	x2, [x4]
    78a4:	17ffffab 	b	7750 <_free_r+0x190>
    78a8:	d503201f 	nop
    78ac:	d503201f 	nop

00000000000078b0 <__sfvwrite_r>:
    78b0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    78b4:	910003fd 	mov	x29, sp
    78b8:	a90363f7 	stp	x23, x24, [sp, #48]
    78bc:	aa0003f7 	mov	x23, x0
    78c0:	f9400840 	ldr	x0, [x2, #16]
    78c4:	b4000460 	cbz	x0, 7950 <__sfvwrite_r+0xa0>
    78c8:	79402023 	ldrh	w3, [x1, #16]
    78cc:	aa0203f8 	mov	x24, x2
    78d0:	a90153f3 	stp	x19, x20, [sp, #16]
    78d4:	aa0103f3 	mov	x19, x1
    78d8:	36180443 	tbz	w3, #3, 7960 <__sfvwrite_r+0xb0>
    78dc:	f9400c20 	ldr	x0, [x1, #24]
    78e0:	b4000400 	cbz	x0, 7960 <__sfvwrite_r+0xb0>
    78e4:	a9025bf5 	stp	x21, x22, [sp, #32]
    78e8:	a9046bf9 	stp	x25, x26, [sp, #64]
    78ec:	f9400314 	ldr	x20, [x24]
    78f0:	360804a3 	tbz	w3, #1, 7984 <__sfvwrite_r+0xd4>
    78f4:	d2800016 	mov	x22, #0x0                   	// #0
    78f8:	d2800015 	mov	x21, #0x0                   	// #0
    78fc:	b27653f9 	mov	x25, #0x7ffffc00            	// #2147482624
    7900:	eb1902bf 	cmp	x21, x25
    7904:	aa1603e2 	mov	x2, x22
    7908:	9a9992a3 	csel	x3, x21, x25, ls  // ls = plast
    790c:	aa1703e0 	mov	x0, x23
    7910:	b4000875 	cbz	x21, 7a1c <__sfvwrite_r+0x16c>
    7914:	f9401a61 	ldr	x1, [x19, #48]
    7918:	f9402264 	ldr	x4, [x19, #64]
    791c:	d63f0080 	blr	x4
    7920:	7100001f 	cmp	w0, #0x0
    7924:	5400206d 	b.le	7d30 <__sfvwrite_r+0x480>
    7928:	f9400b01 	ldr	x1, [x24, #16]
    792c:	93407c00 	sxtw	x0, w0
    7930:	8b0002d6 	add	x22, x22, x0
    7934:	cb0002b5 	sub	x21, x21, x0
    7938:	cb000020 	sub	x0, x1, x0
    793c:	f9000b00 	str	x0, [x24, #16]
    7940:	b5fffe00 	cbnz	x0, 7900 <__sfvwrite_r+0x50>
    7944:	a94153f3 	ldp	x19, x20, [sp, #16]
    7948:	a9425bf5 	ldp	x21, x22, [sp, #32]
    794c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7950:	52800000 	mov	w0, #0x0                   	// #0
    7954:	a94363f7 	ldp	x23, x24, [sp, #48]
    7958:	a8c67bfd 	ldp	x29, x30, [sp], #96
    795c:	d65f03c0 	ret
    7960:	aa1303e1 	mov	x1, x19
    7964:	aa1703e0 	mov	x0, x23
    7968:	97fffc2e 	bl	6a20 <__swsetup_r>
    796c:	35001f00 	cbnz	w0, 7d4c <__sfvwrite_r+0x49c>
    7970:	79402263 	ldrh	w3, [x19, #16]
    7974:	a9025bf5 	stp	x21, x22, [sp, #32]
    7978:	a9046bf9 	stp	x25, x26, [sp, #64]
    797c:	f9400314 	ldr	x20, [x24]
    7980:	370ffba3 	tbnz	w3, #1, 78f4 <__sfvwrite_r+0x44>
    7984:	a90573fb 	stp	x27, x28, [sp, #80]
    7988:	37000503 	tbnz	w3, #0, 7a28 <__sfvwrite_r+0x178>
    798c:	d280001c 	mov	x28, #0x0                   	// #0
    7990:	d2800015 	mov	x21, #0x0                   	// #0
    7994:	d503201f 	nop
    7998:	b40003d5 	cbz	x21, 7a10 <__sfvwrite_r+0x160>
    799c:	f9400266 	ldr	x6, [x19]
    79a0:	b9400e7a 	ldr	w26, [x19, #12]
    79a4:	aa0603e0 	mov	x0, x6
    79a8:	36480ac3 	tbz	w3, #9, 7b00 <__sfvwrite_r+0x250>
    79ac:	93407f5b 	sxtw	x27, w26
    79b0:	eb15037f 	cmp	x27, x21
    79b4:	540010c9 	b.ls	7bcc <__sfvwrite_r+0x31c>  // b.plast
    79b8:	93407ea1 	sxtw	x1, w21
    79bc:	aa0103f6 	mov	x22, x1
    79c0:	aa0603e0 	mov	x0, x6
    79c4:	aa0103fb 	mov	x27, x1
    79c8:	2a1503fa 	mov	w26, w21
    79cc:	aa1b03e2 	mov	x2, x27
    79d0:	aa1c03e1 	mov	x1, x28
    79d4:	97fff35b 	bl	4740 <memmove>
    79d8:	f9400261 	ldr	x1, [x19]
    79dc:	b9400e60 	ldr	w0, [x19, #12]
    79e0:	8b1b0022 	add	x2, x1, x27
    79e4:	f9000262 	str	x2, [x19]
    79e8:	4b1a0000 	sub	w0, w0, w26
    79ec:	b9000e60 	str	w0, [x19, #12]
    79f0:	f9400b00 	ldr	x0, [x24, #16]
    79f4:	8b16039c 	add	x28, x28, x22
    79f8:	cb1602b5 	sub	x21, x21, x22
    79fc:	cb160016 	sub	x22, x0, x22
    7a00:	f9000b16 	str	x22, [x24, #16]
    7a04:	b40005d6 	cbz	x22, 7abc <__sfvwrite_r+0x20c>
    7a08:	79402263 	ldrh	w3, [x19, #16]
    7a0c:	b5fffc95 	cbnz	x21, 799c <__sfvwrite_r+0xec>
    7a10:	a940569c 	ldp	x28, x21, [x20]
    7a14:	91004294 	add	x20, x20, #0x10
    7a18:	17ffffe0 	b	7998 <__sfvwrite_r+0xe8>
    7a1c:	a9405696 	ldp	x22, x21, [x20]
    7a20:	91004294 	add	x20, x20, #0x10
    7a24:	17ffffb7 	b	7900 <__sfvwrite_r+0x50>
    7a28:	5280001a 	mov	w26, #0x0                   	// #0
    7a2c:	52800000 	mov	w0, #0x0                   	// #0
    7a30:	d280001b 	mov	x27, #0x0                   	// #0
    7a34:	d2800019 	mov	x25, #0x0                   	// #0
    7a38:	b40004d9 	cbz	x25, 7ad0 <__sfvwrite_r+0x220>
    7a3c:	34000500 	cbz	w0, 7adc <__sfvwrite_r+0x22c>
    7a40:	f9400260 	ldr	x0, [x19]
    7a44:	93407f56 	sxtw	x22, w26
    7a48:	f9400e61 	ldr	x1, [x19, #24]
    7a4c:	eb1902df 	cmp	x22, x25
    7a50:	b9400e75 	ldr	w21, [x19, #12]
    7a54:	9a9992d6 	csel	x22, x22, x25, ls  // ls = plast
    7a58:	b9402263 	ldr	w3, [x19, #32]
    7a5c:	eb01001f 	cmp	x0, x1
    7a60:	0b150075 	add	w21, w3, w21
    7a64:	7a5582c4 	ccmp	w22, w21, #0x4, hi  // hi = pmore
    7a68:	5400132c 	b.gt	7ccc <__sfvwrite_r+0x41c>
    7a6c:	6b16007f 	cmp	w3, w22
    7a70:	5400116c 	b.gt	7c9c <__sfvwrite_r+0x3ec>
    7a74:	f9401a61 	ldr	x1, [x19, #48]
    7a78:	aa1b03e2 	mov	x2, x27
    7a7c:	f9402264 	ldr	x4, [x19, #64]
    7a80:	aa1703e0 	mov	x0, x23
    7a84:	d63f0080 	blr	x4
    7a88:	2a0003f5 	mov	w21, w0
    7a8c:	7100001f 	cmp	w0, #0x0
    7a90:	5400088d 	b.le	7ba0 <__sfvwrite_r+0x2f0>
    7a94:	6b15035a 	subs	w26, w26, w21
    7a98:	52800020 	mov	w0, #0x1                   	// #1
    7a9c:	54000f60 	b.eq	7c88 <__sfvwrite_r+0x3d8>  // b.none
    7aa0:	f9400b01 	ldr	x1, [x24, #16]
    7aa4:	93407eb5 	sxtw	x21, w21
    7aa8:	8b15037b 	add	x27, x27, x21
    7aac:	cb150339 	sub	x25, x25, x21
    7ab0:	cb150035 	sub	x21, x1, x21
    7ab4:	f9000b15 	str	x21, [x24, #16]
    7ab8:	b5fffc15 	cbnz	x21, 7a38 <__sfvwrite_r+0x188>
    7abc:	a94153f3 	ldp	x19, x20, [sp, #16]
    7ac0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7ac4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7ac8:	a94573fb 	ldp	x27, x28, [sp, #80]
    7acc:	17ffffa1 	b	7950 <__sfvwrite_r+0xa0>
    7ad0:	a940669b 	ldp	x27, x25, [x20]
    7ad4:	91004294 	add	x20, x20, #0x10
    7ad8:	b4ffffd9 	cbz	x25, 7ad0 <__sfvwrite_r+0x220>
    7adc:	aa1903e2 	mov	x2, x25
    7ae0:	aa1b03e0 	mov	x0, x27
    7ae4:	52800141 	mov	w1, #0xa                   	// #10
    7ae8:	940008a7 	bl	9d84 <memchr>
    7aec:	9100041a 	add	x26, x0, #0x1
    7af0:	f100001f 	cmp	x0, #0x0
    7af4:	cb1b035a 	sub	x26, x26, x27
    7af8:	1a99175a 	csinc	w26, w26, w25, ne  // ne = any
    7afc:	17ffffd1 	b	7a40 <__sfvwrite_r+0x190>
    7b00:	f9400e60 	ldr	x0, [x19, #24]
    7b04:	eb06001f 	cmp	x0, x6
    7b08:	54000263 	b.cc	7b54 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    7b0c:	b9402263 	ldr	w3, [x19, #32]
    7b10:	eb23c2bf 	cmp	x21, w3, sxtw
    7b14:	54000203 	b.cc	7b54 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    7b18:	b27f77e0 	mov	x0, #0x7ffffffe            	// #2147483646
    7b1c:	eb0002bf 	cmp	x21, x0
    7b20:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
    7b24:	9a8092a4 	csel	x4, x21, x0, ls  // ls = plast
    7b28:	f9401a61 	ldr	x1, [x19, #48]
    7b2c:	aa1c03e2 	mov	x2, x28
    7b30:	1ac30c84 	sdiv	w4, w4, w3
    7b34:	aa1703e0 	mov	x0, x23
    7b38:	f9402266 	ldr	x6, [x19, #64]
    7b3c:	1b037c83 	mul	w3, w4, w3
    7b40:	d63f00c0 	blr	x6
    7b44:	7100001f 	cmp	w0, #0x0
    7b48:	540002cd 	b.le	7ba0 <__sfvwrite_r+0x2f0>
    7b4c:	93407c16 	sxtw	x22, w0
    7b50:	17ffffa8 	b	79f0 <__sfvwrite_r+0x140>
    7b54:	93407f44 	sxtw	x4, w26
    7b58:	aa1c03e1 	mov	x1, x28
    7b5c:	eb15009f 	cmp	x4, x21
    7b60:	aa0603e0 	mov	x0, x6
    7b64:	9a95909a 	csel	x26, x4, x21, ls  // ls = plast
    7b68:	93407f56 	sxtw	x22, w26
    7b6c:	aa1603e2 	mov	x2, x22
    7b70:	97fff2f4 	bl	4740 <memmove>
    7b74:	f9400261 	ldr	x1, [x19]
    7b78:	b9400e60 	ldr	w0, [x19, #12]
    7b7c:	8b160021 	add	x1, x1, x22
    7b80:	f9000261 	str	x1, [x19]
    7b84:	4b1a0004 	sub	w4, w0, w26
    7b88:	b9000e64 	str	w4, [x19, #12]
    7b8c:	35fff324 	cbnz	w4, 79f0 <__sfvwrite_r+0x140>
    7b90:	aa1303e1 	mov	x1, x19
    7b94:	aa1703e0 	mov	x0, x23
    7b98:	97fffcb2 	bl	6e60 <_fflush_r>
    7b9c:	34fff2a0 	cbz	w0, 79f0 <__sfvwrite_r+0x140>
    7ba0:	a94573fb 	ldp	x27, x28, [sp, #80]
    7ba4:	79c02261 	ldrsh	w1, [x19, #16]
    7ba8:	321a0021 	orr	w1, w1, #0x40
    7bac:	79002261 	strh	w1, [x19, #16]
    7bb0:	12800000 	mov	w0, #0xffffffff            	// #-1
    7bb4:	a94153f3 	ldp	x19, x20, [sp, #16]
    7bb8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7bbc:	a94363f7 	ldp	x23, x24, [sp, #48]
    7bc0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7bc4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7bc8:	d65f03c0 	ret
    7bcc:	93407eb6 	sxtw	x22, w21
    7bd0:	52809001 	mov	w1, #0x480                 	// #1152
    7bd4:	6a01007f 	tst	w3, w1
    7bd8:	54ffefa0 	b.eq	79cc <__sfvwrite_r+0x11c>  // b.none
    7bdc:	b9402267 	ldr	w7, [x19, #32]
    7be0:	f9400e61 	ldr	x1, [x19, #24]
    7be4:	0b0704e7 	add	w7, w7, w7, lsl #1
    7be8:	cb0100d6 	sub	x22, x6, x1
    7bec:	0b477ce7 	add	w7, w7, w7, lsr #31
    7bf0:	93407ed9 	sxtw	x25, w22
    7bf4:	13017cfb 	asr	w27, w7, #1
    7bf8:	91000720 	add	x0, x25, #0x1
    7bfc:	8b150000 	add	x0, x0, x21
    7c00:	93407f62 	sxtw	x2, w27
    7c04:	eb00005f 	cmp	x2, x0
    7c08:	54000082 	b.cs	7c18 <__sfvwrite_r+0x368>  // b.hs, b.nlast
    7c0c:	110006c7 	add	w7, w22, #0x1
    7c10:	0b1500fb 	add	w27, w7, w21
    7c14:	93407f62 	sxtw	x2, w27
    7c18:	36500723 	tbz	w3, #10, 7cfc <__sfvwrite_r+0x44c>
    7c1c:	aa0203e1 	mov	x1, x2
    7c20:	aa1703e0 	mov	x0, x23
    7c24:	94000487 	bl	8e40 <_malloc_r>
    7c28:	aa0003fa 	mov	x26, x0
    7c2c:	b4000860 	cbz	x0, 7d38 <__sfvwrite_r+0x488>
    7c30:	f9400e61 	ldr	x1, [x19, #24]
    7c34:	aa1903e2 	mov	x2, x25
    7c38:	97fff262 	bl	45c0 <memcpy>
    7c3c:	79402260 	ldrh	w0, [x19, #16]
    7c40:	12809001 	mov	w1, #0xfffffb7f            	// #-1153
    7c44:	0a010000 	and	w0, w0, w1
    7c48:	32190000 	orr	w0, w0, #0x80
    7c4c:	79002260 	strh	w0, [x19, #16]
    7c50:	8b190340 	add	x0, x26, x25
    7c54:	4b160366 	sub	w6, w27, w22
    7c58:	93407eb6 	sxtw	x22, w21
    7c5c:	f9000260 	str	x0, [x19]
    7c60:	b9000e66 	str	w6, [x19, #12]
    7c64:	aa1603e1 	mov	x1, x22
    7c68:	f9000e7a 	str	x26, [x19, #24]
    7c6c:	aa0003e6 	mov	x6, x0
    7c70:	b900227b 	str	w27, [x19, #32]
    7c74:	2a1503fa 	mov	w26, w21
    7c78:	eb1502df 	cmp	x22, x21
    7c7c:	54ffea08 	b.hi	79bc <__sfvwrite_r+0x10c>  // b.pmore
    7c80:	aa1603fb 	mov	x27, x22
    7c84:	17ffff52 	b	79cc <__sfvwrite_r+0x11c>
    7c88:	aa1303e1 	mov	x1, x19
    7c8c:	aa1703e0 	mov	x0, x23
    7c90:	97fffc74 	bl	6e60 <_fflush_r>
    7c94:	34fff060 	cbz	w0, 7aa0 <__sfvwrite_r+0x1f0>
    7c98:	17ffffc2 	b	7ba0 <__sfvwrite_r+0x2f0>
    7c9c:	93407edc 	sxtw	x28, w22
    7ca0:	aa1b03e1 	mov	x1, x27
    7ca4:	aa1c03e2 	mov	x2, x28
    7ca8:	97fff2a6 	bl	4740 <memmove>
    7cac:	f9400260 	ldr	x0, [x19]
    7cb0:	2a1603f5 	mov	w21, w22
    7cb4:	b9400e61 	ldr	w1, [x19, #12]
    7cb8:	8b1c0000 	add	x0, x0, x28
    7cbc:	f9000260 	str	x0, [x19]
    7cc0:	4b160036 	sub	w22, w1, w22
    7cc4:	b9000e76 	str	w22, [x19, #12]
    7cc8:	17ffff73 	b	7a94 <__sfvwrite_r+0x1e4>
    7ccc:	93407eb6 	sxtw	x22, w21
    7cd0:	aa1b03e1 	mov	x1, x27
    7cd4:	aa1603e2 	mov	x2, x22
    7cd8:	97fff29a 	bl	4740 <memmove>
    7cdc:	f9400262 	ldr	x2, [x19]
    7ce0:	aa1303e1 	mov	x1, x19
    7ce4:	aa1703e0 	mov	x0, x23
    7ce8:	8b160042 	add	x2, x2, x22
    7cec:	f9000262 	str	x2, [x19]
    7cf0:	97fffc5c 	bl	6e60 <_fflush_r>
    7cf4:	34ffed00 	cbz	w0, 7a94 <__sfvwrite_r+0x1e4>
    7cf8:	17ffffaa 	b	7ba0 <__sfvwrite_r+0x2f0>
    7cfc:	aa1703e0 	mov	x0, x23
    7d00:	94000860 	bl	9e80 <_realloc_r>
    7d04:	aa0003fa 	mov	x26, x0
    7d08:	b5fffa40 	cbnz	x0, 7c50 <__sfvwrite_r+0x3a0>
    7d0c:	f9400e61 	ldr	x1, [x19, #24]
    7d10:	aa1703e0 	mov	x0, x23
    7d14:	97fffe2b 	bl	75c0 <_free_r>
    7d18:	79c02261 	ldrsh	w1, [x19, #16]
    7d1c:	52800180 	mov	w0, #0xc                   	// #12
    7d20:	a94573fb 	ldp	x27, x28, [sp, #80]
    7d24:	12187821 	and	w1, w1, #0xffffff7f
    7d28:	b90002e0 	str	w0, [x23]
    7d2c:	17ffff9f 	b	7ba8 <__sfvwrite_r+0x2f8>
    7d30:	79c02261 	ldrsh	w1, [x19, #16]
    7d34:	17ffff9d 	b	7ba8 <__sfvwrite_r+0x2f8>
    7d38:	79c02261 	ldrsh	w1, [x19, #16]
    7d3c:	52800180 	mov	w0, #0xc                   	// #12
    7d40:	a94573fb 	ldp	x27, x28, [sp, #80]
    7d44:	b90002e0 	str	w0, [x23]
    7d48:	17ffff98 	b	7ba8 <__sfvwrite_r+0x2f8>
    7d4c:	12800000 	mov	w0, #0xffffffff            	// #-1
    7d50:	a94153f3 	ldp	x19, x20, [sp, #16]
    7d54:	17ffff00 	b	7954 <__sfvwrite_r+0xa4>
    7d58:	d503201f 	nop
    7d5c:	d503201f 	nop

0000000000007d60 <_fwalk>:
    7d60:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    7d64:	910003fd 	mov	x29, sp
    7d68:	a9025bf5 	stp	x21, x22, [sp, #32]
    7d6c:	91148015 	add	x21, x0, #0x520
    7d70:	aa0103f6 	mov	x22, x1
    7d74:	a90153f3 	stp	x19, x20, [sp, #16]
    7d78:	f9001bf7 	str	x23, [sp, #48]
    7d7c:	52800017 	mov	w23, #0x0                   	// #0
    7d80:	b9400aa0 	ldr	w0, [x21, #8]
    7d84:	f9400ab3 	ldr	x19, [x21, #16]
    7d88:	7100001f 	cmp	w0, #0x0
    7d8c:	5400026d 	b.le	7dd8 <_fwalk+0x78>
    7d90:	51000400 	sub	w0, w0, #0x1
    7d94:	91000400 	add	x0, x0, #0x1
    7d98:	8b000414 	add	x20, x0, x0, lsl #1
    7d9c:	d37ef694 	lsl	x20, x20, #2
    7da0:	cb000294 	sub	x20, x20, x0
    7da4:	8b141274 	add	x20, x19, x20, lsl #4
    7da8:	79402260 	ldrh	w0, [x19, #16]
    7dac:	7100041f 	cmp	w0, #0x1
    7db0:	540000e9 	b.ls	7dcc <_fwalk+0x6c>  // b.plast
    7db4:	79c02662 	ldrsh	w2, [x19, #18]
    7db8:	aa1303e0 	mov	x0, x19
    7dbc:	3100045f 	cmn	w2, #0x1
    7dc0:	54000060 	b.eq	7dcc <_fwalk+0x6c>  // b.none
    7dc4:	d63f02c0 	blr	x22
    7dc8:	2a0002f7 	orr	w23, w23, w0
    7dcc:	9102c273 	add	x19, x19, #0xb0
    7dd0:	eb13029f 	cmp	x20, x19
    7dd4:	54fffea1 	b.ne	7da8 <_fwalk+0x48>  // b.any
    7dd8:	f94002b5 	ldr	x21, [x21]
    7ddc:	b5fffd35 	cbnz	x21, 7d80 <_fwalk+0x20>
    7de0:	2a1703e0 	mov	w0, w23
    7de4:	a94153f3 	ldp	x19, x20, [sp, #16]
    7de8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7dec:	f9401bf7 	ldr	x23, [sp, #48]
    7df0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7df4:	d65f03c0 	ret
    7df8:	d503201f 	nop
    7dfc:	d503201f 	nop

0000000000007e00 <_fwalk_reent>:
    7e00:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    7e04:	910003fd 	mov	x29, sp
    7e08:	a9025bf5 	stp	x21, x22, [sp, #32]
    7e0c:	aa0103f6 	mov	x22, x1
    7e10:	91148015 	add	x21, x0, #0x520
    7e14:	a90363f7 	stp	x23, x24, [sp, #48]
    7e18:	aa0003f8 	mov	x24, x0
    7e1c:	52800017 	mov	w23, #0x0                   	// #0
    7e20:	a90153f3 	stp	x19, x20, [sp, #16]
    7e24:	d503201f 	nop
    7e28:	b9400aa2 	ldr	w2, [x21, #8]
    7e2c:	f9400ab3 	ldr	x19, [x21, #16]
    7e30:	7100005f 	cmp	w2, #0x0
    7e34:	5400028d 	b.le	7e84 <_fwalk_reent+0x84>
    7e38:	51000442 	sub	w2, w2, #0x1
    7e3c:	91000442 	add	x2, x2, #0x1
    7e40:	8b020454 	add	x20, x2, x2, lsl #1
    7e44:	d37ef694 	lsl	x20, x20, #2
    7e48:	cb020294 	sub	x20, x20, x2
    7e4c:	8b141274 	add	x20, x19, x20, lsl #4
    7e50:	79402262 	ldrh	w2, [x19, #16]
    7e54:	7100045f 	cmp	w2, #0x1
    7e58:	54000109 	b.ls	7e78 <_fwalk_reent+0x78>  // b.plast
    7e5c:	79c02662 	ldrsh	w2, [x19, #18]
    7e60:	aa1303e1 	mov	x1, x19
    7e64:	aa1803e0 	mov	x0, x24
    7e68:	3100045f 	cmn	w2, #0x1
    7e6c:	54000060 	b.eq	7e78 <_fwalk_reent+0x78>  // b.none
    7e70:	d63f02c0 	blr	x22
    7e74:	2a0002f7 	orr	w23, w23, w0
    7e78:	9102c273 	add	x19, x19, #0xb0
    7e7c:	eb13029f 	cmp	x20, x19
    7e80:	54fffe81 	b.ne	7e50 <_fwalk_reent+0x50>  // b.any
    7e84:	f94002b5 	ldr	x21, [x21]
    7e88:	b5fffd15 	cbnz	x21, 7e28 <_fwalk_reent+0x28>
    7e8c:	2a1703e0 	mov	w0, w23
    7e90:	a94153f3 	ldp	x19, x20, [sp, #16]
    7e94:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7e98:	a94363f7 	ldp	x23, x24, [sp, #48]
    7e9c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7ea0:	d65f03c0 	ret
    7ea4:	d503201f 	nop
    7ea8:	d503201f 	nop
    7eac:	d503201f 	nop

0000000000007eb0 <__localeconv_l>:
    7eb0:	91040000 	add	x0, x0, #0x100
    7eb4:	d65f03c0 	ret
    7eb8:	d503201f 	nop
    7ebc:	d503201f 	nop

0000000000007ec0 <_localeconv_r>:
    7ec0:	d0000020 	adrp	x0, d000 <impure_data+0x78>
    7ec4:	911fc000 	add	x0, x0, #0x7f0
    7ec8:	d65f03c0 	ret
    7ecc:	d503201f 	nop

0000000000007ed0 <localeconv>:
    7ed0:	d0000020 	adrp	x0, d000 <impure_data+0x78>
    7ed4:	911fc000 	add	x0, x0, #0x7f0
    7ed8:	d65f03c0 	ret
    7edc:	d503201f 	nop

0000000000007ee0 <currentlocale>:
    7ee0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    7ee4:	910003fd 	mov	x29, sp
    7ee8:	a90153f3 	stp	x19, x20, [sp, #16]
    7eec:	d0000034 	adrp	x20, d000 <impure_data+0x78>
    7ef0:	911bc294 	add	x20, x20, #0x6f0
    7ef4:	a9025bf5 	stp	x21, x22, [sp, #32]
    7ef8:	91010296 	add	x22, x20, #0x40
    7efc:	f0000035 	adrp	x21, e000 <__malloc_av_+0x768>
    7f00:	9107a2b5 	add	x21, x21, #0x1e8
    7f04:	f9001bf7 	str	x23, [sp, #48]
    7f08:	91038297 	add	x23, x20, #0xe0
    7f0c:	91008294 	add	x20, x20, #0x20
    7f10:	aa1603f3 	mov	x19, x22
    7f14:	aa1503e0 	mov	x0, x21
    7f18:	aa1403e1 	mov	x1, x20
    7f1c:	94000b99 	bl	ad80 <strcpy>
    7f20:	aa1303e1 	mov	x1, x19
    7f24:	aa1403e0 	mov	x0, x20
    7f28:	91008273 	add	x19, x19, #0x20
    7f2c:	94000b55 	bl	ac80 <strcmp>
    7f30:	35000120 	cbnz	w0, 7f54 <currentlocale+0x74>
    7f34:	eb17027f 	cmp	x19, x23
    7f38:	54ffff41 	b.ne	7f20 <currentlocale+0x40>  // b.any
    7f3c:	aa1503e0 	mov	x0, x21
    7f40:	a94153f3 	ldp	x19, x20, [sp, #16]
    7f44:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7f48:	f9401bf7 	ldr	x23, [sp, #48]
    7f4c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7f50:	d65f03c0 	ret
    7f54:	b0000033 	adrp	x19, c000 <_reclaim_reent+0xc0>
    7f58:	91274273 	add	x19, x19, #0x9d0
    7f5c:	aa1303e1 	mov	x1, x19
    7f60:	aa1503e0 	mov	x0, x21
    7f64:	94000ae7 	bl	ab00 <strcat>
    7f68:	aa1603e1 	mov	x1, x22
    7f6c:	aa1503e0 	mov	x0, x21
    7f70:	910082d6 	add	x22, x22, #0x20
    7f74:	94000ae3 	bl	ab00 <strcat>
    7f78:	eb1702df 	cmp	x22, x23
    7f7c:	54ffff01 	b.ne	7f5c <currentlocale+0x7c>  // b.any
    7f80:	aa1503e0 	mov	x0, x21
    7f84:	a94153f3 	ldp	x19, x20, [sp, #16]
    7f88:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7f8c:	f9401bf7 	ldr	x23, [sp, #48]
    7f90:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7f94:	d65f03c0 	ret
    7f98:	d503201f 	nop
    7f9c:	d503201f 	nop

0000000000007fa0 <__loadlocale>:
    7fa0:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    7fa4:	910003fd 	mov	x29, sp
    7fa8:	a90153f3 	stp	x19, x20, [sp, #16]
    7fac:	937b7c34 	sbfiz	x20, x1, #5, #32
    7fb0:	8b140014 	add	x20, x0, x20
    7fb4:	aa0203f3 	mov	x19, x2
    7fb8:	a9025bf5 	stp	x21, x22, [sp, #32]
    7fbc:	aa0003f6 	mov	x22, x0
    7fc0:	aa0203e0 	mov	x0, x2
    7fc4:	a90363f7 	stp	x23, x24, [sp, #48]
    7fc8:	2a0103f7 	mov	w23, w1
    7fcc:	aa1403e1 	mov	x1, x20
    7fd0:	94000b2c 	bl	ac80 <strcmp>
    7fd4:	350000e0 	cbnz	w0, 7ff0 <__loadlocale+0x50>
    7fd8:	aa1403e0 	mov	x0, x20
    7fdc:	a94153f3 	ldp	x19, x20, [sp, #16]
    7fe0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7fe4:	a94363f7 	ldp	x23, x24, [sp, #48]
    7fe8:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    7fec:	d65f03c0 	ret
    7ff0:	aa1303e0 	mov	x0, x19
    7ff4:	b0000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    7ff8:	b0000035 	adrp	x21, c000 <_reclaim_reent+0xc0>
    7ffc:	91276021 	add	x1, x1, #0x9d8
    8000:	912782b5 	add	x21, x21, #0x9e0
    8004:	a9046bf9 	stp	x25, x26, [sp, #64]
    8008:	94000b1e 	bl	ac80 <strcmp>
    800c:	34000d80 	cbz	w0, 81bc <__loadlocale+0x21c>
    8010:	aa1503e1 	mov	x1, x21
    8014:	aa1303e0 	mov	x0, x19
    8018:	94000b1a 	bl	ac80 <strcmp>
    801c:	2a0003f5 	mov	w21, w0
    8020:	34000be0 	cbz	w0, 819c <__loadlocale+0x1fc>
    8024:	39400260 	ldrb	w0, [x19]
    8028:	71010c1f 	cmp	w0, #0x43
    802c:	54000d00 	b.eq	81cc <__loadlocale+0x22c>  // b.none
    8030:	51018400 	sub	w0, w0, #0x61
    8034:	12001c00 	and	w0, w0, #0xff
    8038:	7100641f 	cmp	w0, #0x19
    803c:	54000a08 	b.hi	817c <__loadlocale+0x1dc>  // b.pmore
    8040:	39400660 	ldrb	w0, [x19, #1]
    8044:	51018400 	sub	w0, w0, #0x61
    8048:	12001c00 	and	w0, w0, #0xff
    804c:	7100641f 	cmp	w0, #0x19
    8050:	54000968 	b.hi	817c <__loadlocale+0x1dc>  // b.pmore
    8054:	39400a60 	ldrb	w0, [x19, #2]
    8058:	91000a75 	add	x21, x19, #0x2
    805c:	51018401 	sub	w1, w0, #0x61
    8060:	12001c21 	and	w1, w1, #0xff
    8064:	7100643f 	cmp	w1, #0x19
    8068:	54000068 	b.hi	8074 <__loadlocale+0xd4>  // b.pmore
    806c:	39400e60 	ldrb	w0, [x19, #3]
    8070:	91000e75 	add	x21, x19, #0x3
    8074:	71017c1f 	cmp	w0, #0x5f
    8078:	54000d00 	b.eq	8218 <__loadlocale+0x278>  // b.none
    807c:	7100b81f 	cmp	w0, #0x2e
    8080:	54002ec0 	b.eq	8658 <__loadlocale+0x6b8>  // b.none
    8084:	528017e1 	mov	w1, #0xbf                  	// #191
    8088:	6a01001f 	tst	w0, w1
    808c:	54000781 	b.ne	817c <__loadlocale+0x1dc>  // b.any
    8090:	910203f8 	add	x24, sp, #0x80
    8094:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8098:	aa1803e0 	mov	x0, x24
    809c:	9127c021 	add	x1, x1, #0x9f0
    80a0:	94000b38 	bl	ad80 <strcpy>
    80a4:	394002a0 	ldrb	w0, [x21]
    80a8:	7101001f 	cmp	w0, #0x40
    80ac:	54002da0 	b.eq	8660 <__loadlocale+0x6c0>  // b.none
    80b0:	52800019 	mov	w25, #0x0                   	// #0
    80b4:	52800015 	mov	w21, #0x0                   	// #0
    80b8:	5280001a 	mov	w26, #0x0                   	// #0
    80bc:	394203e1 	ldrb	w1, [sp, #128]
    80c0:	51010421 	sub	w1, w1, #0x41
    80c4:	7100d03f 	cmp	w1, #0x34
    80c8:	540005a8 	b.hi	817c <__loadlocale+0x1dc>  // b.pmore
    80cc:	90000020 	adrp	x0, c000 <_reclaim_reent+0xc0>
    80d0:	912ba000 	add	x0, x0, #0xae8
    80d4:	a90573fb 	stp	x27, x28, [sp, #80]
    80d8:	78615800 	ldrh	w0, [x0, w1, uxtw #1]
    80dc:	10000061 	adr	x1, 80e8 <__loadlocale+0x148>
    80e0:	8b20a820 	add	x0, x1, w0, sxth #2
    80e4:	d61f0000 	br	x0
    80e8:	394207e0 	ldrb	w0, [sp, #129]
    80ec:	121a7800 	and	w0, w0, #0xffffffdf
    80f0:	12001c00 	and	w0, w0, #0xff
    80f4:	7101401f 	cmp	w0, #0x50
    80f8:	54000401 	b.ne	8178 <__loadlocale+0x1d8>  // b.any
    80fc:	d2800042 	mov	x2, #0x2                   	// #2
    8100:	aa1803e0 	mov	x0, x24
    8104:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8108:	912a0021 	add	x1, x1, #0xa80
    810c:	94000bc9 	bl	b030 <strncpy>
    8110:	9101e3e1 	add	x1, sp, #0x78
    8114:	91020be0 	add	x0, sp, #0x82
    8118:	52800142 	mov	w2, #0xa                   	// #10
    811c:	94000c71 	bl	b2e0 <strtol>
    8120:	f9403fe1 	ldr	x1, [sp, #120]
    8124:	39400021 	ldrb	w1, [x1]
    8128:	35000281 	cbnz	w1, 8178 <__loadlocale+0x1d8>
    812c:	f10e901f 	cmp	x0, #0x3a4
    8130:	540030a0 	b.eq	8744 <__loadlocale+0x7a4>  // b.none
    8134:	54002f2c 	b.gt	8718 <__loadlocale+0x778>
    8138:	f10d881f 	cmp	x0, #0x362
    813c:	54002dec 	b.gt	86f8 <__loadlocale+0x758>
    8140:	f10d441f 	cmp	x0, #0x351
    8144:	54002c8c 	b.gt	86d4 <__loadlocale+0x734>
    8148:	f106d41f 	cmp	x0, #0x1b5
    814c:	54002da0 	b.eq	8700 <__loadlocale+0x760>  // b.none
    8150:	d10b4000 	sub	x0, x0, #0x2d0
    8154:	f100dc1f 	cmp	x0, #0x37
    8158:	54000108 	b.hi	8178 <__loadlocale+0x1d8>  // b.pmore
    815c:	d2800021 	mov	x1, #0x1                   	// #1
    8160:	d280003c 	mov	x28, #0x1                   	// #1
    8164:	f2a00041 	movk	x1, #0x2, lsl #16
    8168:	9ac02380 	lsl	x0, x28, x0
    816c:	f2e01001 	movk	x1, #0x80, lsl #48
    8170:	ea01001f 	tst	x0, x1
    8174:	54000e21 	b.ne	8338 <__loadlocale+0x398>  // b.any
    8178:	a94573fb 	ldp	x27, x28, [sp, #80]
    817c:	d2800014 	mov	x20, #0x0                   	// #0
    8180:	aa1403e0 	mov	x0, x20
    8184:	a94153f3 	ldp	x19, x20, [sp, #16]
    8188:	a9425bf5 	ldp	x21, x22, [sp, #32]
    818c:	a94363f7 	ldp	x23, x24, [sp, #48]
    8190:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8194:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8198:	d65f03c0 	ret
    819c:	910203f8 	add	x24, sp, #0x80
    81a0:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    81a4:	aa1803e0 	mov	x0, x24
    81a8:	9127a021 	add	x1, x1, #0x9e8
    81ac:	52800019 	mov	w25, #0x0                   	// #0
    81b0:	5280001a 	mov	w26, #0x0                   	// #0
    81b4:	94000af3 	bl	ad80 <strcpy>
    81b8:	17ffffc1 	b	80bc <__loadlocale+0x11c>
    81bc:	aa1503e1 	mov	x1, x21
    81c0:	aa1303e0 	mov	x0, x19
    81c4:	94000aef 	bl	ad80 <strcpy>
    81c8:	17ffff92 	b	8010 <__loadlocale+0x70>
    81cc:	39400660 	ldrb	w0, [x19, #1]
    81d0:	5100b400 	sub	w0, w0, #0x2d
    81d4:	12001c00 	and	w0, w0, #0xff
    81d8:	7100041f 	cmp	w0, #0x1
    81dc:	54fffd08 	b.hi	817c <__loadlocale+0x1dc>  // b.pmore
    81e0:	91000a75 	add	x21, x19, #0x2
    81e4:	910203f8 	add	x24, sp, #0x80
    81e8:	aa1503e1 	mov	x1, x21
    81ec:	aa1803e0 	mov	x0, x24
    81f0:	94000ae4 	bl	ad80 <strcpy>
    81f4:	aa1803e0 	mov	x0, x24
    81f8:	52800801 	mov	w1, #0x40                  	// #64
    81fc:	94000a5e 	bl	ab74 <strchr>
    8200:	b4000040 	cbz	x0, 8208 <__loadlocale+0x268>
    8204:	3900001f 	strb	wzr, [x0]
    8208:	aa1803e0 	mov	x0, x24
    820c:	97fff1fd 	bl	4a00 <strlen>
    8210:	8b0002b5 	add	x21, x21, x0
    8214:	17ffffa4 	b	80a4 <__loadlocale+0x104>
    8218:	394006a0 	ldrb	w0, [x21, #1]
    821c:	51010400 	sub	w0, w0, #0x41
    8220:	12001c00 	and	w0, w0, #0xff
    8224:	7100641f 	cmp	w0, #0x19
    8228:	54fffaa8 	b.hi	817c <__loadlocale+0x1dc>  // b.pmore
    822c:	39400aa0 	ldrb	w0, [x21, #2]
    8230:	51010400 	sub	w0, w0, #0x41
    8234:	12001c00 	and	w0, w0, #0xff
    8238:	7100641f 	cmp	w0, #0x19
    823c:	54fffa08 	b.hi	817c <__loadlocale+0x1dc>  // b.pmore
    8240:	39400ea0 	ldrb	w0, [x21, #3]
    8244:	91000eb5 	add	x21, x21, #0x3
    8248:	17ffff8d 	b	807c <__loadlocale+0xdc>
    824c:	9000003b 	adrp	x27, c000 <_reclaim_reent+0xc0>
    8250:	9128a37b 	add	x27, x27, #0xa28
    8254:	aa1b03e1 	mov	x1, x27
    8258:	aa1803e0 	mov	x0, x24
    825c:	94000a0d 	bl	aa90 <strcasecmp>
    8260:	340000c0 	cbz	w0, 8278 <__loadlocale+0x2d8>
    8264:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8268:	aa1803e0 	mov	x0, x24
    826c:	9128c021 	add	x1, x1, #0xa30
    8270:	94000a08 	bl	aa90 <strcasecmp>
    8274:	35fff820 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    8278:	aa1b03e1 	mov	x1, x27
    827c:	aa1803e0 	mov	x0, x24
    8280:	94000ac0 	bl	ad80 <strcpy>
    8284:	b000001b 	adrp	x27, 9000 <_malloc_r+0x1c0>
    8288:	f0000002 	adrp	x2, b000 <strncasecmp+0x60>
    828c:	911b437b 	add	x27, x27, #0x6d0
    8290:	911bc042 	add	x2, x2, #0x6f0
    8294:	528000dc 	mov	w28, #0x6                   	// #6
    8298:	71000aff 	cmp	w23, #0x2
    829c:	54001b00 	b.eq	85fc <__loadlocale+0x65c>  // b.none
    82a0:	71001aff 	cmp	w23, #0x6
    82a4:	54000081 	b.ne	82b4 <__loadlocale+0x314>  // b.any
    82a8:	aa1803e1 	mov	x1, x24
    82ac:	91060ac0 	add	x0, x22, #0x182
    82b0:	94000ab4 	bl	ad80 <strcpy>
    82b4:	aa1303e1 	mov	x1, x19
    82b8:	aa1403e0 	mov	x0, x20
    82bc:	94000ab1 	bl	ad80 <strcpy>
    82c0:	aa0003f4 	mov	x20, x0
    82c4:	aa1403e0 	mov	x0, x20
    82c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    82cc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    82d0:	a94363f7 	ldp	x23, x24, [sp, #48]
    82d4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    82d8:	a94573fb 	ldp	x27, x28, [sp, #80]
    82dc:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    82e0:	d65f03c0 	ret
    82e4:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    82e8:	aa1803e0 	mov	x0, x24
    82ec:	912b4021 	add	x1, x1, #0xad0
    82f0:	d2800062 	mov	x2, #0x3                   	// #3
    82f4:	94000b2b 	bl	afa0 <strncasecmp>
    82f8:	35fff400 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    82fc:	39420fe0 	ldrb	w0, [sp, #131]
    8300:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8304:	912b6021 	add	x1, x1, #0xad8
    8308:	7100b41f 	cmp	w0, #0x2d
    830c:	910283e0 	add	x0, sp, #0xa0
    8310:	9a801400 	cinc	x0, x0, eq  // eq = none
    8314:	d1007400 	sub	x0, x0, #0x1d
    8318:	94000a5a 	bl	ac80 <strcmp>
    831c:	35fff2e0 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    8320:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8324:	aa1803e0 	mov	x0, x24
    8328:	912b8021 	add	x1, x1, #0xae0
    832c:	d503201f 	nop
    8330:	5280003c 	mov	w28, #0x1                   	// #1
    8334:	94000a93 	bl	ad80 <strcpy>
    8338:	b000001b 	adrp	x27, 9000 <_malloc_r+0x1c0>
    833c:	f0000002 	adrp	x2, b000 <strncasecmp+0x60>
    8340:	911a037b 	add	x27, x27, #0x680
    8344:	911ac042 	add	x2, x2, #0x6b0
    8348:	17ffffd4 	b	8298 <__loadlocale+0x2f8>
    834c:	9000003b 	adrp	x27, c000 <_reclaim_reent+0xc0>
    8350:	9129637b 	add	x27, x27, #0xa58
    8354:	aa1b03e1 	mov	x1, x27
    8358:	aa1803e0 	mov	x0, x24
    835c:	940009cd 	bl	aa90 <strcasecmp>
    8360:	35fff0c0 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    8364:	aa1b03e1 	mov	x1, x27
    8368:	aa1803e0 	mov	x0, x24
    836c:	94000a85 	bl	ad80 <strcpy>
    8370:	b000001b 	adrp	x27, 9000 <_malloc_r+0x1c0>
    8374:	f0000002 	adrp	x2, b000 <strncasecmp+0x60>
    8378:	9126837b 	add	x27, x27, #0x9a0
    837c:	911f8042 	add	x2, x2, #0x7e0
    8380:	5280005c 	mov	w28, #0x2                   	// #2
    8384:	17ffffc5 	b	8298 <__loadlocale+0x2f8>
    8388:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    838c:	aa1803e0 	mov	x0, x24
    8390:	912b0021 	add	x1, x1, #0xac0
    8394:	940009bf 	bl	aa90 <strcasecmp>
    8398:	35ffef00 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    839c:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    83a0:	aa1803e0 	mov	x0, x24
    83a4:	912b2021 	add	x1, x1, #0xac8
    83a8:	17ffffe2 	b	8330 <__loadlocale+0x390>
    83ac:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    83b0:	aa1803e0 	mov	x0, x24
    83b4:	912a2021 	add	x1, x1, #0xa88
    83b8:	d2800082 	mov	x2, #0x4                   	// #4
    83bc:	94000af9 	bl	afa0 <strncasecmp>
    83c0:	35ffedc0 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    83c4:	394213e0 	ldrb	w0, [sp, #132]
    83c8:	394217e1 	ldrb	w1, [sp, #133]
    83cc:	7100b41f 	cmp	w0, #0x2d
    83d0:	1a800020 	csel	w0, w1, w0, eq  // eq = none
    83d4:	121a7800 	and	w0, w0, #0xffffffdf
    83d8:	12001c00 	and	w0, w0, #0xff
    83dc:	7101481f 	cmp	w0, #0x52
    83e0:	54001aa0 	b.eq	8734 <__loadlocale+0x794>  // b.none
    83e4:	7101541f 	cmp	w0, #0x55
    83e8:	54ffec81 	b.ne	8178 <__loadlocale+0x1d8>  // b.any
    83ec:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    83f0:	aa1803e0 	mov	x0, x24
    83f4:	912a6021 	add	x1, x1, #0xa98
    83f8:	17ffffce 	b	8330 <__loadlocale+0x390>
    83fc:	9000003b 	adrp	x27, c000 <_reclaim_reent+0xc0>
    8400:	9128e37b 	add	x27, x27, #0xa38
    8404:	aa1b03e1 	mov	x1, x27
    8408:	aa1803e0 	mov	x0, x24
    840c:	940009a1 	bl	aa90 <strcasecmp>
    8410:	35ffeb40 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    8414:	aa1b03e1 	mov	x1, x27
    8418:	aa1803e0 	mov	x0, x24
    841c:	94000a59 	bl	ad80 <strcpy>
    8420:	b000001b 	adrp	x27, 9000 <_malloc_r+0x1c0>
    8424:	f0000002 	adrp	x2, b000 <strncasecmp+0x60>
    8428:	912e837b 	add	x27, x27, #0xba0
    842c:	91248042 	add	x2, x2, #0x920
    8430:	5280011c 	mov	w28, #0x8                   	// #8
    8434:	17ffff99 	b	8298 <__loadlocale+0x2f8>
    8438:	9000003b 	adrp	x27, c000 <_reclaim_reent+0xc0>
    843c:	9127a37b 	add	x27, x27, #0x9e8
    8440:	aa1b03e1 	mov	x1, x27
    8444:	aa1803e0 	mov	x0, x24
    8448:	94000992 	bl	aa90 <strcasecmp>
    844c:	35ffe960 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    8450:	aa1b03e1 	mov	x1, x27
    8454:	aa1803e0 	mov	x0, x24
    8458:	17ffffb6 	b	8330 <__loadlocale+0x390>
    845c:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8460:	aa1803e0 	mov	x0, x24
    8464:	912a8021 	add	x1, x1, #0xaa0
    8468:	d2800102 	mov	x2, #0x8                   	// #8
    846c:	94000acd 	bl	afa0 <strncasecmp>
    8470:	35ffe840 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    8474:	394223e0 	ldrb	w0, [sp, #136]
    8478:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    847c:	912ac021 	add	x1, x1, #0xab0
    8480:	7100b41f 	cmp	w0, #0x2d
    8484:	910283e0 	add	x0, sp, #0xa0
    8488:	9a801400 	cinc	x0, x0, eq  // eq = none
    848c:	d1006000 	sub	x0, x0, #0x18
    8490:	94000980 	bl	aa90 <strcasecmp>
    8494:	35ffe720 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    8498:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    849c:	aa1803e0 	mov	x0, x24
    84a0:	912ae021 	add	x1, x1, #0xab8
    84a4:	17ffffa3 	b	8330 <__loadlocale+0x390>
    84a8:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    84ac:	aa1803e0 	mov	x0, x24
    84b0:	91290021 	add	x1, x1, #0xa40
    84b4:	d2800062 	mov	x2, #0x3                   	// #3
    84b8:	94000aba 	bl	afa0 <strncasecmp>
    84bc:	35ffe5e0 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    84c0:	39420fe0 	ldrb	w0, [sp, #131]
    84c4:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    84c8:	91292021 	add	x1, x1, #0xa48
    84cc:	7100b41f 	cmp	w0, #0x2d
    84d0:	910283e0 	add	x0, sp, #0xa0
    84d4:	9a801400 	cinc	x0, x0, eq  // eq = none
    84d8:	d1007400 	sub	x0, x0, #0x1d
    84dc:	9400096d 	bl	aa90 <strcasecmp>
    84e0:	35ffe4c0 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    84e4:	aa1803e0 	mov	x0, x24
    84e8:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    84ec:	91294021 	add	x1, x1, #0xa50
    84f0:	94000a24 	bl	ad80 <strcpy>
    84f4:	b000001b 	adrp	x27, 9000 <_malloc_r+0x1c0>
    84f8:	f0000002 	adrp	x2, b000 <strncasecmp+0x60>
    84fc:	9129c37b 	add	x27, x27, #0xa70
    8500:	9121c042 	add	x2, x2, #0x870
    8504:	5280007c 	mov	w28, #0x3                   	// #3
    8508:	17ffff64 	b	8298 <__loadlocale+0x2f8>
    850c:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8510:	aa1803e0 	mov	x0, x24
    8514:	91298021 	add	x1, x1, #0xa60
    8518:	d2800062 	mov	x2, #0x3                   	// #3
    851c:	94000aa1 	bl	afa0 <strncasecmp>
    8520:	35ffe2c0 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    8524:	39420fe0 	ldrb	w0, [sp, #131]
    8528:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    852c:	d2800082 	mov	x2, #0x4                   	// #4
    8530:	9129a021 	add	x1, x1, #0xa68
    8534:	7100b41f 	cmp	w0, #0x2d
    8538:	910283e0 	add	x0, sp, #0xa0
    853c:	9a80141b 	cinc	x27, x0, eq  // eq = none
    8540:	d100777b 	sub	x27, x27, #0x1d
    8544:	aa1b03e0 	mov	x0, x27
    8548:	94000a96 	bl	afa0 <strncasecmp>
    854c:	35ffe160 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    8550:	39401360 	ldrb	w0, [x27, #4]
    8554:	9101e3e1 	add	x1, sp, #0x78
    8558:	52800142 	mov	w2, #0xa                   	// #10
    855c:	7100b41f 	cmp	w0, #0x2d
    8560:	9a9b1760 	cinc	x0, x27, eq  // eq = none
    8564:	91001000 	add	x0, x0, #0x4
    8568:	94000b5e 	bl	b2e0 <strtol>
    856c:	aa0003e3 	mov	x3, x0
    8570:	d1000400 	sub	x0, x0, #0x1
    8574:	f90037e3 	str	x3, [sp, #104]
    8578:	f1003c1f 	cmp	x0, #0xf
    857c:	fa4c9864 	ccmp	x3, #0xc, #0x4, ls  // ls = plast
    8580:	54ffdfc0 	b.eq	8178 <__loadlocale+0x1d8>  // b.none
    8584:	f9403fe0 	ldr	x0, [sp, #120]
    8588:	39400000 	ldrb	w0, [x0]
    858c:	35ffdf60 	cbnz	w0, 8178 <__loadlocale+0x1d8>
    8590:	aa1803e0 	mov	x0, x24
    8594:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8598:	9129c021 	add	x1, x1, #0xa70
    859c:	940009f9 	bl	ad80 <strcpy>
    85a0:	f94037e3 	ldr	x3, [sp, #104]
    85a4:	910227e4 	add	x4, sp, #0x89
    85a8:	f100287f 	cmp	x3, #0xa
    85ac:	5400008d 	b.le	85bc <__loadlocale+0x61c>
    85b0:	91022be4 	add	x4, sp, #0x8a
    85b4:	52800620 	mov	w0, #0x31                  	// #49
    85b8:	390227e0 	strb	w0, [sp, #137]
    85bc:	b203e7e1 	mov	x1, #0x6666666666666666    	// #7378697629483820646
    85c0:	b000001b 	adrp	x27, 9000 <_malloc_r+0x1c0>
    85c4:	f28ccce1 	movk	x1, #0x6667
    85c8:	f0000002 	adrp	x2, b000 <strncasecmp+0x60>
    85cc:	911a037b 	add	x27, x27, #0x680
    85d0:	911ac042 	add	x2, x2, #0x6b0
    85d4:	9b417c61 	smulh	x1, x3, x1
    85d8:	5280003c 	mov	w28, #0x1                   	// #1
    85dc:	3900049f 	strb	wzr, [x4, #1]
    85e0:	9342fc21 	asr	x1, x1, #2
    85e4:	cb83fc21 	sub	x1, x1, x3, asr #63
    85e8:	8b010821 	add	x1, x1, x1, lsl #2
    85ec:	cb010460 	sub	x0, x3, x1, lsl #1
    85f0:	1100c000 	add	w0, w0, #0x30
    85f4:	39000080 	strb	w0, [x4]
    85f8:	17ffff28 	b	8298 <__loadlocale+0x2f8>
    85fc:	aa1803e1 	mov	x1, x24
    8600:	91058ac0 	add	x0, x22, #0x162
    8604:	f90037e2 	str	x2, [sp, #104]
    8608:	940009de 	bl	ad80 <strcpy>
    860c:	f94037e2 	ldr	x2, [sp, #104]
    8610:	a90e6ec2 	stp	x2, x27, [x22, #224]
    8614:	aa1803e1 	mov	x1, x24
    8618:	390582dc 	strb	w28, [x22, #352]
    861c:	aa1603e0 	mov	x0, x22
    8620:	94000d1c 	bl	ba90 <__set_ctype>
    8624:	35000139 	cbnz	w25, 8648 <__loadlocale+0x6a8>
    8628:	7100079f 	cmp	w28, #0x1
    862c:	520002b5 	eor	w21, w21, #0x1
    8630:	1a9fd7e0 	cset	w0, gt
    8634:	6a0002bf 	tst	w21, w0
    8638:	54000080 	b.eq	8648 <__loadlocale+0x6a8>  // b.none
    863c:	394203e0 	ldrb	w0, [sp, #128]
    8640:	7101541f 	cmp	w0, #0x55
    8644:	1a9f07f9 	cset	w25, ne  // ne = any
    8648:	7100035f 	cmp	w26, #0x0
    864c:	5a9f0339 	csinv	w25, w25, wzr, eq  // eq = none
    8650:	b900f2d9 	str	w25, [x22, #240]
    8654:	17ffff18 	b	82b4 <__loadlocale+0x314>
    8658:	910006b5 	add	x21, x21, #0x1
    865c:	17fffee2 	b	81e4 <__loadlocale+0x244>
    8660:	a90573fb 	stp	x27, x28, [sp, #80]
    8664:	910006bb 	add	x27, x21, #0x1
    8668:	aa1b03e0 	mov	x0, x27
    866c:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8670:	52800019 	mov	w25, #0x0                   	// #0
    8674:	91280021 	add	x1, x1, #0xa00
    8678:	5280003a 	mov	w26, #0x1                   	// #1
    867c:	94000981 	bl	ac80 <strcmp>
    8680:	2a0003f5 	mov	w21, w0
    8684:	35000060 	cbnz	w0, 8690 <__loadlocale+0x6f0>
    8688:	a94573fb 	ldp	x27, x28, [sp, #80]
    868c:	17fffe8c 	b	80bc <__loadlocale+0x11c>
    8690:	aa1b03e0 	mov	x0, x27
    8694:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8698:	5280001a 	mov	w26, #0x0                   	// #0
    869c:	91284021 	add	x1, x1, #0xa10
    86a0:	52800035 	mov	w21, #0x1                   	// #1
    86a4:	94000977 	bl	ac80 <strcmp>
    86a8:	2a0003f9 	mov	w25, w0
    86ac:	34fffee0 	cbz	w0, 8688 <__loadlocale+0x6e8>
    86b0:	aa1b03e0 	mov	x0, x27
    86b4:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    86b8:	91288021 	add	x1, x1, #0xa20
    86bc:	94000971 	bl	ac80 <strcmp>
    86c0:	7100001f 	cmp	w0, #0x0
    86c4:	52800015 	mov	w21, #0x0                   	// #0
    86c8:	1a9f17f9 	cset	w25, eq  // eq = none
    86cc:	a94573fb 	ldp	x27, x28, [sp, #80]
    86d0:	17fffe7b 	b	80bc <__loadlocale+0x11c>
    86d4:	d10d4800 	sub	x0, x0, #0x352
    86d8:	d280003c 	mov	x28, #0x1                   	// #1
    86dc:	d28234a1 	mov	x1, #0x11a5                	// #4517
    86e0:	f2a00021 	movk	x1, #0x1, lsl #16
    86e4:	9ac02380 	lsl	x0, x28, x0
    86e8:	ea01001f 	tst	x0, x1
    86ec:	54ffe261 	b.ne	8338 <__loadlocale+0x398>  // b.any
    86f0:	a94573fb 	ldp	x27, x28, [sp, #80]
    86f4:	17fffea2 	b	817c <__loadlocale+0x1dc>
    86f8:	f10da81f 	cmp	x0, #0x36a
    86fc:	54ffd3e1 	b.ne	8178 <__loadlocale+0x1d8>  // b.any
    8700:	b000001b 	adrp	x27, 9000 <_malloc_r+0x1c0>
    8704:	f0000002 	adrp	x2, b000 <strncasecmp+0x60>
    8708:	911a037b 	add	x27, x27, #0x680
    870c:	911ac042 	add	x2, x2, #0x6b0
    8710:	5280003c 	mov	w28, #0x1                   	// #1
    8714:	17fffee1 	b	8298 <__loadlocale+0x2f8>
    8718:	f111941f 	cmp	x0, #0x465
    871c:	54ffff20 	b.eq	8700 <__loadlocale+0x760>  // b.none
    8720:	d1138800 	sub	x0, x0, #0x4e2
    8724:	f100201f 	cmp	x0, #0x8
    8728:	54fffec9 	b.ls	8700 <__loadlocale+0x760>  // b.plast
    872c:	a94573fb 	ldp	x27, x28, [sp, #80]
    8730:	17fffe93 	b	817c <__loadlocale+0x1dc>
    8734:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8738:	aa1803e0 	mov	x0, x24
    873c:	912a4021 	add	x1, x1, #0xa90
    8740:	17fffefc 	b	8330 <__loadlocale+0x390>
    8744:	b000001b 	adrp	x27, 9000 <_malloc_r+0x1c0>
    8748:	f0000002 	adrp	x2, b000 <strncasecmp+0x60>
    874c:	9126837b 	add	x27, x27, #0x9a0
    8750:	911f8042 	add	x2, x2, #0x7e0
    8754:	5280005c 	mov	w28, #0x2                   	// #2
    8758:	17fffed0 	b	8298 <__loadlocale+0x2f8>
    875c:	d503201f 	nop

0000000000008760 <__get_locale_env>:
    8760:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    8764:	910003fd 	mov	x29, sp
    8768:	a90153f3 	stp	x19, x20, [sp, #16]
    876c:	2a0103f4 	mov	w20, w1
    8770:	aa0003f3 	mov	x19, x0
    8774:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8778:	912d6021 	add	x1, x1, #0xb58
    877c:	94000d85 	bl	bd90 <_getenv_r>
    8780:	b4000060 	cbz	x0, 878c <__get_locale_env+0x2c>
    8784:	39400001 	ldrb	w1, [x0]
    8788:	35000201 	cbnz	w1, 87c8 <__get_locale_env+0x68>
    878c:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    8790:	9135c021 	add	x1, x1, #0xd70
    8794:	aa1303e0 	mov	x0, x19
    8798:	f874d821 	ldr	x1, [x1, w20, sxtw #3]
    879c:	94000d7d 	bl	bd90 <_getenv_r>
    87a0:	b4000060 	cbz	x0, 87ac <__get_locale_env+0x4c>
    87a4:	39400001 	ldrb	w1, [x0]
    87a8:	35000101 	cbnz	w1, 87c8 <__get_locale_env+0x68>
    87ac:	90000021 	adrp	x1, c000 <_reclaim_reent+0xc0>
    87b0:	aa1303e0 	mov	x0, x19
    87b4:	912d8021 	add	x1, x1, #0xb60
    87b8:	94000d76 	bl	bd90 <_getenv_r>
    87bc:	b50000c0 	cbnz	x0, 87d4 <__get_locale_env+0x74>
    87c0:	b0000020 	adrp	x0, d000 <impure_data+0x78>
    87c4:	911b4000 	add	x0, x0, #0x6d0
    87c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    87cc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    87d0:	d65f03c0 	ret
    87d4:	39400001 	ldrb	w1, [x0]
    87d8:	35ffff81 	cbnz	w1, 87c8 <__get_locale_env+0x68>
    87dc:	b0000020 	adrp	x0, d000 <impure_data+0x78>
    87e0:	911b4000 	add	x0, x0, #0x6d0
    87e4:	17fffff9 	b	87c8 <__get_locale_env+0x68>
    87e8:	d503201f 	nop
    87ec:	d503201f 	nop

00000000000087f0 <_setlocale_r.part.0>:
    87f0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    87f4:	910003fd 	mov	x29, sp
    87f8:	a9025bf5 	stp	x21, x22, [sp, #32]
    87fc:	d0000035 	adrp	x21, e000 <__malloc_av_+0x768>
    8800:	b0000036 	adrp	x22, d000 <impure_data+0x78>
    8804:	910b42b5 	add	x21, x21, #0x2d0
    8808:	911bc2d6 	add	x22, x22, #0x6f0
    880c:	a90153f3 	stp	x19, x20, [sp, #16]
    8810:	910082d4 	add	x20, x22, #0x20
    8814:	a9046bf9 	stp	x25, x26, [sp, #64]
    8818:	910082b9 	add	x25, x21, #0x20
    881c:	aa0003fa 	mov	x26, x0
    8820:	aa1903f3 	mov	x19, x25
    8824:	a90363f7 	stp	x23, x24, [sp, #48]
    8828:	aa0203f8 	mov	x24, x2
    882c:	910382b7 	add	x23, x21, #0xe0
    8830:	a90573fb 	stp	x27, x28, [sp, #80]
    8834:	2a0103fc 	mov	w28, w1
    8838:	aa1403fb 	mov	x27, x20
    883c:	d503201f 	nop
    8840:	aa1b03e1 	mov	x1, x27
    8844:	aa1303e0 	mov	x0, x19
    8848:	91008273 	add	x19, x19, #0x20
    884c:	9400094d 	bl	ad80 <strcpy>
    8850:	9100837b 	add	x27, x27, #0x20
    8854:	eb17027f 	cmp	x19, x23
    8858:	54ffff41 	b.ne	8840 <_setlocale_r.part.0+0x50>  // b.any
    885c:	39400300 	ldrb	w0, [x24]
    8860:	350005e0 	cbnz	w0, 891c <_setlocale_r.part.0+0x12c>
    8864:	35000edc 	cbnz	w28, 8a3c <_setlocale_r.part.0+0x24c>
    8868:	aa1903f7 	mov	x23, x25
    886c:	52800033 	mov	w19, #0x1                   	// #1
    8870:	2a1303e1 	mov	w1, w19
    8874:	aa1a03e0 	mov	x0, x26
    8878:	97ffffba 	bl	8760 <__get_locale_env>
    887c:	aa0003f5 	mov	x21, x0
    8880:	11000673 	add	w19, w19, #0x1
    8884:	97fff05f 	bl	4a00 <strlen>
    8888:	aa0003e2 	mov	x2, x0
    888c:	aa1503e1 	mov	x1, x21
    8890:	aa1703e0 	mov	x0, x23
    8894:	f1007c5f 	cmp	x2, #0x1f
    8898:	54000be8 	b.hi	8a14 <_setlocale_r.part.0+0x224>  // b.pmore
    889c:	910082f7 	add	x23, x23, #0x20
    88a0:	94000938 	bl	ad80 <strcpy>
    88a4:	71001e7f 	cmp	w19, #0x7
    88a8:	54fffe41 	b.ne	8870 <_setlocale_r.part.0+0x80>  // b.any
    88ac:	d0000038 	adrp	x24, e000 <__malloc_av_+0x768>
    88b0:	910ec318 	add	x24, x24, #0x3b0
    88b4:	91008318 	add	x24, x24, #0x20
    88b8:	aa1903f7 	mov	x23, x25
    88bc:	aa1803f5 	mov	x21, x24
    88c0:	52800033 	mov	w19, #0x1                   	// #1
    88c4:	d503201f 	nop
    88c8:	aa1403e1 	mov	x1, x20
    88cc:	aa1503e0 	mov	x0, x21
    88d0:	9400092c 	bl	ad80 <strcpy>
    88d4:	aa1703e2 	mov	x2, x23
    88d8:	2a1303e1 	mov	w1, w19
    88dc:	aa1603e0 	mov	x0, x22
    88e0:	97fffdb0 	bl	7fa0 <__loadlocale>
    88e4:	b4000c60 	cbz	x0, 8a70 <_setlocale_r.part.0+0x280>
    88e8:	11000673 	add	w19, w19, #0x1
    88ec:	910082b5 	add	x21, x21, #0x20
    88f0:	91008294 	add	x20, x20, #0x20
    88f4:	910082f7 	add	x23, x23, #0x20
    88f8:	71001e7f 	cmp	w19, #0x7
    88fc:	54fffe61 	b.ne	88c8 <_setlocale_r.part.0+0xd8>  // b.any
    8900:	a94153f3 	ldp	x19, x20, [sp, #16]
    8904:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8908:	a94363f7 	ldp	x23, x24, [sp, #48]
    890c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8910:	a94573fb 	ldp	x27, x28, [sp, #80]
    8914:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8918:	17fffd72 	b	7ee0 <currentlocale>
    891c:	3500057c 	cbnz	w28, 89c8 <_setlocale_r.part.0+0x1d8>
    8920:	aa1803e0 	mov	x0, x24
    8924:	528005e1 	mov	w1, #0x2f                  	// #47
    8928:	94000893 	bl	ab74 <strchr>
    892c:	aa0003f3 	mov	x19, x0
    8930:	b5000060 	cbnz	x0, 893c <_setlocale_r.part.0+0x14c>
    8934:	14000085 	b	8b48 <_setlocale_r.part.0+0x358>
    8938:	91000673 	add	x19, x19, #0x1
    893c:	39400660 	ldrb	w0, [x19, #1]
    8940:	7100bc1f 	cmp	w0, #0x2f
    8944:	54ffffa0 	b.eq	8938 <_setlocale_r.part.0+0x148>  // b.none
    8948:	34000660 	cbz	w0, 8a14 <_setlocale_r.part.0+0x224>
    894c:	aa1903fb 	mov	x27, x25
    8950:	52800037 	mov	w23, #0x1                   	// #1
    8954:	cb180262 	sub	x2, x19, x24
    8958:	71007c5f 	cmp	w2, #0x1f
    895c:	540005cc 	b.gt	8a14 <_setlocale_r.part.0+0x224>
    8960:	11000442 	add	w2, w2, #0x1
    8964:	aa1803e1 	mov	x1, x24
    8968:	aa1b03e0 	mov	x0, x27
    896c:	110006f7 	add	w23, w23, #0x1
    8970:	93407c42 	sxtw	x2, w2
    8974:	94000973 	bl	af40 <strlcpy>
    8978:	39400260 	ldrb	w0, [x19]
    897c:	7100bc1f 	cmp	w0, #0x2f
    8980:	540000a1 	b.ne	8994 <_setlocale_r.part.0+0x1a4>  // b.any
    8984:	d503201f 	nop
    8988:	38401e60 	ldrb	w0, [x19, #1]!
    898c:	7100bc1f 	cmp	w0, #0x2f
    8990:	54ffffc0 	b.eq	8988 <_setlocale_r.part.0+0x198>  // b.none
    8994:	34000c00 	cbz	w0, 8b14 <_setlocale_r.part.0+0x324>
    8998:	aa1303e1 	mov	x1, x19
    899c:	d503201f 	nop
    89a0:	38401c20 	ldrb	w0, [x1, #1]!
    89a4:	7100bc1f 	cmp	w0, #0x2f
    89a8:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    89ac:	54ffffa1 	b.ne	89a0 <_setlocale_r.part.0+0x1b0>  // b.any
    89b0:	9100837b 	add	x27, x27, #0x20
    89b4:	71001eff 	cmp	w23, #0x7
    89b8:	54fff7a0 	b.eq	88ac <_setlocale_r.part.0+0xbc>  // b.none
    89bc:	aa1303f8 	mov	x24, x19
    89c0:	aa0103f3 	mov	x19, x1
    89c4:	17ffffe4 	b	8954 <_setlocale_r.part.0+0x164>
    89c8:	aa1803e0 	mov	x0, x24
    89cc:	97fff00d 	bl	4a00 <strlen>
    89d0:	f1007c1f 	cmp	x0, #0x1f
    89d4:	54000208 	b.hi	8a14 <_setlocale_r.part.0+0x224>  // b.pmore
    89d8:	937b7f80 	sbfiz	x0, x28, #5, #32
    89dc:	aa1803e1 	mov	x1, x24
    89e0:	8b0002b5 	add	x21, x21, x0
    89e4:	aa1503e0 	mov	x0, x21
    89e8:	940008e6 	bl	ad80 <strcpy>
    89ec:	aa1503e2 	mov	x2, x21
    89f0:	2a1c03e1 	mov	w1, w28
    89f4:	aa1603e0 	mov	x0, x22
    89f8:	a94153f3 	ldp	x19, x20, [sp, #16]
    89fc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8a00:	a94363f7 	ldp	x23, x24, [sp, #48]
    8a04:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8a08:	a94573fb 	ldp	x27, x28, [sp, #80]
    8a0c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8a10:	17fffd64 	b	7fa0 <__loadlocale>
    8a14:	528002c0 	mov	w0, #0x16                  	// #22
    8a18:	b9000340 	str	w0, [x26]
    8a1c:	d2800000 	mov	x0, #0x0                   	// #0
    8a20:	a94153f3 	ldp	x19, x20, [sp, #16]
    8a24:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8a28:	a94363f7 	ldp	x23, x24, [sp, #48]
    8a2c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8a30:	a94573fb 	ldp	x27, x28, [sp, #80]
    8a34:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8a38:	d65f03c0 	ret
    8a3c:	2a1c03e1 	mov	w1, w28
    8a40:	aa1a03e0 	mov	x0, x26
    8a44:	97ffff47 	bl	8760 <__get_locale_env>
    8a48:	aa0003f3 	mov	x19, x0
    8a4c:	97ffefed 	bl	4a00 <strlen>
    8a50:	f1007c1f 	cmp	x0, #0x1f
    8a54:	54fffe08 	b.hi	8a14 <_setlocale_r.part.0+0x224>  // b.pmore
    8a58:	937b7f80 	sbfiz	x0, x28, #5, #32
    8a5c:	aa1303e1 	mov	x1, x19
    8a60:	8b0002b5 	add	x21, x21, x0
    8a64:	aa1503e0 	mov	x0, x21
    8a68:	940008c6 	bl	ad80 <strcpy>
    8a6c:	17ffffe0 	b	89ec <_setlocale_r.part.0+0x1fc>
    8a70:	90000020 	adrp	x0, c000 <_reclaim_reent+0xc0>
    8a74:	b9400357 	ldr	w23, [x26]
    8a78:	91278015 	add	x21, x0, #0x9e0
    8a7c:	52800034 	mov	w20, #0x1                   	// #1
    8a80:	6b14027f 	cmp	w19, w20
    8a84:	540000e1 	b.ne	8aa0 <_setlocale_r.part.0+0x2b0>  // b.any
    8a88:	1400001a 	b	8af0 <_setlocale_r.part.0+0x300>
    8a8c:	11000694 	add	w20, w20, #0x1
    8a90:	91008339 	add	x25, x25, #0x20
    8a94:	91008318 	add	x24, x24, #0x20
    8a98:	6b14027f 	cmp	w19, w20
    8a9c:	540002a0 	b.eq	8af0 <_setlocale_r.part.0+0x300>  // b.none
    8aa0:	aa1803e1 	mov	x1, x24
    8aa4:	aa1903e0 	mov	x0, x25
    8aa8:	940008b6 	bl	ad80 <strcpy>
    8aac:	aa1903e2 	mov	x2, x25
    8ab0:	2a1403e1 	mov	w1, w20
    8ab4:	aa1603e0 	mov	x0, x22
    8ab8:	97fffd3a 	bl	7fa0 <__loadlocale>
    8abc:	b5fffe80 	cbnz	x0, 8a8c <_setlocale_r.part.0+0x29c>
    8ac0:	aa1503e1 	mov	x1, x21
    8ac4:	aa1903e0 	mov	x0, x25
    8ac8:	940008ae 	bl	ad80 <strcpy>
    8acc:	91008318 	add	x24, x24, #0x20
    8ad0:	aa1903e2 	mov	x2, x25
    8ad4:	2a1403e1 	mov	w1, w20
    8ad8:	aa1603e0 	mov	x0, x22
    8adc:	11000694 	add	w20, w20, #0x1
    8ae0:	97fffd30 	bl	7fa0 <__loadlocale>
    8ae4:	91008339 	add	x25, x25, #0x20
    8ae8:	6b14027f 	cmp	w19, w20
    8aec:	54fffda1 	b.ne	8aa0 <_setlocale_r.part.0+0x2b0>  // b.any
    8af0:	b9000357 	str	w23, [x26]
    8af4:	d2800000 	mov	x0, #0x0                   	// #0
    8af8:	a94153f3 	ldp	x19, x20, [sp, #16]
    8afc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8b00:	a94363f7 	ldp	x23, x24, [sp, #48]
    8b04:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8b08:	a94573fb 	ldp	x27, x28, [sp, #80]
    8b0c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8b10:	d65f03c0 	ret
    8b14:	71001eff 	cmp	w23, #0x7
    8b18:	54ffeca0 	b.eq	88ac <_setlocale_r.part.0+0xbc>  // b.none
    8b1c:	937b7ee0 	sbfiz	x0, x23, #5, #32
    8b20:	8b0002b5 	add	x21, x21, x0
    8b24:	d503201f 	nop
    8b28:	d10082a1 	sub	x1, x21, #0x20
    8b2c:	aa1503e0 	mov	x0, x21
    8b30:	110006f7 	add	w23, w23, #0x1
    8b34:	94000893 	bl	ad80 <strcpy>
    8b38:	910082b5 	add	x21, x21, #0x20
    8b3c:	71001eff 	cmp	w23, #0x7
    8b40:	54ffff41 	b.ne	8b28 <_setlocale_r.part.0+0x338>  // b.any
    8b44:	17ffff5a 	b	88ac <_setlocale_r.part.0+0xbc>
    8b48:	aa1803e0 	mov	x0, x24
    8b4c:	97ffefad 	bl	4a00 <strlen>
    8b50:	f1007c1f 	cmp	x0, #0x1f
    8b54:	54fff608 	b.hi	8a14 <_setlocale_r.part.0+0x224>  // b.pmore
    8b58:	aa1903f3 	mov	x19, x25
    8b5c:	d503201f 	nop
    8b60:	aa1303e0 	mov	x0, x19
    8b64:	aa1803e1 	mov	x1, x24
    8b68:	91008273 	add	x19, x19, #0x20
    8b6c:	94000885 	bl	ad80 <strcpy>
    8b70:	eb1302ff 	cmp	x23, x19
    8b74:	54ffff61 	b.ne	8b60 <_setlocale_r.part.0+0x370>  // b.any
    8b78:	17ffff4d 	b	88ac <_setlocale_r.part.0+0xbc>
    8b7c:	d503201f 	nop

0000000000008b80 <_setlocale_r>:
    8b80:	aa0003e5 	mov	x5, x0
    8b84:	7100183f 	cmp	w1, #0x6
    8b88:	54000068 	b.hi	8b94 <_setlocale_r+0x14>  // b.pmore
    8b8c:	b40000c2 	cbz	x2, 8ba4 <_setlocale_r+0x24>
    8b90:	17ffff18 	b	87f0 <_setlocale_r.part.0>
    8b94:	528002c1 	mov	w1, #0x16                  	// #22
    8b98:	d2800000 	mov	x0, #0x0                   	// #0
    8b9c:	b90000a1 	str	w1, [x5]
    8ba0:	d65f03c0 	ret
    8ba4:	340000c1 	cbz	w1, 8bbc <_setlocale_r+0x3c>
    8ba8:	937b7c23 	sbfiz	x3, x1, #5, #32
    8bac:	b0000020 	adrp	x0, d000 <impure_data+0x78>
    8bb0:	911bc000 	add	x0, x0, #0x6f0
    8bb4:	8b030000 	add	x0, x0, x3
    8bb8:	d65f03c0 	ret
    8bbc:	17fffcc9 	b	7ee0 <currentlocale>

0000000000008bc0 <__locale_mb_cur_max>:
    8bc0:	b0000020 	adrp	x0, d000 <impure_data+0x78>
    8bc4:	39614000 	ldrb	w0, [x0, #2128]
    8bc8:	d65f03c0 	ret
    8bcc:	d503201f 	nop

0000000000008bd0 <setlocale>:
    8bd0:	90000024 	adrp	x4, c000 <_reclaim_reent+0xc0>
    8bd4:	2a0003e3 	mov	w3, w0
    8bd8:	aa0103e2 	mov	x2, x1
    8bdc:	f947c080 	ldr	x0, [x4, #3968]
    8be0:	7100187f 	cmp	w3, #0x6
    8be4:	54000088 	b.hi	8bf4 <setlocale+0x24>  // b.pmore
    8be8:	b4000101 	cbz	x1, 8c08 <setlocale+0x38>
    8bec:	2a0303e1 	mov	w1, w3
    8bf0:	17ffff00 	b	87f0 <_setlocale_r.part.0>
    8bf4:	528002c1 	mov	w1, #0x16                  	// #22
    8bf8:	d2800003 	mov	x3, #0x0                   	// #0
    8bfc:	b9000001 	str	w1, [x0]
    8c00:	aa0303e0 	mov	x0, x3
    8c04:	d65f03c0 	ret
    8c08:	340000e3 	cbz	w3, 8c24 <setlocale+0x54>
    8c0c:	937b7c63 	sbfiz	x3, x3, #5, #32
    8c10:	b0000020 	adrp	x0, d000 <impure_data+0x78>
    8c14:	911bc000 	add	x0, x0, #0x6f0
    8c18:	8b030003 	add	x3, x0, x3
    8c1c:	aa0303e0 	mov	x0, x3
    8c20:	d65f03c0 	ret
    8c24:	17fffcaf 	b	7ee0 <currentlocale>
    8c28:	d503201f 	nop
    8c2c:	d503201f 	nop

0000000000008c30 <__smakebuf_r>:
    8c30:	a9b57bfd 	stp	x29, x30, [sp, #-176]!
    8c34:	910003fd 	mov	x29, sp
    8c38:	79402022 	ldrh	w2, [x1, #16]
    8c3c:	a90153f3 	stp	x19, x20, [sp, #16]
    8c40:	aa0103f3 	mov	x19, x1
    8c44:	36080122 	tbz	w2, #1, 8c68 <__smakebuf_r+0x38>
    8c48:	9101dc20 	add	x0, x1, #0x77
    8c4c:	52800021 	mov	w1, #0x1                   	// #1
    8c50:	f9000260 	str	x0, [x19]
    8c54:	f9000e60 	str	x0, [x19, #24]
    8c58:	b9002261 	str	w1, [x19, #32]
    8c5c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8c60:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    8c64:	d65f03c0 	ret
    8c68:	79c02421 	ldrsh	w1, [x1, #18]
    8c6c:	aa0003f4 	mov	x20, x0
    8c70:	a9025bf5 	stp	x21, x22, [sp, #32]
    8c74:	f9001bf7 	str	x23, [sp, #48]
    8c78:	37f80381 	tbnz	w1, #31, 8ce8 <__smakebuf_r+0xb8>
    8c7c:	910123e2 	add	x2, sp, #0x48
    8c80:	94000bf0 	bl	bc40 <_fstat_r>
    8c84:	37f80300 	tbnz	w0, #31, 8ce4 <__smakebuf_r+0xb4>
    8c88:	b9404fe0 	ldr	w0, [sp, #76]
    8c8c:	d2808016 	mov	x22, #0x400                 	// #1024
    8c90:	52810015 	mov	w21, #0x800                 	// #2048
    8c94:	aa1603e1 	mov	x1, x22
    8c98:	12140c00 	and	w0, w0, #0xf000
    8c9c:	7140081f 	cmp	w0, #0x2, lsl #12
    8ca0:	aa1403e0 	mov	x0, x20
    8ca4:	1a9f17f7 	cset	w23, eq  // eq = none
    8ca8:	94000066 	bl	8e40 <_malloc_r>
    8cac:	b5000320 	cbnz	x0, 8d10 <__smakebuf_r+0xe0>
    8cb0:	79c02260 	ldrsh	w0, [x19, #16]
    8cb4:	374805c0 	tbnz	w0, #9, 8d6c <__smakebuf_r+0x13c>
    8cb8:	121e7400 	and	w0, w0, #0xfffffffc
    8cbc:	9101de61 	add	x1, x19, #0x77
    8cc0:	321f0000 	orr	w0, w0, #0x2
    8cc4:	52800022 	mov	w2, #0x1                   	// #1
    8cc8:	79002260 	strh	w0, [x19, #16]
    8ccc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8cd0:	f9401bf7 	ldr	x23, [sp, #48]
    8cd4:	f9000261 	str	x1, [x19]
    8cd8:	f9000e61 	str	x1, [x19, #24]
    8cdc:	b9002262 	str	w2, [x19, #32]
    8ce0:	17ffffdf 	b	8c5c <__smakebuf_r+0x2c>
    8ce4:	79402262 	ldrh	w2, [x19, #16]
    8ce8:	f279005f 	tst	x2, #0x80
    8cec:	d2808001 	mov	x1, #0x400                 	// #1024
    8cf0:	d2800816 	mov	x22, #0x40                  	// #64
    8cf4:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    8cf8:	aa1603e1 	mov	x1, x22
    8cfc:	aa1403e0 	mov	x0, x20
    8d00:	52800017 	mov	w23, #0x0                   	// #0
    8d04:	52800015 	mov	w21, #0x0                   	// #0
    8d08:	9400004e 	bl	8e40 <_malloc_r>
    8d0c:	b4fffd20 	cbz	x0, 8cb0 <__smakebuf_r+0x80>
    8d10:	79c02262 	ldrsh	w2, [x19, #16]
    8d14:	d0ffffe1 	adrp	x1, 6000 <_vfiprintf_r+0x13c0>
    8d18:	913d4021 	add	x1, x1, #0xf50
    8d1c:	f9002e81 	str	x1, [x20, #88]
    8d20:	32190042 	orr	w2, w2, #0x80
    8d24:	f9000260 	str	x0, [x19]
    8d28:	79002262 	strh	w2, [x19, #16]
    8d2c:	f9000e60 	str	x0, [x19, #24]
    8d30:	b9002276 	str	w22, [x19, #32]
    8d34:	35000117 	cbnz	w23, 8d54 <__smakebuf_r+0x124>
    8d38:	2a150042 	orr	w2, w2, w21
    8d3c:	79002262 	strh	w2, [x19, #16]
    8d40:	a94153f3 	ldp	x19, x20, [sp, #16]
    8d44:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8d48:	f9401bf7 	ldr	x23, [sp, #48]
    8d4c:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    8d50:	d65f03c0 	ret
    8d54:	79c02661 	ldrsh	w1, [x19, #18]
    8d58:	aa1403e0 	mov	x0, x20
    8d5c:	94000c15 	bl	bdb0 <_isatty_r>
    8d60:	350000c0 	cbnz	w0, 8d78 <__smakebuf_r+0x148>
    8d64:	79c02262 	ldrsh	w2, [x19, #16]
    8d68:	17fffff4 	b	8d38 <__smakebuf_r+0x108>
    8d6c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8d70:	f9401bf7 	ldr	x23, [sp, #48]
    8d74:	17ffffba 	b	8c5c <__smakebuf_r+0x2c>
    8d78:	79402262 	ldrh	w2, [x19, #16]
    8d7c:	121e7442 	and	w2, w2, #0xfffffffc
    8d80:	32000042 	orr	w2, w2, #0x1
    8d84:	13003c42 	sxth	w2, w2
    8d88:	17ffffec 	b	8d38 <__smakebuf_r+0x108>
    8d8c:	d503201f 	nop

0000000000008d90 <__swhatbuf_r>:
    8d90:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    8d94:	910003fd 	mov	x29, sp
    8d98:	a90153f3 	stp	x19, x20, [sp, #16]
    8d9c:	aa0103f3 	mov	x19, x1
    8da0:	79c02421 	ldrsh	w1, [x1, #18]
    8da4:	f90013f5 	str	x21, [sp, #32]
    8da8:	aa0203f4 	mov	x20, x2
    8dac:	aa0303f5 	mov	x21, x3
    8db0:	37f80201 	tbnz	w1, #31, 8df0 <__swhatbuf_r+0x60>
    8db4:	9100e3e2 	add	x2, sp, #0x38
    8db8:	94000ba2 	bl	bc40 <_fstat_r>
    8dbc:	37f801a0 	tbnz	w0, #31, 8df0 <__swhatbuf_r+0x60>
    8dc0:	b9403fe1 	ldr	w1, [sp, #60]
    8dc4:	d2808002 	mov	x2, #0x400                 	// #1024
    8dc8:	52810000 	mov	w0, #0x800                 	// #2048
    8dcc:	12140c21 	and	w1, w1, #0xf000
    8dd0:	7140083f 	cmp	w1, #0x2, lsl #12
    8dd4:	1a9f17e1 	cset	w1, eq  // eq = none
    8dd8:	b90002a1 	str	w1, [x21]
    8ddc:	f9000282 	str	x2, [x20]
    8de0:	a94153f3 	ldp	x19, x20, [sp, #16]
    8de4:	f94013f5 	ldr	x21, [sp, #32]
    8de8:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8dec:	d65f03c0 	ret
    8df0:	79c02260 	ldrsh	w0, [x19, #16]
    8df4:	b90002bf 	str	wzr, [x21]
    8df8:	36380100 	tbz	w0, #7, 8e18 <__swhatbuf_r+0x88>
    8dfc:	d2800801 	mov	x1, #0x40                  	// #64
    8e00:	f9000281 	str	x1, [x20]
    8e04:	52800000 	mov	w0, #0x0                   	// #0
    8e08:	a94153f3 	ldp	x19, x20, [sp, #16]
    8e0c:	f94013f5 	ldr	x21, [sp, #32]
    8e10:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8e14:	d65f03c0 	ret
    8e18:	d2808001 	mov	x1, #0x400                 	// #1024
    8e1c:	f9000281 	str	x1, [x20]
    8e20:	52800000 	mov	w0, #0x0                   	// #0
    8e24:	a94153f3 	ldp	x19, x20, [sp, #16]
    8e28:	f94013f5 	ldr	x21, [sp, #32]
    8e2c:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8e30:	d65f03c0 	ret
    8e34:	d503201f 	nop
    8e38:	d503201f 	nop
    8e3c:	d503201f 	nop

0000000000008e40 <_malloc_r>:
    8e40:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    8e44:	910003fd 	mov	x29, sp
    8e48:	a90153f3 	stp	x19, x20, [sp, #16]
    8e4c:	91005c33 	add	x19, x1, #0x17
    8e50:	a9025bf5 	stp	x21, x22, [sp, #32]
    8e54:	aa0003f5 	mov	x21, x0
    8e58:	a90363f7 	stp	x23, x24, [sp, #48]
    8e5c:	f100ba7f 	cmp	x19, #0x2e
    8e60:	54000c88 	b.hi	8ff0 <_malloc_r+0x1b0>  // b.pmore
    8e64:	f100803f 	cmp	x1, #0x20
    8e68:	54002068 	b.hi	9274 <_malloc_r+0x434>  // b.pmore
    8e6c:	940003fd 	bl	9e60 <__malloc_lock>
    8e70:	d2800413 	mov	x19, #0x20                  	// #32
    8e74:	d2800a00 	mov	x0, #0x50                  	// #80
    8e78:	52800085 	mov	w5, #0x4                   	// #4
    8e7c:	b0000034 	adrp	x20, d000 <impure_data+0x78>
    8e80:	91226294 	add	x20, x20, #0x898
    8e84:	8b000280 	add	x0, x20, x0
    8e88:	110008a5 	add	w5, w5, #0x2
    8e8c:	d1004000 	sub	x0, x0, #0x10
    8e90:	f9400c01 	ldr	x1, [x0, #24]
    8e94:	eb00003f 	cmp	x1, x0
    8e98:	54002181 	b.ne	92c8 <_malloc_r+0x488>  // b.any
    8e9c:	f9401284 	ldr	x4, [x20, #32]
    8ea0:	91004282 	add	x2, x20, #0x10
    8ea4:	eb02009f 	cmp	x4, x2
    8ea8:	54000f20 	b.eq	908c <_malloc_r+0x24c>  // b.none
    8eac:	f9400481 	ldr	x1, [x4, #8]
    8eb0:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    8eb4:	cb130023 	sub	x3, x1, x19
    8eb8:	f1007c7f 	cmp	x3, #0x1f
    8ebc:	54002d4c 	b.gt	9464 <_malloc_r+0x624>
    8ec0:	a9020a82 	stp	x2, x2, [x20, #32]
    8ec4:	b6f81f23 	tbz	x3, #63, 92a8 <_malloc_r+0x468>
    8ec8:	f107fc3f 	cmp	x1, #0x1ff
    8ecc:	54002428 	b.hi	9350 <_malloc_r+0x510>  // b.pmore
    8ed0:	d343fc22 	lsr	x2, x1, #3
    8ed4:	d2800021 	mov	x1, #0x1                   	// #1
    8ed8:	11000440 	add	w0, w2, #0x1
    8edc:	13027c42 	asr	w2, w2, #2
    8ee0:	531f7800 	lsl	w0, w0, #1
    8ee4:	f9400683 	ldr	x3, [x20, #8]
    8ee8:	8b20ce80 	add	x0, x20, w0, sxtw #3
    8eec:	9ac22021 	lsl	x1, x1, x2
    8ef0:	aa030021 	orr	x1, x1, x3
    8ef4:	f85f0402 	ldr	x2, [x0], #-16
    8ef8:	f9000681 	str	x1, [x20, #8]
    8efc:	a9010082 	stp	x2, x0, [x4, #16]
    8f00:	f9000804 	str	x4, [x0, #16]
    8f04:	f9000c44 	str	x4, [x2, #24]
    8f08:	13027ca2 	asr	w2, w5, #2
    8f0c:	d2800020 	mov	x0, #0x1                   	// #1
    8f10:	9ac22000 	lsl	x0, x0, x2
    8f14:	eb01001f 	cmp	x0, x1
    8f18:	54000c68 	b.hi	90a4 <_malloc_r+0x264>  // b.pmore
    8f1c:	ea01001f 	tst	x0, x1
    8f20:	540000c1 	b.ne	8f38 <_malloc_r+0xf8>  // b.any
    8f24:	121e74a5 	and	w5, w5, #0xfffffffc
    8f28:	d37ff800 	lsl	x0, x0, #1
    8f2c:	110010a5 	add	w5, w5, #0x4
    8f30:	ea01001f 	tst	x0, x1
    8f34:	54ffffa0 	b.eq	8f28 <_malloc_r+0xe8>  // b.none
    8f38:	928001e9 	mov	x9, #0xfffffffffffffff0    	// #-16
    8f3c:	110004a7 	add	w7, w5, #0x1
    8f40:	2a0503e8 	mov	w8, w5
    8f44:	531f78e7 	lsl	w7, w7, #1
    8f48:	8b27cd27 	add	x7, x9, w7, sxtw #3
    8f4c:	8b070287 	add	x7, x20, x7
    8f50:	aa0703e4 	mov	x4, x7
    8f54:	f9400c81 	ldr	x1, [x4, #24]
    8f58:	14000009 	b	8f7c <_malloc_r+0x13c>
    8f5c:	f9400422 	ldr	x2, [x1, #8]
    8f60:	aa0103e6 	mov	x6, x1
    8f64:	f9400c21 	ldr	x1, [x1, #24]
    8f68:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    8f6c:	cb130043 	sub	x3, x2, x19
    8f70:	f1007c7f 	cmp	x3, #0x1f
    8f74:	5400238c 	b.gt	93e4 <_malloc_r+0x5a4>
    8f78:	b6f82563 	tbz	x3, #63, 9424 <_malloc_r+0x5e4>
    8f7c:	eb01009f 	cmp	x4, x1
    8f80:	54fffee1 	b.ne	8f5c <_malloc_r+0x11c>  // b.any
    8f84:	7100f91f 	cmp	w8, #0x3e
    8f88:	540029cd 	b.le	94c0 <_malloc_r+0x680>
    8f8c:	91004084 	add	x4, x4, #0x10
    8f90:	11000508 	add	w8, w8, #0x1
    8f94:	f240051f 	tst	x8, #0x3
    8f98:	54fffde1 	b.ne	8f54 <_malloc_r+0x114>  // b.any
    8f9c:	14000005 	b	8fb0 <_malloc_r+0x170>
    8fa0:	f85f04e1 	ldr	x1, [x7], #-16
    8fa4:	510004a5 	sub	w5, w5, #0x1
    8fa8:	eb07003f 	cmp	x1, x7
    8fac:	540035a1 	b.ne	9660 <_malloc_r+0x820>  // b.any
    8fb0:	f24004bf 	tst	x5, #0x3
    8fb4:	54ffff61 	b.ne	8fa0 <_malloc_r+0x160>  // b.any
    8fb8:	f9400681 	ldr	x1, [x20, #8]
    8fbc:	8a200021 	bic	x1, x1, x0
    8fc0:	f9000681 	str	x1, [x20, #8]
    8fc4:	d37ff800 	lsl	x0, x0, #1
    8fc8:	f100001f 	cmp	x0, #0x0
    8fcc:	fa411002 	ccmp	x0, x1, #0x2, ne  // ne = any
    8fd0:	54000089 	b.ls	8fe0 <_malloc_r+0x1a0>  // b.plast
    8fd4:	14000034 	b	90a4 <_malloc_r+0x264>
    8fd8:	d37ff800 	lsl	x0, x0, #1
    8fdc:	11001108 	add	w8, w8, #0x4
    8fe0:	ea01001f 	tst	x0, x1
    8fe4:	54ffffa0 	b.eq	8fd8 <_malloc_r+0x198>  // b.none
    8fe8:	2a0803e5 	mov	w5, w8
    8fec:	17ffffd4 	b	8f3c <_malloc_r+0xfc>
    8ff0:	927cee73 	and	x19, x19, #0xfffffffffffffff0
    8ff4:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
    8ff8:	eb02027f 	cmp	x19, x2
    8ffc:	fa539022 	ccmp	x1, x19, #0x2, ls  // ls = plast
    9000:	540013a8 	b.hi	9274 <_malloc_r+0x434>  // b.pmore
    9004:	94000397 	bl	9e60 <__malloc_lock>
    9008:	f107de7f 	cmp	x19, #0x1f7
    900c:	54002229 	b.ls	9450 <_malloc_r+0x610>  // b.plast
    9010:	d349fe60 	lsr	x0, x19, #9
    9014:	b4001420 	cbz	x0, 9298 <_malloc_r+0x458>
    9018:	f100101f 	cmp	x0, #0x4
    901c:	54001d08 	b.hi	93bc <_malloc_r+0x57c>  // b.pmore
    9020:	d346fe60 	lsr	x0, x19, #6
    9024:	1100e405 	add	w5, w0, #0x39
    9028:	1100e000 	add	w0, w0, #0x38
    902c:	531f78a4 	lsl	w4, w5, #1
    9030:	937d7c84 	sbfiz	x4, x4, #3, #32
    9034:	90000034 	adrp	x20, d000 <impure_data+0x78>
    9038:	91226294 	add	x20, x20, #0x898
    903c:	8b040284 	add	x4, x20, x4
    9040:	d1004084 	sub	x4, x4, #0x10
    9044:	f9400c81 	ldr	x1, [x4, #24]
    9048:	eb01009f 	cmp	x4, x1
    904c:	540000c1 	b.ne	9064 <_malloc_r+0x224>  // b.any
    9050:	17ffff93 	b	8e9c <_malloc_r+0x5c>
    9054:	b6f815e3 	tbz	x3, #63, 9310 <_malloc_r+0x4d0>
    9058:	f9400c21 	ldr	x1, [x1, #24]
    905c:	eb01009f 	cmp	x4, x1
    9060:	54fff1e0 	b.eq	8e9c <_malloc_r+0x5c>  // b.none
    9064:	f9400422 	ldr	x2, [x1, #8]
    9068:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    906c:	cb130043 	sub	x3, x2, x19
    9070:	f1007c7f 	cmp	x3, #0x1f
    9074:	54ffff0d 	b.le	9054 <_malloc_r+0x214>
    9078:	f9401284 	ldr	x4, [x20, #32]
    907c:	91004282 	add	x2, x20, #0x10
    9080:	2a0003e5 	mov	w5, w0
    9084:	eb02009f 	cmp	x4, x2
    9088:	54fff121 	b.ne	8eac <_malloc_r+0x6c>  // b.any
    908c:	f9400681 	ldr	x1, [x20, #8]
    9090:	13027ca2 	asr	w2, w5, #2
    9094:	d2800020 	mov	x0, #0x1                   	// #1
    9098:	9ac22000 	lsl	x0, x0, x2
    909c:	eb01001f 	cmp	x0, x1
    90a0:	54fff3e9 	b.ls	8f1c <_malloc_r+0xdc>  // b.plast
    90a4:	f9400a97 	ldr	x23, [x20, #16]
    90a8:	f94006f6 	ldr	x22, [x23, #8]
    90ac:	927ef6d8 	and	x24, x22, #0xfffffffffffffffc
    90b0:	eb18027f 	cmp	x19, x24
    90b4:	cb130300 	sub	x0, x24, x19
    90b8:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    90bc:	54000bec 	b.gt	9238 <_malloc_r+0x3f8>
    90c0:	b0000021 	adrp	x1, e000 <__malloc_av_+0x768>
    90c4:	a90573fb 	stp	x27, x28, [sp, #80]
    90c8:	b000003b 	adrp	x27, e000 <__malloc_av_+0x768>
    90cc:	f9426421 	ldr	x1, [x1, #1224]
    90d0:	d28203e3 	mov	x3, #0x101f                	// #4127
    90d4:	f9405762 	ldr	x2, [x27, #168]
    90d8:	8b010261 	add	x1, x19, x1
    90dc:	8b030036 	add	x22, x1, x3
    90e0:	91008021 	add	x1, x1, #0x20
    90e4:	b100045f 	cmn	x2, #0x1
    90e8:	9274ced6 	and	x22, x22, #0xfffffffffffff000
    90ec:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    90f0:	aa1503e0 	mov	x0, x21
    90f4:	aa1603e1 	mov	x1, x22
    90f8:	a9046bf9 	stp	x25, x26, [sp, #64]
    90fc:	940004b1 	bl	a3c0 <_sbrk_r>
    9100:	8b1802fa 	add	x26, x23, x24
    9104:	aa0003f9 	mov	x25, x0
    9108:	b100041f 	cmn	x0, #0x1
    910c:	54001f20 	b.eq	94f0 <_malloc_r+0x6b0>  // b.none
    9110:	eb00035f 	cmp	x26, x0
    9114:	fa5482e4 	ccmp	x23, x20, #0x4, hi  // hi = pmore
    9118:	54001ec1 	b.ne	94f0 <_malloc_r+0x6b0>  // b.any
    911c:	b000003c 	adrp	x28, e000 <__malloc_av_+0x768>
    9120:	b9449381 	ldr	w1, [x28, #1168]
    9124:	0b160021 	add	w1, w1, w22
    9128:	b9049381 	str	w1, [x28, #1168]
    912c:	eb00035f 	cmp	x26, x0
    9130:	54001ce0 	b.eq	94cc <_malloc_r+0x68c>  // b.none
    9134:	f9405760 	ldr	x0, [x27, #168]
    9138:	b100041f 	cmn	x0, #0x1
    913c:	54001d60 	b.eq	94e8 <_malloc_r+0x6a8>  // b.none
    9140:	cb1a033a 	sub	x26, x25, x26
    9144:	0b1a0021 	add	w1, w1, w26
    9148:	b9049381 	str	w1, [x28, #1168]
    914c:	f2400f3a 	ands	x26, x25, #0xf
    9150:	54001e40 	b.eq	9518 <_malloc_r+0x6d8>  // b.none
    9154:	cb1a0339 	sub	x25, x25, x26
    9158:	d2820201 	mov	x1, #0x1010                	// #4112
    915c:	91004339 	add	x25, x25, #0x10
    9160:	cb1a0021 	sub	x1, x1, x26
    9164:	8b16033b 	add	x27, x25, x22
    9168:	aa1503e0 	mov	x0, x21
    916c:	cb1b0036 	sub	x22, x1, x27
    9170:	92402ed6 	and	x22, x22, #0xfff
    9174:	aa1603e1 	mov	x1, x22
    9178:	94000492 	bl	a3c0 <_sbrk_r>
    917c:	b100041f 	cmn	x0, #0x1
    9180:	54002480 	b.eq	9610 <_malloc_r+0x7d0>  // b.none
    9184:	cb190000 	sub	x0, x0, x25
    9188:	2a1603e2 	mov	w2, w22
    918c:	8b160016 	add	x22, x0, x22
    9190:	b9449381 	ldr	w1, [x28, #1168]
    9194:	b24002d6 	orr	x22, x22, #0x1
    9198:	f9000a99 	str	x25, [x20, #16]
    919c:	0b010041 	add	w1, w2, w1
    91a0:	b9049381 	str	w1, [x28, #1168]
    91a4:	f9000736 	str	x22, [x25, #8]
    91a8:	eb1402ff 	cmp	x23, x20
    91ac:	54002000 	b.eq	95ac <_malloc_r+0x76c>  // b.none
    91b0:	f1007f1f 	cmp	x24, #0x1f
    91b4:	54001cc9 	b.ls	954c <_malloc_r+0x70c>  // b.plast
    91b8:	d1006300 	sub	x0, x24, #0x18
    91bc:	d2800124 	mov	x4, #0x9                   	// #9
    91c0:	f94006e2 	ldr	x2, [x23, #8]
    91c4:	927cec00 	and	x0, x0, #0xfffffffffffffff0
    91c8:	8b0002e3 	add	x3, x23, x0
    91cc:	92400042 	and	x2, x2, #0x1
    91d0:	aa000042 	orr	x2, x2, x0
    91d4:	f90006e2 	str	x2, [x23, #8]
    91d8:	f8008c64 	str	x4, [x3, #8]!
    91dc:	f9000464 	str	x4, [x3, #8]
    91e0:	f1007c1f 	cmp	x0, #0x1f
    91e4:	54002088 	b.hi	95f4 <_malloc_r+0x7b4>  // b.pmore
    91e8:	f9400736 	ldr	x22, [x25, #8]
    91ec:	aa1903f7 	mov	x23, x25
    91f0:	b0000020 	adrp	x0, e000 <__malloc_av_+0x768>
    91f4:	93407c21 	sxtw	x1, w1
    91f8:	f9425c02 	ldr	x2, [x0, #1208]
    91fc:	eb02003f 	cmp	x1, x2
    9200:	54000049 	b.ls	9208 <_malloc_r+0x3c8>  // b.plast
    9204:	f9025c01 	str	x1, [x0, #1208]
    9208:	b0000020 	adrp	x0, e000 <__malloc_av_+0x768>
    920c:	f9426002 	ldr	x2, [x0, #1216]
    9210:	eb02003f 	cmp	x1, x2
    9214:	54000049 	b.ls	921c <_malloc_r+0x3dc>  // b.plast
    9218:	f9026001 	str	x1, [x0, #1216]
    921c:	927ef6c0 	and	x0, x22, #0xfffffffffffffffc
    9220:	eb00027f 	cmp	x19, x0
    9224:	cb130000 	sub	x0, x0, x19
    9228:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    922c:	5400194d 	b.le	9554 <_malloc_r+0x714>
    9230:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9234:	a94573fb 	ldp	x27, x28, [sp, #80]
    9238:	8b1302e2 	add	x2, x23, x19
    923c:	b2400273 	orr	x19, x19, #0x1
    9240:	f90006f3 	str	x19, [x23, #8]
    9244:	b2400001 	orr	x1, x0, #0x1
    9248:	f9000a82 	str	x2, [x20, #16]
    924c:	f9000441 	str	x1, [x2, #8]
    9250:	aa1503e0 	mov	x0, x21
    9254:	910042f7 	add	x23, x23, #0x10
    9258:	94000306 	bl	9e70 <__malloc_unlock>
    925c:	aa1703e0 	mov	x0, x23
    9260:	a94153f3 	ldp	x19, x20, [sp, #16]
    9264:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9268:	a94363f7 	ldp	x23, x24, [sp, #48]
    926c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    9270:	d65f03c0 	ret
    9274:	52800180 	mov	w0, #0xc                   	// #12
    9278:	d2800017 	mov	x23, #0x0                   	// #0
    927c:	b90002a0 	str	w0, [x21]
    9280:	aa1703e0 	mov	x0, x23
    9284:	a94153f3 	ldp	x19, x20, [sp, #16]
    9288:	a9425bf5 	ldp	x21, x22, [sp, #32]
    928c:	a94363f7 	ldp	x23, x24, [sp, #48]
    9290:	a8c67bfd 	ldp	x29, x30, [sp], #96
    9294:	d65f03c0 	ret
    9298:	d2808004 	mov	x4, #0x400                 	// #1024
    929c:	52800805 	mov	w5, #0x40                  	// #64
    92a0:	528007e0 	mov	w0, #0x3f                  	// #63
    92a4:	17ffff64 	b	9034 <_malloc_r+0x1f4>
    92a8:	8b010081 	add	x1, x4, x1
    92ac:	aa1503e0 	mov	x0, x21
    92b0:	91004097 	add	x23, x4, #0x10
    92b4:	f9400422 	ldr	x2, [x1, #8]
    92b8:	b2400042 	orr	x2, x2, #0x1
    92bc:	f9000422 	str	x2, [x1, #8]
    92c0:	940002ec 	bl	9e70 <__malloc_unlock>
    92c4:	17ffffef 	b	9280 <_malloc_r+0x440>
    92c8:	a9409022 	ldp	x2, x4, [x1, #8]
    92cc:	91004037 	add	x23, x1, #0x10
    92d0:	f9400c23 	ldr	x3, [x1, #24]
    92d4:	aa1503e0 	mov	x0, x21
    92d8:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    92dc:	8b020022 	add	x2, x1, x2
    92e0:	f9400441 	ldr	x1, [x2, #8]
    92e4:	f9000c83 	str	x3, [x4, #24]
    92e8:	f9000864 	str	x4, [x3, #16]
    92ec:	b2400021 	orr	x1, x1, #0x1
    92f0:	f9000441 	str	x1, [x2, #8]
    92f4:	940002df 	bl	9e70 <__malloc_unlock>
    92f8:	aa1703e0 	mov	x0, x23
    92fc:	a94153f3 	ldp	x19, x20, [sp, #16]
    9300:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9304:	a94363f7 	ldp	x23, x24, [sp, #48]
    9308:	a8c67bfd 	ldp	x29, x30, [sp], #96
    930c:	d65f03c0 	ret
    9310:	8b020022 	add	x2, x1, x2
    9314:	91004037 	add	x23, x1, #0x10
    9318:	a9410c24 	ldp	x4, x3, [x1, #16]
    931c:	aa1503e0 	mov	x0, x21
    9320:	f9400441 	ldr	x1, [x2, #8]
    9324:	f9000c83 	str	x3, [x4, #24]
    9328:	b2400021 	orr	x1, x1, #0x1
    932c:	f9000864 	str	x4, [x3, #16]
    9330:	f9000441 	str	x1, [x2, #8]
    9334:	940002cf 	bl	9e70 <__malloc_unlock>
    9338:	aa1703e0 	mov	x0, x23
    933c:	a94153f3 	ldp	x19, x20, [sp, #16]
    9340:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9344:	a94363f7 	ldp	x23, x24, [sp, #48]
    9348:	a8c67bfd 	ldp	x29, x30, [sp], #96
    934c:	d65f03c0 	ret
    9350:	d349fc20 	lsr	x0, x1, #9
    9354:	f127fc3f 	cmp	x1, #0x9ff
    9358:	540009e9 	b.ls	9494 <_malloc_r+0x654>  // b.plast
    935c:	f100501f 	cmp	x0, #0x14
    9360:	54001068 	b.hi	956c <_malloc_r+0x72c>  // b.pmore
    9364:	11017003 	add	w3, w0, #0x5c
    9368:	11016c02 	add	w2, w0, #0x5b
    936c:	531f7863 	lsl	w3, w3, #1
    9370:	937d7c63 	sbfiz	x3, x3, #3, #32
    9374:	8b030283 	add	x3, x20, x3
    9378:	f85f0460 	ldr	x0, [x3], #-16
    937c:	eb00007f 	cmp	x3, x0
    9380:	54000be0 	b.eq	94fc <_malloc_r+0x6bc>  // b.none
    9384:	d503201f 	nop
    9388:	f9400402 	ldr	x2, [x0, #8]
    938c:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    9390:	eb01005f 	cmp	x2, x1
    9394:	54000089 	b.ls	93a4 <_malloc_r+0x564>  // b.plast
    9398:	f9400800 	ldr	x0, [x0, #16]
    939c:	eb00007f 	cmp	x3, x0
    93a0:	54ffff41 	b.ne	9388 <_malloc_r+0x548>  // b.any
    93a4:	f9400681 	ldr	x1, [x20, #8]
    93a8:	f9400c03 	ldr	x3, [x0, #24]
    93ac:	a9010c80 	stp	x0, x3, [x4, #16]
    93b0:	f9000864 	str	x4, [x3, #16]
    93b4:	f9000c04 	str	x4, [x0, #24]
    93b8:	17fffed4 	b	8f08 <_malloc_r+0xc8>
    93bc:	f100501f 	cmp	x0, #0x14
    93c0:	54000769 	b.ls	94ac <_malloc_r+0x66c>  // b.plast
    93c4:	f101501f 	cmp	x0, #0x54
    93c8:	54000e28 	b.hi	958c <_malloc_r+0x74c>  // b.pmore
    93cc:	d34cfe60 	lsr	x0, x19, #12
    93d0:	1101bc05 	add	w5, w0, #0x6f
    93d4:	1101b800 	add	w0, w0, #0x6e
    93d8:	531f78a4 	lsl	w4, w5, #1
    93dc:	937d7c84 	sbfiz	x4, x4, #3, #32
    93e0:	17ffff15 	b	9034 <_malloc_r+0x1f4>
    93e4:	f94008c7 	ldr	x7, [x6, #16]
    93e8:	b2400260 	orr	x0, x19, #0x1
    93ec:	f90004c0 	str	x0, [x6, #8]
    93f0:	8b1300c4 	add	x4, x6, x19
    93f4:	91004285 	add	x5, x20, #0x10
    93f8:	b2400068 	orr	x8, x3, #0x1
    93fc:	f9000ce1 	str	x1, [x7, #24]
    9400:	910040d7 	add	x23, x6, #0x10
    9404:	f9000827 	str	x7, [x1, #16]
    9408:	aa1503e0 	mov	x0, x21
    940c:	a9021284 	stp	x4, x4, [x20, #32]
    9410:	a9009488 	stp	x8, x5, [x4, #8]
    9414:	f9000c85 	str	x5, [x4, #24]
    9418:	f82268c3 	str	x3, [x6, x2]
    941c:	94000295 	bl	9e70 <__malloc_unlock>
    9420:	17ffff98 	b	9280 <_malloc_r+0x440>
    9424:	8b0200c2 	add	x2, x6, x2
    9428:	aa0603f7 	mov	x23, x6
    942c:	aa1503e0 	mov	x0, x21
    9430:	f9400443 	ldr	x3, [x2, #8]
    9434:	f8410ee4 	ldr	x4, [x23, #16]!
    9438:	b2400063 	orr	x3, x3, #0x1
    943c:	f9000443 	str	x3, [x2, #8]
    9440:	f9000c81 	str	x1, [x4, #24]
    9444:	f9000824 	str	x4, [x1, #16]
    9448:	9400028a 	bl	9e70 <__malloc_unlock>
    944c:	17ffff8d 	b	9280 <_malloc_r+0x440>
    9450:	d343fe65 	lsr	x5, x19, #3
    9454:	110004a0 	add	w0, w5, #0x1
    9458:	531f7800 	lsl	w0, w0, #1
    945c:	937d7c00 	sbfiz	x0, x0, #3, #32
    9460:	17fffe87 	b	8e7c <_malloc_r+0x3c>
    9464:	8b130085 	add	x5, x4, x19
    9468:	b2400273 	orr	x19, x19, #0x1
    946c:	f9000493 	str	x19, [x4, #8]
    9470:	b2400066 	orr	x6, x3, #0x1
    9474:	a9021685 	stp	x5, x5, [x20, #32]
    9478:	aa1503e0 	mov	x0, x21
    947c:	91004097 	add	x23, x4, #0x10
    9480:	a90088a6 	stp	x6, x2, [x5, #8]
    9484:	f9000ca2 	str	x2, [x5, #24]
    9488:	f8216883 	str	x3, [x4, x1]
    948c:	94000279 	bl	9e70 <__malloc_unlock>
    9490:	17ffff7c 	b	9280 <_malloc_r+0x440>
    9494:	d346fc20 	lsr	x0, x1, #6
    9498:	1100e403 	add	w3, w0, #0x39
    949c:	1100e002 	add	w2, w0, #0x38
    94a0:	531f7863 	lsl	w3, w3, #1
    94a4:	937d7c63 	sbfiz	x3, x3, #3, #32
    94a8:	17ffffb3 	b	9374 <_malloc_r+0x534>
    94ac:	11017005 	add	w5, w0, #0x5c
    94b0:	11016c00 	add	w0, w0, #0x5b
    94b4:	531f78a4 	lsl	w4, w5, #1
    94b8:	937d7c84 	sbfiz	x4, x4, #3, #32
    94bc:	17fffede 	b	9034 <_malloc_r+0x1f4>
    94c0:	11000508 	add	w8, w8, #0x1
    94c4:	91008084 	add	x4, x4, #0x20
    94c8:	17fffeb2 	b	8f90 <_malloc_r+0x150>
    94cc:	f2402f5f 	tst	x26, #0xfff
    94d0:	54ffe321 	b.ne	9134 <_malloc_r+0x2f4>  // b.any
    94d4:	f9400a97 	ldr	x23, [x20, #16]
    94d8:	8b160316 	add	x22, x24, x22
    94dc:	b24002d6 	orr	x22, x22, #0x1
    94e0:	f90006f6 	str	x22, [x23, #8]
    94e4:	17ffff43 	b	91f0 <_malloc_r+0x3b0>
    94e8:	f9005779 	str	x25, [x27, #168]
    94ec:	17ffff18 	b	914c <_malloc_r+0x30c>
    94f0:	f9400a97 	ldr	x23, [x20, #16]
    94f4:	f94006f6 	ldr	x22, [x23, #8]
    94f8:	17ffff49 	b	921c <_malloc_r+0x3dc>
    94fc:	f9400686 	ldr	x6, [x20, #8]
    9500:	13027c42 	asr	w2, w2, #2
    9504:	d2800021 	mov	x1, #0x1                   	// #1
    9508:	9ac22021 	lsl	x1, x1, x2
    950c:	aa060021 	orr	x1, x1, x6
    9510:	f9000681 	str	x1, [x20, #8]
    9514:	17ffffa6 	b	93ac <_malloc_r+0x56c>
    9518:	8b16033a 	add	x26, x25, x22
    951c:	aa1503e0 	mov	x0, x21
    9520:	cb1a03fa 	neg	x26, x26
    9524:	92402f5a 	and	x26, x26, #0xfff
    9528:	aa1a03e1 	mov	x1, x26
    952c:	940003a5 	bl	a3c0 <_sbrk_r>
    9530:	52800002 	mov	w2, #0x0                   	// #0
    9534:	b100041f 	cmn	x0, #0x1
    9538:	54ffe2c0 	b.eq	9190 <_malloc_r+0x350>  // b.none
    953c:	cb190000 	sub	x0, x0, x25
    9540:	2a1a03e2 	mov	w2, w26
    9544:	8b1a0016 	add	x22, x0, x26
    9548:	17ffff12 	b	9190 <_malloc_r+0x350>
    954c:	d2800020 	mov	x0, #0x1                   	// #1
    9550:	f9000720 	str	x0, [x25, #8]
    9554:	aa1503e0 	mov	x0, x21
    9558:	d2800017 	mov	x23, #0x0                   	// #0
    955c:	94000245 	bl	9e70 <__malloc_unlock>
    9560:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9564:	a94573fb 	ldp	x27, x28, [sp, #80]
    9568:	17ffff46 	b	9280 <_malloc_r+0x440>
    956c:	f101501f 	cmp	x0, #0x54
    9570:	54000228 	b.hi	95b4 <_malloc_r+0x774>  // b.pmore
    9574:	d34cfc20 	lsr	x0, x1, #12
    9578:	1101bc03 	add	w3, w0, #0x6f
    957c:	1101b802 	add	w2, w0, #0x6e
    9580:	531f7863 	lsl	w3, w3, #1
    9584:	937d7c63 	sbfiz	x3, x3, #3, #32
    9588:	17ffff7b 	b	9374 <_malloc_r+0x534>
    958c:	f105501f 	cmp	x0, #0x154
    9590:	54000228 	b.hi	95d4 <_malloc_r+0x794>  // b.pmore
    9594:	d34ffe60 	lsr	x0, x19, #15
    9598:	1101e005 	add	w5, w0, #0x78
    959c:	1101dc00 	add	w0, w0, #0x77
    95a0:	531f78a4 	lsl	w4, w5, #1
    95a4:	937d7c84 	sbfiz	x4, x4, #3, #32
    95a8:	17fffea3 	b	9034 <_malloc_r+0x1f4>
    95ac:	aa1903f7 	mov	x23, x25
    95b0:	17ffff10 	b	91f0 <_malloc_r+0x3b0>
    95b4:	f105501f 	cmp	x0, #0x154
    95b8:	54000368 	b.hi	9624 <_malloc_r+0x7e4>  // b.pmore
    95bc:	d34ffc20 	lsr	x0, x1, #15
    95c0:	1101e003 	add	w3, w0, #0x78
    95c4:	1101dc02 	add	w2, w0, #0x77
    95c8:	531f7863 	lsl	w3, w3, #1
    95cc:	937d7c63 	sbfiz	x3, x3, #3, #32
    95d0:	17ffff69 	b	9374 <_malloc_r+0x534>
    95d4:	f115501f 	cmp	x0, #0x554
    95d8:	54000368 	b.hi	9644 <_malloc_r+0x804>  // b.pmore
    95dc:	d352fe60 	lsr	x0, x19, #18
    95e0:	1101f405 	add	w5, w0, #0x7d
    95e4:	1101f000 	add	w0, w0, #0x7c
    95e8:	531f78a4 	lsl	w4, w5, #1
    95ec:	937d7c84 	sbfiz	x4, x4, #3, #32
    95f0:	17fffe91 	b	9034 <_malloc_r+0x1f4>
    95f4:	910042e1 	add	x1, x23, #0x10
    95f8:	aa1503e0 	mov	x0, x21
    95fc:	97fff7f1 	bl	75c0 <_free_r>
    9600:	f9400a97 	ldr	x23, [x20, #16]
    9604:	b9449381 	ldr	w1, [x28, #1168]
    9608:	f94006f6 	ldr	x22, [x23, #8]
    960c:	17fffef9 	b	91f0 <_malloc_r+0x3b0>
    9610:	d100435a 	sub	x26, x26, #0x10
    9614:	52800002 	mov	w2, #0x0                   	// #0
    9618:	8b1a0376 	add	x22, x27, x26
    961c:	cb1902d6 	sub	x22, x22, x25
    9620:	17fffedc 	b	9190 <_malloc_r+0x350>
    9624:	f115501f 	cmp	x0, #0x554
    9628:	54000168 	b.hi	9654 <_malloc_r+0x814>  // b.pmore
    962c:	d352fc20 	lsr	x0, x1, #18
    9630:	1101f403 	add	w3, w0, #0x7d
    9634:	1101f002 	add	w2, w0, #0x7c
    9638:	531f7863 	lsl	w3, w3, #1
    963c:	937d7c63 	sbfiz	x3, x3, #3, #32
    9640:	17ffff4d 	b	9374 <_malloc_r+0x534>
    9644:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    9648:	52800fe5 	mov	w5, #0x7f                  	// #127
    964c:	52800fc0 	mov	w0, #0x7e                  	// #126
    9650:	17fffe79 	b	9034 <_malloc_r+0x1f4>
    9654:	d280fe03 	mov	x3, #0x7f0                 	// #2032
    9658:	52800fc2 	mov	w2, #0x7e                  	// #126
    965c:	17ffff46 	b	9374 <_malloc_r+0x534>
    9660:	f9400681 	ldr	x1, [x20, #8]
    9664:	17fffe58 	b	8fc4 <_malloc_r+0x184>
    9668:	d503201f 	nop
    966c:	d503201f 	nop

0000000000009670 <_mbtowc_r>:
    9670:	90000025 	adrp	x5, d000 <impure_data+0x78>
    9674:	f943eca5 	ldr	x5, [x5, #2008]
    9678:	aa0503f0 	mov	x16, x5
    967c:	d61f0200 	br	x16

0000000000009680 <__ascii_mbtowc>:
    9680:	d10043ff 	sub	sp, sp, #0x10
    9684:	f100003f 	cmp	x1, #0x0
    9688:	910033e0 	add	x0, sp, #0xc
    968c:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    9690:	b4000122 	cbz	x2, 96b4 <__ascii_mbtowc+0x34>
    9694:	b4000163 	cbz	x3, 96c0 <__ascii_mbtowc+0x40>
    9698:	39400040 	ldrb	w0, [x2]
    969c:	b9000020 	str	w0, [x1]
    96a0:	39400040 	ldrb	w0, [x2]
    96a4:	7100001f 	cmp	w0, #0x0
    96a8:	1a9f07e0 	cset	w0, ne  // ne = any
    96ac:	910043ff 	add	sp, sp, #0x10
    96b0:	d65f03c0 	ret
    96b4:	52800000 	mov	w0, #0x0                   	// #0
    96b8:	910043ff 	add	sp, sp, #0x10
    96bc:	d65f03c0 	ret
    96c0:	12800020 	mov	w0, #0xfffffffe            	// #-2
    96c4:	17fffffa 	b	96ac <__ascii_mbtowc+0x2c>
    96c8:	d503201f 	nop
    96cc:	d503201f 	nop

00000000000096d0 <__utf8_mbtowc>:
    96d0:	d10043ff 	sub	sp, sp, #0x10
    96d4:	f100003f 	cmp	x1, #0x0
    96d8:	910033e5 	add	x5, sp, #0xc
    96dc:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    96e0:	b4000a02 	cbz	x2, 9820 <__utf8_mbtowc+0x150>
    96e4:	b40012a3 	cbz	x3, 9938 <__utf8_mbtowc+0x268>
    96e8:	b9400086 	ldr	w6, [x4]
    96ec:	aa0003e8 	mov	x8, x0
    96f0:	350003c6 	cbnz	w6, 9768 <__utf8_mbtowc+0x98>
    96f4:	39400040 	ldrb	w0, [x2]
    96f8:	52800025 	mov	w5, #0x1                   	// #1
    96fc:	340003c0 	cbz	w0, 9774 <__utf8_mbtowc+0xa4>
    9700:	7101fc1f 	cmp	w0, #0x7f
    9704:	5400084d 	b.le	980c <__utf8_mbtowc+0x13c>
    9708:	51030007 	sub	w7, w0, #0xc0
    970c:	71007cff 	cmp	w7, #0x1f
    9710:	540003a8 	b.hi	9784 <__utf8_mbtowc+0xb4>  // b.pmore
    9714:	39001080 	strb	w0, [x4, #4]
    9718:	350000a6 	cbnz	w6, 972c <__utf8_mbtowc+0x5c>
    971c:	52800026 	mov	w6, #0x1                   	// #1
    9720:	b9000086 	str	w6, [x4]
    9724:	f100047f 	cmp	x3, #0x1
    9728:	54001080 	b.eq	9938 <__utf8_mbtowc+0x268>  // b.none
    972c:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    9730:	110004a5 	add	w5, w5, #0x1
    9734:	51020043 	sub	w3, w2, #0x80
    9738:	7100fc7f 	cmp	w3, #0x3f
    973c:	54001068 	b.hi	9948 <__utf8_mbtowc+0x278>  // b.pmore
    9740:	7103041f 	cmp	w0, #0xc1
    9744:	5400102d 	b.le	9948 <__utf8_mbtowc+0x278>
    9748:	531a1000 	ubfiz	w0, w0, #6, #5
    974c:	12001442 	and	w2, w2, #0x3f
    9750:	b900009f 	str	wzr, [x4]
    9754:	2a020002 	orr	w2, w0, w2
    9758:	b9000022 	str	w2, [x1]
    975c:	2a0503e0 	mov	w0, w5
    9760:	910043ff 	add	sp, sp, #0x10
    9764:	d65f03c0 	ret
    9768:	39401080 	ldrb	w0, [x4, #4]
    976c:	52800005 	mov	w5, #0x0                   	// #0
    9770:	35fffc80 	cbnz	w0, 9700 <__utf8_mbtowc+0x30>
    9774:	b900003f 	str	wzr, [x1]
    9778:	b900009f 	str	wzr, [x4]
    977c:	910043ff 	add	sp, sp, #0x10
    9780:	d65f03c0 	ret
    9784:	51038007 	sub	w7, w0, #0xe0
    9788:	71003cff 	cmp	w7, #0xf
    978c:	54000508 	b.hi	982c <__utf8_mbtowc+0x15c>  // b.pmore
    9790:	39001080 	strb	w0, [x4, #4]
    9794:	34000aa6 	cbz	w6, 98e8 <__utf8_mbtowc+0x218>
    9798:	b100047f 	cmn	x3, #0x1
    979c:	9a830463 	cinc	x3, x3, ne  // ne = any
    97a0:	710004df 	cmp	w6, #0x1
    97a4:	54000aa0 	b.eq	98f8 <__utf8_mbtowc+0x228>  // b.none
    97a8:	39401487 	ldrb	w7, [x4, #5]
    97ac:	7103801f 	cmp	w0, #0xe0
    97b0:	528013e9 	mov	w9, #0x9f                  	// #159
    97b4:	7a4900e0 	ccmp	w7, w9, #0x0, eq  // eq = none
    97b8:	54000c8d 	b.le	9948 <__utf8_mbtowc+0x278>
    97bc:	510200e9 	sub	w9, w7, #0x80
    97c0:	7100fd3f 	cmp	w9, #0x3f
    97c4:	54000c28 	b.hi	9948 <__utf8_mbtowc+0x278>  // b.pmore
    97c8:	39001487 	strb	w7, [x4, #5]
    97cc:	710004df 	cmp	w6, #0x1
    97d0:	54000ac0 	b.eq	9928 <__utf8_mbtowc+0x258>  // b.none
    97d4:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    97d8:	110004a5 	add	w5, w5, #0x1
    97dc:	51020043 	sub	w3, w2, #0x80
    97e0:	7100fc7f 	cmp	w3, #0x3f
    97e4:	54000b28 	b.hi	9948 <__utf8_mbtowc+0x278>  // b.pmore
    97e8:	53140c00 	ubfiz	w0, w0, #12, #4
    97ec:	531a14e7 	ubfiz	w7, w7, #6, #6
    97f0:	2a070007 	orr	w7, w0, w7
    97f4:	12001442 	and	w2, w2, #0x3f
    97f8:	b900009f 	str	wzr, [x4]
    97fc:	2a0200e7 	orr	w7, w7, w2
    9800:	2a0503e0 	mov	w0, w5
    9804:	b9000027 	str	w7, [x1]
    9808:	17ffffdd 	b	977c <__utf8_mbtowc+0xac>
    980c:	b900009f 	str	wzr, [x4]
    9810:	b9000020 	str	w0, [x1]
    9814:	52800020 	mov	w0, #0x1                   	// #1
    9818:	910043ff 	add	sp, sp, #0x10
    981c:	d65f03c0 	ret
    9820:	52800000 	mov	w0, #0x0                   	// #0
    9824:	910043ff 	add	sp, sp, #0x10
    9828:	d65f03c0 	ret
    982c:	5103c007 	sub	w7, w0, #0xf0
    9830:	710010ff 	cmp	w7, #0x4
    9834:	540008a8 	b.hi	9948 <__utf8_mbtowc+0x278>  // b.pmore
    9838:	39001080 	strb	w0, [x4, #4]
    983c:	34000666 	cbz	w6, 9908 <__utf8_mbtowc+0x238>
    9840:	b100047f 	cmn	x3, #0x1
    9844:	9a830463 	cinc	x3, x3, ne  // ne = any
    9848:	710004df 	cmp	w6, #0x1
    984c:	54000660 	b.eq	9918 <__utf8_mbtowc+0x248>  // b.none
    9850:	39401487 	ldrb	w7, [x4, #5]
    9854:	7103c01f 	cmp	w0, #0xf0
    9858:	54000740 	b.eq	9940 <__utf8_mbtowc+0x270>  // b.none
    985c:	71023cff 	cmp	w7, #0x8f
    9860:	52801e89 	mov	w9, #0xf4                  	// #244
    9864:	7a49c000 	ccmp	w0, w9, #0x0, gt
    9868:	54000700 	b.eq	9948 <__utf8_mbtowc+0x278>  // b.none
    986c:	510200e9 	sub	w9, w7, #0x80
    9870:	7100fd3f 	cmp	w9, #0x3f
    9874:	540006a8 	b.hi	9948 <__utf8_mbtowc+0x278>  // b.pmore
    9878:	39001487 	strb	w7, [x4, #5]
    987c:	710004df 	cmp	w6, #0x1
    9880:	540006c0 	b.eq	9958 <__utf8_mbtowc+0x288>  // b.none
    9884:	b9400086 	ldr	w6, [x4]
    9888:	b100047f 	cmn	x3, #0x1
    988c:	9a830463 	cinc	x3, x3, ne  // ne = any
    9890:	710008df 	cmp	w6, #0x2
    9894:	540006a0 	b.eq	9968 <__utf8_mbtowc+0x298>  // b.none
    9898:	39401886 	ldrb	w6, [x4, #6]
    989c:	510200c3 	sub	w3, w6, #0x80
    98a0:	7100fc7f 	cmp	w3, #0x3f
    98a4:	54000528 	b.hi	9948 <__utf8_mbtowc+0x278>  // b.pmore
    98a8:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    98ac:	110004a5 	add	w5, w5, #0x1
    98b0:	51020043 	sub	w3, w2, #0x80
    98b4:	7100fc7f 	cmp	w3, #0x3f
    98b8:	54000488 	b.hi	9948 <__utf8_mbtowc+0x278>  // b.pmore
    98bc:	530e0800 	ubfiz	w0, w0, #18, #3
    98c0:	531414e7 	ubfiz	w7, w7, #12, #6
    98c4:	531a14c6 	ubfiz	w6, w6, #6, #6
    98c8:	12001442 	and	w2, w2, #0x3f
    98cc:	2a070007 	orr	w7, w0, w7
    98d0:	2a0200c6 	orr	w6, w6, w2
    98d4:	2a0600e6 	orr	w6, w7, w6
    98d8:	b9000026 	str	w6, [x1]
    98dc:	2a0503e0 	mov	w0, w5
    98e0:	b900009f 	str	wzr, [x4]
    98e4:	17ffffa6 	b	977c <__utf8_mbtowc+0xac>
    98e8:	52800026 	mov	w6, #0x1                   	// #1
    98ec:	b9000086 	str	w6, [x4]
    98f0:	f100047f 	cmp	x3, #0x1
    98f4:	54000220 	b.eq	9938 <__utf8_mbtowc+0x268>  // b.none
    98f8:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    98fc:	52800026 	mov	w6, #0x1                   	// #1
    9900:	0b0600a5 	add	w5, w5, w6
    9904:	17ffffaa 	b	97ac <__utf8_mbtowc+0xdc>
    9908:	52800026 	mov	w6, #0x1                   	// #1
    990c:	b9000086 	str	w6, [x4]
    9910:	f100047f 	cmp	x3, #0x1
    9914:	54000120 	b.eq	9938 <__utf8_mbtowc+0x268>  // b.none
    9918:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    991c:	52800026 	mov	w6, #0x1                   	// #1
    9920:	0b0600a5 	add	w5, w5, w6
    9924:	17ffffcc 	b	9854 <__utf8_mbtowc+0x184>
    9928:	52800046 	mov	w6, #0x2                   	// #2
    992c:	b9000086 	str	w6, [x4]
    9930:	f100087f 	cmp	x3, #0x2
    9934:	54fff501 	b.ne	97d4 <__utf8_mbtowc+0x104>  // b.any
    9938:	12800020 	mov	w0, #0xfffffffe            	// #-2
    993c:	17ffff90 	b	977c <__utf8_mbtowc+0xac>
    9940:	71023cff 	cmp	w7, #0x8f
    9944:	54fff94c 	b.gt	986c <__utf8_mbtowc+0x19c>
    9948:	52801141 	mov	w1, #0x8a                  	// #138
    994c:	12800000 	mov	w0, #0xffffffff            	// #-1
    9950:	b9000101 	str	w1, [x8]
    9954:	17ffff8a 	b	977c <__utf8_mbtowc+0xac>
    9958:	52800046 	mov	w6, #0x2                   	// #2
    995c:	b9000086 	str	w6, [x4]
    9960:	f100087f 	cmp	x3, #0x2
    9964:	54fffea0 	b.eq	9938 <__utf8_mbtowc+0x268>  // b.none
    9968:	3865c846 	ldrb	w6, [x2, w5, sxtw]
    996c:	110004a5 	add	w5, w5, #0x1
    9970:	510200c9 	sub	w9, w6, #0x80
    9974:	7100fd3f 	cmp	w9, #0x3f
    9978:	54fffe88 	b.hi	9948 <__utf8_mbtowc+0x278>  // b.pmore
    997c:	52800069 	mov	w9, #0x3                   	// #3
    9980:	b9000089 	str	w9, [x4]
    9984:	39001886 	strb	w6, [x4, #6]
    9988:	f1000c7f 	cmp	x3, #0x3
    998c:	54fff8e1 	b.ne	98a8 <__utf8_mbtowc+0x1d8>  // b.any
    9990:	12800020 	mov	w0, #0xfffffffe            	// #-2
    9994:	17ffff7a 	b	977c <__utf8_mbtowc+0xac>
    9998:	d503201f 	nop
    999c:	d503201f 	nop

00000000000099a0 <__sjis_mbtowc>:
    99a0:	d10043ff 	sub	sp, sp, #0x10
    99a4:	f100003f 	cmp	x1, #0x0
    99a8:	910033e5 	add	x5, sp, #0xc
    99ac:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    99b0:	b40004c2 	cbz	x2, 9a48 <__sjis_mbtowc+0xa8>
    99b4:	b4000503 	cbz	x3, 9a54 <__sjis_mbtowc+0xb4>
    99b8:	aa0003e6 	mov	x6, x0
    99bc:	b9400080 	ldr	w0, [x4]
    99c0:	39400045 	ldrb	w5, [x2]
    99c4:	35000320 	cbnz	w0, 9a28 <__sjis_mbtowc+0x88>
    99c8:	510204a7 	sub	w7, w5, #0x81
    99cc:	510380a0 	sub	w0, w5, #0xe0
    99d0:	710078ff 	cmp	w7, #0x1e
    99d4:	7a4f8800 	ccmp	w0, #0xf, #0x0, hi  // hi = pmore
    99d8:	540002c8 	b.hi	9a30 <__sjis_mbtowc+0x90>  // b.pmore
    99dc:	52800020 	mov	w0, #0x1                   	// #1
    99e0:	b9000080 	str	w0, [x4]
    99e4:	39001085 	strb	w5, [x4, #4]
    99e8:	f100047f 	cmp	x3, #0x1
    99ec:	54000340 	b.eq	9a54 <__sjis_mbtowc+0xb4>  // b.none
    99f0:	39400445 	ldrb	w5, [x2, #1]
    99f4:	52800040 	mov	w0, #0x2                   	// #2
    99f8:	510100a3 	sub	w3, w5, #0x40
    99fc:	510200a2 	sub	w2, w5, #0x80
    9a00:	7100f87f 	cmp	w3, #0x3e
    9a04:	52800f83 	mov	w3, #0x7c                  	// #124
    9a08:	7a438040 	ccmp	w2, w3, #0x0, hi  // hi = pmore
    9a0c:	54000288 	b.hi	9a5c <__sjis_mbtowc+0xbc>  // b.pmore
    9a10:	39401082 	ldrb	w2, [x4, #4]
    9a14:	0b0220a5 	add	w5, w5, w2, lsl #8
    9a18:	b9000025 	str	w5, [x1]
    9a1c:	b900009f 	str	wzr, [x4]
    9a20:	910043ff 	add	sp, sp, #0x10
    9a24:	d65f03c0 	ret
    9a28:	7100041f 	cmp	w0, #0x1
    9a2c:	54fffe60 	b.eq	99f8 <__sjis_mbtowc+0x58>  // b.none
    9a30:	b9000025 	str	w5, [x1]
    9a34:	39400040 	ldrb	w0, [x2]
    9a38:	7100001f 	cmp	w0, #0x0
    9a3c:	1a9f07e0 	cset	w0, ne  // ne = any
    9a40:	910043ff 	add	sp, sp, #0x10
    9a44:	d65f03c0 	ret
    9a48:	52800000 	mov	w0, #0x0                   	// #0
    9a4c:	910043ff 	add	sp, sp, #0x10
    9a50:	d65f03c0 	ret
    9a54:	12800020 	mov	w0, #0xfffffffe            	// #-2
    9a58:	17fffffa 	b	9a40 <__sjis_mbtowc+0xa0>
    9a5c:	52801141 	mov	w1, #0x8a                  	// #138
    9a60:	12800000 	mov	w0, #0xffffffff            	// #-1
    9a64:	b90000c1 	str	w1, [x6]
    9a68:	17fffff6 	b	9a40 <__sjis_mbtowc+0xa0>
    9a6c:	d503201f 	nop

0000000000009a70 <__eucjp_mbtowc>:
    9a70:	d10083ff 	sub	sp, sp, #0x20
    9a74:	f100003f 	cmp	x1, #0x0
    9a78:	a90007e0 	stp	x0, x1, [sp]
    9a7c:	910073e0 	add	x0, sp, #0x1c
    9a80:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    9a84:	f94003e6 	ldr	x6, [sp]
    9a88:	b4000702 	cbz	x2, 9b68 <__eucjp_mbtowc+0xf8>
    9a8c:	b4000783 	cbz	x3, 9b7c <__eucjp_mbtowc+0x10c>
    9a90:	b9400080 	ldr	w0, [x4]
    9a94:	39400045 	ldrb	w5, [x2]
    9a98:	350004a0 	cbnz	w0, 9b2c <__eucjp_mbtowc+0xbc>
    9a9c:	510284a7 	sub	w7, w5, #0xa1
    9aa0:	510238a0 	sub	w0, w5, #0x8e
    9aa4:	710174ff 	cmp	w7, #0x5d
    9aa8:	7a418800 	ccmp	w0, #0x1, #0x0, hi  // hi = pmore
    9aac:	54000488 	b.hi	9b3c <__eucjp_mbtowc+0xcc>  // b.pmore
    9ab0:	52800020 	mov	w0, #0x1                   	// #1
    9ab4:	b9000080 	str	w0, [x4]
    9ab8:	39001085 	strb	w5, [x4, #4]
    9abc:	f100047f 	cmp	x3, #0x1
    9ac0:	540005e0 	b.eq	9b7c <__eucjp_mbtowc+0x10c>  // b.none
    9ac4:	39400445 	ldrb	w5, [x2, #1]
    9ac8:	52800040 	mov	w0, #0x2                   	// #2
    9acc:	510284a7 	sub	w7, w5, #0xa1
    9ad0:	710174ff 	cmp	w7, #0x5d
    9ad4:	54000588 	b.hi	9b84 <__eucjp_mbtowc+0x114>  // b.pmore
    9ad8:	39401087 	ldrb	w7, [x4, #4]
    9adc:	71023cff 	cmp	w7, #0x8f
    9ae0:	540003a1 	b.ne	9b54 <__eucjp_mbtowc+0xe4>  // b.any
    9ae4:	52800048 	mov	w8, #0x2                   	// #2
    9ae8:	93407c07 	sxtw	x7, w0
    9aec:	b9000088 	str	w8, [x4]
    9af0:	39001485 	strb	w5, [x4, #5]
    9af4:	eb0300ff 	cmp	x7, x3
    9af8:	54000422 	b.cs	9b7c <__eucjp_mbtowc+0x10c>  // b.hs, b.nlast
    9afc:	38676845 	ldrb	w5, [x2, x7]
    9b00:	11000400 	add	w0, w0, #0x1
    9b04:	510284a2 	sub	w2, w5, #0xa1
    9b08:	7101745f 	cmp	w2, #0x5d
    9b0c:	540003c8 	b.hi	9b84 <__eucjp_mbtowc+0x114>  // b.pmore
    9b10:	39401482 	ldrb	w2, [x4, #5]
    9b14:	120018a5 	and	w5, w5, #0x7f
    9b18:	0b0220a5 	add	w5, w5, w2, lsl #8
    9b1c:	b9000025 	str	w5, [x1]
    9b20:	b900009f 	str	wzr, [x4]
    9b24:	910083ff 	add	sp, sp, #0x20
    9b28:	d65f03c0 	ret
    9b2c:	7100041f 	cmp	w0, #0x1
    9b30:	54fffce0 	b.eq	9acc <__eucjp_mbtowc+0x5c>  // b.none
    9b34:	7100081f 	cmp	w0, #0x2
    9b38:	540001e0 	b.eq	9b74 <__eucjp_mbtowc+0x104>  // b.none
    9b3c:	b9000025 	str	w5, [x1]
    9b40:	39400040 	ldrb	w0, [x2]
    9b44:	7100001f 	cmp	w0, #0x0
    9b48:	1a9f07e0 	cset	w0, ne  // ne = any
    9b4c:	910083ff 	add	sp, sp, #0x20
    9b50:	d65f03c0 	ret
    9b54:	0b0720a5 	add	w5, w5, w7, lsl #8
    9b58:	b9000025 	str	w5, [x1]
    9b5c:	b900009f 	str	wzr, [x4]
    9b60:	910083ff 	add	sp, sp, #0x20
    9b64:	d65f03c0 	ret
    9b68:	52800000 	mov	w0, #0x0                   	// #0
    9b6c:	910083ff 	add	sp, sp, #0x20
    9b70:	d65f03c0 	ret
    9b74:	52800020 	mov	w0, #0x1                   	// #1
    9b78:	17ffffe3 	b	9b04 <__eucjp_mbtowc+0x94>
    9b7c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    9b80:	17fffff3 	b	9b4c <__eucjp_mbtowc+0xdc>
    9b84:	52801141 	mov	w1, #0x8a                  	// #138
    9b88:	12800000 	mov	w0, #0xffffffff            	// #-1
    9b8c:	b90000c1 	str	w1, [x6]
    9b90:	17ffffef 	b	9b4c <__eucjp_mbtowc+0xdc>
    9b94:	d503201f 	nop
    9b98:	d503201f 	nop
    9b9c:	d503201f 	nop

0000000000009ba0 <__jis_mbtowc>:
    9ba0:	d10043ff 	sub	sp, sp, #0x10
    9ba4:	f100003f 	cmp	x1, #0x0
    9ba8:	910033e5 	add	x5, sp, #0xc
    9bac:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    9bb0:	b4000da2 	cbz	x2, 9d64 <__jis_mbtowc+0x1c4>
    9bb4:	b4000e43 	cbz	x3, 9d7c <__jis_mbtowc+0x1dc>
    9bb8:	39400085 	ldrb	w5, [x4]
    9bbc:	f000000c 	adrp	x12, c000 <_reclaim_reent+0xc0>
    9bc0:	f000000b 	adrp	x11, c000 <_reclaim_reent+0xc0>
    9bc4:	aa0003ed 	mov	x13, x0
    9bc8:	9136a18c 	add	x12, x12, #0xda8
    9bcc:	9137c16b 	add	x11, x11, #0xdf0
    9bd0:	aa0203ef 	mov	x15, x2
    9bd4:	5280000a 	mov	w10, #0x0                   	// #0
    9bd8:	d2800009 	mov	x9, #0x0                   	// #0
    9bdc:	38696847 	ldrb	w7, [x2, x9]
    9be0:	8b09004e 	add	x14, x2, x9
    9be4:	7100a0ff 	cmp	w7, #0x28
    9be8:	54000c60 	b.eq	9d74 <__jis_mbtowc+0x1d4>  // b.none
    9bec:	540005a8 	b.hi	9ca0 <__jis_mbtowc+0x100>  // b.pmore
    9bf0:	52800006 	mov	w6, #0x0                   	// #0
    9bf4:	71006cff 	cmp	w7, #0x1b
    9bf8:	54000080 	b.eq	9c08 <__jis_mbtowc+0x68>  // b.none
    9bfc:	52800026 	mov	w6, #0x1                   	// #1
    9c00:	710090ff 	cmp	w7, #0x24
    9c04:	540008c1 	b.ne	9d1c <__jis_mbtowc+0x17c>  // b.any
    9c08:	937d7ca0 	sbfiz	x0, x5, #3, #32
    9c0c:	8b25c005 	add	x5, x0, w5, sxtw
    9c10:	8b050180 	add	x0, x12, x5
    9c14:	8b050165 	add	x5, x11, x5
    9c18:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    9c1c:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    9c20:	71000d1f 	cmp	w8, #0x3
    9c24:	540006a0 	b.eq	9cf8 <__jis_mbtowc+0x158>  // b.none
    9c28:	540002a8 	b.hi	9c7c <__jis_mbtowc+0xdc>  // b.pmore
    9c2c:	7100051f 	cmp	w8, #0x1
    9c30:	54000840 	b.eq	9d38 <__jis_mbtowc+0x198>  // b.none
    9c34:	7100091f 	cmp	w8, #0x2
    9c38:	54000141 	b.ne	9c60 <__jis_mbtowc+0xc0>  // b.any
    9c3c:	52800020 	mov	w0, #0x1                   	// #1
    9c40:	b9000080 	str	w0, [x4]
    9c44:	39401082 	ldrb	w2, [x4, #4]
    9c48:	0b000140 	add	w0, w10, w0
    9c4c:	394001c3 	ldrb	w3, [x14]
    9c50:	0b022062 	add	w2, w3, w2, lsl #8
    9c54:	b9000022 	str	w2, [x1]
    9c58:	910043ff 	add	sp, sp, #0x10
    9c5c:	d65f03c0 	ret
    9c60:	35000788 	cbnz	w8, 9d50 <__jis_mbtowc+0x1b0>
    9c64:	b900009f 	str	wzr, [x4]
    9c68:	11000540 	add	w0, w10, #0x1
    9c6c:	394001e2 	ldrb	w2, [x15]
    9c70:	b9000022 	str	w2, [x1]
    9c74:	910043ff 	add	sp, sp, #0x10
    9c78:	d65f03c0 	ret
    9c7c:	7100111f 	cmp	w8, #0x4
    9c80:	54000400 	b.eq	9d00 <__jis_mbtowc+0x160>  // b.none
    9c84:	7100151f 	cmp	w8, #0x5
    9c88:	54000641 	b.ne	9d50 <__jis_mbtowc+0x1b0>  // b.any
    9c8c:	b900009f 	str	wzr, [x4]
    9c90:	52800000 	mov	w0, #0x0                   	// #0
    9c94:	b900003f 	str	wzr, [x1]
    9c98:	910043ff 	add	sp, sp, #0x10
    9c9c:	d65f03c0 	ret
    9ca0:	52800086 	mov	w6, #0x4                   	// #4
    9ca4:	710108ff 	cmp	w7, #0x42
    9ca8:	54fffb00 	b.eq	9c08 <__jis_mbtowc+0x68>  // b.none
    9cac:	528000a6 	mov	w6, #0x5                   	// #5
    9cb0:	710128ff 	cmp	w7, #0x4a
    9cb4:	54fffaa0 	b.eq	9c08 <__jis_mbtowc+0x68>  // b.none
    9cb8:	52800066 	mov	w6, #0x3                   	// #3
    9cbc:	710100ff 	cmp	w7, #0x40
    9cc0:	54fffa40 	b.eq	9c08 <__jis_mbtowc+0x68>  // b.none
    9cc4:	510084e0 	sub	w0, w7, #0x21
    9cc8:	7101741f 	cmp	w0, #0x5d
    9ccc:	1a9f97e6 	cset	w6, hi  // hi = pmore
    9cd0:	11001cc6 	add	w6, w6, #0x7
    9cd4:	d503201f 	nop
    9cd8:	937d7ca0 	sbfiz	x0, x5, #3, #32
    9cdc:	8b25c005 	add	x5, x0, w5, sxtw
    9ce0:	8b050180 	add	x0, x12, x5
    9ce4:	8b050165 	add	x5, x11, x5
    9ce8:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    9cec:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    9cf0:	71000d1f 	cmp	w8, #0x3
    9cf4:	54fff9a1 	b.ne	9c28 <__jis_mbtowc+0x88>  // b.any
    9cf8:	91000529 	add	x9, x9, #0x1
    9cfc:	8b09004f 	add	x15, x2, x9
    9d00:	11000549 	add	w9, w10, #0x1
    9d04:	aa0903ea 	mov	x10, x9
    9d08:	eb03013f 	cmp	x9, x3
    9d0c:	54fff683 	b.cc	9bdc <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    9d10:	12800020 	mov	w0, #0xfffffffe            	// #-2
    9d14:	b9000085 	str	w5, [x4]
    9d18:	17ffffd0 	b	9c58 <__jis_mbtowc+0xb8>
    9d1c:	528000c6 	mov	w6, #0x6                   	// #6
    9d20:	34fff747 	cbz	w7, 9c08 <__jis_mbtowc+0x68>
    9d24:	510084e0 	sub	w0, w7, #0x21
    9d28:	7101741f 	cmp	w0, #0x5d
    9d2c:	1a9f97e6 	cset	w6, hi  // hi = pmore
    9d30:	11001cc6 	add	w6, w6, #0x7
    9d34:	17ffffe9 	b	9cd8 <__jis_mbtowc+0x138>
    9d38:	11000549 	add	w9, w10, #0x1
    9d3c:	39001087 	strb	w7, [x4, #4]
    9d40:	aa0903ea 	mov	x10, x9
    9d44:	eb03013f 	cmp	x9, x3
    9d48:	54fff4a3 	b.cc	9bdc <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    9d4c:	17fffff1 	b	9d10 <__jis_mbtowc+0x170>
    9d50:	52801141 	mov	w1, #0x8a                  	// #138
    9d54:	b90001a1 	str	w1, [x13]
    9d58:	12800000 	mov	w0, #0xffffffff            	// #-1
    9d5c:	910043ff 	add	sp, sp, #0x10
    9d60:	d65f03c0 	ret
    9d64:	b900009f 	str	wzr, [x4]
    9d68:	52800020 	mov	w0, #0x1                   	// #1
    9d6c:	910043ff 	add	sp, sp, #0x10
    9d70:	d65f03c0 	ret
    9d74:	52800046 	mov	w6, #0x2                   	// #2
    9d78:	17ffffa4 	b	9c08 <__jis_mbtowc+0x68>
    9d7c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    9d80:	17ffffb6 	b	9c58 <__jis_mbtowc+0xb8>

0000000000009d84 <memchr>:
    9d84:	b4000682 	cbz	x2, 9e54 <memchr+0xd0>
    9d88:	52808025 	mov	w5, #0x401                 	// #1025
    9d8c:	72a80205 	movk	w5, #0x4010, lsl #16
    9d90:	4e010c20 	dup	v0.16b, w1
    9d94:	927be803 	and	x3, x0, #0xffffffffffffffe0
    9d98:	4e040ca5 	dup	v5.4s, w5
    9d9c:	f2401009 	ands	x9, x0, #0x1f
    9da0:	9240104a 	and	x10, x2, #0x1f
    9da4:	54000200 	b.eq	9de4 <memchr+0x60>  // b.none
    9da8:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    9dac:	d1008124 	sub	x4, x9, #0x20
    9db0:	ab040042 	adds	x2, x2, x4
    9db4:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    9db8:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    9dbc:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    9dc0:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    9dc4:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    9dc8:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    9dcc:	4e083cc6 	mov	x6, v6.d[0]
    9dd0:	d37ff924 	lsl	x4, x9, #1
    9dd4:	9ac424c6 	lsr	x6, x6, x4
    9dd8:	9ac420c6 	lsl	x6, x6, x4
    9ddc:	54000229 	b.ls	9e20 <memchr+0x9c>  // b.plast
    9de0:	b50002c6 	cbnz	x6, 9e38 <memchr+0xb4>
    9de4:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    9de8:	f1008042 	subs	x2, x2, #0x20
    9dec:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    9df0:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    9df4:	540000a9 	b.ls	9e08 <memchr+0x84>  // b.plast
    9df8:	4ea41c66 	orr	v6.16b, v3.16b, v4.16b
    9dfc:	4ee6bcc6 	addp	v6.2d, v6.2d, v6.2d
    9e00:	4e083cc6 	mov	x6, v6.d[0]
    9e04:	b4ffff06 	cbz	x6, 9de4 <memchr+0x60>
    9e08:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    9e0c:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    9e10:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    9e14:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    9e18:	4e083cc6 	mov	x6, v6.d[0]
    9e1c:	540000e8 	b.hi	9e38 <memchr+0xb4>  // b.pmore
    9e20:	8b090144 	add	x4, x10, x9
    9e24:	92401084 	and	x4, x4, #0x1f
    9e28:	d1008084 	sub	x4, x4, #0x20
    9e2c:	cb0407e4 	neg	x4, x4, lsl #1
    9e30:	9ac420c6 	lsl	x6, x6, x4
    9e34:	9ac424c6 	lsr	x6, x6, x4
    9e38:	dac000c6 	rbit	x6, x6
    9e3c:	d1008063 	sub	x3, x3, #0x20
    9e40:	f10000df 	cmp	x6, #0x0
    9e44:	dac010c6 	clz	x6, x6
    9e48:	8b460460 	add	x0, x3, x6, lsr #1
    9e4c:	9a8003e0 	csel	x0, xzr, x0, eq  // eq = none
    9e50:	d65f03c0 	ret
    9e54:	d2800000 	mov	x0, #0x0                   	// #0
    9e58:	d65f03c0 	ret
    9e5c:	d503201f 	nop

0000000000009e60 <__malloc_lock>:
    9e60:	d65f03c0 	ret
    9e64:	d503201f 	nop
    9e68:	d503201f 	nop
    9e6c:	d503201f 	nop

0000000000009e70 <__malloc_unlock>:
    9e70:	d65f03c0 	ret
    9e74:	d503201f 	nop
    9e78:	d503201f 	nop
    9e7c:	d503201f 	nop

0000000000009e80 <_realloc_r>:
    9e80:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    9e84:	910003fd 	mov	x29, sp
    9e88:	a9025bf5 	stp	x21, x22, [sp, #32]
    9e8c:	aa0203f5 	mov	x21, x2
    9e90:	b40010e1 	cbz	x1, a0ac <_realloc_r+0x22c>
    9e94:	a90363f7 	stp	x23, x24, [sp, #48]
    9e98:	d1004038 	sub	x24, x1, #0x10
    9e9c:	aa0003f7 	mov	x23, x0
    9ea0:	a90153f3 	stp	x19, x20, [sp, #16]
    9ea4:	aa0103f3 	mov	x19, x1
    9ea8:	91005eb4 	add	x20, x21, #0x17
    9eac:	a9046bf9 	stp	x25, x26, [sp, #64]
    9eb0:	97ffffec 	bl	9e60 <__malloc_lock>
    9eb4:	aa1803f9 	mov	x25, x24
    9eb8:	f9400700 	ldr	x0, [x24, #8]
    9ebc:	927ef416 	and	x22, x0, #0xfffffffffffffffc
    9ec0:	f100ba9f 	cmp	x20, #0x2e
    9ec4:	54000908 	b.hi	9fe4 <_realloc_r+0x164>  // b.pmore
    9ec8:	52800001 	mov	w1, #0x0                   	// #0
    9ecc:	7100003f 	cmp	w1, #0x0
    9ed0:	d2800414 	mov	x20, #0x20                  	// #32
    9ed4:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    9ed8:	54000943 	b.cc	a000 <_realloc_r+0x180>  // b.lo, b.ul, b.last
    9edc:	eb1402df 	cmp	x22, x20
    9ee0:	54000b0a 	b.ge	a040 <_realloc_r+0x1c0>  // b.tcont
    9ee4:	90000021 	adrp	x1, d000 <impure_data+0x78>
    9ee8:	a90573fb 	stp	x27, x28, [sp, #80]
    9eec:	9122603c 	add	x28, x1, #0x898
    9ef0:	8b160302 	add	x2, x24, x22
    9ef4:	f9400b83 	ldr	x3, [x28, #16]
    9ef8:	f9400441 	ldr	x1, [x2, #8]
    9efc:	eb02007f 	cmp	x3, x2
    9f00:	54000f60 	b.eq	a0ec <_realloc_r+0x26c>  // b.none
    9f04:	927ff823 	and	x3, x1, #0xfffffffffffffffe
    9f08:	8b030043 	add	x3, x2, x3
    9f0c:	f9400463 	ldr	x3, [x3, #8]
    9f10:	37000c23 	tbnz	w3, #0, a094 <_realloc_r+0x214>
    9f14:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    9f18:	8b0102c3 	add	x3, x22, x1
    9f1c:	eb03029f 	cmp	x20, x3
    9f20:	5400084d 	b.le	a028 <_realloc_r+0x1a8>
    9f24:	37000180 	tbnz	w0, #0, 9f54 <_realloc_r+0xd4>
    9f28:	f85f027b 	ldur	x27, [x19, #-16]
    9f2c:	cb1b031b 	sub	x27, x24, x27
    9f30:	f9400760 	ldr	x0, [x27, #8]
    9f34:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    9f38:	8b010001 	add	x1, x0, x1
    9f3c:	8b160023 	add	x3, x1, x22
    9f40:	eb03029f 	cmp	x20, x3
    9f44:	540019ad 	b.le	a278 <_realloc_r+0x3f8>
    9f48:	8b0002c3 	add	x3, x22, x0
    9f4c:	eb03029f 	cmp	x20, x3
    9f50:	5400152d 	b.le	a1f4 <_realloc_r+0x374>
    9f54:	aa1503e1 	mov	x1, x21
    9f58:	aa1703e0 	mov	x0, x23
    9f5c:	97fffbb9 	bl	8e40 <_malloc_r>
    9f60:	aa0003f5 	mov	x21, x0
    9f64:	b40002c0 	cbz	x0, 9fbc <_realloc_r+0x13c>
    9f68:	f9400701 	ldr	x1, [x24, #8]
    9f6c:	d1004002 	sub	x2, x0, #0x10
    9f70:	927ff821 	and	x1, x1, #0xfffffffffffffffe
    9f74:	8b010318 	add	x24, x24, x1
    9f78:	eb02031f 	cmp	x24, x2
    9f7c:	54001200 	b.eq	a1bc <_realloc_r+0x33c>  // b.none
    9f80:	d10022c2 	sub	x2, x22, #0x8
    9f84:	f101205f 	cmp	x2, #0x48
    9f88:	54001728 	b.hi	a26c <_realloc_r+0x3ec>  // b.pmore
    9f8c:	f1009c5f 	cmp	x2, #0x27
    9f90:	54001208 	b.hi	a1d0 <_realloc_r+0x350>  // b.pmore
    9f94:	aa1303e1 	mov	x1, x19
    9f98:	f9400022 	ldr	x2, [x1]
    9f9c:	f9000002 	str	x2, [x0]
    9fa0:	f9400422 	ldr	x2, [x1, #8]
    9fa4:	f9000402 	str	x2, [x0, #8]
    9fa8:	f9400821 	ldr	x1, [x1, #16]
    9fac:	f9000801 	str	x1, [x0, #16]
    9fb0:	aa1303e1 	mov	x1, x19
    9fb4:	aa1703e0 	mov	x0, x23
    9fb8:	97fff582 	bl	75c0 <_free_r>
    9fbc:	aa1703e0 	mov	x0, x23
    9fc0:	97ffffac 	bl	9e70 <__malloc_unlock>
    9fc4:	aa1503e0 	mov	x0, x21
    9fc8:	a94153f3 	ldp	x19, x20, [sp, #16]
    9fcc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9fd0:	a94363f7 	ldp	x23, x24, [sp, #48]
    9fd4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9fd8:	a94573fb 	ldp	x27, x28, [sp, #80]
    9fdc:	a8c67bfd 	ldp	x29, x30, [sp], #96
    9fe0:	d65f03c0 	ret
    9fe4:	927cee94 	and	x20, x20, #0xfffffffffffffff0
    9fe8:	b2407be1 	mov	x1, #0x7fffffff            	// #2147483647
    9fec:	eb01029f 	cmp	x20, x1
    9ff0:	1a9f97e1 	cset	w1, hi  // hi = pmore
    9ff4:	7100003f 	cmp	w1, #0x0
    9ff8:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    9ffc:	54fff702 	b.cs	9edc <_realloc_r+0x5c>  // b.hs, b.nlast
    a000:	52800180 	mov	w0, #0xc                   	// #12
    a004:	b90002e0 	str	w0, [x23]
    a008:	d2800015 	mov	x21, #0x0                   	// #0
    a00c:	aa1503e0 	mov	x0, x21
    a010:	a94153f3 	ldp	x19, x20, [sp, #16]
    a014:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a018:	a94363f7 	ldp	x23, x24, [sp, #48]
    a01c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a020:	a8c67bfd 	ldp	x29, x30, [sp], #96
    a024:	d65f03c0 	ret
    a028:	a9410041 	ldp	x1, x0, [x2, #16]
    a02c:	aa0303f6 	mov	x22, x3
    a030:	a94573fb 	ldp	x27, x28, [sp, #80]
    a034:	f9000c20 	str	x0, [x1, #24]
    a038:	f9000801 	str	x1, [x0, #16]
    a03c:	d503201f 	nop
    a040:	f9400721 	ldr	x1, [x25, #8]
    a044:	cb1402c0 	sub	x0, x22, x20
    a048:	8b160322 	add	x2, x25, x22
    a04c:	92400021 	and	x1, x1, #0x1
    a050:	f1007c1f 	cmp	x0, #0x1f
    a054:	54000348 	b.hi	a0bc <_realloc_r+0x23c>  // b.pmore
    a058:	aa0102c1 	orr	x1, x22, x1
    a05c:	f9000721 	str	x1, [x25, #8]
    a060:	f9400440 	ldr	x0, [x2, #8]
    a064:	b2400000 	orr	x0, x0, #0x1
    a068:	f9000440 	str	x0, [x2, #8]
    a06c:	aa1703e0 	mov	x0, x23
    a070:	aa1303f5 	mov	x21, x19
    a074:	97ffff7f 	bl	9e70 <__malloc_unlock>
    a078:	aa1503e0 	mov	x0, x21
    a07c:	a94153f3 	ldp	x19, x20, [sp, #16]
    a080:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a084:	a94363f7 	ldp	x23, x24, [sp, #48]
    a088:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a08c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    a090:	d65f03c0 	ret
    a094:	3707f600 	tbnz	w0, #0, 9f54 <_realloc_r+0xd4>
    a098:	f85f027b 	ldur	x27, [x19, #-16]
    a09c:	cb1b031b 	sub	x27, x24, x27
    a0a0:	f9400760 	ldr	x0, [x27, #8]
    a0a4:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    a0a8:	17ffffa8 	b	9f48 <_realloc_r+0xc8>
    a0ac:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a0b0:	aa0203e1 	mov	x1, x2
    a0b4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    a0b8:	17fffb62 	b	8e40 <_malloc_r>
    a0bc:	8b140324 	add	x4, x25, x20
    a0c0:	aa010281 	orr	x1, x20, x1
    a0c4:	f9000721 	str	x1, [x25, #8]
    a0c8:	b2400003 	orr	x3, x0, #0x1
    a0cc:	91004081 	add	x1, x4, #0x10
    a0d0:	aa1703e0 	mov	x0, x23
    a0d4:	f9000483 	str	x3, [x4, #8]
    a0d8:	f9400443 	ldr	x3, [x2, #8]
    a0dc:	b2400063 	orr	x3, x3, #0x1
    a0e0:	f9000443 	str	x3, [x2, #8]
    a0e4:	97fff537 	bl	75c0 <_free_r>
    a0e8:	17ffffe1 	b	a06c <_realloc_r+0x1ec>
    a0ec:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    a0f0:	91008283 	add	x3, x20, #0x20
    a0f4:	8b0102c2 	add	x2, x22, x1
    a0f8:	eb03005f 	cmp	x2, x3
    a0fc:	54000eaa 	b.ge	a2d0 <_realloc_r+0x450>  // b.tcont
    a100:	3707f2a0 	tbnz	w0, #0, 9f54 <_realloc_r+0xd4>
    a104:	f85f027b 	ldur	x27, [x19, #-16]
    a108:	cb1b031b 	sub	x27, x24, x27
    a10c:	f9400760 	ldr	x0, [x27, #8]
    a110:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    a114:	8b010001 	add	x1, x0, x1
    a118:	8b16003a 	add	x26, x1, x22
    a11c:	eb1a007f 	cmp	x3, x26
    a120:	54fff14c 	b.gt	9f48 <_realloc_r+0xc8>
    a124:	aa1b03f5 	mov	x21, x27
    a128:	d10022c2 	sub	x2, x22, #0x8
    a12c:	f9400f60 	ldr	x0, [x27, #24]
    a130:	f8410ea1 	ldr	x1, [x21, #16]!
    a134:	f9000c20 	str	x0, [x1, #24]
    a138:	f9000801 	str	x1, [x0, #16]
    a13c:	f101205f 	cmp	x2, #0x48
    a140:	54001128 	b.hi	a364 <_realloc_r+0x4e4>  // b.pmore
    a144:	aa1503e0 	mov	x0, x21
    a148:	f1009c5f 	cmp	x2, #0x27
    a14c:	54000129 	b.ls	a170 <_realloc_r+0x2f0>  // b.plast
    a150:	f9400260 	ldr	x0, [x19]
    a154:	f9000b60 	str	x0, [x27, #16]
    a158:	f9400660 	ldr	x0, [x19, #8]
    a15c:	f9000f60 	str	x0, [x27, #24]
    a160:	f100dc5f 	cmp	x2, #0x37
    a164:	54001088 	b.hi	a374 <_realloc_r+0x4f4>  // b.pmore
    a168:	91004273 	add	x19, x19, #0x10
    a16c:	91008360 	add	x0, x27, #0x20
    a170:	f9400261 	ldr	x1, [x19]
    a174:	f9000001 	str	x1, [x0]
    a178:	f9400661 	ldr	x1, [x19, #8]
    a17c:	f9000401 	str	x1, [x0, #8]
    a180:	f9400a61 	ldr	x1, [x19, #16]
    a184:	f9000801 	str	x1, [x0, #16]
    a188:	8b140362 	add	x2, x27, x20
    a18c:	cb140341 	sub	x1, x26, x20
    a190:	f9000b82 	str	x2, [x28, #16]
    a194:	b2400021 	orr	x1, x1, #0x1
    a198:	aa1703e0 	mov	x0, x23
    a19c:	f9000441 	str	x1, [x2, #8]
    a1a0:	f9400761 	ldr	x1, [x27, #8]
    a1a4:	92400021 	and	x1, x1, #0x1
    a1a8:	aa140034 	orr	x20, x1, x20
    a1ac:	f9000774 	str	x20, [x27, #8]
    a1b0:	97ffff30 	bl	9e70 <__malloc_unlock>
    a1b4:	a94573fb 	ldp	x27, x28, [sp, #80]
    a1b8:	17ffffb0 	b	a078 <_realloc_r+0x1f8>
    a1bc:	f9400700 	ldr	x0, [x24, #8]
    a1c0:	a94573fb 	ldp	x27, x28, [sp, #80]
    a1c4:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    a1c8:	8b0002d6 	add	x22, x22, x0
    a1cc:	17ffff9d 	b	a040 <_realloc_r+0x1c0>
    a1d0:	f9400260 	ldr	x0, [x19]
    a1d4:	f90002a0 	str	x0, [x21]
    a1d8:	f9400660 	ldr	x0, [x19, #8]
    a1dc:	f90006a0 	str	x0, [x21, #8]
    a1e0:	f100dc5f 	cmp	x2, #0x37
    a1e4:	54000648 	b.hi	a2ac <_realloc_r+0x42c>  // b.pmore
    a1e8:	91004261 	add	x1, x19, #0x10
    a1ec:	910042a0 	add	x0, x21, #0x10
    a1f0:	17ffff6a 	b	9f98 <_realloc_r+0x118>
    a1f4:	aa1b03e0 	mov	x0, x27
    a1f8:	d10022c2 	sub	x2, x22, #0x8
    a1fc:	f8410c04 	ldr	x4, [x0, #16]!
    a200:	f9400f61 	ldr	x1, [x27, #24]
    a204:	f9000c81 	str	x1, [x4, #24]
    a208:	f9000824 	str	x4, [x1, #16]
    a20c:	f101205f 	cmp	x2, #0x48
    a210:	54000408 	b.hi	a290 <_realloc_r+0x410>  // b.pmore
    a214:	aa0003e1 	mov	x1, x0
    a218:	f1009c5f 	cmp	x2, #0x27
    a21c:	54000129 	b.ls	a240 <_realloc_r+0x3c0>  // b.plast
    a220:	f9400261 	ldr	x1, [x19]
    a224:	f9000b61 	str	x1, [x27, #16]
    a228:	f9400661 	ldr	x1, [x19, #8]
    a22c:	f9000f61 	str	x1, [x27, #24]
    a230:	f100dc5f 	cmp	x2, #0x37
    a234:	540006a8 	b.hi	a308 <_realloc_r+0x488>  // b.pmore
    a238:	91004273 	add	x19, x19, #0x10
    a23c:	91008361 	add	x1, x27, #0x20
    a240:	f9400262 	ldr	x2, [x19]
    a244:	aa1b03f9 	mov	x25, x27
    a248:	a94573fb 	ldp	x27, x28, [sp, #80]
    a24c:	f9000022 	str	x2, [x1]
    a250:	aa0303f6 	mov	x22, x3
    a254:	f9400662 	ldr	x2, [x19, #8]
    a258:	f9000422 	str	x2, [x1, #8]
    a25c:	f9400a62 	ldr	x2, [x19, #16]
    a260:	aa0003f3 	mov	x19, x0
    a264:	f9000822 	str	x2, [x1, #16]
    a268:	17ffff76 	b	a040 <_realloc_r+0x1c0>
    a26c:	aa1303e1 	mov	x1, x19
    a270:	97ffe934 	bl	4740 <memmove>
    a274:	17ffff4f 	b	9fb0 <_realloc_r+0x130>
    a278:	a9410444 	ldp	x4, x1, [x2, #16]
    a27c:	f9000c81 	str	x1, [x4, #24]
    a280:	aa1b03e0 	mov	x0, x27
    a284:	d10022c2 	sub	x2, x22, #0x8
    a288:	f9000824 	str	x4, [x1, #16]
    a28c:	17ffffdc 	b	a1fc <_realloc_r+0x37c>
    a290:	aa1303e1 	mov	x1, x19
    a294:	aa0303f6 	mov	x22, x3
    a298:	aa1b03f9 	mov	x25, x27
    a29c:	aa0003f3 	mov	x19, x0
    a2a0:	97ffe928 	bl	4740 <memmove>
    a2a4:	a94573fb 	ldp	x27, x28, [sp, #80]
    a2a8:	17ffff66 	b	a040 <_realloc_r+0x1c0>
    a2ac:	f9400a60 	ldr	x0, [x19, #16]
    a2b0:	f9000aa0 	str	x0, [x21, #16]
    a2b4:	f9400e60 	ldr	x0, [x19, #24]
    a2b8:	f9000ea0 	str	x0, [x21, #24]
    a2bc:	f101205f 	cmp	x2, #0x48
    a2c0:	54000360 	b.eq	a32c <_realloc_r+0x4ac>  // b.none
    a2c4:	91008261 	add	x1, x19, #0x20
    a2c8:	910082a0 	add	x0, x21, #0x20
    a2cc:	17ffff33 	b	9f98 <_realloc_r+0x118>
    a2d0:	8b140303 	add	x3, x24, x20
    a2d4:	cb140041 	sub	x1, x2, x20
    a2d8:	f9000b83 	str	x3, [x28, #16]
    a2dc:	b2400021 	orr	x1, x1, #0x1
    a2e0:	aa1703e0 	mov	x0, x23
    a2e4:	aa1303f5 	mov	x21, x19
    a2e8:	f9000461 	str	x1, [x3, #8]
    a2ec:	f9400701 	ldr	x1, [x24, #8]
    a2f0:	92400021 	and	x1, x1, #0x1
    a2f4:	aa140034 	orr	x20, x1, x20
    a2f8:	f9000714 	str	x20, [x24, #8]
    a2fc:	97fffedd 	bl	9e70 <__malloc_unlock>
    a300:	a94573fb 	ldp	x27, x28, [sp, #80]
    a304:	17ffff5d 	b	a078 <_realloc_r+0x1f8>
    a308:	f9400a61 	ldr	x1, [x19, #16]
    a30c:	f9001361 	str	x1, [x27, #32]
    a310:	f9400e61 	ldr	x1, [x19, #24]
    a314:	f9001761 	str	x1, [x27, #40]
    a318:	f101205f 	cmp	x2, #0x48
    a31c:	54000160 	b.eq	a348 <_realloc_r+0x4c8>  // b.none
    a320:	91008273 	add	x19, x19, #0x20
    a324:	9100c361 	add	x1, x27, #0x30
    a328:	17ffffc6 	b	a240 <_realloc_r+0x3c0>
    a32c:	f9401260 	ldr	x0, [x19, #32]
    a330:	f90012a0 	str	x0, [x21, #32]
    a334:	9100c261 	add	x1, x19, #0x30
    a338:	9100c2a0 	add	x0, x21, #0x30
    a33c:	f9401662 	ldr	x2, [x19, #40]
    a340:	f90016a2 	str	x2, [x21, #40]
    a344:	17ffff15 	b	9f98 <_realloc_r+0x118>
    a348:	f9401261 	ldr	x1, [x19, #32]
    a34c:	f9001b61 	str	x1, [x27, #48]
    a350:	9100c273 	add	x19, x19, #0x30
    a354:	91010361 	add	x1, x27, #0x40
    a358:	f85f8262 	ldur	x2, [x19, #-8]
    a35c:	f9001f62 	str	x2, [x27, #56]
    a360:	17ffffb8 	b	a240 <_realloc_r+0x3c0>
    a364:	aa1303e1 	mov	x1, x19
    a368:	aa1503e0 	mov	x0, x21
    a36c:	97ffe8f5 	bl	4740 <memmove>
    a370:	17ffff86 	b	a188 <_realloc_r+0x308>
    a374:	f9400a60 	ldr	x0, [x19, #16]
    a378:	f9001360 	str	x0, [x27, #32]
    a37c:	f9400e60 	ldr	x0, [x19, #24]
    a380:	f9001760 	str	x0, [x27, #40]
    a384:	f101205f 	cmp	x2, #0x48
    a388:	54000080 	b.eq	a398 <_realloc_r+0x518>  // b.none
    a38c:	91008273 	add	x19, x19, #0x20
    a390:	9100c360 	add	x0, x27, #0x30
    a394:	17ffff77 	b	a170 <_realloc_r+0x2f0>
    a398:	f9401260 	ldr	x0, [x19, #32]
    a39c:	f9001b60 	str	x0, [x27, #48]
    a3a0:	9100c273 	add	x19, x19, #0x30
    a3a4:	91010360 	add	x0, x27, #0x40
    a3a8:	f85f8261 	ldur	x1, [x19, #-8]
    a3ac:	f9001f61 	str	x1, [x27, #56]
    a3b0:	17ffff70 	b	a170 <_realloc_r+0x2f0>
    a3b4:	d503201f 	nop
    a3b8:	d503201f 	nop
    a3bc:	d503201f 	nop

000000000000a3c0 <_sbrk_r>:
    a3c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a3c4:	910003fd 	mov	x29, sp
    a3c8:	a90153f3 	stp	x19, x20, [sp, #16]
    a3cc:	90000034 	adrp	x20, e000 <__malloc_av_+0x768>
    a3d0:	aa0003f3 	mov	x19, x0
    a3d4:	b904d29f 	str	wzr, [x20, #1232]
    a3d8:	aa0103e0 	mov	x0, x1
    a3dc:	97ffe7ad 	bl	4290 <_sbrk>
    a3e0:	b100041f 	cmn	x0, #0x1
    a3e4:	54000080 	b.eq	a3f4 <_sbrk_r+0x34>  // b.none
    a3e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    a3ec:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a3f0:	d65f03c0 	ret
    a3f4:	b944d281 	ldr	w1, [x20, #1232]
    a3f8:	34ffff81 	cbz	w1, a3e8 <_sbrk_r+0x28>
    a3fc:	b9000261 	str	w1, [x19]
    a400:	a94153f3 	ldp	x19, x20, [sp, #16]
    a404:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a408:	d65f03c0 	ret
    a40c:	d503201f 	nop

000000000000a410 <_init_signal_r>:
    a410:	f9428c01 	ldr	x1, [x0, #1304]
    a414:	b4000061 	cbz	x1, a420 <_init_signal_r+0x10>
    a418:	52800000 	mov	w0, #0x0                   	// #0
    a41c:	d65f03c0 	ret
    a420:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a424:	d2802001 	mov	x1, #0x100                 	// #256
    a428:	910003fd 	mov	x29, sp
    a42c:	f9000bf3 	str	x19, [sp, #16]
    a430:	aa0003f3 	mov	x19, x0
    a434:	97fffa83 	bl	8e40 <_malloc_r>
    a438:	f9028e60 	str	x0, [x19, #1304]
    a43c:	b4000140 	cbz	x0, a464 <_init_signal_r+0x54>
    a440:	91040001 	add	x1, x0, #0x100
    a444:	d503201f 	nop
    a448:	f800841f 	str	xzr, [x0], #8
    a44c:	eb01001f 	cmp	x0, x1
    a450:	54ffffc1 	b.ne	a448 <_init_signal_r+0x38>  // b.any
    a454:	52800000 	mov	w0, #0x0                   	// #0
    a458:	f9400bf3 	ldr	x19, [sp, #16]
    a45c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a460:	d65f03c0 	ret
    a464:	12800000 	mov	w0, #0xffffffff            	// #-1
    a468:	17fffffc 	b	a458 <_init_signal_r+0x48>
    a46c:	d503201f 	nop

000000000000a470 <_signal_r>:
    a470:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a474:	910003fd 	mov	x29, sp
    a478:	a90153f3 	stp	x19, x20, [sp, #16]
    a47c:	93407c33 	sxtw	x19, w1
    a480:	aa0003f4 	mov	x20, x0
    a484:	71007e7f 	cmp	w19, #0x1f
    a488:	54000108 	b.hi	a4a8 <_signal_r+0x38>  // b.pmore
    a48c:	f9428c04 	ldr	x4, [x0, #1304]
    a490:	b4000184 	cbz	x4, a4c0 <_signal_r+0x50>
    a494:	f8737880 	ldr	x0, [x4, x19, lsl #3]
    a498:	f8337882 	str	x2, [x4, x19, lsl #3]
    a49c:	a94153f3 	ldp	x19, x20, [sp, #16]
    a4a0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a4a4:	d65f03c0 	ret
    a4a8:	528002c1 	mov	w1, #0x16                  	// #22
    a4ac:	b9000281 	str	w1, [x20]
    a4b0:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    a4b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    a4b8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a4bc:	d65f03c0 	ret
    a4c0:	d2802001 	mov	x1, #0x100                 	// #256
    a4c4:	f90017e2 	str	x2, [sp, #40]
    a4c8:	97fffa5e 	bl	8e40 <_malloc_r>
    a4cc:	f9028e80 	str	x0, [x20, #1304]
    a4d0:	aa0003e4 	mov	x4, x0
    a4d4:	b4000120 	cbz	x0, a4f8 <_signal_r+0x88>
    a4d8:	f94017e2 	ldr	x2, [sp, #40]
    a4dc:	aa0003e3 	mov	x3, x0
    a4e0:	91040001 	add	x1, x0, #0x100
    a4e4:	d503201f 	nop
    a4e8:	f800847f 	str	xzr, [x3], #8
    a4ec:	eb03003f 	cmp	x1, x3
    a4f0:	54ffffc1 	b.ne	a4e8 <_signal_r+0x78>  // b.any
    a4f4:	17ffffe8 	b	a494 <_signal_r+0x24>
    a4f8:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    a4fc:	17ffffe8 	b	a49c <_signal_r+0x2c>

000000000000a500 <_raise_r>:
    a500:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a504:	910003fd 	mov	x29, sp
    a508:	a90153f3 	stp	x19, x20, [sp, #16]
    a50c:	aa0003f4 	mov	x20, x0
    a510:	71007c3f 	cmp	w1, #0x1f
    a514:	54000488 	b.hi	a5a4 <_raise_r+0xa4>  // b.pmore
    a518:	f9428c00 	ldr	x0, [x0, #1304]
    a51c:	2a0103f3 	mov	w19, w1
    a520:	b40001e0 	cbz	x0, a55c <_raise_r+0x5c>
    a524:	93407c22 	sxtw	x2, w1
    a528:	f8627801 	ldr	x1, [x0, x2, lsl #3]
    a52c:	b4000181 	cbz	x1, a55c <_raise_r+0x5c>
    a530:	f100043f 	cmp	x1, #0x1
    a534:	54000300 	b.eq	a594 <_raise_r+0x94>  // b.none
    a538:	b100043f 	cmn	x1, #0x1
    a53c:	54000200 	b.eq	a57c <_raise_r+0x7c>  // b.none
    a540:	f822781f 	str	xzr, [x0, x2, lsl #3]
    a544:	2a1303e0 	mov	w0, w19
    a548:	d63f0020 	blr	x1
    a54c:	52800000 	mov	w0, #0x0                   	// #0
    a550:	a94153f3 	ldp	x19, x20, [sp, #16]
    a554:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a558:	d65f03c0 	ret
    a55c:	aa1403e0 	mov	x0, x20
    a560:	940000fc 	bl	a950 <_getpid_r>
    a564:	2a1303e2 	mov	w2, w19
    a568:	2a0003e1 	mov	w1, w0
    a56c:	aa1403e0 	mov	x0, x20
    a570:	a94153f3 	ldp	x19, x20, [sp, #16]
    a574:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a578:	140000e2 	b	a900 <_kill_r>
    a57c:	528002c1 	mov	w1, #0x16                  	// #22
    a580:	b9000281 	str	w1, [x20]
    a584:	52800020 	mov	w0, #0x1                   	// #1
    a588:	a94153f3 	ldp	x19, x20, [sp, #16]
    a58c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a590:	d65f03c0 	ret
    a594:	52800000 	mov	w0, #0x0                   	// #0
    a598:	a94153f3 	ldp	x19, x20, [sp, #16]
    a59c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a5a0:	d65f03c0 	ret
    a5a4:	528002c1 	mov	w1, #0x16                  	// #22
    a5a8:	12800000 	mov	w0, #0xffffffff            	// #-1
    a5ac:	b9000281 	str	w1, [x20]
    a5b0:	17ffffe8 	b	a550 <_raise_r+0x50>
    a5b4:	d503201f 	nop
    a5b8:	d503201f 	nop
    a5bc:	d503201f 	nop

000000000000a5c0 <__sigtramp_r>:
    a5c0:	71007c3f 	cmp	w1, #0x1f
    a5c4:	540005a8 	b.hi	a678 <__sigtramp_r+0xb8>  // b.pmore
    a5c8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a5cc:	910003fd 	mov	x29, sp
    a5d0:	f9428c03 	ldr	x3, [x0, #1304]
    a5d4:	a90153f3 	stp	x19, x20, [sp, #16]
    a5d8:	2a0103f3 	mov	w19, w1
    a5dc:	aa0003f4 	mov	x20, x0
    a5e0:	b4000263 	cbz	x3, a62c <__sigtramp_r+0x6c>
    a5e4:	f873d861 	ldr	x1, [x3, w19, sxtw #3]
    a5e8:	8b33cc63 	add	x3, x3, w19, sxtw #3
    a5ec:	b4000181 	cbz	x1, a61c <__sigtramp_r+0x5c>
    a5f0:	b100043f 	cmn	x1, #0x1
    a5f4:	540003a0 	b.eq	a668 <__sigtramp_r+0xa8>  // b.none
    a5f8:	f100043f 	cmp	x1, #0x1
    a5fc:	540002e0 	b.eq	a658 <__sigtramp_r+0x98>  // b.none
    a600:	f900007f 	str	xzr, [x3]
    a604:	2a1303e0 	mov	w0, w19
    a608:	d63f0020 	blr	x1
    a60c:	52800000 	mov	w0, #0x0                   	// #0
    a610:	a94153f3 	ldp	x19, x20, [sp, #16]
    a614:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a618:	d65f03c0 	ret
    a61c:	52800020 	mov	w0, #0x1                   	// #1
    a620:	a94153f3 	ldp	x19, x20, [sp, #16]
    a624:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a628:	d65f03c0 	ret
    a62c:	d2802001 	mov	x1, #0x100                 	// #256
    a630:	97fffa04 	bl	8e40 <_malloc_r>
    a634:	f9028e80 	str	x0, [x20, #1304]
    a638:	aa0003e3 	mov	x3, x0
    a63c:	b40001a0 	cbz	x0, a670 <__sigtramp_r+0xb0>
    a640:	aa0003e2 	mov	x2, x0
    a644:	91040000 	add	x0, x0, #0x100
    a648:	f800845f 	str	xzr, [x2], #8
    a64c:	eb00005f 	cmp	x2, x0
    a650:	54ffffc1 	b.ne	a648 <__sigtramp_r+0x88>  // b.any
    a654:	17ffffe4 	b	a5e4 <__sigtramp_r+0x24>
    a658:	52800060 	mov	w0, #0x3                   	// #3
    a65c:	a94153f3 	ldp	x19, x20, [sp, #16]
    a660:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a664:	d65f03c0 	ret
    a668:	52800040 	mov	w0, #0x2                   	// #2
    a66c:	17ffffe9 	b	a610 <__sigtramp_r+0x50>
    a670:	12800000 	mov	w0, #0xffffffff            	// #-1
    a674:	17ffffe7 	b	a610 <__sigtramp_r+0x50>
    a678:	12800000 	mov	w0, #0xffffffff            	// #-1
    a67c:	d65f03c0 	ret

000000000000a680 <raise>:
    a680:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a684:	d0000001 	adrp	x1, c000 <_reclaim_reent+0xc0>
    a688:	910003fd 	mov	x29, sp
    a68c:	a90153f3 	stp	x19, x20, [sp, #16]
    a690:	f947c034 	ldr	x20, [x1, #3968]
    a694:	71007c1f 	cmp	w0, #0x1f
    a698:	54000468 	b.hi	a724 <raise+0xa4>  // b.pmore
    a69c:	f9428e82 	ldr	x2, [x20, #1304]
    a6a0:	2a0003f3 	mov	w19, w0
    a6a4:	b40001c2 	cbz	x2, a6dc <raise+0x5c>
    a6a8:	93407c03 	sxtw	x3, w0
    a6ac:	f8637841 	ldr	x1, [x2, x3, lsl #3]
    a6b0:	b4000161 	cbz	x1, a6dc <raise+0x5c>
    a6b4:	f100043f 	cmp	x1, #0x1
    a6b8:	540002e0 	b.eq	a714 <raise+0x94>  // b.none
    a6bc:	b100043f 	cmn	x1, #0x1
    a6c0:	540001e0 	b.eq	a6fc <raise+0x7c>  // b.none
    a6c4:	f823785f 	str	xzr, [x2, x3, lsl #3]
    a6c8:	d63f0020 	blr	x1
    a6cc:	52800000 	mov	w0, #0x0                   	// #0
    a6d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    a6d4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a6d8:	d65f03c0 	ret
    a6dc:	aa1403e0 	mov	x0, x20
    a6e0:	9400009c 	bl	a950 <_getpid_r>
    a6e4:	2a1303e2 	mov	w2, w19
    a6e8:	2a0003e1 	mov	w1, w0
    a6ec:	aa1403e0 	mov	x0, x20
    a6f0:	a94153f3 	ldp	x19, x20, [sp, #16]
    a6f4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a6f8:	14000082 	b	a900 <_kill_r>
    a6fc:	528002c1 	mov	w1, #0x16                  	// #22
    a700:	b9000281 	str	w1, [x20]
    a704:	52800020 	mov	w0, #0x1                   	// #1
    a708:	a94153f3 	ldp	x19, x20, [sp, #16]
    a70c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a710:	d65f03c0 	ret
    a714:	52800000 	mov	w0, #0x0                   	// #0
    a718:	a94153f3 	ldp	x19, x20, [sp, #16]
    a71c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a720:	d65f03c0 	ret
    a724:	528002c1 	mov	w1, #0x16                  	// #22
    a728:	12800000 	mov	w0, #0xffffffff            	// #-1
    a72c:	b9000281 	str	w1, [x20]
    a730:	17ffffe8 	b	a6d0 <raise+0x50>
    a734:	d503201f 	nop
    a738:	d503201f 	nop
    a73c:	d503201f 	nop

000000000000a740 <signal>:
    a740:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a744:	d0000002 	adrp	x2, c000 <_reclaim_reent+0xc0>
    a748:	910003fd 	mov	x29, sp
    a74c:	a90153f3 	stp	x19, x20, [sp, #16]
    a750:	93407c13 	sxtw	x19, w0
    a754:	f90013f5 	str	x21, [sp, #32]
    a758:	f947c055 	ldr	x21, [x2, #3968]
    a75c:	71007e7f 	cmp	w19, #0x1f
    a760:	54000148 	b.hi	a788 <signal+0x48>  // b.pmore
    a764:	aa0103f4 	mov	x20, x1
    a768:	f9428ea1 	ldr	x1, [x21, #1304]
    a76c:	b40001c1 	cbz	x1, a7a4 <signal+0x64>
    a770:	f8737820 	ldr	x0, [x1, x19, lsl #3]
    a774:	f8337834 	str	x20, [x1, x19, lsl #3]
    a778:	a94153f3 	ldp	x19, x20, [sp, #16]
    a77c:	f94013f5 	ldr	x21, [sp, #32]
    a780:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a784:	d65f03c0 	ret
    a788:	528002c1 	mov	w1, #0x16                  	// #22
    a78c:	b90002a1 	str	w1, [x21]
    a790:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    a794:	a94153f3 	ldp	x19, x20, [sp, #16]
    a798:	f94013f5 	ldr	x21, [sp, #32]
    a79c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a7a0:	d65f03c0 	ret
    a7a4:	d2802001 	mov	x1, #0x100                 	// #256
    a7a8:	aa1503e0 	mov	x0, x21
    a7ac:	97fff9a5 	bl	8e40 <_malloc_r>
    a7b0:	f9028ea0 	str	x0, [x21, #1304]
    a7b4:	aa0003e1 	mov	x1, x0
    a7b8:	b4000100 	cbz	x0, a7d8 <signal+0x98>
    a7bc:	aa0003e2 	mov	x2, x0
    a7c0:	91040003 	add	x3, x0, #0x100
    a7c4:	d503201f 	nop
    a7c8:	f800845f 	str	xzr, [x2], #8
    a7cc:	eb02007f 	cmp	x3, x2
    a7d0:	54ffffc1 	b.ne	a7c8 <signal+0x88>  // b.any
    a7d4:	17ffffe7 	b	a770 <signal+0x30>
    a7d8:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    a7dc:	17ffffe7 	b	a778 <signal+0x38>

000000000000a7e0 <_init_signal>:
    a7e0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a7e4:	d0000000 	adrp	x0, c000 <_reclaim_reent+0xc0>
    a7e8:	910003fd 	mov	x29, sp
    a7ec:	f9000bf3 	str	x19, [sp, #16]
    a7f0:	f947c013 	ldr	x19, [x0, #3968]
    a7f4:	f9428e60 	ldr	x0, [x19, #1304]
    a7f8:	b40000a0 	cbz	x0, a80c <_init_signal+0x2c>
    a7fc:	52800000 	mov	w0, #0x0                   	// #0
    a800:	f9400bf3 	ldr	x19, [sp, #16]
    a804:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a808:	d65f03c0 	ret
    a80c:	aa1303e0 	mov	x0, x19
    a810:	d2802001 	mov	x1, #0x100                 	// #256
    a814:	97fff98b 	bl	8e40 <_malloc_r>
    a818:	f9028e60 	str	x0, [x19, #1304]
    a81c:	b40000e0 	cbz	x0, a838 <_init_signal+0x58>
    a820:	91040001 	add	x1, x0, #0x100
    a824:	d503201f 	nop
    a828:	f800841f 	str	xzr, [x0], #8
    a82c:	eb01001f 	cmp	x0, x1
    a830:	54ffffc1 	b.ne	a828 <_init_signal+0x48>  // b.any
    a834:	17fffff2 	b	a7fc <_init_signal+0x1c>
    a838:	12800000 	mov	w0, #0xffffffff            	// #-1
    a83c:	17fffff1 	b	a800 <_init_signal+0x20>

000000000000a840 <__sigtramp>:
    a840:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a844:	d0000001 	adrp	x1, c000 <_reclaim_reent+0xc0>
    a848:	910003fd 	mov	x29, sp
    a84c:	a90153f3 	stp	x19, x20, [sp, #16]
    a850:	f947c034 	ldr	x20, [x1, #3968]
    a854:	71007c1f 	cmp	w0, #0x1f
    a858:	54000508 	b.hi	a8f8 <__sigtramp+0xb8>  // b.pmore
    a85c:	f9428e82 	ldr	x2, [x20, #1304]
    a860:	2a0003f3 	mov	w19, w0
    a864:	b4000262 	cbz	x2, a8b0 <__sigtramp+0x70>
    a868:	f873d841 	ldr	x1, [x2, w19, sxtw #3]
    a86c:	8b33cc42 	add	x2, x2, w19, sxtw #3
    a870:	b4000181 	cbz	x1, a8a0 <__sigtramp+0x60>
    a874:	b100043f 	cmn	x1, #0x1
    a878:	540003c0 	b.eq	a8f0 <__sigtramp+0xb0>  // b.none
    a87c:	f100043f 	cmp	x1, #0x1
    a880:	54000300 	b.eq	a8e0 <__sigtramp+0xa0>  // b.none
    a884:	f900005f 	str	xzr, [x2]
    a888:	2a1303e0 	mov	w0, w19
    a88c:	d63f0020 	blr	x1
    a890:	52800000 	mov	w0, #0x0                   	// #0
    a894:	a94153f3 	ldp	x19, x20, [sp, #16]
    a898:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a89c:	d65f03c0 	ret
    a8a0:	52800020 	mov	w0, #0x1                   	// #1
    a8a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    a8a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a8ac:	d65f03c0 	ret
    a8b0:	aa1403e0 	mov	x0, x20
    a8b4:	d2802001 	mov	x1, #0x100                 	// #256
    a8b8:	97fff962 	bl	8e40 <_malloc_r>
    a8bc:	f9028e80 	str	x0, [x20, #1304]
    a8c0:	aa0003e2 	mov	x2, x0
    a8c4:	b40001a0 	cbz	x0, a8f8 <__sigtramp+0xb8>
    a8c8:	aa0003e1 	mov	x1, x0
    a8cc:	91040000 	add	x0, x0, #0x100
    a8d0:	f800843f 	str	xzr, [x1], #8
    a8d4:	eb00003f 	cmp	x1, x0
    a8d8:	54ffffc1 	b.ne	a8d0 <__sigtramp+0x90>  // b.any
    a8dc:	17ffffe3 	b	a868 <__sigtramp+0x28>
    a8e0:	52800060 	mov	w0, #0x3                   	// #3
    a8e4:	a94153f3 	ldp	x19, x20, [sp, #16]
    a8e8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a8ec:	d65f03c0 	ret
    a8f0:	52800040 	mov	w0, #0x2                   	// #2
    a8f4:	17ffffe8 	b	a894 <__sigtramp+0x54>
    a8f8:	12800000 	mov	w0, #0xffffffff            	// #-1
    a8fc:	17ffffe6 	b	a894 <__sigtramp+0x54>

000000000000a900 <_kill_r>:
    a900:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a904:	910003fd 	mov	x29, sp
    a908:	a90153f3 	stp	x19, x20, [sp, #16]
    a90c:	90000034 	adrp	x20, e000 <__malloc_av_+0x768>
    a910:	aa0003f3 	mov	x19, x0
    a914:	b904d29f 	str	wzr, [x20, #1232]
    a918:	2a0103e0 	mov	w0, w1
    a91c:	2a0203e1 	mov	w1, w2
    a920:	97ffe680 	bl	4320 <_kill>
    a924:	3100041f 	cmn	w0, #0x1
    a928:	54000080 	b.eq	a938 <_kill_r+0x38>  // b.none
    a92c:	a94153f3 	ldp	x19, x20, [sp, #16]
    a930:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a934:	d65f03c0 	ret
    a938:	b944d281 	ldr	w1, [x20, #1232]
    a93c:	34ffff81 	cbz	w1, a92c <_kill_r+0x2c>
    a940:	b9000261 	str	w1, [x19]
    a944:	a94153f3 	ldp	x19, x20, [sp, #16]
    a948:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a94c:	d65f03c0 	ret

000000000000a950 <_getpid_r>:
    a950:	17ffe678 	b	4330 <_getpid>
    a954:	d503201f 	nop
    a958:	d503201f 	nop
    a95c:	d503201f 	nop

000000000000a960 <__sread>:
    a960:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a964:	93407c63 	sxtw	x3, w3
    a968:	910003fd 	mov	x29, sp
    a96c:	f9000bf3 	str	x19, [sp, #16]
    a970:	aa0103f3 	mov	x19, x1
    a974:	79c02421 	ldrsh	w1, [x1, #18]
    a978:	9400053a 	bl	be60 <_read_r>
    a97c:	b7f800e0 	tbnz	x0, #63, a998 <__sread+0x38>
    a980:	f9404a61 	ldr	x1, [x19, #144]
    a984:	8b000021 	add	x1, x1, x0
    a988:	f9004a61 	str	x1, [x19, #144]
    a98c:	f9400bf3 	ldr	x19, [sp, #16]
    a990:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a994:	d65f03c0 	ret
    a998:	79402261 	ldrh	w1, [x19, #16]
    a99c:	12137821 	and	w1, w1, #0xffffefff
    a9a0:	79002261 	strh	w1, [x19, #16]
    a9a4:	f9400bf3 	ldr	x19, [sp, #16]
    a9a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a9ac:	d65f03c0 	ret

000000000000a9b0 <__seofread>:
    a9b0:	52800000 	mov	w0, #0x0                   	// #0
    a9b4:	d65f03c0 	ret
    a9b8:	d503201f 	nop
    a9bc:	d503201f 	nop

000000000000a9c0 <__swrite>:
    a9c0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a9c4:	910003fd 	mov	x29, sp
    a9c8:	79c02024 	ldrsh	w4, [x1, #16]
    a9cc:	a90153f3 	stp	x19, x20, [sp, #16]
    a9d0:	aa0103f3 	mov	x19, x1
    a9d4:	aa0003f4 	mov	x20, x0
    a9d8:	a9025bf5 	stp	x21, x22, [sp, #32]
    a9dc:	aa0203f5 	mov	x21, x2
    a9e0:	2a0303f6 	mov	w22, w3
    a9e4:	37400184 	tbnz	w4, #8, aa14 <__swrite+0x54>
    a9e8:	79c02661 	ldrsh	w1, [x19, #18]
    a9ec:	12137884 	and	w4, w4, #0xffffefff
    a9f0:	79002264 	strh	w4, [x19, #16]
    a9f4:	93407ec3 	sxtw	x3, w22
    a9f8:	aa1503e2 	mov	x2, x21
    a9fc:	aa1403e0 	mov	x0, x20
    aa00:	940003f8 	bl	b9e0 <_write_r>
    aa04:	a94153f3 	ldp	x19, x20, [sp, #16]
    aa08:	a9425bf5 	ldp	x21, x22, [sp, #32]
    aa0c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    aa10:	d65f03c0 	ret
    aa14:	79c02421 	ldrsh	w1, [x1, #18]
    aa18:	52800043 	mov	w3, #0x2                   	// #2
    aa1c:	d2800002 	mov	x2, #0x0                   	// #0
    aa20:	940004f8 	bl	be00 <_lseek_r>
    aa24:	79c02264 	ldrsh	w4, [x19, #16]
    aa28:	17fffff0 	b	a9e8 <__swrite+0x28>
    aa2c:	d503201f 	nop

000000000000aa30 <__sseek>:
    aa30:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    aa34:	910003fd 	mov	x29, sp
    aa38:	f9000bf3 	str	x19, [sp, #16]
    aa3c:	aa0103f3 	mov	x19, x1
    aa40:	79c02421 	ldrsh	w1, [x1, #18]
    aa44:	940004ef 	bl	be00 <_lseek_r>
    aa48:	79402261 	ldrh	w1, [x19, #16]
    aa4c:	b100041f 	cmn	x0, #0x1
    aa50:	540000e0 	b.eq	aa6c <__sseek+0x3c>  // b.none
    aa54:	32140021 	orr	w1, w1, #0x1000
    aa58:	79002261 	strh	w1, [x19, #16]
    aa5c:	f9004a60 	str	x0, [x19, #144]
    aa60:	f9400bf3 	ldr	x19, [sp, #16]
    aa64:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aa68:	d65f03c0 	ret
    aa6c:	12137821 	and	w1, w1, #0xffffefff
    aa70:	79002261 	strh	w1, [x19, #16]
    aa74:	f9400bf3 	ldr	x19, [sp, #16]
    aa78:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aa7c:	d65f03c0 	ret

000000000000aa80 <__sclose>:
    aa80:	79c02421 	ldrsh	w1, [x1, #18]
    aa84:	140003ef 	b	ba40 <_close_r>
    aa88:	d503201f 	nop
    aa8c:	d503201f 	nop

000000000000aa90 <strcasecmp>:
    aa90:	d0000006 	adrp	x6, c000 <_reclaim_reent+0xc0>
    aa94:	aa0003e8 	mov	x8, x0
    aa98:	9138e4c6 	add	x6, x6, #0xe39
    aa9c:	d2800003 	mov	x3, #0x0                   	// #0
    aaa0:	38636902 	ldrb	w2, [x8, x3]
    aaa4:	38636820 	ldrb	w0, [x1, x3]
    aaa8:	91000463 	add	x3, x3, #0x1
    aaac:	92401c45 	and	x5, x2, #0xff
    aab0:	11008047 	add	w7, w2, #0x20
    aab4:	92401c04 	and	x4, x0, #0xff
    aab8:	386568c5 	ldrb	w5, [x6, x5]
    aabc:	386468c4 	ldrb	w4, [x6, x4]
    aac0:	120004a5 	and	w5, w5, #0x3
    aac4:	710004bf 	cmp	w5, #0x1
    aac8:	12000484 	and	w4, w4, #0x3
    aacc:	1a8200e2 	csel	w2, w7, w2, eq  // eq = none
    aad0:	7100049f 	cmp	w4, #0x1
    aad4:	540000a0 	b.eq	aae8 <strcasecmp+0x58>  // b.none
    aad8:	6b000042 	subs	w2, w2, w0
    aadc:	540000e1 	b.ne	aaf8 <strcasecmp+0x68>  // b.any
    aae0:	35fffe00 	cbnz	w0, aaa0 <strcasecmp+0x10>
    aae4:	d65f03c0 	ret
    aae8:	11008000 	add	w0, w0, #0x20
    aaec:	6b000040 	subs	w0, w2, w0
    aaf0:	54fffd80 	b.eq	aaa0 <strcasecmp+0x10>  // b.none
    aaf4:	d65f03c0 	ret
    aaf8:	2a0203e0 	mov	w0, w2
    aafc:	d65f03c0 	ret

000000000000ab00 <strcat>:
    ab00:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    ab04:	910003fd 	mov	x29, sp
    ab08:	f9000bf3 	str	x19, [sp, #16]
    ab0c:	aa0003f3 	mov	x19, x0
    ab10:	f240081f 	tst	x0, #0x7
    ab14:	540001c1 	b.ne	ab4c <strcat+0x4c>  // b.any
    ab18:	f9400002 	ldr	x2, [x0]
    ab1c:	b207dbe4 	mov	x4, #0xfefefefefefefefe    	// #-72340172838076674
    ab20:	f29fdfe4 	movk	x4, #0xfeff
    ab24:	8b040043 	add	x3, x2, x4
    ab28:	8a220062 	bic	x2, x3, x2
    ab2c:	f201c05f 	tst	x2, #0x8080808080808080
    ab30:	540000e1 	b.ne	ab4c <strcat+0x4c>  // b.any
    ab34:	d503201f 	nop
    ab38:	f8408c02 	ldr	x2, [x0, #8]!
    ab3c:	8b040043 	add	x3, x2, x4
    ab40:	8a220062 	bic	x2, x3, x2
    ab44:	f201c05f 	tst	x2, #0x8080808080808080
    ab48:	54ffff80 	b.eq	ab38 <strcat+0x38>  // b.none
    ab4c:	39400002 	ldrb	w2, [x0]
    ab50:	34000082 	cbz	w2, ab60 <strcat+0x60>
    ab54:	d503201f 	nop
    ab58:	38401c02 	ldrb	w2, [x0, #1]!
    ab5c:	35ffffe2 	cbnz	w2, ab58 <strcat+0x58>
    ab60:	94000088 	bl	ad80 <strcpy>
    ab64:	aa1303e0 	mov	x0, x19
    ab68:	f9400bf3 	ldr	x19, [sp, #16]
    ab6c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ab70:	d65f03c0 	ret

000000000000ab74 <strchr>:
    ab74:	52808024 	mov	w4, #0x401                 	// #1025
    ab78:	72a80204 	movk	w4, #0x4010, lsl #16
    ab7c:	4e010c20 	dup	v0.16b, w1
    ab80:	927be802 	and	x2, x0, #0xffffffffffffffe0
    ab84:	4e040c90 	dup	v16.4s, w4
    ab88:	f2401003 	ands	x3, x0, #0x1f
    ab8c:	4eb08607 	add	v7.4s, v16.4s, v16.4s
    ab90:	540002a0 	b.eq	abe4 <strchr+0x70>  // b.none
    ab94:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    ab98:	cb0303e3 	neg	x3, x3
    ab9c:	4e209823 	cmeq	v3.16b, v1.16b, #0
    aba0:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    aba4:	4e209844 	cmeq	v4.16b, v2.16b, #0
    aba8:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    abac:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    abb0:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    abb4:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    abb8:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    abbc:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    abc0:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    abc4:	d37ff863 	lsl	x3, x3, #1
    abc8:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    abcc:	92800005 	mov	x5, #0xffffffffffffffff    	// #-1
    abd0:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    abd4:	9ac324a3 	lsr	x3, x5, x3
    abd8:	4e083e25 	mov	x5, v17.d[0]
    abdc:	8a2300a3 	bic	x3, x5, x3
    abe0:	b50002a3 	cbnz	x3, ac34 <strchr+0xc0>
    abe4:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    abe8:	4e209823 	cmeq	v3.16b, v1.16b, #0
    abec:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    abf0:	4e209844 	cmeq	v4.16b, v2.16b, #0
    abf4:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    abf8:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    abfc:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    ac00:	4eb21e31 	orr	v17.16b, v17.16b, v18.16b
    ac04:	4ef1be31 	addp	v17.2d, v17.2d, v17.2d
    ac08:	4e083e23 	mov	x3, v17.d[0]
    ac0c:	b4fffec3 	cbz	x3, abe4 <strchr+0x70>
    ac10:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    ac14:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    ac18:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    ac1c:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    ac20:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    ac24:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    ac28:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    ac2c:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    ac30:	4e083e23 	mov	x3, v17.d[0]
    ac34:	dac00063 	rbit	x3, x3
    ac38:	d1008042 	sub	x2, x2, #0x20
    ac3c:	dac01063 	clz	x3, x3
    ac40:	f240007f 	tst	x3, #0x1
    ac44:	8b430440 	add	x0, x2, x3, lsr #1
    ac48:	9a9f0000 	csel	x0, x0, xzr, eq  // eq = none
    ac4c:	d65f03c0 	ret
    ac50:	d503201f 	nop
    ac54:	d503201f 	nop
    ac58:	d503201f 	nop
    ac5c:	d503201f 	nop
    ac60:	d503201f 	nop
    ac64:	d503201f 	nop
    ac68:	d503201f 	nop
    ac6c:	d503201f 	nop
    ac70:	d503201f 	nop
    ac74:	d503201f 	nop
    ac78:	d503201f 	nop
    ac7c:	d503201f 	nop

000000000000ac80 <strcmp>:
    ac80:	ca010007 	eor	x7, x0, x1
    ac84:	b200c3ea 	mov	x10, #0x101010101010101     	// #72340172838076673
    ac88:	f24008ff 	tst	x7, #0x7
    ac8c:	540003e1 	b.ne	ad08 <strcmp+0x88>  // b.any
    ac90:	f2400807 	ands	x7, x0, #0x7
    ac94:	54000241 	b.ne	acdc <strcmp+0x5c>  // b.any
    ac98:	f8408402 	ldr	x2, [x0], #8
    ac9c:	f8408423 	ldr	x3, [x1], #8
    aca0:	cb0a0047 	sub	x7, x2, x10
    aca4:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    aca8:	ca030045 	eor	x5, x2, x3
    acac:	8a2800e4 	bic	x4, x7, x8
    acb0:	aa0400a6 	orr	x6, x5, x4
    acb4:	b4ffff26 	cbz	x6, ac98 <strcmp+0x18>
    acb8:	dac00cc6 	rev	x6, x6
    acbc:	dac00c42 	rev	x2, x2
    acc0:	dac010cb 	clz	x11, x6
    acc4:	dac00c63 	rev	x3, x3
    acc8:	9acb2042 	lsl	x2, x2, x11
    accc:	9acb2063 	lsl	x3, x3, x11
    acd0:	d378fc42 	lsr	x2, x2, #56
    acd4:	cb43e040 	sub	x0, x2, x3, lsr #56
    acd8:	d65f03c0 	ret
    acdc:	927df000 	and	x0, x0, #0xfffffffffffffff8
    ace0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    ace4:	d37df0e7 	lsl	x7, x7, #3
    ace8:	f8408402 	ldr	x2, [x0], #8
    acec:	cb0703e7 	neg	x7, x7
    acf0:	f8408423 	ldr	x3, [x1], #8
    acf4:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
    acf8:	9ac72508 	lsr	x8, x8, x7
    acfc:	aa080042 	orr	x2, x2, x8
    ad00:	aa080063 	orr	x3, x3, x8
    ad04:	17ffffe7 	b	aca0 <strcmp+0x20>
    ad08:	f240081f 	tst	x0, #0x7
    ad0c:	54000100 	b.eq	ad2c <strcmp+0xac>  // b.none
    ad10:	38401402 	ldrb	w2, [x0], #1
    ad14:	38401423 	ldrb	w3, [x1], #1
    ad18:	7100045f 	cmp	w2, #0x1
    ad1c:	7a432040 	ccmp	w2, w3, #0x0, cs  // cs = hs, nlast
    ad20:	540001e1 	b.ne	ad5c <strcmp+0xdc>  // b.any
    ad24:	f240081f 	tst	x0, #0x7
    ad28:	54ffff41 	b.ne	ad10 <strcmp+0x90>  // b.any
    ad2c:	927d2027 	and	x7, x1, #0xff8
    ad30:	d27d20e7 	eor	x7, x7, #0xff8
    ad34:	b4fffee7 	cbz	x7, ad10 <strcmp+0x90>
    ad38:	f8408402 	ldr	x2, [x0], #8
    ad3c:	f8408423 	ldr	x3, [x1], #8
    ad40:	cb0a0047 	sub	x7, x2, x10
    ad44:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    ad48:	ca030045 	eor	x5, x2, x3
    ad4c:	8a2800e4 	bic	x4, x7, x8
    ad50:	aa0400a6 	orr	x6, x5, x4
    ad54:	b4fffec6 	cbz	x6, ad2c <strcmp+0xac>
    ad58:	17ffffd8 	b	acb8 <strcmp+0x38>
    ad5c:	cb030040 	sub	x0, x2, x3
    ad60:	d65f03c0 	ret
    ad64:	d503201f 	nop
    ad68:	d503201f 	nop
    ad6c:	d503201f 	nop
    ad70:	d503201f 	nop
    ad74:	d503201f 	nop
    ad78:	d503201f 	nop
    ad7c:	d503201f 	nop

000000000000ad80 <strcpy>:
    ad80:	92402c29 	and	x9, x1, #0xfff
    ad84:	b200c3ec 	mov	x12, #0x101010101010101     	// #72340172838076673
    ad88:	92400c31 	and	x17, x1, #0xf
    ad8c:	f13fc13f 	cmp	x9, #0xff0
    ad90:	cb1103e8 	neg	x8, x17
    ad94:	540008cc 	b.gt	aeac <strcpy+0x12c>
    ad98:	a9401424 	ldp	x4, x5, [x1]
    ad9c:	cb0c0088 	sub	x8, x4, x12
    ada0:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    ada4:	ea290106 	bics	x6, x8, x9
    ada8:	540001c1 	b.ne	ade0 <strcpy+0x60>  // b.any
    adac:	cb0c00aa 	sub	x10, x5, x12
    adb0:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    adb4:	ea2b0147 	bics	x7, x10, x11
    adb8:	54000440 	b.eq	ae40 <strcpy+0xc0>  // b.none
    adbc:	dac00ce7 	rev	x7, x7
    adc0:	dac010ef 	clz	x15, x7
    adc4:	d2800709 	mov	x9, #0x38                  	// #56
    adc8:	8b4f0c03 	add	x3, x0, x15, lsr #3
    adcc:	cb0f012f 	sub	x15, x9, x15
    add0:	9acf20a5 	lsl	x5, x5, x15
    add4:	f8001065 	stur	x5, [x3, #1]
    add8:	f9000004 	str	x4, [x0]
    addc:	d65f03c0 	ret
    ade0:	dac00cc6 	rev	x6, x6
    ade4:	dac010cf 	clz	x15, x6
    ade8:	8b4f0c03 	add	x3, x0, x15, lsr #3
    adec:	f10061e9 	subs	x9, x15, #0x18
    adf0:	540000ab 	b.lt	ae04 <strcpy+0x84>  // b.tstop
    adf4:	9ac92485 	lsr	x5, x4, x9
    adf8:	b81fd065 	stur	w5, [x3, #-3]
    adfc:	b9000004 	str	w4, [x0]
    ae00:	d65f03c0 	ret
    ae04:	b400004f 	cbz	x15, ae0c <strcpy+0x8c>
    ae08:	79000004 	strh	w4, [x0]
    ae0c:	3900007f 	strb	wzr, [x3]
    ae10:	d65f03c0 	ret
    ae14:	d503201f 	nop
    ae18:	d503201f 	nop
    ae1c:	d503201f 	nop
    ae20:	d503201f 	nop
    ae24:	d503201f 	nop
    ae28:	d503201f 	nop
    ae2c:	d503201f 	nop
    ae30:	d503201f 	nop
    ae34:	d503201f 	nop
    ae38:	d503201f 	nop
    ae3c:	d503201f 	nop
    ae40:	d1004231 	sub	x17, x17, #0x10
    ae44:	a9001404 	stp	x4, x5, [x0]
    ae48:	cb110022 	sub	x2, x1, x17
    ae4c:	cb110003 	sub	x3, x0, x17
    ae50:	14000002 	b	ae58 <strcpy+0xd8>
    ae54:	a8811464 	stp	x4, x5, [x3], #16
    ae58:	a8c11444 	ldp	x4, x5, [x2], #16
    ae5c:	cb0c0088 	sub	x8, x4, x12
    ae60:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    ae64:	cb0c00aa 	sub	x10, x5, x12
    ae68:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    ae6c:	8a290106 	bic	x6, x8, x9
    ae70:	ea2b0147 	bics	x7, x10, x11
    ae74:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    ae78:	54fffee0 	b.eq	ae54 <strcpy+0xd4>  // b.none
    ae7c:	f10000df 	cmp	x6, #0x0
    ae80:	9a8710c6 	csel	x6, x6, x7, ne  // ne = any
    ae84:	dac00cc6 	rev	x6, x6
    ae88:	dac010cf 	clz	x15, x6
    ae8c:	910121e8 	add	x8, x15, #0x48
    ae90:	910021ef 	add	x15, x15, #0x8
    ae94:	9a8811ef 	csel	x15, x15, x8, ne  // ne = any
    ae98:	8b4f0c42 	add	x2, x2, x15, lsr #3
    ae9c:	8b4f0c63 	add	x3, x3, x15, lsr #3
    aea0:	a97e1444 	ldp	x4, x5, [x2, #-32]
    aea4:	a93f1464 	stp	x4, x5, [x3, #-16]
    aea8:	d65f03c0 	ret
    aeac:	927cec22 	and	x2, x1, #0xfffffffffffffff0
    aeb0:	a9401444 	ldp	x4, x5, [x2]
    aeb4:	d37df108 	lsl	x8, x8, #3
    aeb8:	f2400a3f 	tst	x17, #0x7
    aebc:	da9f03e9 	csetm	x9, ne  // ne = any
    aec0:	9ac82529 	lsr	x9, x9, x8
    aec4:	aa090084 	orr	x4, x4, x9
    aec8:	aa0900ae 	orr	x14, x5, x9
    aecc:	f100223f 	cmp	x17, #0x8
    aed0:	da9fb084 	csinv	x4, x4, xzr, lt  // lt = tstop
    aed4:	9a8eb0a5 	csel	x5, x5, x14, lt  // lt = tstop
    aed8:	cb0c0088 	sub	x8, x4, x12
    aedc:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    aee0:	cb0c00aa 	sub	x10, x5, x12
    aee4:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    aee8:	8a290106 	bic	x6, x8, x9
    aeec:	ea2b0147 	bics	x7, x10, x11
    aef0:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    aef4:	54fff520 	b.eq	ad98 <strcpy+0x18>  // b.none
    aef8:	d37df228 	lsl	x8, x17, #3
    aefc:	cb110fe9 	neg	x9, x17, lsl #3
    af00:	9ac8248d 	lsr	x13, x4, x8
    af04:	9ac920ab 	lsl	x11, x5, x9
    af08:	9ac824a5 	lsr	x5, x5, x8
    af0c:	aa0d016b 	orr	x11, x11, x13
    af10:	f100223f 	cmp	x17, #0x8
    af14:	9a85b164 	csel	x4, x11, x5, lt  // lt = tstop
    af18:	cb0c0088 	sub	x8, x4, x12
    af1c:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    af20:	cb0c00aa 	sub	x10, x5, x12
    af24:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    af28:	8a290106 	bic	x6, x8, x9
    af2c:	b5fff5a6 	cbnz	x6, ade0 <strcpy+0x60>
    af30:	8a2b0147 	bic	x7, x10, x11
    af34:	17ffffa2 	b	adbc <strcpy+0x3c>
    af38:	d503201f 	nop
    af3c:	d503201f 	nop

000000000000af40 <strlcpy>:
    af40:	aa0003e4 	mov	x4, x0
    af44:	aa0103e3 	mov	x3, x1
    af48:	b4000202 	cbz	x2, af88 <strlcpy+0x48>
    af4c:	f100045f 	cmp	x2, #0x1
    af50:	54000180 	b.eq	af80 <strlcpy+0x40>  // b.none
    af54:	8b020002 	add	x2, x0, x2
    af58:	14000003 	b	af64 <strlcpy+0x24>
    af5c:	ab02001f 	cmn	x0, x2
    af60:	54000100 	b.eq	af80 <strlcpy+0x40>  // b.none
    af64:	38401465 	ldrb	w5, [x3], #1
    af68:	38001485 	strb	w5, [x4], #1
    af6c:	aa2403e0 	mvn	x0, x4
    af70:	35ffff65 	cbnz	w5, af5c <strlcpy+0x1c>
    af74:	cb010060 	sub	x0, x3, x1
    af78:	d1000400 	sub	x0, x0, #0x1
    af7c:	d65f03c0 	ret
    af80:	3900009f 	strb	wzr, [x4]
    af84:	d503201f 	nop
    af88:	38401462 	ldrb	w2, [x3], #1
    af8c:	34ffff42 	cbz	w2, af74 <strlcpy+0x34>
    af90:	38401462 	ldrb	w2, [x3], #1
    af94:	35ffffa2 	cbnz	w2, af88 <strlcpy+0x48>
    af98:	17fffff7 	b	af74 <strlcpy+0x34>
    af9c:	d503201f 	nop

000000000000afa0 <strncasecmp>:
    afa0:	aa0003e9 	mov	x9, x0
    afa4:	b4000382 	cbz	x2, b014 <strncasecmp+0x74>
    afa8:	d0000007 	adrp	x7, c000 <_reclaim_reent+0xc0>
    afac:	d2800004 	mov	x4, #0x0                   	// #0
    afb0:	9138e4e7 	add	x7, x7, #0xe39
    afb4:	14000006 	b	afcc <strncasecmp+0x2c>
    afb8:	6b000063 	subs	w3, w3, w0
    afbc:	54000301 	b.ne	b01c <strncasecmp+0x7c>  // b.any
    afc0:	34000280 	cbz	w0, b010 <strncasecmp+0x70>
    afc4:	eb04005f 	cmp	x2, x4
    afc8:	54000260 	b.eq	b014 <strncasecmp+0x74>  // b.none
    afcc:	38646923 	ldrb	w3, [x9, x4]
    afd0:	38646820 	ldrb	w0, [x1, x4]
    afd4:	91000484 	add	x4, x4, #0x1
    afd8:	92401c66 	and	x6, x3, #0xff
    afdc:	11008068 	add	w8, w3, #0x20
    afe0:	92401c05 	and	x5, x0, #0xff
    afe4:	386668e6 	ldrb	w6, [x7, x6]
    afe8:	386568e5 	ldrb	w5, [x7, x5]
    afec:	120004c6 	and	w6, w6, #0x3
    aff0:	710004df 	cmp	w6, #0x1
    aff4:	120004a5 	and	w5, w5, #0x3
    aff8:	1a830103 	csel	w3, w8, w3, eq  // eq = none
    affc:	710004bf 	cmp	w5, #0x1
    b000:	54fffdc1 	b.ne	afb8 <strncasecmp+0x18>  // b.any
    b004:	11008000 	add	w0, w0, #0x20
    b008:	6b000060 	subs	w0, w3, w0
    b00c:	54fffdc0 	b.eq	afc4 <strncasecmp+0x24>  // b.none
    b010:	d65f03c0 	ret
    b014:	52800000 	mov	w0, #0x0                   	// #0
    b018:	d65f03c0 	ret
    b01c:	2a0303e0 	mov	w0, w3
    b020:	d65f03c0 	ret
    b024:	d503201f 	nop
    b028:	d503201f 	nop
    b02c:	d503201f 	nop

000000000000b030 <strncpy>:
    b030:	aa000023 	orr	x3, x1, x0
    b034:	f240087f 	tst	x3, #0x7
    b038:	aa0003e3 	mov	x3, x0
    b03c:	fa470840 	ccmp	x2, #0x7, #0x0, eq  // eq = none
    b040:	540002c8 	b.hi	b098 <strncpy+0x68>  // b.pmore
    b044:	d1000445 	sub	x5, x2, #0x1
    b048:	d2800027 	mov	x7, #0x1                   	// #1
    b04c:	8b050025 	add	x5, x1, x5
    b050:	14000007 	b	b06c <strncpy+0x3c>
    b054:	386468a4 	ldrb	w4, [x5, x4]
    b058:	d1000446 	sub	x6, x2, #0x1
    b05c:	38001424 	strb	w4, [x1], #1
    b060:	340000e4 	cbz	w4, b07c <strncpy+0x4c>
    b064:	aa0103e3 	mov	x3, x1
    b068:	aa0603e2 	mov	x2, x6
    b06c:	cb0200e4 	sub	x4, x7, x2
    b070:	aa0303e1 	mov	x1, x3
    b074:	b5ffff02 	cbnz	x2, b054 <strncpy+0x24>
    b078:	d65f03c0 	ret
    b07c:	8b020062 	add	x2, x3, x2
    b080:	b4ffffc6 	cbz	x6, b078 <strncpy+0x48>
    b084:	d503201f 	nop
    b088:	3800143f 	strb	wzr, [x1], #1
    b08c:	eb02003f 	cmp	x1, x2
    b090:	54ffffc1 	b.ne	b088 <strncpy+0x58>  // b.any
    b094:	d65f03c0 	ret
    b098:	b207dbe6 	mov	x6, #0xfefefefefefefefe    	// #-72340172838076674
    b09c:	f29fdfe6 	movk	x6, #0xfeff
    b0a0:	f9400025 	ldr	x5, [x1]
    b0a4:	8b0600a4 	add	x4, x5, x6
    b0a8:	8a250084 	bic	x4, x4, x5
    b0ac:	f201c09f 	tst	x4, #0x8080808080808080
    b0b0:	54fffca1 	b.ne	b044 <strncpy+0x14>  // b.any
    b0b4:	d1002042 	sub	x2, x2, #0x8
    b0b8:	f8008465 	str	x5, [x3], #8
    b0bc:	91002021 	add	x1, x1, #0x8
    b0c0:	f1001c5f 	cmp	x2, #0x7
    b0c4:	54fffee8 	b.hi	b0a0 <strncpy+0x70>  // b.pmore
    b0c8:	17ffffdf 	b	b044 <strncpy+0x14>
    b0cc:	d503201f 	nop

000000000000b0d0 <_strtol_l.part.0>:
    b0d0:	b0000007 	adrp	x7, c000 <_reclaim_reent+0xc0>
    b0d4:	aa0003ec 	mov	x12, x0
    b0d8:	aa0103e6 	mov	x6, x1
    b0dc:	9138e4e7 	add	x7, x7, #0xe39
    b0e0:	aa0603e8 	mov	x8, x6
    b0e4:	384014c4 	ldrb	w4, [x6], #1
    b0e8:	92401c85 	and	x5, x4, #0xff
    b0ec:	386568e5 	ldrb	w5, [x7, x5]
    b0f0:	371fff85 	tbnz	w5, #3, b0e0 <_strtol_l.part.0+0x10>
    b0f4:	2a0403e5 	mov	w5, w4
    b0f8:	7100b49f 	cmp	w4, #0x2d
    b0fc:	54000880 	b.eq	b20c <_strtol_l.part.0+0x13c>  // b.none
    b100:	92f0000b 	mov	x11, #0x7fffffffffffffff    	// #9223372036854775807
    b104:	5280000d 	mov	w13, #0x0                   	// #0
    b108:	7100ac9f 	cmp	w4, #0x2b
    b10c:	540006a0 	b.eq	b1e0 <_strtol_l.part.0+0x110>  // b.none
    b110:	721b787f 	tst	w3, #0xffffffef
    b114:	54000121 	b.ne	b138 <_strtol_l.part.0+0x68>  // b.any
    b118:	7100c0bf 	cmp	w5, #0x30
    b11c:	54000820 	b.eq	b220 <_strtol_l.part.0+0x150>  // b.none
    b120:	350000c3 	cbnz	w3, b138 <_strtol_l.part.0+0x68>
    b124:	d280014a 	mov	x10, #0xa                   	// #10
    b128:	2a0a03e3 	mov	w3, w10
    b12c:	14000004 	b	b13c <_strtol_l.part.0+0x6c>
    b130:	34000903 	cbz	w3, b250 <_strtol_l.part.0+0x180>
    b134:	d503201f 	nop
    b138:	93407c6a 	sxtw	x10, w3
    b13c:	9aca0968 	udiv	x8, x11, x10
    b140:	52800007 	mov	w7, #0x0                   	// #0
    b144:	d2800000 	mov	x0, #0x0                   	// #0
    b148:	1b0aad09 	msub	w9, w8, w10, w11
    b14c:	d503201f 	nop
    b150:	5100c0a4 	sub	w4, w5, #0x30
    b154:	7100249f 	cmp	w4, #0x9
    b158:	540000a9 	b.ls	b16c <_strtol_l.part.0+0x9c>  // b.plast
    b15c:	510104a4 	sub	w4, w5, #0x41
    b160:	7100649f 	cmp	w4, #0x19
    b164:	54000208 	b.hi	b1a4 <_strtol_l.part.0+0xd4>  // b.pmore
    b168:	5100dca4 	sub	w4, w5, #0x37
    b16c:	6b04007f 	cmp	w3, w4
    b170:	5400028d 	b.le	b1c0 <_strtol_l.part.0+0xf0>
    b174:	710000ff 	cmp	w7, #0x0
    b178:	12800007 	mov	w7, #0xffffffff            	// #-1
    b17c:	fa40a100 	ccmp	x8, x0, #0x0, ge  // ge = tcont
    b180:	540000e3 	b.cc	b19c <_strtol_l.part.0+0xcc>  // b.lo, b.ul, b.last
    b184:	eb00011f 	cmp	x8, x0
    b188:	7a440120 	ccmp	w9, w4, #0x0, eq  // eq = none
    b18c:	5400008b 	b.lt	b19c <_strtol_l.part.0+0xcc>  // b.tstop
    b190:	93407c84 	sxtw	x4, w4
    b194:	52800027 	mov	w7, #0x1                   	// #1
    b198:	9b0a1000 	madd	x0, x0, x10, x4
    b19c:	384014c5 	ldrb	w5, [x6], #1
    b1a0:	17ffffec 	b	b150 <_strtol_l.part.0+0x80>
    b1a4:	510184a4 	sub	w4, w5, #0x61
    b1a8:	7100649f 	cmp	w4, #0x19
    b1ac:	540000a8 	b.hi	b1c0 <_strtol_l.part.0+0xf0>  // b.pmore
    b1b0:	51015ca4 	sub	w4, w5, #0x57
    b1b4:	6b04007f 	cmp	w3, w4
    b1b8:	54fffdec 	b.gt	b174 <_strtol_l.part.0+0xa4>
    b1bc:	d503201f 	nop
    b1c0:	310004ff 	cmn	w7, #0x1
    b1c4:	54000140 	b.eq	b1ec <_strtol_l.part.0+0x11c>  // b.none
    b1c8:	710001bf 	cmp	w13, #0x0
    b1cc:	da800400 	cneg	x0, x0, ne  // ne = any
    b1d0:	b4000062 	cbz	x2, b1dc <_strtol_l.part.0+0x10c>
    b1d4:	350003a7 	cbnz	w7, b248 <_strtol_l.part.0+0x178>
    b1d8:	f9000041 	str	x1, [x2]
    b1dc:	d65f03c0 	ret
    b1e0:	394000c5 	ldrb	w5, [x6]
    b1e4:	91000906 	add	x6, x8, #0x2
    b1e8:	17ffffca 	b	b110 <_strtol_l.part.0+0x40>
    b1ec:	52800440 	mov	w0, #0x22                  	// #34
    b1f0:	b9000180 	str	w0, [x12]
    b1f4:	aa0b03e0 	mov	x0, x11
    b1f8:	b4ffff22 	cbz	x2, b1dc <_strtol_l.part.0+0x10c>
    b1fc:	d10004c1 	sub	x1, x6, #0x1
    b200:	aa0b03e0 	mov	x0, x11
    b204:	f9000041 	str	x1, [x2]
    b208:	17fffff5 	b	b1dc <_strtol_l.part.0+0x10c>
    b20c:	394000c5 	ldrb	w5, [x6]
    b210:	d2f0000b 	mov	x11, #0x8000000000000000    	// #-9223372036854775808
    b214:	91000906 	add	x6, x8, #0x2
    b218:	5280002d 	mov	w13, #0x1                   	// #1
    b21c:	17ffffbd 	b	b110 <_strtol_l.part.0+0x40>
    b220:	394000c0 	ldrb	w0, [x6]
    b224:	121a7800 	and	w0, w0, #0xffffffdf
    b228:	12001c00 	and	w0, w0, #0xff
    b22c:	7101601f 	cmp	w0, #0x58
    b230:	54fff801 	b.ne	b130 <_strtol_l.part.0+0x60>  // b.any
    b234:	394004c5 	ldrb	w5, [x6, #1]
    b238:	d280020a 	mov	x10, #0x10                  	// #16
    b23c:	910008c6 	add	x6, x6, #0x2
    b240:	2a0a03e3 	mov	w3, w10
    b244:	17ffffbe 	b	b13c <_strtol_l.part.0+0x6c>
    b248:	aa0003eb 	mov	x11, x0
    b24c:	17ffffec 	b	b1fc <_strtol_l.part.0+0x12c>
    b250:	d280010a 	mov	x10, #0x8                   	// #8
    b254:	2a0a03e3 	mov	w3, w10
    b258:	17ffffb9 	b	b13c <_strtol_l.part.0+0x6c>
    b25c:	d503201f 	nop

000000000000b260 <_strtol_r>:
    b260:	7100907f 	cmp	w3, #0x24
    b264:	7a419864 	ccmp	w3, #0x1, #0x4, ls  // ls = plast
    b268:	54000040 	b.eq	b270 <_strtol_r+0x10>  // b.none
    b26c:	17ffff99 	b	b0d0 <_strtol_l.part.0>
    b270:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    b274:	910003fd 	mov	x29, sp
    b278:	9400020a 	bl	baa0 <__errno>
    b27c:	528002c1 	mov	w1, #0x16                  	// #22
    b280:	b9000001 	str	w1, [x0]
    b284:	d2800000 	mov	x0, #0x0                   	// #0
    b288:	a8c17bfd 	ldp	x29, x30, [sp], #16
    b28c:	d65f03c0 	ret

000000000000b290 <strtol_l>:
    b290:	7100905f 	cmp	w2, #0x24
    b294:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    b298:	540000e0 	b.eq	b2b4 <strtol_l+0x24>  // b.none
    b29c:	b0000004 	adrp	x4, c000 <_reclaim_reent+0xc0>
    b2a0:	2a0203e3 	mov	w3, w2
    b2a4:	aa0103e2 	mov	x2, x1
    b2a8:	aa0003e1 	mov	x1, x0
    b2ac:	f947c080 	ldr	x0, [x4, #3968]
    b2b0:	17ffff88 	b	b0d0 <_strtol_l.part.0>
    b2b4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    b2b8:	910003fd 	mov	x29, sp
    b2bc:	940001f9 	bl	baa0 <__errno>
    b2c0:	528002c1 	mov	w1, #0x16                  	// #22
    b2c4:	b9000001 	str	w1, [x0]
    b2c8:	d2800000 	mov	x0, #0x0                   	// #0
    b2cc:	a8c17bfd 	ldp	x29, x30, [sp], #16
    b2d0:	d65f03c0 	ret
    b2d4:	d503201f 	nop
    b2d8:	d503201f 	nop
    b2dc:	d503201f 	nop

000000000000b2e0 <strtol>:
    b2e0:	7100905f 	cmp	w2, #0x24
    b2e4:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    b2e8:	540000e0 	b.eq	b304 <strtol+0x24>  // b.none
    b2ec:	b0000004 	adrp	x4, c000 <_reclaim_reent+0xc0>
    b2f0:	2a0203e3 	mov	w3, w2
    b2f4:	aa0103e2 	mov	x2, x1
    b2f8:	aa0003e1 	mov	x1, x0
    b2fc:	f947c080 	ldr	x0, [x4, #3968]
    b300:	17ffff74 	b	b0d0 <_strtol_l.part.0>
    b304:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    b308:	910003fd 	mov	x29, sp
    b30c:	940001e5 	bl	baa0 <__errno>
    b310:	528002c1 	mov	w1, #0x16                  	// #22
    b314:	b9000001 	str	w1, [x0]
    b318:	d2800000 	mov	x0, #0x0                   	// #0
    b31c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    b320:	d65f03c0 	ret
    b324:	d503201f 	nop
    b328:	d503201f 	nop
    b32c:	d503201f 	nop

000000000000b330 <__swbuf_r>:
    b330:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    b334:	910003fd 	mov	x29, sp
    b338:	a90153f3 	stp	x19, x20, [sp, #16]
    b33c:	2a0103f4 	mov	w20, w1
    b340:	aa0203f3 	mov	x19, x2
    b344:	a9025bf5 	stp	x21, x22, [sp, #32]
    b348:	aa0003f5 	mov	x21, x0
    b34c:	b4000060 	cbz	x0, b358 <__swbuf_r+0x28>
    b350:	b9405001 	ldr	w1, [x0, #80]
    b354:	340007e1 	cbz	w1, b450 <__swbuf_r+0x120>
    b358:	79c02260 	ldrsh	w0, [x19, #16]
    b35c:	b9402a61 	ldr	w1, [x19, #40]
    b360:	b9000e61 	str	w1, [x19, #12]
    b364:	12003c02 	and	w2, w0, #0xffff
    b368:	361803e0 	tbz	w0, #3, b3e4 <__swbuf_r+0xb4>
    b36c:	f9400e61 	ldr	x1, [x19, #24]
    b370:	b40003a1 	cbz	x1, b3e4 <__swbuf_r+0xb4>
    b374:	12001e96 	and	w22, w20, #0xff
    b378:	12001e94 	and	w20, w20, #0xff
    b37c:	36680482 	tbz	w2, #13, b40c <__swbuf_r+0xdc>
    b380:	f9400260 	ldr	x0, [x19]
    b384:	b9402262 	ldr	w2, [x19, #32]
    b388:	cb010001 	sub	x1, x0, x1
    b38c:	6b01005f 	cmp	w2, w1
    b390:	5400052d 	b.le	b434 <__swbuf_r+0x104>
    b394:	11000421 	add	w1, w1, #0x1
    b398:	b9400e62 	ldr	w2, [x19, #12]
    b39c:	91000403 	add	x3, x0, #0x1
    b3a0:	f9000263 	str	x3, [x19]
    b3a4:	51000442 	sub	w2, w2, #0x1
    b3a8:	b9000e62 	str	w2, [x19, #12]
    b3ac:	39000016 	strb	w22, [x0]
    b3b0:	b9402260 	ldr	w0, [x19, #32]
    b3b4:	6b01001f 	cmp	w0, w1
    b3b8:	54000500 	b.eq	b458 <__swbuf_r+0x128>  // b.none
    b3bc:	71002a9f 	cmp	w20, #0xa
    b3c0:	79402260 	ldrh	w0, [x19, #16]
    b3c4:	1a9f17e1 	cset	w1, eq  // eq = none
    b3c8:	6a00003f 	tst	w1, w0
    b3cc:	54000461 	b.ne	b458 <__swbuf_r+0x128>  // b.any
    b3d0:	2a1403e0 	mov	w0, w20
    b3d4:	a94153f3 	ldp	x19, x20, [sp, #16]
    b3d8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b3dc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    b3e0:	d65f03c0 	ret
    b3e4:	aa1303e1 	mov	x1, x19
    b3e8:	aa1503e0 	mov	x0, x21
    b3ec:	97ffed8d 	bl	6a20 <__swsetup_r>
    b3f0:	350003c0 	cbnz	w0, b468 <__swbuf_r+0x138>
    b3f4:	79c02260 	ldrsh	w0, [x19, #16]
    b3f8:	12001e96 	and	w22, w20, #0xff
    b3fc:	12001e94 	and	w20, w20, #0xff
    b400:	12003c02 	and	w2, w0, #0xffff
    b404:	f9400e61 	ldr	x1, [x19, #24]
    b408:	376ffbc2 	tbnz	w2, #13, b380 <__swbuf_r+0x50>
    b40c:	b940ae62 	ldr	w2, [x19, #172]
    b410:	32130000 	orr	w0, w0, #0x2000
    b414:	79002260 	strh	w0, [x19, #16]
    b418:	12127840 	and	w0, w2, #0xffffdfff
    b41c:	b900ae60 	str	w0, [x19, #172]
    b420:	f9400260 	ldr	x0, [x19]
    b424:	b9402262 	ldr	w2, [x19, #32]
    b428:	cb010001 	sub	x1, x0, x1
    b42c:	6b01005f 	cmp	w2, w1
    b430:	54fffb2c 	b.gt	b394 <__swbuf_r+0x64>
    b434:	aa1303e1 	mov	x1, x19
    b438:	aa1503e0 	mov	x0, x21
    b43c:	97ffee89 	bl	6e60 <_fflush_r>
    b440:	35000140 	cbnz	w0, b468 <__swbuf_r+0x138>
    b444:	52800021 	mov	w1, #0x1                   	// #1
    b448:	f9400260 	ldr	x0, [x19]
    b44c:	17ffffd3 	b	b398 <__swbuf_r+0x68>
    b450:	97ffef84 	bl	7260 <__sinit>
    b454:	17ffffc1 	b	b358 <__swbuf_r+0x28>
    b458:	aa1303e1 	mov	x1, x19
    b45c:	aa1503e0 	mov	x0, x21
    b460:	97ffee80 	bl	6e60 <_fflush_r>
    b464:	34fffb60 	cbz	w0, b3d0 <__swbuf_r+0xa0>
    b468:	12800014 	mov	w20, #0xffffffff            	// #-1
    b46c:	17ffffd9 	b	b3d0 <__swbuf_r+0xa0>

000000000000b470 <__swbuf>:
    b470:	b0000003 	adrp	x3, c000 <_reclaim_reent+0xc0>
    b474:	aa0103e2 	mov	x2, x1
    b478:	2a0003e1 	mov	w1, w0
    b47c:	f947c060 	ldr	x0, [x3, #3968]
    b480:	17ffffac 	b	b330 <__swbuf_r>
    b484:	d503201f 	nop
    b488:	d503201f 	nop
    b48c:	d503201f 	nop

000000000000b490 <_wcsnrtombs_l>:
    b490:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
    b494:	f10000bf 	cmp	x5, #0x0
    b498:	910003fd 	mov	x29, sp
    b49c:	a90153f3 	stp	x19, x20, [sp, #16]
    b4a0:	aa0003f3 	mov	x19, x0
    b4a4:	91057000 	add	x0, x0, #0x15c
    b4a8:	a9025bf5 	stp	x21, x22, [sp, #32]
    b4ac:	aa0103f4 	mov	x20, x1
    b4b0:	aa0203f5 	mov	x21, x2
    b4b4:	a90363f7 	stp	x23, x24, [sp, #48]
    b4b8:	aa0603f6 	mov	x22, x6
    b4bc:	9a850017 	csel	x23, x0, x5, eq  // eq = none
    b4c0:	a9046bf9 	stp	x25, x26, [sp, #64]
    b4c4:	a90573fb 	stp	x27, x28, [sp, #80]
    b4c8:	f940005c 	ldr	x28, [x2]
    b4cc:	b4000901 	cbz	x1, b5ec <_wcsnrtombs_l+0x15c>
    b4d0:	aa0403fa 	mov	x26, x4
    b4d4:	b4000a84 	cbz	x4, b624 <_wcsnrtombs_l+0x194>
    b4d8:	d1000478 	sub	x24, x3, #0x1
    b4dc:	b4000a43 	cbz	x3, b624 <_wcsnrtombs_l+0x194>
    b4e0:	d280001b 	mov	x27, #0x0                   	// #0
    b4e4:	f90037f4 	str	x20, [sp, #104]
    b4e8:	1400000a 	b	b510 <_wcsnrtombs_l+0x80>
    b4ec:	b50003d4 	cbnz	x20, b564 <_wcsnrtombs_l+0xd4>
    b4f0:	b8404780 	ldr	w0, [x28], #4
    b4f4:	34000640 	cbz	w0, b5bc <_wcsnrtombs_l+0x12c>
    b4f8:	eb1a011f 	cmp	x8, x26
    b4fc:	54000982 	b.cs	b62c <_wcsnrtombs_l+0x19c>  // b.hs, b.nlast
    b500:	d1000718 	sub	x24, x24, #0x1
    b504:	aa0803fb 	mov	x27, x8
    b508:	b100071f 	cmn	x24, #0x1
    b50c:	540001c0 	b.eq	b544 <_wcsnrtombs_l+0xb4>  // b.none
    b510:	b9400382 	ldr	w2, [x28]
    b514:	aa1703e3 	mov	x3, x23
    b518:	f94072c4 	ldr	x4, [x22, #224]
    b51c:	9101c3e1 	add	x1, sp, #0x70
    b520:	aa1303e0 	mov	x0, x19
    b524:	f94002f9 	ldr	x25, [x23]
    b528:	d63f0080 	blr	x4
    b52c:	3100041f 	cmn	w0, #0x1
    b530:	54000620 	b.eq	b5f4 <_wcsnrtombs_l+0x164>  // b.none
    b534:	8b20c368 	add	x8, x27, w0, sxtw
    b538:	eb1a011f 	cmp	x8, x26
    b53c:	54fffd89 	b.ls	b4ec <_wcsnrtombs_l+0x5c>  // b.plast
    b540:	f90002f9 	str	x25, [x23]
    b544:	aa1b03e0 	mov	x0, x27
    b548:	a94153f3 	ldp	x19, x20, [sp, #16]
    b54c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b550:	a94363f7 	ldp	x23, x24, [sp, #48]
    b554:	a9446bf9 	ldp	x25, x26, [sp, #64]
    b558:	a94573fb 	ldp	x27, x28, [sp, #80]
    b55c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    b560:	d65f03c0 	ret
    b564:	7100001f 	cmp	w0, #0x0
    b568:	5400020d 	b.le	b5a8 <_wcsnrtombs_l+0x118>
    b56c:	f94037e1 	ldr	x1, [sp, #104]
    b570:	11000402 	add	w2, w0, #0x1
    b574:	d2800027 	mov	x7, #0x1                   	// #1
    b578:	d1000421 	sub	x1, x1, #0x1
    b57c:	d503201f 	nop
    b580:	9101c3e3 	add	x3, sp, #0x70
    b584:	8b070069 	add	x9, x3, x7
    b588:	385ff129 	ldurb	w9, [x9, #-1]
    b58c:	38276829 	strb	w9, [x1, x7]
    b590:	910004e7 	add	x7, x7, #0x1
    b594:	eb0200ff 	cmp	x7, x2
    b598:	54ffff41 	b.ne	b580 <_wcsnrtombs_l+0xf0>  // b.any
    b59c:	f94037e1 	ldr	x1, [sp, #104]
    b5a0:	8b204020 	add	x0, x1, w0, uxtw
    b5a4:	f90037e0 	str	x0, [sp, #104]
    b5a8:	f94002a0 	ldr	x0, [x21]
    b5ac:	91001000 	add	x0, x0, #0x4
    b5b0:	f90002a0 	str	x0, [x21]
    b5b4:	b8404780 	ldr	w0, [x28], #4
    b5b8:	35fffa00 	cbnz	w0, b4f8 <_wcsnrtombs_l+0x68>
    b5bc:	b4000054 	cbz	x20, b5c4 <_wcsnrtombs_l+0x134>
    b5c0:	f90002bf 	str	xzr, [x21]
    b5c4:	b90002ff 	str	wzr, [x23]
    b5c8:	d100051b 	sub	x27, x8, #0x1
    b5cc:	aa1b03e0 	mov	x0, x27
    b5d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    b5d4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b5d8:	a94363f7 	ldp	x23, x24, [sp, #48]
    b5dc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    b5e0:	a94573fb 	ldp	x27, x28, [sp, #80]
    b5e4:	a8c87bfd 	ldp	x29, x30, [sp], #128
    b5e8:	d65f03c0 	ret
    b5ec:	9280001a 	mov	x26, #0xffffffffffffffff    	// #-1
    b5f0:	17ffffba 	b	b4d8 <_wcsnrtombs_l+0x48>
    b5f4:	52801140 	mov	w0, #0x8a                  	// #138
    b5f8:	b9000260 	str	w0, [x19]
    b5fc:	b90002ff 	str	wzr, [x23]
    b600:	9280001b 	mov	x27, #0xffffffffffffffff    	// #-1
    b604:	aa1b03e0 	mov	x0, x27
    b608:	a94153f3 	ldp	x19, x20, [sp, #16]
    b60c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b610:	a94363f7 	ldp	x23, x24, [sp, #48]
    b614:	a9446bf9 	ldp	x25, x26, [sp, #64]
    b618:	a94573fb 	ldp	x27, x28, [sp, #80]
    b61c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    b620:	d65f03c0 	ret
    b624:	d280001b 	mov	x27, #0x0                   	// #0
    b628:	17ffffc7 	b	b544 <_wcsnrtombs_l+0xb4>
    b62c:	aa0803fb 	mov	x27, x8
    b630:	17ffffc5 	b	b544 <_wcsnrtombs_l+0xb4>
    b634:	d503201f 	nop
    b638:	d503201f 	nop
    b63c:	d503201f 	nop

000000000000b640 <_wcsnrtombs_r>:
    b640:	b0000000 	adrp	x0, c000 <_reclaim_reent+0xc0>
    b644:	d0000006 	adrp	x6, d000 <impure_data+0x78>
    b648:	911bc0c6 	add	x6, x6, #0x6f0
    b64c:	f947c000 	ldr	x0, [x0, #3968]
    b650:	17ffff90 	b	b490 <_wcsnrtombs_l>
    b654:	d503201f 	nop
    b658:	d503201f 	nop
    b65c:	d503201f 	nop

000000000000b660 <wcsnrtombs>:
    b660:	b0000006 	adrp	x6, c000 <_reclaim_reent+0xc0>
    b664:	aa0003e8 	mov	x8, x0
    b668:	aa0103e7 	mov	x7, x1
    b66c:	aa0203e5 	mov	x5, x2
    b670:	f947c0c0 	ldr	x0, [x6, #3968]
    b674:	aa0303e6 	mov	x6, x3
    b678:	aa0803e1 	mov	x1, x8
    b67c:	aa0503e3 	mov	x3, x5
    b680:	aa0703e2 	mov	x2, x7
    b684:	aa0403e5 	mov	x5, x4
    b688:	aa0603e4 	mov	x4, x6
    b68c:	d0000006 	adrp	x6, d000 <impure_data+0x78>
    b690:	911bc0c6 	add	x6, x6, #0x6f0
    b694:	17ffff7f 	b	b490 <_wcsnrtombs_l>
    b698:	d503201f 	nop
    b69c:	d503201f 	nop

000000000000b6a0 <_wctomb_r>:
    b6a0:	d0000004 	adrp	x4, d000 <impure_data+0x78>
    b6a4:	f943e884 	ldr	x4, [x4, #2000]
    b6a8:	aa0403f0 	mov	x16, x4
    b6ac:	d61f0200 	br	x16

000000000000b6b0 <__ascii_wctomb>:
    b6b0:	aa0003e3 	mov	x3, x0
    b6b4:	b4000141 	cbz	x1, b6dc <__ascii_wctomb+0x2c>
    b6b8:	7103fc5f 	cmp	w2, #0xff
    b6bc:	54000088 	b.hi	b6cc <__ascii_wctomb+0x1c>  // b.pmore
    b6c0:	52800020 	mov	w0, #0x1                   	// #1
    b6c4:	39000022 	strb	w2, [x1]
    b6c8:	d65f03c0 	ret
    b6cc:	52801141 	mov	w1, #0x8a                  	// #138
    b6d0:	12800000 	mov	w0, #0xffffffff            	// #-1
    b6d4:	b9000061 	str	w1, [x3]
    b6d8:	d65f03c0 	ret
    b6dc:	52800000 	mov	w0, #0x0                   	// #0
    b6e0:	d65f03c0 	ret
    b6e4:	d503201f 	nop
    b6e8:	d503201f 	nop
    b6ec:	d503201f 	nop

000000000000b6f0 <__utf8_wctomb>:
    b6f0:	aa0003e3 	mov	x3, x0
    b6f4:	b40004e1 	cbz	x1, b790 <__utf8_wctomb+0xa0>
    b6f8:	7101fc5f 	cmp	w2, #0x7f
    b6fc:	54000349 	b.ls	b764 <__utf8_wctomb+0x74>  // b.plast
    b700:	51020040 	sub	w0, w2, #0x80
    b704:	711dfc1f 	cmp	w0, #0x77f
    b708:	54000349 	b.ls	b770 <__utf8_wctomb+0x80>  // b.plast
    b70c:	51200044 	sub	w4, w2, #0x800
    b710:	529effe0 	mov	w0, #0xf7ff                	// #63487
    b714:	6b00009f 	cmp	w4, w0
    b718:	54000409 	b.ls	b798 <__utf8_wctomb+0xa8>  // b.plast
    b71c:	51404044 	sub	w4, w2, #0x10, lsl #12
    b720:	12bffe00 	mov	w0, #0xfffff               	// #1048575
    b724:	6b00009f 	cmp	w4, w0
    b728:	540004e8 	b.hi	b7c4 <__utf8_wctomb+0xd4>  // b.pmore
    b72c:	53127c45 	lsr	w5, w2, #18
    b730:	d34c4444 	ubfx	x4, x2, #12, #6
    b734:	d3462c43 	ubfx	x3, x2, #6, #6
    b738:	12001442 	and	w2, w2, #0x3f
    b73c:	321c6ca5 	orr	w5, w5, #0xfffffff0
    b740:	32196084 	orr	w4, w4, #0xffffff80
    b744:	32196063 	orr	w3, w3, #0xffffff80
    b748:	32196042 	orr	w2, w2, #0xffffff80
    b74c:	52800080 	mov	w0, #0x4                   	// #4
    b750:	39000025 	strb	w5, [x1]
    b754:	39000424 	strb	w4, [x1, #1]
    b758:	39000823 	strb	w3, [x1, #2]
    b75c:	39000c22 	strb	w2, [x1, #3]
    b760:	d65f03c0 	ret
    b764:	52800020 	mov	w0, #0x1                   	// #1
    b768:	39000022 	strb	w2, [x1]
    b76c:	d65f03c0 	ret
    b770:	53067c43 	lsr	w3, w2, #6
    b774:	12001442 	and	w2, w2, #0x3f
    b778:	321a6463 	orr	w3, w3, #0xffffffc0
    b77c:	32196042 	orr	w2, w2, #0xffffff80
    b780:	52800040 	mov	w0, #0x2                   	// #2
    b784:	39000023 	strb	w3, [x1]
    b788:	39000422 	strb	w2, [x1, #1]
    b78c:	d65f03c0 	ret
    b790:	52800000 	mov	w0, #0x0                   	// #0
    b794:	d65f03c0 	ret
    b798:	530c7c44 	lsr	w4, w2, #12
    b79c:	d3462c43 	ubfx	x3, x2, #6, #6
    b7a0:	12001442 	and	w2, w2, #0x3f
    b7a4:	321b6884 	orr	w4, w4, #0xffffffe0
    b7a8:	32196063 	orr	w3, w3, #0xffffff80
    b7ac:	32196042 	orr	w2, w2, #0xffffff80
    b7b0:	52800060 	mov	w0, #0x3                   	// #3
    b7b4:	39000024 	strb	w4, [x1]
    b7b8:	39000423 	strb	w3, [x1, #1]
    b7bc:	39000822 	strb	w2, [x1, #2]
    b7c0:	d65f03c0 	ret
    b7c4:	52801141 	mov	w1, #0x8a                  	// #138
    b7c8:	12800000 	mov	w0, #0xffffffff            	// #-1
    b7cc:	b9000061 	str	w1, [x3]
    b7d0:	d65f03c0 	ret
    b7d4:	d503201f 	nop
    b7d8:	d503201f 	nop
    b7dc:	d503201f 	nop

000000000000b7e0 <__sjis_wctomb>:
    b7e0:	aa0003e5 	mov	x5, x0
    b7e4:	12001c44 	and	w4, w2, #0xff
    b7e8:	d3483c43 	ubfx	x3, x2, #8, #8
    b7ec:	b4000301 	cbz	x1, b84c <__sjis_wctomb+0x6c>
    b7f0:	34000283 	cbz	w3, b840 <__sjis_wctomb+0x60>
    b7f4:	1101fc60 	add	w0, w3, #0x7f
    b7f8:	11008063 	add	w3, w3, #0x20
    b7fc:	12001c00 	and	w0, w0, #0xff
    b800:	12001c63 	and	w3, w3, #0xff
    b804:	7100781f 	cmp	w0, #0x1e
    b808:	7a4f8860 	ccmp	w3, #0xf, #0x0, hi  // hi = pmore
    b80c:	54000248 	b.hi	b854 <__sjis_wctomb+0x74>  // b.pmore
    b810:	51010080 	sub	w0, w4, #0x40
    b814:	51020084 	sub	w4, w4, #0x80
    b818:	12001c00 	and	w0, w0, #0xff
    b81c:	12001c84 	and	w4, w4, #0xff
    b820:	7100f81f 	cmp	w0, #0x3e
    b824:	52800f80 	mov	w0, #0x7c                  	// #124
    b828:	7a408080 	ccmp	w4, w0, #0x0, hi  // hi = pmore
    b82c:	54000148 	b.hi	b854 <__sjis_wctomb+0x74>  // b.pmore
    b830:	5ac00442 	rev16	w2, w2
    b834:	52800040 	mov	w0, #0x2                   	// #2
    b838:	79000022 	strh	w2, [x1]
    b83c:	d65f03c0 	ret
    b840:	52800020 	mov	w0, #0x1                   	// #1
    b844:	39000024 	strb	w4, [x1]
    b848:	d65f03c0 	ret
    b84c:	52800000 	mov	w0, #0x0                   	// #0
    b850:	d65f03c0 	ret
    b854:	52801141 	mov	w1, #0x8a                  	// #138
    b858:	12800000 	mov	w0, #0xffffffff            	// #-1
    b85c:	b90000a1 	str	w1, [x5]
    b860:	d65f03c0 	ret
    b864:	d503201f 	nop
    b868:	d503201f 	nop
    b86c:	d503201f 	nop

000000000000b870 <__eucjp_wctomb>:
    b870:	aa0003e4 	mov	x4, x0
    b874:	12001c43 	and	w3, w2, #0xff
    b878:	d3483c45 	ubfx	x5, x2, #8, #8
    b87c:	b4000421 	cbz	x1, b900 <__eucjp_wctomb+0x90>
    b880:	34000185 	cbz	w5, b8b0 <__eucjp_wctomb+0x40>
    b884:	11017ca0 	add	w0, w5, #0x5f
    b888:	1101c8a6 	add	w6, w5, #0x72
    b88c:	12001c00 	and	w0, w0, #0xff
    b890:	12001cc6 	and	w6, w6, #0xff
    b894:	7101741f 	cmp	w0, #0x5d
    b898:	7a4188c0 	ccmp	w6, #0x1, #0x0, hi  // hi = pmore
    b89c:	54000109 	b.ls	b8bc <__eucjp_wctomb+0x4c>  // b.plast
    b8a0:	52801141 	mov	w1, #0x8a                  	// #138
    b8a4:	12800000 	mov	w0, #0xffffffff            	// #-1
    b8a8:	b9000081 	str	w1, [x4]
    b8ac:	d65f03c0 	ret
    b8b0:	52800020 	mov	w0, #0x1                   	// #1
    b8b4:	39000023 	strb	w3, [x1]
    b8b8:	d65f03c0 	ret
    b8bc:	11017c66 	add	w6, w3, #0x5f
    b8c0:	12001cc6 	and	w6, w6, #0xff
    b8c4:	710174df 	cmp	w6, #0x5d
    b8c8:	54000209 	b.ls	b908 <__eucjp_wctomb+0x98>  // b.plast
    b8cc:	7101741f 	cmp	w0, #0x5d
    b8d0:	54fffe88 	b.hi	b8a0 <__eucjp_wctomb+0x30>  // b.pmore
    b8d4:	32190063 	orr	w3, w3, #0x80
    b8d8:	11017c60 	add	w0, w3, #0x5f
    b8dc:	12001c00 	and	w0, w0, #0xff
    b8e0:	7101741f 	cmp	w0, #0x5d
    b8e4:	54fffde8 	b.hi	b8a0 <__eucjp_wctomb+0x30>  // b.pmore
    b8e8:	12800e02 	mov	w2, #0xffffff8f            	// #-113
    b8ec:	52800060 	mov	w0, #0x3                   	// #3
    b8f0:	39000022 	strb	w2, [x1]
    b8f4:	39000425 	strb	w5, [x1, #1]
    b8f8:	39000823 	strb	w3, [x1, #2]
    b8fc:	d65f03c0 	ret
    b900:	52800000 	mov	w0, #0x0                   	// #0
    b904:	d65f03c0 	ret
    b908:	5ac00442 	rev16	w2, w2
    b90c:	52800040 	mov	w0, #0x2                   	// #2
    b910:	79000022 	strh	w2, [x1]
    b914:	d65f03c0 	ret
    b918:	d503201f 	nop
    b91c:	d503201f 	nop

000000000000b920 <__jis_wctomb>:
    b920:	aa0003e6 	mov	x6, x0
    b924:	12001c45 	and	w5, w2, #0xff
    b928:	d3483c44 	ubfx	x4, x2, #8, #8
    b92c:	b40004c1 	cbz	x1, b9c4 <__jis_wctomb+0xa4>
    b930:	34000304 	cbz	w4, b990 <__jis_wctomb+0x70>
    b934:	51008484 	sub	w4, w4, #0x21
    b938:	12001c84 	and	w4, w4, #0xff
    b93c:	7101749f 	cmp	w4, #0x5d
    b940:	54000468 	b.hi	b9cc <__jis_wctomb+0xac>  // b.pmore
    b944:	510084a5 	sub	w5, w5, #0x21
    b948:	12001ca5 	and	w5, w5, #0xff
    b94c:	710174bf 	cmp	w5, #0x5d
    b950:	540003e8 	b.hi	b9cc <__jis_wctomb+0xac>  // b.pmore
    b954:	b9400064 	ldr	w4, [x3]
    b958:	52800040 	mov	w0, #0x2                   	// #2
    b95c:	35000144 	cbnz	w4, b984 <__jis_wctomb+0x64>
    b960:	aa0103e4 	mov	x4, x1
    b964:	52800020 	mov	w0, #0x1                   	// #1
    b968:	b9000060 	str	w0, [x3]
    b96c:	52848365 	mov	w5, #0x241b                	// #9243
    b970:	52800843 	mov	w3, #0x42                  	// #66
    b974:	528000a0 	mov	w0, #0x5                   	// #5
    b978:	78003485 	strh	w5, [x4], #3
    b97c:	39000823 	strb	w3, [x1, #2]
    b980:	aa0403e1 	mov	x1, x4
    b984:	5ac00442 	rev16	w2, w2
    b988:	79000022 	strh	w2, [x1]
    b98c:	d65f03c0 	ret
    b990:	b9400062 	ldr	w2, [x3]
    b994:	52800020 	mov	w0, #0x1                   	// #1
    b998:	34000122 	cbz	w2, b9bc <__jis_wctomb+0x9c>
    b99c:	aa0103e2 	mov	x2, x1
    b9a0:	b900007f 	str	wzr, [x3]
    b9a4:	52850364 	mov	w4, #0x281b                	// #10267
    b9a8:	52800843 	mov	w3, #0x42                  	// #66
    b9ac:	52800080 	mov	w0, #0x4                   	// #4
    b9b0:	78003444 	strh	w4, [x2], #3
    b9b4:	39000823 	strb	w3, [x1, #2]
    b9b8:	aa0203e1 	mov	x1, x2
    b9bc:	39000025 	strb	w5, [x1]
    b9c0:	d65f03c0 	ret
    b9c4:	52800020 	mov	w0, #0x1                   	// #1
    b9c8:	d65f03c0 	ret
    b9cc:	52801141 	mov	w1, #0x8a                  	// #138
    b9d0:	12800000 	mov	w0, #0xffffffff            	// #-1
    b9d4:	b90000c1 	str	w1, [x6]
    b9d8:	d65f03c0 	ret
    b9dc:	d503201f 	nop

000000000000b9e0 <_write_r>:
    b9e0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b9e4:	910003fd 	mov	x29, sp
    b9e8:	a90153f3 	stp	x19, x20, [sp, #16]
    b9ec:	f0000014 	adrp	x20, e000 <__malloc_av_+0x768>
    b9f0:	aa0003f3 	mov	x19, x0
    b9f4:	2a0103e0 	mov	w0, w1
    b9f8:	aa0203e1 	mov	x1, x2
    b9fc:	b904d29f 	str	wzr, [x20, #1232]
    ba00:	aa0303e2 	mov	x2, x3
    ba04:	97ffe22f 	bl	42c0 <_write>
    ba08:	93407c01 	sxtw	x1, w0
    ba0c:	3100041f 	cmn	w0, #0x1
    ba10:	540000a0 	b.eq	ba24 <_write_r+0x44>  // b.none
    ba14:	aa0103e0 	mov	x0, x1
    ba18:	a94153f3 	ldp	x19, x20, [sp, #16]
    ba1c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ba20:	d65f03c0 	ret
    ba24:	b944d280 	ldr	w0, [x20, #1232]
    ba28:	34ffff60 	cbz	w0, ba14 <_write_r+0x34>
    ba2c:	b9000260 	str	w0, [x19]
    ba30:	aa0103e0 	mov	x0, x1
    ba34:	a94153f3 	ldp	x19, x20, [sp, #16]
    ba38:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ba3c:	d65f03c0 	ret

000000000000ba40 <_close_r>:
    ba40:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    ba44:	910003fd 	mov	x29, sp
    ba48:	a90153f3 	stp	x19, x20, [sp, #16]
    ba4c:	f0000014 	adrp	x20, e000 <__malloc_av_+0x768>
    ba50:	aa0003f3 	mov	x19, x0
    ba54:	b904d29f 	str	wzr, [x20, #1232]
    ba58:	2a0103e0 	mov	w0, w1
    ba5c:	97ffe21d 	bl	42d0 <_close>
    ba60:	3100041f 	cmn	w0, #0x1
    ba64:	54000080 	b.eq	ba74 <_close_r+0x34>  // b.none
    ba68:	a94153f3 	ldp	x19, x20, [sp, #16]
    ba6c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ba70:	d65f03c0 	ret
    ba74:	b944d281 	ldr	w1, [x20, #1232]
    ba78:	34ffff81 	cbz	w1, ba68 <_close_r+0x28>
    ba7c:	b9000261 	str	w1, [x19]
    ba80:	a94153f3 	ldp	x19, x20, [sp, #16]
    ba84:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ba88:	d65f03c0 	ret
    ba8c:	d503201f 	nop

000000000000ba90 <__set_ctype>:
    ba90:	b0000001 	adrp	x1, c000 <_reclaim_reent+0xc0>
    ba94:	9138e021 	add	x1, x1, #0xe38
    ba98:	f9007c01 	str	x1, [x0, #248]
    ba9c:	d65f03c0 	ret

000000000000baa0 <__errno>:
    baa0:	b0000000 	adrp	x0, c000 <_reclaim_reent+0xc0>
    baa4:	f947c000 	ldr	x0, [x0, #3968]
    baa8:	d65f03c0 	ret
    baac:	d503201f 	nop

000000000000bab0 <_fclose_r.part.0>:
    bab0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    bab4:	910003fd 	mov	x29, sp
    bab8:	a90153f3 	stp	x19, x20, [sp, #16]
    babc:	aa0103f3 	mov	x19, x1
    bac0:	f90013f5 	str	x21, [sp, #32]
    bac4:	aa0003f5 	mov	x21, x0
    bac8:	97ffec5a 	bl	6c30 <__sflush_r>
    bacc:	2a0003f4 	mov	w20, w0
    bad0:	f9402a62 	ldr	x2, [x19, #80]
    bad4:	b40000c2 	cbz	x2, baec <_fclose_r.part.0+0x3c>
    bad8:	f9401a61 	ldr	x1, [x19, #48]
    badc:	aa1503e0 	mov	x0, x21
    bae0:	d63f0040 	blr	x2
    bae4:	7100001f 	cmp	w0, #0x0
    bae8:	5a9fa294 	csinv	w20, w20, wzr, ge  // ge = tcont
    baec:	79402260 	ldrh	w0, [x19, #16]
    baf0:	373802c0 	tbnz	w0, #7, bb48 <_fclose_r.part.0+0x98>
    baf4:	f9402e61 	ldr	x1, [x19, #88]
    baf8:	b40000e1 	cbz	x1, bb14 <_fclose_r.part.0+0x64>
    bafc:	9101d260 	add	x0, x19, #0x74
    bb00:	eb00003f 	cmp	x1, x0
    bb04:	54000060 	b.eq	bb10 <_fclose_r.part.0+0x60>  // b.none
    bb08:	aa1503e0 	mov	x0, x21
    bb0c:	97ffeead 	bl	75c0 <_free_r>
    bb10:	f9002e7f 	str	xzr, [x19, #88]
    bb14:	f9403e61 	ldr	x1, [x19, #120]
    bb18:	b4000081 	cbz	x1, bb28 <_fclose_r.part.0+0x78>
    bb1c:	aa1503e0 	mov	x0, x21
    bb20:	97ffeea8 	bl	75c0 <_free_r>
    bb24:	f9003e7f 	str	xzr, [x19, #120]
    bb28:	97ffedd2 	bl	7270 <__sfp_lock_acquire>
    bb2c:	7900227f 	strh	wzr, [x19, #16]
    bb30:	97ffedd4 	bl	7280 <__sfp_lock_release>
    bb34:	2a1403e0 	mov	w0, w20
    bb38:	a94153f3 	ldp	x19, x20, [sp, #16]
    bb3c:	f94013f5 	ldr	x21, [sp, #32]
    bb40:	a8c37bfd 	ldp	x29, x30, [sp], #48
    bb44:	d65f03c0 	ret
    bb48:	f9400e61 	ldr	x1, [x19, #24]
    bb4c:	aa1503e0 	mov	x0, x21
    bb50:	97ffee9c 	bl	75c0 <_free_r>
    bb54:	17ffffe8 	b	baf4 <_fclose_r.part.0+0x44>
    bb58:	d503201f 	nop
    bb5c:	d503201f 	nop

000000000000bb60 <_fclose_r>:
    bb60:	b4000301 	cbz	x1, bbc0 <_fclose_r+0x60>
    bb64:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    bb68:	910003fd 	mov	x29, sp
    bb6c:	f9000bf4 	str	x20, [sp, #16]
    bb70:	aa0003f4 	mov	x20, x0
    bb74:	b4000060 	cbz	x0, bb80 <_fclose_r+0x20>
    bb78:	b9405002 	ldr	w2, [x0, #80]
    bb7c:	34000162 	cbz	w2, bba8 <_fclose_r+0x48>
    bb80:	79c02020 	ldrsh	w0, [x1, #16]
    bb84:	350000a0 	cbnz	w0, bb98 <_fclose_r+0x38>
    bb88:	52800000 	mov	w0, #0x0                   	// #0
    bb8c:	f9400bf4 	ldr	x20, [sp, #16]
    bb90:	a8c37bfd 	ldp	x29, x30, [sp], #48
    bb94:	d65f03c0 	ret
    bb98:	aa1403e0 	mov	x0, x20
    bb9c:	f9400bf4 	ldr	x20, [sp, #16]
    bba0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    bba4:	17ffffc3 	b	bab0 <_fclose_r.part.0>
    bba8:	f90017e1 	str	x1, [sp, #40]
    bbac:	97ffedad 	bl	7260 <__sinit>
    bbb0:	f94017e1 	ldr	x1, [sp, #40]
    bbb4:	79c02020 	ldrsh	w0, [x1, #16]
    bbb8:	34fffe80 	cbz	w0, bb88 <_fclose_r+0x28>
    bbbc:	17fffff7 	b	bb98 <_fclose_r+0x38>
    bbc0:	52800000 	mov	w0, #0x0                   	// #0
    bbc4:	d65f03c0 	ret
    bbc8:	d503201f 	nop
    bbcc:	d503201f 	nop

000000000000bbd0 <fclose>:
    bbd0:	b4000340 	cbz	x0, bc38 <fclose+0x68>
    bbd4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    bbd8:	910003fd 	mov	x29, sp
    bbdc:	a90153f3 	stp	x19, x20, [sp, #16]
    bbe0:	aa0003f3 	mov	x19, x0
    bbe4:	b0000000 	adrp	x0, c000 <_reclaim_reent+0xc0>
    bbe8:	f947c014 	ldr	x20, [x0, #3968]
    bbec:	b4000074 	cbz	x20, bbf8 <fclose+0x28>
    bbf0:	b9405280 	ldr	w0, [x20, #80]
    bbf4:	34000180 	cbz	w0, bc24 <fclose+0x54>
    bbf8:	79c02260 	ldrsh	w0, [x19, #16]
    bbfc:	350000a0 	cbnz	w0, bc10 <fclose+0x40>
    bc00:	52800000 	mov	w0, #0x0                   	// #0
    bc04:	a94153f3 	ldp	x19, x20, [sp, #16]
    bc08:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bc0c:	d65f03c0 	ret
    bc10:	aa1303e1 	mov	x1, x19
    bc14:	aa1403e0 	mov	x0, x20
    bc18:	a94153f3 	ldp	x19, x20, [sp, #16]
    bc1c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bc20:	17ffffa4 	b	bab0 <_fclose_r.part.0>
    bc24:	aa1403e0 	mov	x0, x20
    bc28:	97ffed8e 	bl	7260 <__sinit>
    bc2c:	79c02260 	ldrsh	w0, [x19, #16]
    bc30:	34fffe80 	cbz	w0, bc00 <fclose+0x30>
    bc34:	17fffff7 	b	bc10 <fclose+0x40>
    bc38:	52800000 	mov	w0, #0x0                   	// #0
    bc3c:	d65f03c0 	ret

000000000000bc40 <_fstat_r>:
    bc40:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    bc44:	910003fd 	mov	x29, sp
    bc48:	a90153f3 	stp	x19, x20, [sp, #16]
    bc4c:	f0000014 	adrp	x20, e000 <__malloc_av_+0x768>
    bc50:	aa0003f3 	mov	x19, x0
    bc54:	b904d29f 	str	wzr, [x20, #1232]
    bc58:	2a0103e0 	mov	w0, w1
    bc5c:	aa0203e1 	mov	x1, x2
    bc60:	97ffe1a0 	bl	42e0 <_fstat>
    bc64:	3100041f 	cmn	w0, #0x1
    bc68:	54000080 	b.eq	bc78 <_fstat_r+0x38>  // b.none
    bc6c:	a94153f3 	ldp	x19, x20, [sp, #16]
    bc70:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bc74:	d65f03c0 	ret
    bc78:	b944d281 	ldr	w1, [x20, #1232]
    bc7c:	34ffff81 	cbz	w1, bc6c <_fstat_r+0x2c>
    bc80:	b9000261 	str	w1, [x19]
    bc84:	a94153f3 	ldp	x19, x20, [sp, #16]
    bc88:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bc8c:	d65f03c0 	ret

000000000000bc90 <_findenv_r>:
    bc90:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    bc94:	910003fd 	mov	x29, sp
    bc98:	a90363f7 	stp	x23, x24, [sp, #48]
    bc9c:	f0000017 	adrp	x23, e000 <__malloc_av_+0x768>
    bca0:	aa0103f8 	mov	x24, x1
    bca4:	a90153f3 	stp	x19, x20, [sp, #16]
    bca8:	a9025bf5 	stp	x21, x22, [sp, #32]
    bcac:	aa0203f5 	mov	x21, x2
    bcb0:	aa0003f6 	mov	x22, x0
    bcb4:	9400016b 	bl	c260 <__env_lock>
    bcb8:	f9405ef4 	ldr	x20, [x23, #184]
    bcbc:	b40003f4 	cbz	x20, bd38 <_findenv_r+0xa8>
    bcc0:	39400303 	ldrb	w3, [x24]
    bcc4:	aa1803f3 	mov	x19, x24
    bcc8:	7100f47f 	cmp	w3, #0x3d
    bccc:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    bcd0:	540000c0 	b.eq	bce8 <_findenv_r+0x58>  // b.none
    bcd4:	d503201f 	nop
    bcd8:	38401e63 	ldrb	w3, [x19, #1]!
    bcdc:	7100f47f 	cmp	w3, #0x3d
    bce0:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    bce4:	54ffffa1 	b.ne	bcd8 <_findenv_r+0x48>  // b.any
    bce8:	7100f47f 	cmp	w3, #0x3d
    bcec:	54000260 	b.eq	bd38 <_findenv_r+0xa8>  // b.none
    bcf0:	f9400280 	ldr	x0, [x20]
    bcf4:	cb180273 	sub	x19, x19, x24
    bcf8:	b4000200 	cbz	x0, bd38 <_findenv_r+0xa8>
    bcfc:	93407e73 	sxtw	x19, w19
    bd00:	f90023f9 	str	x25, [sp, #64]
    bd04:	d503201f 	nop
    bd08:	aa1303e2 	mov	x2, x19
    bd0c:	aa1803e1 	mov	x1, x24
    bd10:	940000e3 	bl	c09c <strncmp>
    bd14:	350000c0 	cbnz	w0, bd2c <_findenv_r+0x9c>
    bd18:	f9400280 	ldr	x0, [x20]
    bd1c:	8b130019 	add	x25, x0, x19
    bd20:	38736800 	ldrb	w0, [x0, x19]
    bd24:	7100f41f 	cmp	w0, #0x3d
    bd28:	54000180 	b.eq	bd58 <_findenv_r+0xc8>  // b.none
    bd2c:	f8408e80 	ldr	x0, [x20, #8]!
    bd30:	b5fffec0 	cbnz	x0, bd08 <_findenv_r+0x78>
    bd34:	f94023f9 	ldr	x25, [sp, #64]
    bd38:	aa1603e0 	mov	x0, x22
    bd3c:	9400014d 	bl	c270 <__env_unlock>
    bd40:	d2800000 	mov	x0, #0x0                   	// #0
    bd44:	a94153f3 	ldp	x19, x20, [sp, #16]
    bd48:	a9425bf5 	ldp	x21, x22, [sp, #32]
    bd4c:	a94363f7 	ldp	x23, x24, [sp, #48]
    bd50:	a8c57bfd 	ldp	x29, x30, [sp], #80
    bd54:	d65f03c0 	ret
    bd58:	f9405ee1 	ldr	x1, [x23, #184]
    bd5c:	aa1603e0 	mov	x0, x22
    bd60:	cb010281 	sub	x1, x20, x1
    bd64:	9343fc21 	asr	x1, x1, #3
    bd68:	b90002a1 	str	w1, [x21]
    bd6c:	94000141 	bl	c270 <__env_unlock>
    bd70:	91000720 	add	x0, x25, #0x1
    bd74:	a94153f3 	ldp	x19, x20, [sp, #16]
    bd78:	a9425bf5 	ldp	x21, x22, [sp, #32]
    bd7c:	a94363f7 	ldp	x23, x24, [sp, #48]
    bd80:	f94023f9 	ldr	x25, [sp, #64]
    bd84:	a8c57bfd 	ldp	x29, x30, [sp], #80
    bd88:	d65f03c0 	ret
    bd8c:	d503201f 	nop

000000000000bd90 <_getenv_r>:
    bd90:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    bd94:	910003fd 	mov	x29, sp
    bd98:	910073e2 	add	x2, sp, #0x1c
    bd9c:	97ffffbd 	bl	bc90 <_findenv_r>
    bda0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bda4:	d65f03c0 	ret
    bda8:	d503201f 	nop
    bdac:	d503201f 	nop

000000000000bdb0 <_isatty_r>:
    bdb0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    bdb4:	910003fd 	mov	x29, sp
    bdb8:	a90153f3 	stp	x19, x20, [sp, #16]
    bdbc:	f0000014 	adrp	x20, e000 <__malloc_av_+0x768>
    bdc0:	aa0003f3 	mov	x19, x0
    bdc4:	b904d29f 	str	wzr, [x20, #1232]
    bdc8:	2a0103e0 	mov	w0, w1
    bdcc:	97ffe149 	bl	42f0 <_isatty>
    bdd0:	3100041f 	cmn	w0, #0x1
    bdd4:	54000080 	b.eq	bde4 <_isatty_r+0x34>  // b.none
    bdd8:	a94153f3 	ldp	x19, x20, [sp, #16]
    bddc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bde0:	d65f03c0 	ret
    bde4:	b944d281 	ldr	w1, [x20, #1232]
    bde8:	34ffff81 	cbz	w1, bdd8 <_isatty_r+0x28>
    bdec:	b9000261 	str	w1, [x19]
    bdf0:	a94153f3 	ldp	x19, x20, [sp, #16]
    bdf4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bdf8:	d65f03c0 	ret
    bdfc:	d503201f 	nop

000000000000be00 <_lseek_r>:
    be00:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    be04:	910003fd 	mov	x29, sp
    be08:	a90153f3 	stp	x19, x20, [sp, #16]
    be0c:	f0000014 	adrp	x20, e000 <__malloc_av_+0x768>
    be10:	aa0003f3 	mov	x19, x0
    be14:	b904d29f 	str	wzr, [x20, #1232]
    be18:	2a0103e0 	mov	w0, w1
    be1c:	aa0203e1 	mov	x1, x2
    be20:	2a0303e2 	mov	w2, w3
    be24:	97ffe137 	bl	4300 <_lseek>
    be28:	b100041f 	cmn	x0, #0x1
    be2c:	54000080 	b.eq	be3c <_lseek_r+0x3c>  // b.none
    be30:	a94153f3 	ldp	x19, x20, [sp, #16]
    be34:	a8c27bfd 	ldp	x29, x30, [sp], #32
    be38:	d65f03c0 	ret
    be3c:	b944d281 	ldr	w1, [x20, #1232]
    be40:	34ffff81 	cbz	w1, be30 <_lseek_r+0x30>
    be44:	b9000261 	str	w1, [x19]
    be48:	a94153f3 	ldp	x19, x20, [sp, #16]
    be4c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    be50:	d65f03c0 	ret
    be54:	d503201f 	nop
    be58:	d503201f 	nop
    be5c:	d503201f 	nop

000000000000be60 <_read_r>:
    be60:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    be64:	910003fd 	mov	x29, sp
    be68:	a90153f3 	stp	x19, x20, [sp, #16]
    be6c:	f0000014 	adrp	x20, e000 <__malloc_av_+0x768>
    be70:	aa0003f3 	mov	x19, x0
    be74:	2a0103e0 	mov	w0, w1
    be78:	aa0203e1 	mov	x1, x2
    be7c:	b904d29f 	str	wzr, [x20, #1232]
    be80:	aa0303e2 	mov	x2, x3
    be84:	97ffe123 	bl	4310 <_read>
    be88:	93407c01 	sxtw	x1, w0
    be8c:	3100041f 	cmn	w0, #0x1
    be90:	540000a0 	b.eq	bea4 <_read_r+0x44>  // b.none
    be94:	aa0103e0 	mov	x0, x1
    be98:	a94153f3 	ldp	x19, x20, [sp, #16]
    be9c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bea0:	d65f03c0 	ret
    bea4:	b944d280 	ldr	w0, [x20, #1232]
    bea8:	34ffff60 	cbz	w0, be94 <_read_r+0x34>
    beac:	b9000260 	str	w0, [x19]
    beb0:	aa0103e0 	mov	x0, x1
    beb4:	a94153f3 	ldp	x19, x20, [sp, #16]
    beb8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bebc:	d65f03c0 	ret

000000000000bec0 <cleanup_glue>:
    bec0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    bec4:	910003fd 	mov	x29, sp
    bec8:	a9025bf5 	stp	x21, x22, [sp, #32]
    becc:	f9400035 	ldr	x21, [x1]
    bed0:	a90153f3 	stp	x19, x20, [sp, #16]
    bed4:	aa0103f3 	mov	x19, x1
    bed8:	aa0003f4 	mov	x20, x0
    bedc:	b4000275 	cbz	x21, bf28 <cleanup_glue+0x68>
    bee0:	f94002b6 	ldr	x22, [x21]
    bee4:	b40001d6 	cbz	x22, bf1c <cleanup_glue+0x5c>
    bee8:	f9001bf7 	str	x23, [sp, #48]
    beec:	f94002d7 	ldr	x23, [x22]
    bef0:	b40000f7 	cbz	x23, bf0c <cleanup_glue+0x4c>
    bef4:	f94002e1 	ldr	x1, [x23]
    bef8:	b4000041 	cbz	x1, bf00 <cleanup_glue+0x40>
    befc:	97fffff1 	bl	bec0 <cleanup_glue>
    bf00:	aa1703e1 	mov	x1, x23
    bf04:	aa1403e0 	mov	x0, x20
    bf08:	97ffedae 	bl	75c0 <_free_r>
    bf0c:	aa1603e1 	mov	x1, x22
    bf10:	aa1403e0 	mov	x0, x20
    bf14:	97ffedab 	bl	75c0 <_free_r>
    bf18:	f9401bf7 	ldr	x23, [sp, #48]
    bf1c:	aa1503e1 	mov	x1, x21
    bf20:	aa1403e0 	mov	x0, x20
    bf24:	97ffeda7 	bl	75c0 <_free_r>
    bf28:	aa1303e1 	mov	x1, x19
    bf2c:	aa1403e0 	mov	x0, x20
    bf30:	a94153f3 	ldp	x19, x20, [sp, #16]
    bf34:	a9425bf5 	ldp	x21, x22, [sp, #32]
    bf38:	a8c47bfd 	ldp	x29, x30, [sp], #64
    bf3c:	17ffeda1 	b	75c0 <_free_r>

000000000000bf40 <_reclaim_reent>:
    bf40:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    bf44:	b0000001 	adrp	x1, c000 <_reclaim_reent+0xc0>
    bf48:	910003fd 	mov	x29, sp
    bf4c:	a90153f3 	stp	x19, x20, [sp, #16]
    bf50:	aa0003f4 	mov	x20, x0
    bf54:	f947c020 	ldr	x0, [x1, #3968]
    bf58:	eb14001f 	cmp	x0, x20
    bf5c:	54000500 	b.eq	bffc <_reclaim_reent+0xbc>  // b.none
    bf60:	f9403e81 	ldr	x1, [x20, #120]
    bf64:	f90013f5 	str	x21, [sp, #32]
    bf68:	b40001e1 	cbz	x1, bfa4 <_reclaim_reent+0x64>
    bf6c:	d2800015 	mov	x21, #0x0                   	// #0
    bf70:	f8756833 	ldr	x19, [x1, x21]
    bf74:	b40000f3 	cbz	x19, bf90 <_reclaim_reent+0x50>
    bf78:	aa1303e1 	mov	x1, x19
    bf7c:	aa1403e0 	mov	x0, x20
    bf80:	f9400273 	ldr	x19, [x19]
    bf84:	97ffed8f 	bl	75c0 <_free_r>
    bf88:	b5ffff93 	cbnz	x19, bf78 <_reclaim_reent+0x38>
    bf8c:	f9403e81 	ldr	x1, [x20, #120]
    bf90:	910022b5 	add	x21, x21, #0x8
    bf94:	f10802bf 	cmp	x21, #0x200
    bf98:	54fffec1 	b.ne	bf70 <_reclaim_reent+0x30>  // b.any
    bf9c:	aa1403e0 	mov	x0, x20
    bfa0:	97ffed88 	bl	75c0 <_free_r>
    bfa4:	f9403281 	ldr	x1, [x20, #96]
    bfa8:	b4000061 	cbz	x1, bfb4 <_reclaim_reent+0x74>
    bfac:	aa1403e0 	mov	x0, x20
    bfb0:	97ffed84 	bl	75c0 <_free_r>
    bfb4:	f940fe93 	ldr	x19, [x20, #504]
    bfb8:	b4000153 	cbz	x19, bfe0 <_reclaim_reent+0xa0>
    bfbc:	91080295 	add	x21, x20, #0x200
    bfc0:	eb15027f 	cmp	x19, x21
    bfc4:	540000e0 	b.eq	bfe0 <_reclaim_reent+0xa0>  // b.none
    bfc8:	aa1303e1 	mov	x1, x19
    bfcc:	aa1403e0 	mov	x0, x20
    bfd0:	f9400273 	ldr	x19, [x19]
    bfd4:	97ffed7b 	bl	75c0 <_free_r>
    bfd8:	eb1302bf 	cmp	x21, x19
    bfdc:	54ffff61 	b.ne	bfc8 <_reclaim_reent+0x88>  // b.any
    bfe0:	f9404681 	ldr	x1, [x20, #136]
    bfe4:	b4000061 	cbz	x1, bff0 <_reclaim_reent+0xb0>
    bfe8:	aa1403e0 	mov	x0, x20
    bfec:	97ffed75 	bl	75c0 <_free_r>
    bff0:	b9405280 	ldr	w0, [x20, #80]
    bff4:	350000a0 	cbnz	w0, c008 <_reclaim_reent+0xc8>
    bff8:	f94013f5 	ldr	x21, [sp, #32]
    bffc:	a94153f3 	ldp	x19, x20, [sp, #16]
    c000:	a8c37bfd 	ldp	x29, x30, [sp], #48
    c004:	d65f03c0 	ret
    c008:	f9402e81 	ldr	x1, [x20, #88]
    c00c:	aa1403e0 	mov	x0, x20
    c010:	d63f0020 	blr	x1
    c014:	f9429293 	ldr	x19, [x20, #1312]
    c018:	b4ffff13 	cbz	x19, bff8 <_reclaim_reent+0xb8>
    c01c:	f9400261 	ldr	x1, [x19]
    c020:	b4000061 	cbz	x1, c02c <_reclaim_reent+0xec>
    c024:	aa1403e0 	mov	x0, x20
    c028:	97ffffa6 	bl	bec0 <cleanup_glue>
    c02c:	aa1303e1 	mov	x1, x19
    c030:	aa1403e0 	mov	x0, x20
    c034:	a94153f3 	ldp	x19, x20, [sp, #16]
    c038:	f94013f5 	ldr	x21, [sp, #32]
    c03c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    c040:	17ffed60 	b	75c0 <_free_r>
    c044:	d503201f 	nop
    c048:	d503201f 	nop
    c04c:	d503201f 	nop
    c050:	d503201f 	nop
    c054:	d503201f 	nop
    c058:	d503201f 	nop
    c05c:	d503201f 	nop
    c060:	d503201f 	nop
    c064:	d503201f 	nop
    c068:	d503201f 	nop
    c06c:	d503201f 	nop
    c070:	d503201f 	nop
    c074:	d503201f 	nop
    c078:	d503201f 	nop
    c07c:	d503201f 	nop
    c080:	d503201f 	nop
    c084:	d503201f 	nop
    c088:	d503201f 	nop
    c08c:	d503201f 	nop
    c090:	d503201f 	nop
    c094:	d503201f 	nop
    c098:	d503201f 	nop

000000000000c09c <strncmp>:
    c09c:	b4000d82 	cbz	x2, c24c <strncmp+0x1b0>
    c0a0:	ca010008 	eor	x8, x0, x1
    c0a4:	b200c3eb 	mov	x11, #0x101010101010101     	// #72340172838076673
    c0a8:	f240091f 	tst	x8, #0x7
    c0ac:	9240080e 	and	x14, x0, #0x7
    c0b0:	54000681 	b.ne	c180 <strncmp+0xe4>  // b.any
    c0b4:	b500040e 	cbnz	x14, c134 <strncmp+0x98>
    c0b8:	d100044d 	sub	x13, x2, #0x1
    c0bc:	d343fdad 	lsr	x13, x13, #3
    c0c0:	f8408403 	ldr	x3, [x0], #8
    c0c4:	f8408424 	ldr	x4, [x1], #8
    c0c8:	f10005ad 	subs	x13, x13, #0x1
    c0cc:	cb0b0068 	sub	x8, x3, x11
    c0d0:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    c0d4:	ca040066 	eor	x6, x3, x4
    c0d8:	da9f50cf 	csinv	x15, x6, xzr, pl  // pl = nfrst
    c0dc:	ea290105 	bics	x5, x8, x9
    c0e0:	fa4009e0 	ccmp	x15, #0x0, #0x0, eq  // eq = none
    c0e4:	54fffee0 	b.eq	c0c0 <strncmp+0x24>  // b.none
    c0e8:	b6f8012d 	tbz	x13, #63, c10c <strncmp+0x70>
    c0ec:	f2400842 	ands	x2, x2, #0x7
    c0f0:	540000e0 	b.eq	c10c <strncmp+0x70>  // b.none
    c0f4:	d37df042 	lsl	x2, x2, #3
    c0f8:	9280000e 	mov	x14, #0xffffffffffffffff    	// #-1
    c0fc:	9ac221ce 	lsl	x14, x14, x2
    c100:	8a2e0063 	bic	x3, x3, x14
    c104:	8a2e0084 	bic	x4, x4, x14
    c108:	aa0e00a5 	orr	x5, x5, x14
    c10c:	aa0500c7 	orr	x7, x6, x5
    c110:	dac00ce7 	rev	x7, x7
    c114:	dac00c63 	rev	x3, x3
    c118:	dac010ec 	clz	x12, x7
    c11c:	dac00c84 	rev	x4, x4
    c120:	9acc2063 	lsl	x3, x3, x12
    c124:	9acc2084 	lsl	x4, x4, x12
    c128:	d378fc63 	lsr	x3, x3, #56
    c12c:	cb44e060 	sub	x0, x3, x4, lsr #56
    c130:	d65f03c0 	ret
    c134:	927df000 	and	x0, x0, #0xfffffffffffffff8
    c138:	927df021 	and	x1, x1, #0xfffffffffffffff8
    c13c:	f8408403 	ldr	x3, [x0], #8
    c140:	cb0e0fea 	neg	x10, x14, lsl #3
    c144:	f8408424 	ldr	x4, [x1], #8
    c148:	92800009 	mov	x9, #0xffffffffffffffff    	// #-1
    c14c:	d100044d 	sub	x13, x2, #0x1
    c150:	9aca2529 	lsr	x9, x9, x10
    c154:	924009aa 	and	x10, x13, #0x7
    c158:	d343fdad 	lsr	x13, x13, #3
    c15c:	8b0e0042 	add	x2, x2, x14
    c160:	8b0e014a 	add	x10, x10, x14
    c164:	aa090063 	orr	x3, x3, x9
    c168:	aa090084 	orr	x4, x4, x9
    c16c:	8b4a0dad 	add	x13, x13, x10, lsr #3
    c170:	17ffffd6 	b	c0c8 <strncmp+0x2c>
    c174:	d503201f 	nop
    c178:	d503201f 	nop
    c17c:	d503201f 	nop
    c180:	f100405f 	cmp	x2, #0x10
    c184:	54000122 	b.cs	c1a8 <strncmp+0x10c>  // b.hs, b.nlast
    c188:	38401403 	ldrb	w3, [x0], #1
    c18c:	38401424 	ldrb	w4, [x1], #1
    c190:	f1000442 	subs	x2, x2, #0x1
    c194:	7a418860 	ccmp	w3, #0x1, #0x0, hi  // hi = pmore
    c198:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    c19c:	54ffff60 	b.eq	c188 <strncmp+0xec>  // b.none
    c1a0:	cb040060 	sub	x0, x3, x4
    c1a4:	d65f03c0 	ret
    c1a8:	d343fc4d 	lsr	x13, x2, #3
    c1ac:	b400018e 	cbz	x14, c1dc <strncmp+0x140>
    c1b0:	cb0e03ee 	neg	x14, x14
    c1b4:	924009ce 	and	x14, x14, #0x7
    c1b8:	cb0e0042 	sub	x2, x2, x14
    c1bc:	d343fc4d 	lsr	x13, x2, #3
    c1c0:	38401403 	ldrb	w3, [x0], #1
    c1c4:	38401424 	ldrb	w4, [x1], #1
    c1c8:	7100047f 	cmp	w3, #0x1
    c1cc:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    c1d0:	54fffe81 	b.ne	c1a0 <strncmp+0x104>  // b.any
    c1d4:	f10005ce 	subs	x14, x14, #0x1
    c1d8:	54ffff48 	b.hi	c1c0 <strncmp+0x124>  // b.pmore
    c1dc:	d280010e 	mov	x14, #0x8                   	// #8
    c1e0:	f10005ad 	subs	x13, x13, #0x1
    c1e4:	540001c3 	b.cc	c21c <strncmp+0x180>  // b.lo, b.ul, b.last
    c1e8:	927d2029 	and	x9, x1, #0xff8
    c1ec:	d27d2129 	eor	x9, x9, #0xff8
    c1f0:	b4fffe89 	cbz	x9, c1c0 <strncmp+0x124>
    c1f4:	f8408403 	ldr	x3, [x0], #8
    c1f8:	f8408424 	ldr	x4, [x1], #8
    c1fc:	cb0b0068 	sub	x8, x3, x11
    c200:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    c204:	ca040066 	eor	x6, x3, x4
    c208:	ea290105 	bics	x5, x8, x9
    c20c:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    c210:	54fff7e1 	b.ne	c10c <strncmp+0x70>  // b.any
    c214:	f10005ad 	subs	x13, x13, #0x1
    c218:	54fffe85 	b.pl	c1e8 <strncmp+0x14c>  // b.nfrst
    c21c:	92400842 	and	x2, x2, #0x7
    c220:	b4fff762 	cbz	x2, c10c <strncmp+0x70>
    c224:	d1002000 	sub	x0, x0, #0x8
    c228:	d1002021 	sub	x1, x1, #0x8
    c22c:	f8626803 	ldr	x3, [x0, x2]
    c230:	f8626824 	ldr	x4, [x1, x2]
    c234:	cb0b0068 	sub	x8, x3, x11
    c238:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    c23c:	ca040066 	eor	x6, x3, x4
    c240:	ea290105 	bics	x5, x8, x9
    c244:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    c248:	54fff621 	b.ne	c10c <strncmp+0x70>  // b.any
    c24c:	d2800000 	mov	x0, #0x0                   	// #0
    c250:	d65f03c0 	ret
    c254:	d503201f 	nop
    c258:	d503201f 	nop
    c25c:	d503201f 	nop

000000000000c260 <__env_lock>:
    c260:	d65f03c0 	ret
    c264:	d503201f 	nop
    c268:	d503201f 	nop
    c26c:	d503201f 	nop

000000000000c270 <__env_unlock>:
    c270:	d65f03c0 	ret

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

000000000000c274 <_fini>:
    c274:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    c278:	a9bf73fb 	stp	x27, x28, [sp, #-16]!
    c27c:	a9bf6bf9 	stp	x25, x26, [sp, #-16]!
    c280:	a9bf63f7 	stp	x23, x24, [sp, #-16]!
    c284:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    c288:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    c28c:	a8c153f3 	ldp	x19, x20, [sp], #16
    c290:	a8c15bf5 	ldp	x21, x22, [sp], #16
    c294:	a8c163f7 	ldp	x23, x24, [sp], #16
    c298:	a8c16bf9 	ldp	x25, x26, [sp], #16
    c29c:	a8c173fb 	ldp	x27, x28, [sp], #16
    c2a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    c2a4:	d65f03c0 	ret
