
obj/Font.o:     file format elf32-littlearm


Disassembly of section .group:

00000000 <.group>:
   0:	00000001 	andeq	r0, r0, r1
   4:	00000006 	andeq	r0, r0, r6
   8:	00000007 	andeq	r0, r0, r7
   c:	00000008 	andeq	r0, r0, r8

Disassembly of section .text:

00000000 <_ZN4FontC1Ev>:
   0:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
   4:	e1a04000 	mov	r4, r0
   8:	e3a06000 	mov	r6, #0
   c:	e3a035fe 	mov	r3, #1065353216	; 0x3f800000
  10:	e280001c 	add	r0, r0, #28
  14:	e5846000 	str	r6, [r4]
  18:	e3a0100a 	mov	r1, #10
  1c:	e5846014 	str	r6, [r4, #20]
  20:	e5846018 	str	r6, [r4, #24]
  24:	e5846020 	str	r6, [r4, #32]
  28:	e584301c 	str	r3, [r4, #28]
  2c:	ebfffffe 	bl	0 <_ZNKSt8__detail20_Prime_rehash_policy11_M_next_bktEj>
  30:	e3500001 	cmp	r0, #1
  34:	e5840010 	str	r0, [r4, #16]
  38:	01a07004 	moveq	r7, r4
  3c:	05a76024 	streq	r6, [r7, #36]!	; 0x24
  40:	0a000008 	beq	68 <_ZN4FontC1Ev+0x68>
  44:	e3700107 	cmn	r0, #-1073741823	; 0xc0000001
  48:	8a000009 	bhi	74 <_ZN4FontC1Ev+0x74>
  4c:	e1a05100 	lsl	r5, r0, #2
  50:	e1a00005 	mov	r0, r5
  54:	ebfffffe 	bl	0 <_Znwj>
  58:	e1a01006 	mov	r1, r6
  5c:	e1a02005 	mov	r2, r5
  60:	e1a07000 	mov	r7, r0
  64:	ebfffffe 	bl	0 <memset>
  68:	e584700c 	str	r7, [r4, #12]
  6c:	e1a00004 	mov	r0, r4
  70:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
  74:	ebfffffe 	bl	0 <_ZSt17__throw_bad_allocv>

00000078 <_ZN4FontC1EPv>:
  78:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
  7c:	e1a04000 	mov	r4, r0
  80:	e5801000 	str	r1, [r0]
  84:	e3a06000 	mov	r6, #0
  88:	e3a035fe 	mov	r3, #1065353216	; 0x3f800000
  8c:	e280001c 	add	r0, r0, #28
  90:	e5846014 	str	r6, [r4, #20]
  94:	e3a0100a 	mov	r1, #10
  98:	e5846018 	str	r6, [r4, #24]
  9c:	e5846020 	str	r6, [r4, #32]
  a0:	e584301c 	str	r3, [r4, #28]
  a4:	ebfffffe 	bl	0 <_ZNKSt8__detail20_Prime_rehash_policy11_M_next_bktEj>
  a8:	e3500001 	cmp	r0, #1
  ac:	e5840010 	str	r0, [r4, #16]
  b0:	01a07004 	moveq	r7, r4
  b4:	05a76024 	streq	r6, [r7, #36]!	; 0x24
  b8:	0a000008 	beq	e0 <_ZN4FontC1EPv+0x68>
  bc:	e3700107 	cmn	r0, #-1073741823	; 0xc0000001
  c0:	8a000009 	bhi	ec <_ZN4FontC1EPv+0x74>
  c4:	e1a05100 	lsl	r5, r0, #2
  c8:	e1a00005 	mov	r0, r5
  cc:	ebfffffe 	bl	0 <_Znwj>
  d0:	e1a01006 	mov	r1, r6
  d4:	e1a02005 	mov	r2, r5
  d8:	e1a07000 	mov	r7, r0
  dc:	ebfffffe 	bl	0 <memset>
  e0:	e584700c 	str	r7, [r4, #12]
  e4:	e1a00004 	mov	r0, r4
  e8:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
  ec:	ebfffffe 	bl	0 <_ZSt17__throw_bad_allocv>

000000f0 <_ZN4FontC1EOS_>:
  f0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
  f4:	e1a04000 	mov	r4, r0
  f8:	e5912000 	ldr	r2, [r1]
  fc:	e3a06000 	mov	r6, #0
 100:	e3a035fe 	mov	r3, #1065353216	; 0x3f800000
 104:	e1a07001 	mov	r7, r1
 108:	e280001c 	add	r0, r0, #28
 10c:	e5846014 	str	r6, [r4, #20]
 110:	e3a0100a 	mov	r1, #10
 114:	e5842000 	str	r2, [r4]
 118:	e5846018 	str	r6, [r4, #24]
 11c:	e5846020 	str	r6, [r4, #32]
 120:	e584301c 	str	r3, [r4, #28]
 124:	ebfffffe 	bl	0 <_ZNKSt8__detail20_Prime_rehash_policy11_M_next_bktEj>
 128:	e3500001 	cmp	r0, #1
 12c:	e5840010 	str	r0, [r4, #16]
 130:	01a08004 	moveq	r8, r4
 134:	05a86024 	streq	r6, [r8, #36]!	; 0x24
 138:	0a000008 	beq	160 <_ZN4FontC1EOS_+0x70>
 13c:	e3700107 	cmn	r0, #-1073741823	; 0xc0000001
 140:	8a00000b 	bhi	174 <_ZN4FontC1EOS_+0x84>
 144:	e1a05100 	lsl	r5, r0, #2
 148:	e1a00005 	mov	r0, r5
 14c:	ebfffffe 	bl	0 <_Znwj>
 150:	e1a01006 	mov	r1, r6
 154:	e1a02005 	mov	r2, r5
 158:	e1a08000 	mov	r8, r0
 15c:	ebfffffe 	bl	0 <memset>
 160:	e584800c 	str	r8, [r4, #12]
 164:	e3a03000 	mov	r3, #0
 168:	e1a00004 	mov	r0, r4
 16c:	e5873000 	str	r3, [r7]
 170:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
 174:	ebfffffe 	bl	0 <_ZSt17__throw_bad_allocv>

00000178 <_ZN4FontaSEOS_>:
 178:	e5913000 	ldr	r3, [r1]
 17c:	e5803000 	str	r3, [r0]
 180:	e5813000 	str	r3, [r1]
 184:	e12fff1e 	bx	lr

00000188 <_ZN4FontD1Ev>:
 188:	e92d4038 	push	{r3, r4, r5, lr}
 18c:	e1a05000 	mov	r5, r0
 190:	e5900014 	ldr	r0, [r0, #20]
 194:	e3500000 	cmp	r0, #0
 198:	0a000003 	beq	1ac <_ZN4FontD1Ev+0x24>
 19c:	e5904000 	ldr	r4, [r0]
 1a0:	ebfffffe 	bl	0 <_ZdlPv>
 1a4:	e2540000 	subs	r0, r4, #0
 1a8:	1afffffb 	bne	19c <_ZN4FontD1Ev+0x14>
 1ac:	e5952010 	ldr	r2, [r5, #16]
 1b0:	e3a01000 	mov	r1, #0
 1b4:	e595000c 	ldr	r0, [r5, #12]
 1b8:	e1a02102 	lsl	r2, r2, #2
 1bc:	ebfffffe 	bl	0 <memset>
 1c0:	e595000c 	ldr	r0, [r5, #12]
 1c4:	e3a03000 	mov	r3, #0
 1c8:	e5853018 	str	r3, [r5, #24]
 1cc:	e1500003 	cmp	r0, r3
 1d0:	e5853014 	str	r3, [r5, #20]
 1d4:	0a000003 	beq	1e8 <_ZN4FontD1Ev+0x60>
 1d8:	e2853024 	add	r3, r5, #36	; 0x24
 1dc:	e1500003 	cmp	r0, r3
 1e0:	0a000000 	beq	1e8 <_ZN4FontD1Ev+0x60>
 1e4:	ebfffffe 	bl	0 <_ZdlPv>
 1e8:	e1a00005 	mov	r0, r5
 1ec:	e8bd8038 	pop	{r3, r4, r5, pc}

000001f0 <_ZN4Font7SetSizeEj>:
 1f0:	e92d4038 	push	{r3, r4, r5, lr}
 1f4:	e1a04000 	mov	r4, r0
 1f8:	e5900000 	ldr	r0, [r0]
 1fc:	e1a05001 	mov	r5, r1
 200:	e3500000 	cmp	r0, #0
 204:	0a000004 	beq	21c <_ZN4Font7SetSizeEj+0x2c>
 208:	e3a01000 	mov	r1, #0
 20c:	e1a02005 	mov	r2, r5
 210:	ebfffffe 	bl	0 <FT_Set_Pixel_Sizes>
 214:	e5845008 	str	r5, [r4, #8]
 218:	e8bd8038 	pop	{r3, r4, r5, pc}
 21c:	e59f0020 	ldr	r0, [pc, #32]	; 244 <_ZN4Font7SetSizeEj+0x54>
 220:	e3a01042 	mov	r1, #66	; 0x42
 224:	e59f201c 	ldr	r2, [pc, #28]	; 248 <_ZN4Font7SetSizeEj+0x58>
 228:	e59f301c 	ldr	r3, [pc, #28]	; 24c <_ZN4Font7SetSizeEj+0x5c>
 22c:	e08f0000 	add	r0, pc, r0
 230:	e08f2002 	add	r2, pc, r2
 234:	e08f3003 	add	r3, pc, r3
 238:	ebfffffe 	bl	0 <__assert2>
 23c:	e5940000 	ldr	r0, [r4]
 240:	eafffff0 	b	208 <_ZN4Font7SetSizeEj+0x18>
 244:	00000010 	andeq	r0, r0, r0, lsl r0
 248:	00000010 	andeq	r0, r0, r0, lsl r0
 24c:	00000010 	andeq	r0, r0, r0, lsl r0

00000250 <_ZN4Font10BufferCharEt>:
 250:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 254:	e1a07000 	mov	r7, r0
 258:	e5903000 	ldr	r3, [r0]
 25c:	e24dd01c 	sub	sp, sp, #28
 260:	e1a06001 	mov	r6, r1
 264:	e3530000 	cmp	r3, #0
 268:	0a0000bb 	beq	55c <_ZN4Font10BufferCharEt+0x30c>
 26c:	e5978010 	ldr	r8, [r7, #16]
 270:	e1a00006 	mov	r0, r6
 274:	e1a01008 	mov	r1, r8
 278:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 27c:	e597300c 	ldr	r3, [r7, #12]
 280:	e7933101 	ldr	r3, [r3, r1, lsl #2]
 284:	e1a09001 	mov	r9, r1
 288:	e3530000 	cmp	r3, #0
 28c:	0a00000c 	beq	2c4 <_ZN4Font10BufferCharEt+0x74>
 290:	e5935000 	ldr	r5, [r3]
 294:	e1d540b4 	ldrh	r4, [r5, #4]
 298:	e1560004 	cmp	r6, r4
 29c:	0a000017 	beq	300 <_ZN4Font10BufferCharEt+0xb0>
 2a0:	e5955000 	ldr	r5, [r5]
 2a4:	e3550000 	cmp	r5, #0
 2a8:	0a000005 	beq	2c4 <_ZN4Font10BufferCharEt+0x74>
 2ac:	e1d540b4 	ldrh	r4, [r5, #4]
 2b0:	e1a01008 	mov	r1, r8
 2b4:	e1a00004 	mov	r0, r4
 2b8:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 2bc:	e1590001 	cmp	r9, r1
 2c0:	0afffff4 	beq	298 <_ZN4Font10BufferCharEt+0x48>
 2c4:	e5975000 	ldr	r5, [r7]
 2c8:	e1a01006 	mov	r1, r6
 2cc:	e1a00005 	mov	r0, r5
 2d0:	ebfffffe 	bl	0 <FT_Get_Char_Index>
 2d4:	e3a02000 	mov	r2, #0
 2d8:	e1a01000 	mov	r1, r0
 2dc:	e1a00005 	mov	r0, r5
 2e0:	ebfffffe 	bl	0 <FT_Load_Glyph>
 2e4:	e5950054 	ldr	r0, [r5, #84]	; 0x54
 2e8:	e3a01000 	mov	r1, #0
 2ec:	ebfffffe 	bl	0 <FT_Render_Glyph>
 2f0:	e3500000 	cmp	r0, #0
 2f4:	0a00000b 	beq	328 <_ZN4Font10BufferCharEt+0xd8>
 2f8:	e28dd01c 	add	sp, sp, #28
 2fc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 300:	e59f2354 	ldr	r2, [pc, #852]	; 65c <_ZN4Font10BufferCharEt+0x40c>
 304:	e3a0104b 	mov	r1, #75	; 0x4b
 308:	e59f0350 	ldr	r0, [pc, #848]	; 660 <_ZN4Font10BufferCharEt+0x410>
 30c:	e59f3350 	ldr	r3, [pc, #848]	; 664 <_ZN4Font10BufferCharEt+0x414>
 310:	e08f2002 	add	r2, pc, r2
 314:	e08f0000 	add	r0, pc, r0
 318:	e282201c 	add	r2, r2, #28
 31c:	e08f3003 	add	r3, pc, r3
 320:	ebfffffe 	bl	0 <__assert2>
 324:	eaffffe6 	b	2c4 <_ZN4Font10BufferCharEt+0x74>
 328:	e5979010 	ldr	r9, [r7, #16]
 32c:	e1a00006 	mov	r0, r6
 330:	e1a01009 	mov	r1, r9
 334:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 338:	e597300c 	ldr	r3, [r7, #12]
 33c:	e7933101 	ldr	r3, [r3, r1, lsl #2]
 340:	e1a08001 	mov	r8, r1
 344:	e1a0a101 	lsl	sl, r1, #2
 348:	e3530000 	cmp	r3, #0
 34c:	0a00000c 	beq	384 <_ZN4Font10BufferCharEt+0x134>
 350:	e593b000 	ldr	fp, [r3]
 354:	e1db40b4 	ldrh	r4, [fp, #4]
 358:	e1560004 	cmp	r6, r4
 35c:	0a000054 	beq	4b4 <_ZN4Font10BufferCharEt+0x264>
 360:	e59bb000 	ldr	fp, [fp]
 364:	e35b0000 	cmp	fp, #0
 368:	0a000005 	beq	384 <_ZN4Font10BufferCharEt+0x134>
 36c:	e1db40b4 	ldrh	r4, [fp, #4]
 370:	e1a01009 	mov	r1, r9
 374:	e1a00004 	mov	r0, r4
 378:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 37c:	e1580001 	cmp	r8, r1
 380:	0afffff4 	beq	358 <_ZN4Font10BufferCharEt+0x108>
 384:	e3a00020 	mov	r0, #32
 388:	e3a08000 	mov	r8, #0
 38c:	ebfffffe 	bl	0 <_Znwj>
 390:	e3a0c001 	mov	ip, #1
 394:	e287101c 	add	r1, r7, #28
 398:	e1a0b000 	mov	fp, r0
 39c:	e1c060b4 	strh	r6, [r0, #4]
 3a0:	e5808000 	str	r8, [r0]
 3a4:	e28d0010 	add	r0, sp, #16
 3a8:	e58b8008 	str	r8, [fp, #8]
 3ac:	e1cb80bc 	strh	r8, [fp, #12]
 3b0:	e1cb80be 	strh	r8, [fp, #14]
 3b4:	e1cb81b0 	strh	r8, [fp, #16]
 3b8:	e1cb81b2 	strh	r8, [fp, #18]
 3bc:	e1cb81b4 	strh	r8, [fp, #20]
 3c0:	e1cb81b6 	strh	r8, [fp, #22]
 3c4:	e1cb81b8 	strh	r8, [fp, #24]
 3c8:	e1cb81ba 	strh	r8, [fp, #26]
 3cc:	e1cb81bc 	strh	r8, [fp, #28]
 3d0:	e5973018 	ldr	r3, [r7, #24]
 3d4:	e5972010 	ldr	r2, [r7, #16]
 3d8:	e58dc000 	str	ip, [sp]
 3dc:	e5979020 	ldr	r9, [r7, #32]
 3e0:	ebfffffe 	bl	0 <_ZNKSt8__detail20_Prime_rehash_policy14_M_need_rehashEjjj>
 3e4:	e5dd3010 	ldrb	r3, [sp, #16]
 3e8:	e1530008 	cmp	r3, r8
 3ec:	0a00007c 	beq	5e4 <_ZN4Font10BufferCharEt+0x394>
 3f0:	e59d4014 	ldr	r4, [sp, #20]
 3f4:	e3540001 	cmp	r4, #1
 3f8:	01a09007 	moveq	r9, r7
 3fc:	05a98024 	streq	r8, [r9, #36]!	; 0x24
 400:	058d9008 	streq	r9, [sp, #8]
 404:	0a00000a 	beq	434 <_ZN4Font10BufferCharEt+0x1e4>
 408:	e3740107 	cmn	r4, #-1073741823	; 0xc0000001
 40c:	8a000088 	bhi	634 <_ZN4Font10BufferCharEt+0x3e4>
 410:	e1a08104 	lsl	r8, r4, #2
 414:	e1a00008 	mov	r0, r8
 418:	ebfffffe 	bl	0 <_Znwj>
 41c:	e1a02008 	mov	r2, r8
 420:	e3a01000 	mov	r1, #0
 424:	e1a09000 	mov	r9, r0
 428:	ebfffffe 	bl	0 <memset>
 42c:	e2873024 	add	r3, r7, #36	; 0x24
 430:	e58d3008 	str	r3, [sp, #8]
 434:	e597a014 	ldr	sl, [r7, #20]
 438:	e3a08000 	mov	r8, #0
 43c:	e5878014 	str	r8, [r7, #20]
 440:	e15a0008 	cmp	sl, r8
 444:	12873014 	addne	r3, r7, #20
 448:	158d300c 	strne	r3, [sp, #12]
 44c:	1a000006 	bne	46c <_ZN4Font10BufferCharEt+0x21c>
 450:	ea00004b 	b	584 <_ZN4Font10BufferCharEt+0x334>
 454:	e5900000 	ldr	r0, [r0]
 458:	e58a0000 	str	r0, [sl]
 45c:	e7991101 	ldr	r1, [r9, r1, lsl #2]
 460:	e581a000 	str	sl, [r1]
 464:	e252a000 	subs	sl, r2, #0
 468:	0a000045 	beq	584 <_ZN4Font10BufferCharEt+0x334>
 46c:	e1da00b4 	ldrh	r0, [sl, #4]
 470:	e1a01004 	mov	r1, r4
 474:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 478:	e59a2000 	ldr	r2, [sl]
 47c:	e7990101 	ldr	r0, [r9, r1, lsl #2]
 480:	e3500000 	cmp	r0, #0
 484:	1afffff2 	bne	454 <_ZN4Font10BufferCharEt+0x204>
 488:	e5970014 	ldr	r0, [r7, #20]
 48c:	e59d300c 	ldr	r3, [sp, #12]
 490:	e58a0000 	str	r0, [sl]
 494:	e587a014 	str	sl, [r7, #20]
 498:	e7893101 	str	r3, [r9, r1, lsl #2]
 49c:	e59a0000 	ldr	r0, [sl]
 4a0:	e3500000 	cmp	r0, #0
 4a4:	01a08001 	moveq	r8, r1
 4a8:	1789a108 	strne	sl, [r9, r8, lsl #2]
 4ac:	11a08001 	movne	r8, r1
 4b0:	eaffffeb 	b	464 <_ZN4Font10BufferCharEt+0x214>
 4b4:	e28bb008 	add	fp, fp, #8
 4b8:	e5953054 	ldr	r3, [r5, #84]	; 0x54
 4bc:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
 4c0:	e5934054 	ldr	r4, [r3, #84]	; 0x54
 4c4:	e6ff3072 	uxth	r3, r2
 4c8:	e1cb30b6 	strh	r3, [fp, #6]
 4cc:	e5951054 	ldr	r1, [r5, #84]	; 0x54
 4d0:	e1d105b0 	ldrh	r0, [r1, #80]	; 0x50
 4d4:	e1cb00b4 	strh	r0, [fp, #4]
 4d8:	e5951054 	ldr	r1, [r5, #84]	; 0x54
 4dc:	e5911054 	ldr	r1, [r1, #84]	; 0x54
 4e0:	e1cb61b0 	strh	r6, [fp, #16]
 4e4:	e1cb10b8 	strh	r1, [fp, #8]
 4e8:	e5951054 	ldr	r1, [r5, #84]	; 0x54
 4ec:	e5911040 	ldr	r1, [r1, #64]	; 0x40
 4f0:	e1a01341 	asr	r1, r1, #6
 4f4:	e1cb10ba 	strh	r1, [fp, #10]
 4f8:	e5951054 	ldr	r1, [r5, #84]	; 0x54
 4fc:	e5911064 	ldr	r1, [r1, #100]	; 0x64
 500:	e1cb10bc 	strh	r1, [fp, #12]
 504:	e5951054 	ldr	r1, [r5, #84]	; 0x54
 508:	e5911068 	ldr	r1, [r1, #104]	; 0x68
 50c:	e1cb10be 	strh	r1, [fp, #14]
 510:	e5951054 	ldr	r1, [r5, #84]	; 0x54
 514:	e5911058 	ldr	r1, [r1, #88]	; 0x58
 518:	e3510000 	cmp	r1, #0
 51c:	0a000009 	beq	548 <_ZN4Font10BufferCharEt+0x2f8>
 520:	e0040492 	mul	r4, r2, r4
 524:	e1a00004 	mov	r0, r4
 528:	ebfffffe 	bl	0 <_Znaj>
 52c:	e1a02004 	mov	r2, r4
 530:	e58b0000 	str	r0, [fp]
 534:	e5953054 	ldr	r3, [r5, #84]	; 0x54
 538:	e5931058 	ldr	r1, [r3, #88]	; 0x58
 53c:	ebfffffe 	bl	0 <memcpy>
 540:	e1db30b6 	ldrh	r3, [fp, #6]
 544:	e1db00b4 	ldrh	r0, [fp, #4]
 548:	e5972028 	ldr	r2, [r7, #40]	; 0x28
 54c:	e0232390 	mla	r3, r0, r3, r2
 550:	e5873028 	str	r3, [r7, #40]	; 0x28
 554:	e28dd01c 	add	sp, sp, #28
 558:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 55c:	e59f2104 	ldr	r2, [pc, #260]	; 668 <_ZN4Font10BufferCharEt+0x418>
 560:	e3a0104a 	mov	r1, #74	; 0x4a
 564:	e59f0100 	ldr	r0, [pc, #256]	; 66c <_ZN4Font10BufferCharEt+0x41c>
 568:	e59f3100 	ldr	r3, [pc, #256]	; 670 <_ZN4Font10BufferCharEt+0x420>
 56c:	e08f2002 	add	r2, pc, r2
 570:	e08f0000 	add	r0, pc, r0
 574:	e282201c 	add	r2, r2, #28
 578:	e08f3003 	add	r3, pc, r3
 57c:	ebfffffe 	bl	0 <__assert2>
 580:	eaffff39 	b	26c <_ZN4Font10BufferCharEt+0x1c>
 584:	e597000c 	ldr	r0, [r7, #12]
 588:	e59d3008 	ldr	r3, [sp, #8]
 58c:	e1500003 	cmp	r0, r3
 590:	0a000000 	beq	598 <_ZN4Font10BufferCharEt+0x348>
 594:	ebfffffe 	bl	0 <_ZdlPv>
 598:	e5874010 	str	r4, [r7, #16]
 59c:	e1a01004 	mov	r1, r4
 5a0:	e587900c 	str	r9, [r7, #12]
 5a4:	e1a00006 	mov	r0, r6
 5a8:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 5ac:	e1a0a101 	lsl	sl, r1, #2
 5b0:	e799300a 	ldr	r3, [r9, sl]
 5b4:	e3530000 	cmp	r3, #0
 5b8:	0a00000b 	beq	5ec <_ZN4Font10BufferCharEt+0x39c>
 5bc:	e5933000 	ldr	r3, [r3]
 5c0:	e58b3000 	str	r3, [fp]
 5c4:	e597300c 	ldr	r3, [r7, #12]
 5c8:	e793300a 	ldr	r3, [r3, sl]
 5cc:	e583b000 	str	fp, [r3]
 5d0:	e5973018 	ldr	r3, [r7, #24]
 5d4:	e28bb008 	add	fp, fp, #8
 5d8:	e2833001 	add	r3, r3, #1
 5dc:	e5873018 	str	r3, [r7, #24]
 5e0:	eaffffb4 	b	4b8 <_ZN4Font10BufferCharEt+0x268>
 5e4:	e597900c 	ldr	r9, [r7, #12]
 5e8:	eafffff0 	b	5b0 <_ZN4Font10BufferCharEt+0x360>
 5ec:	e5973014 	ldr	r3, [r7, #20]
 5f0:	e58b3000 	str	r3, [fp]
 5f4:	e587b014 	str	fp, [r7, #20]
 5f8:	e59b3000 	ldr	r3, [fp]
 5fc:	e3530000 	cmp	r3, #0
 600:	0a000004 	beq	618 <_ZN4Font10BufferCharEt+0x3c8>
 604:	e1d300b4 	ldrh	r0, [r3, #4]
 608:	e5971010 	ldr	r1, [r7, #16]
 60c:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 610:	e597300c 	ldr	r3, [r7, #12]
 614:	e783b101 	str	fp, [r3, r1, lsl #2]
 618:	e597300c 	ldr	r3, [r7, #12]
 61c:	e2872014 	add	r2, r7, #20
 620:	e783200a 	str	r2, [r3, sl]
 624:	eaffffe9 	b	5d0 <_ZN4Font10BufferCharEt+0x380>
 628:	ebfffffe 	bl	0 <__cxa_begin_catch>
 62c:	e5879020 	str	r9, [r7, #32]
 630:	ebfffffe 	bl	0 <__cxa_rethrow>
 634:	ebfffffe 	bl	0 <_ZSt17__throw_bad_allocv>
 638:	e1a04000 	mov	r4, r0
 63c:	ebfffffe 	bl	0 <__cxa_end_catch>
 640:	e1a00004 	mov	r0, r4
 644:	ebfffffe 	bl	0 <__cxa_begin_catch>
 648:	e1a0000b 	mov	r0, fp
 64c:	ebfffffe 	bl	0 <_ZdlPv>
 650:	ebfffffe 	bl	0 <__cxa_rethrow>
 654:	ebfffffe 	bl	0 <__cxa_end_catch>
 658:	ebfffffe 	bl	0 <__cxa_end_cleanup>
 65c:	00000344 	andeq	r0, r0, r4, asr #6
 660:	00000344 	andeq	r0, r0, r4, asr #6
 664:	00000340 	andeq	r0, r0, r0, asr #6
 668:	000000f4 	strdeq	r0, [r0], -r4
 66c:	000000f4 	strdeq	r0, [r0], -r4
 670:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>

00000674 <_ZN4Font15LoadVideoMemoryEb>:
 674:	e3500000 	cmp	r0, #0
 678:	012fff1e 	bxeq	lr
 67c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 680:	e1a04000 	mov	r4, r0
 684:	ed2d8b02 	vpush	{d8}
 688:	e1a07001 	mov	r7, r1
 68c:	e24dd03c 	sub	sp, sp, #60	; 0x3c
 690:	e28d8024 	add	r8, sp, #36	; 0x24
 694:	e1a00008 	mov	r0, r8
 698:	ebfffffe 	bl	0 <_ZN7Model2DC1Ev>
 69c:	e3a00030 	mov	r0, #48	; 0x30
 6a0:	e3013002 	movw	r3, #4098	; 0x1002
 6a4:	e1cd33b4 	strh	r3, [sp, #52]	; 0x34
 6a8:	ebfffffe 	bl	0 <_Znaj>
 6ac:	e1a03000 	mov	r3, r0
 6b0:	e3a025fe 	mov	r2, #1065353216	; 0x3f800000
 6b4:	e3a0c000 	mov	ip, #0
 6b8:	e3a0e000 	mov	lr, #0
 6bc:	e58d3024 	str	r3, [sp, #36]	; 0x24
 6c0:	e3a01004 	mov	r1, #4
 6c4:	e3a0000c 	mov	r0, #12
 6c8:	e58d102c 	str	r1, [sp, #44]	; 0x2c
 6cc:	e1c3e0be 	strh	lr, [r3, #14]
 6d0:	e3a01001 	mov	r1, #1
 6d4:	e1c3e0b0 	strh	lr, [r3]
 6d8:	e583c004 	str	ip, [r3, #4]
 6dc:	e1c3e0b2 	strh	lr, [r3, #2]
 6e0:	e1c3e1b8 	strh	lr, [r3, #24]
 6e4:	e583c008 	str	ip, [r3, #8]
 6e8:	e1c310bc 	strh	r1, [r3, #12]
 6ec:	e1c311ba 	strh	r1, [r3, #26]
 6f0:	e583c014 	str	ip, [r3, #20]
 6f4:	e1c312b4 	strh	r1, [r3, #36]	; 0x24
 6f8:	e1c312b6 	strh	r1, [r3, #38]	; 0x26
 6fc:	e583c01c 	str	ip, [r3, #28]
 700:	e5832010 	str	r2, [r3, #16]
 704:	e5832020 	str	r2, [r3, #32]
 708:	e5832028 	str	r2, [r3, #40]	; 0x28
 70c:	e583202c 	str	r2, [r3, #44]	; 0x2c
 710:	ebfffffe 	bl	0 <_Znaj>
 714:	e58d0028 	str	r0, [sp, #40]	; 0x28
 718:	e3a03002 	mov	r3, #2
 71c:	e3a01000 	mov	r1, #0
 720:	e58d3030 	str	r3, [sp, #48]	; 0x30
 724:	e1c010b0 	strh	r1, [r0]
 728:	e3a02001 	mov	r2, #1
 72c:	e59dc028 	ldr	ip, [sp, #40]	; 0x28
 730:	e3a01003 	mov	r1, #3
 734:	e1a00008 	mov	r0, r8
 738:	e1cc20b2 	strh	r2, [ip, #2]
 73c:	e59dc028 	ldr	ip, [sp, #40]	; 0x28
 740:	e1cc30b4 	strh	r3, [ip, #4]
 744:	e59dc028 	ldr	ip, [sp, #40]	; 0x28
 748:	e1cc20b6 	strh	r2, [ip, #6]
 74c:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
 750:	e1c230b8 	strh	r3, [r2, #8]
 754:	e1c210ba 	strh	r1, [r2, #10]
 758:	ebfffffe 	bl	0 <_ZN7Model2D13BuildGeometryEv>
 75c:	edd47a0a 	vldr	s15, [r4, #40]	; 0x28
 760:	e5840004 	str	r0, [r4, #4]
 764:	eeb87b67 	vcvt.f64.u32	d7, s15
 768:	eeb10bc7 	vsqrt.f64	d0, d7
 76c:	eeb40b40 	vcmp.f64	d0, d0
 770:	eef1fa10 	vmrs	APSR_nzcv, fpscr
 774:	1a000097 	bne	9d8 <_ZN4Font15LoadVideoMemoryEb+0x364>
 778:	e28d001c 	add	r0, sp, #28
 77c:	eeb08b40 	vmov.f64	d8, d0
 780:	ebfffffe 	bl	0 <frexp>
 784:	eeb67b00 	vmov.f64	d7, #96	; 0x60
 788:	eeb40b47 	vcmp.f64	d0, d7
 78c:	eef1fa10 	vmrs	APSR_nzcv, fpscr
 790:	1a000088 	bne	9b8 <_ZN4Font15LoadVideoMemoryEb+0x344>
 794:	eefc7bc8 	vcvt.u32.f64	s15, d8
 798:	e59f3250 	ldr	r3, [pc, #592]	; 9f0 <_ZN4Font15LoadVideoMemoryEb+0x37c>
 79c:	e79f3003 	ldr	r3, [pc, r3]
 7a0:	e5933000 	ldr	r3, [r3]
 7a4:	ee179a90 	vmov	r9, s15
 7a8:	e5933090 	ldr	r3, [r3, #144]	; 0x90
 7ac:	e1590003 	cmp	r9, r3
 7b0:	8a00007b 	bhi	9a4 <_ZN4Font15LoadVideoMemoryEb+0x330>
 7b4:	eeb70bc8 	vcvt.f32.f64	s0, d8
 7b8:	e3000de1 	movw	r0, #3553	; 0xde1
 7bc:	ed840a0e 	vstr	s0, [r4, #56]	; 0x38
 7c0:	ebfffffe 	bl	0 <glEnable>
 7c4:	e3a00001 	mov	r0, #1
 7c8:	e284102c 	add	r1, r4, #44	; 0x2c
 7cc:	ebfffffe 	bl	0 <glGenTextures>
 7d0:	e3080069 	movw	r0, #32873	; 0x8069
 7d4:	e28d1020 	add	r1, sp, #32
 7d8:	ebfffffe 	bl	0 <glGetIntegerv>
 7dc:	e3000de1 	movw	r0, #3553	; 0xde1
 7e0:	e594102c 	ldr	r1, [r4, #44]	; 0x2c
 7e4:	ebfffffe 	bl	0 <glBindTexture>
 7e8:	e3000de1 	movw	r0, #3553	; 0xde1
 7ec:	e3a01b0a 	mov	r1, #10240	; 0x2800
 7f0:	e3a02c26 	mov	r2, #9728	; 0x2600
 7f4:	ebfffffe 	bl	0 <glTexParameteri>
 7f8:	e3000de1 	movw	r0, #3553	; 0xde1
 7fc:	e3021801 	movw	r1, #10241	; 0x2801
 800:	e3a02c26 	mov	r2, #9728	; 0x2600
 804:	ebfffffe 	bl	0 <glTexParameteri>
 808:	e3a03000 	mov	r3, #0
 80c:	e3010906 	movw	r0, #6406	; 0x1906
 810:	e1a01003 	mov	r1, r3
 814:	e58d3004 	str	r3, [sp, #4]
 818:	e1a02000 	mov	r2, r0
 81c:	e58d3010 	str	r3, [sp, #16]
 820:	e58d0008 	str	r0, [sp, #8]
 824:	e3013401 	movw	r3, #5121	; 0x1401
 828:	e58d9000 	str	r9, [sp]
 82c:	e3000de1 	movw	r0, #3553	; 0xde1
 830:	e58d300c 	str	r3, [sp, #12]
 834:	e1a03009 	mov	r3, r9
 838:	ebfffffe 	bl	0 <glTexImage2D>
 83c:	e5944014 	ldr	r4, [r4, #20]
 840:	e3540000 	cmp	r4, #0
 844:	0a000053 	beq	998 <_ZN4Font15LoadVideoMemoryEb+0x324>
 848:	e3570000 	cmp	r7, #0
 84c:	1a000027 	bne	8f0 <_ZN4Font15LoadVideoMemoryEb+0x27c>
 850:	e3a06102 	mov	r6, #-2147483648	; 0x80000000
 854:	e1a05007 	mov	r5, r7
 858:	ea00001a 	b	8c8 <_ZN4Font15LoadVideoMemoryEb+0x254>
 85c:	e3a02000 	mov	r2, #0
 860:	e0877006 	add	r7, r7, r6
 864:	e1a00002 	mov	r0, r2
 868:	e1a05002 	mov	r5, r2
 86c:	e3a06102 	mov	r6, #-2147483648	; 0x80000000
 870:	e1c401ba 	strh	r0, [r4, #26]
 874:	e301a906 	movw	sl, #6406	; 0x1906
 878:	e1c471bc 	strh	r7, [r4, #28]
 87c:	e301c401 	movw	ip, #5121	; 0x1401
 880:	e58d1000 	str	r1, [sp]
 884:	e3000de1 	movw	r0, #3553	; 0xde1
 888:	e1d4e0be 	ldrh	lr, [r4, #14]
 88c:	e3a01000 	mov	r1, #0
 890:	e58d3010 	str	r3, [sp, #16]
 894:	e1a03007 	mov	r3, r7
 898:	e58da008 	str	sl, [sp, #8]
 89c:	e58de004 	str	lr, [sp, #4]
 8a0:	e58dc00c 	str	ip, [sp, #12]
 8a4:	ebfffffe 	bl	0 <glTexSubImage2D>
 8a8:	e1d430be 	ldrh	r3, [r4, #14]
 8ac:	e1d420bc 	ldrh	r2, [r4, #12]
 8b0:	e1560003 	cmp	r6, r3
 8b4:	e0855002 	add	r5, r5, r2
 8b8:	b1a06003 	movlt	r6, r3
 8bc:	e5944000 	ldr	r4, [r4]
 8c0:	e3540000 	cmp	r4, #0
 8c4:	0a000033 	beq	998 <_ZN4Font15LoadVideoMemoryEb+0x324>
 8c8:	e5943008 	ldr	r3, [r4, #8]
 8cc:	e3530000 	cmp	r3, #0
 8d0:	0afffff9 	beq	8bc <_ZN4Font15LoadVideoMemoryEb+0x248>
 8d4:	e1d410bc 	ldrh	r1, [r4, #12]
 8d8:	e0852001 	add	r2, r5, r1
 8dc:	e1590002 	cmp	r9, r2
 8e0:	3affffdd 	bcc	85c <_ZN4Font15LoadVideoMemoryEb+0x1e8>
 8e4:	e6ff0075 	uxth	r0, r5
 8e8:	e1a02005 	mov	r2, r5
 8ec:	eaffffdf 	b	870 <_ZN4Font15LoadVideoMemoryEb+0x1fc>
 8f0:	e3a07000 	mov	r7, #0
 8f4:	e3a06102 	mov	r6, #-2147483648	; 0x80000000
 8f8:	e1a05007 	mov	r5, r7
 8fc:	e301a906 	movw	sl, #6406	; 0x1906
 900:	e594c008 	ldr	ip, [r4, #8]
 904:	e35c0000 	cmp	ip, #0
 908:	0a00001f 	beq	98c <_ZN4Font15LoadVideoMemoryEb+0x318>
 90c:	e1d430bc 	ldrh	r3, [r4, #12]
 910:	e301e401 	movw	lr, #5121	; 0x1401
 914:	e3000de1 	movw	r0, #3553	; 0xde1
 918:	e0852003 	add	r2, r5, r3
 91c:	e1590002 	cmp	r9, r2
 920:	30877006 	addcc	r7, r7, r6
 924:	26ff1075 	uxthcs	r1, r5
 928:	33a02000 	movcc	r2, #0
 92c:	e1c471bc 	strh	r7, [r4, #28]
 930:	31a01002 	movcc	r1, r2
 934:	e1c411ba 	strh	r1, [r4, #26]
 938:	e58d3000 	str	r3, [sp]
 93c:	21a02005 	movcs	r2, r5
 940:	e1d4b0be 	ldrh	fp, [r4, #14]
 944:	e3a01000 	mov	r1, #0
 948:	e58da008 	str	sl, [sp, #8]
 94c:	e1a03007 	mov	r3, r7
 950:	e58dc010 	str	ip, [sp, #16]
 954:	31a05002 	movcc	r5, r2
 958:	e58db004 	str	fp, [sp, #4]
 95c:	33a06102 	movcc	r6, #-2147483648	; 0x80000000
 960:	e58de00c 	str	lr, [sp, #12]
 964:	ebfffffe 	bl	0 <glTexSubImage2D>
 968:	e1d430be 	ldrh	r3, [r4, #14]
 96c:	e5940008 	ldr	r0, [r4, #8]
 970:	e1560003 	cmp	r6, r3
 974:	e1d420bc 	ldrh	r2, [r4, #12]
 978:	b1a06003 	movlt	r6, r3
 97c:	e3500000 	cmp	r0, #0
 980:	e0855002 	add	r5, r5, r2
 984:	0a000000 	beq	98c <_ZN4Font15LoadVideoMemoryEb+0x318>
 988:	ebfffffe 	bl	0 <_ZdaPv>
 98c:	e5944000 	ldr	r4, [r4]
 990:	e3540000 	cmp	r4, #0
 994:	1affffd9 	bne	900 <_ZN4Font15LoadVideoMemoryEb+0x28c>
 998:	e3000de1 	movw	r0, #3553	; 0xde1
 99c:	e59d1020 	ldr	r1, [sp, #32]
 9a0:	ebfffffe 	bl	0 <glBindTexture>
 9a4:	e1a00008 	mov	r0, r8
 9a8:	ebfffffe 	bl	0 <_ZN7Model2DD1Ev>
 9ac:	e28dd03c 	add	sp, sp, #60	; 0x3c
 9b0:	ecbd8b02 	vpop	{d8}
 9b4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 9b8:	eeb70b00 	vmov.f64	d0, #112	; 0x70
 9bc:	e59d001c 	ldr	r0, [sp, #28]
 9c0:	ebfffffe 	bl	0 <ldexp>
 9c4:	eeb08b40 	vmov.f64	d8, d0
 9c8:	eaffff71 	b	794 <_ZN4Font15LoadVideoMemoryEb+0x120>
 9cc:	e1a00008 	mov	r0, r8
 9d0:	ebfffffe 	bl	0 <_ZN7Model2DD1Ev>
 9d4:	ebfffffe 	bl	0 <__cxa_end_cleanup>
 9d8:	eeb00b47 	vmov.f64	d0, d7
 9dc:	ebfffffe 	bl	0 <sqrt>
 9e0:	eaffff64 	b	778 <_ZN4Font15LoadVideoMemoryEb+0x104>
 9e4:	e1a00008 	mov	r0, r8
 9e8:	ebfffffe 	bl	0 <_ZN7Model2DD1Ev>
 9ec:	ebfffffe 	bl	0 <__cxa_end_cleanup>
 9f0:	0000024c 	andeq	r0, r0, ip, asr #4

000009f4 <_ZN4Font10DrawStringERKSs>:
 9f4:	e3500000 	cmp	r0, #0
 9f8:	012fff1e 	bxeq	lr
 9fc:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 a00:	e1a09000 	mov	r9, r0
 a04:	ed2d8b02 	vpush	{d8}
 a08:	e1a04001 	mov	r4, r1
 a0c:	e3000de1 	movw	r0, #3553	; 0xde1
 a10:	e24dd0a4 	sub	sp, sp, #164	; 0xa4
 a14:	e599102c 	ldr	r1, [r9, #44]	; 0x2c
 a18:	ebfffffe 	bl	0 <glBindTexture>
 a1c:	e594a000 	ldr	sl, [r4]
 a20:	e51a300c 	ldr	r3, [sl, #-12]
 a24:	e08a3003 	add	r3, sl, r3
 a28:	e58d3014 	str	r3, [sp, #20]
 a2c:	e15a0003 	cmp	sl, r3
 a30:	0a000026 	beq	ad0 <_ZN4Font10DrawStringERKSs+0xdc>
 a34:	ed9f8a99 	vldr	s16, [pc, #612]	; ca0 <_ZN4Font10DrawStringERKSs+0x2ac>
 a38:	e1a0200a 	mov	r2, sl
 a3c:	e2893014 	add	r3, r9, #20
 a40:	e58da00c 	str	sl, [sp, #12]
 a44:	e58d301c 	str	r3, [sp, #28]
 a48:	e4d23001 	ldrb	r3, [r2], #1
 a4c:	e5998010 	ldr	r8, [r9, #16]
 a50:	e1a00003 	mov	r0, r3
 a54:	e58d3018 	str	r3, [sp, #24]
 a58:	e1a01008 	mov	r1, r8
 a5c:	e58d200c 	str	r2, [sp, #12]
 a60:	e6ff6073 	uxth	r6, r3
 a64:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 a68:	e599300c 	ldr	r3, [r9, #12]
 a6c:	e7933101 	ldr	r3, [r3, r1, lsl #2]
 a70:	e1a02101 	lsl	r2, r1, #2
 a74:	e1a07001 	mov	r7, r1
 a78:	e58d2010 	str	r2, [sp, #16]
 a7c:	e3530000 	cmp	r3, #0
 a80:	0a00000e 	beq	ac0 <_ZN4Font10DrawStringERKSs+0xcc>
 a84:	e5934000 	ldr	r4, [r3]
 a88:	e1d450b4 	ldrh	r5, [r4, #4]
 a8c:	e1a0b004 	mov	fp, r4
 a90:	e1a0a005 	mov	sl, r5
 a94:	e156000a 	cmp	r6, sl
 a98:	0a00000f 	beq	adc <_ZN4Font10DrawStringERKSs+0xe8>
 a9c:	e59bb000 	ldr	fp, [fp]
 aa0:	e35b0000 	cmp	fp, #0
 aa4:	0a000005 	beq	ac0 <_ZN4Font10DrawStringERKSs+0xcc>
 aa8:	e1dba0b4 	ldrh	sl, [fp, #4]
 aac:	e1a01008 	mov	r1, r8
 ab0:	e1a0000a 	mov	r0, sl
 ab4:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 ab8:	e1570001 	cmp	r7, r1
 abc:	0afffff4 	beq	a94 <_ZN4Font10DrawStringERKSs+0xa0>
 ac0:	e59d3014 	ldr	r3, [sp, #20]
 ac4:	e59d200c 	ldr	r2, [sp, #12]
 ac8:	e1530002 	cmp	r3, r2
 acc:	1affffdd 	bne	a48 <_ZN4Font10DrawStringERKSs+0x54>
 ad0:	e28dd0a4 	add	sp, sp, #164	; 0xa4
 ad4:	ecbd8b02 	vpop	{d8}
 ad8:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 adc:	e1560005 	cmp	r6, r5
 ae0:	0a000071 	beq	cac <_ZN4Font10DrawStringERKSs+0x2b8>
 ae4:	e5944000 	ldr	r4, [r4]
 ae8:	e3540000 	cmp	r4, #0
 aec:	0a000005 	beq	b08 <_ZN4Font10DrawStringERKSs+0x114>
 af0:	e1d450b4 	ldrh	r5, [r4, #4]
 af4:	e1a01008 	mov	r1, r8
 af8:	e1a00005 	mov	r0, r5
 afc:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 b00:	e1570001 	cmp	r7, r1
 b04:	0afffff4 	beq	adc <_ZN4Font10DrawStringERKSs+0xe8>
 b08:	e3a00020 	mov	r0, #32
 b0c:	e28d5060 	add	r5, sp, #96	; 0x60
 b10:	ebfffffe 	bl	0 <_Znwj>
 b14:	e3a07000 	mov	r7, #0
 b18:	e3a0c001 	mov	ip, #1
 b1c:	e289101c 	add	r1, r9, #28
 b20:	e1a04000 	mov	r4, r0
 b24:	e1c060b4 	strh	r6, [r0, #4]
 b28:	e5807000 	str	r7, [r0]
 b2c:	e5807008 	str	r7, [r0, #8]
 b30:	e1a00005 	mov	r0, r5
 b34:	e1c470bc 	strh	r7, [r4, #12]
 b38:	e1c470be 	strh	r7, [r4, #14]
 b3c:	e1c471b0 	strh	r7, [r4, #16]
 b40:	e1c471b2 	strh	r7, [r4, #18]
 b44:	e1c471b4 	strh	r7, [r4, #20]
 b48:	e1c471b6 	strh	r7, [r4, #22]
 b4c:	e1c471b8 	strh	r7, [r4, #24]
 b50:	e1c471ba 	strh	r7, [r4, #26]
 b54:	e1c471bc 	strh	r7, [r4, #28]
 b58:	e5993018 	ldr	r3, [r9, #24]
 b5c:	e5992010 	ldr	r2, [r9, #16]
 b60:	e5998020 	ldr	r8, [r9, #32]
 b64:	e58dc000 	str	ip, [sp]
 b68:	ebfffffe 	bl	0 <_ZNKSt8__detail20_Prime_rehash_policy14_M_need_rehashEjjj>
 b6c:	e5dd3060 	ldrb	r3, [sp, #96]	; 0x60
 b70:	e1530007 	cmp	r3, r7
 b74:	0a0000d3 	beq	ec8 <_ZN4Font10DrawStringERKSs+0x4d4>
 b78:	e59d6064 	ldr	r6, [sp, #100]	; 0x64
 b7c:	e3560001 	cmp	r6, #1
 b80:	01a08009 	moveq	r8, r9
 b84:	05a87024 	streq	r7, [r8, #36]!	; 0x24
 b88:	01a0a008 	moveq	sl, r8
 b8c:	0a000009 	beq	bb8 <_ZN4Font10DrawStringERKSs+0x1c4>
 b90:	e3760107 	cmn	r6, #-1073741823	; 0xc0000001
 b94:	8a0000e3 	bhi	f28 <_ZN4Font10DrawStringERKSs+0x534>
 b98:	e1a07106 	lsl	r7, r6, #2
 b9c:	e1a00007 	mov	r0, r7
 ba0:	ebfffffe 	bl	0 <_Znwj>
 ba4:	e1a02007 	mov	r2, r7
 ba8:	e3a01000 	mov	r1, #0
 bac:	e1a08000 	mov	r8, r0
 bb0:	ebfffffe 	bl	0 <memset>
 bb4:	e289a024 	add	sl, r9, #36	; 0x24
 bb8:	e5997014 	ldr	r7, [r9, #20]
 bbc:	e3a03000 	mov	r3, #0
 bc0:	e5893014 	str	r3, [r9, #20]
 bc4:	e1570003 	cmp	r7, r3
 bc8:	11a0b003 	movne	fp, r3
 bcc:	1a000006 	bne	bec <_ZN4Font10DrawStringERKSs+0x1f8>
 bd0:	ea000019 	b	c3c <_ZN4Font10DrawStringERKSs+0x248>
 bd4:	e5922000 	ldr	r2, [r2]
 bd8:	e5872000 	str	r2, [r7]
 bdc:	e7982101 	ldr	r2, [r8, r1, lsl #2]
 be0:	e5827000 	str	r7, [r2]
 be4:	e2537000 	subs	r7, r3, #0
 be8:	0a000013 	beq	c3c <_ZN4Font10DrawStringERKSs+0x248>
 bec:	e1d700b4 	ldrh	r0, [r7, #4]
 bf0:	e1a01006 	mov	r1, r6
 bf4:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 bf8:	e5973000 	ldr	r3, [r7]
 bfc:	e7982101 	ldr	r2, [r8, r1, lsl #2]
 c00:	e3520000 	cmp	r2, #0
 c04:	1afffff2 	bne	bd4 <_ZN4Font10DrawStringERKSs+0x1e0>
 c08:	e5992014 	ldr	r2, [r9, #20]
 c0c:	e5872000 	str	r2, [r7]
 c10:	e59d201c 	ldr	r2, [sp, #28]
 c14:	e5897014 	str	r7, [r9, #20]
 c18:	e7882101 	str	r2, [r8, r1, lsl #2]
 c1c:	e5972000 	ldr	r2, [r7]
 c20:	e3520000 	cmp	r2, #0
 c24:	01a0b001 	moveq	fp, r1
 c28:	0affffed 	beq	be4 <_ZN4Font10DrawStringERKSs+0x1f0>
 c2c:	e788710b 	str	r7, [r8, fp, lsl #2]
 c30:	e2537000 	subs	r7, r3, #0
 c34:	e1a0b001 	mov	fp, r1
 c38:	1affffeb 	bne	bec <_ZN4Font10DrawStringERKSs+0x1f8>
 c3c:	e599000c 	ldr	r0, [r9, #12]
 c40:	e150000a 	cmp	r0, sl
 c44:	0a000000 	beq	c4c <_ZN4Font10DrawStringERKSs+0x258>
 c48:	ebfffffe 	bl	0 <_ZdlPv>
 c4c:	e5896010 	str	r6, [r9, #16]
 c50:	e1a01006 	mov	r1, r6
 c54:	e59d0018 	ldr	r0, [sp, #24]
 c58:	e589800c 	str	r8, [r9, #12]
 c5c:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 c60:	e1a03101 	lsl	r3, r1, #2
 c64:	e58d3010 	str	r3, [sp, #16]
 c68:	e1a02003 	mov	r2, r3
 c6c:	e7983002 	ldr	r3, [r8, r2]
 c70:	e3530000 	cmp	r3, #0
 c74:	0a000098 	beq	edc <_ZN4Font10DrawStringERKSs+0x4e8>
 c78:	e5933000 	ldr	r3, [r3]
 c7c:	e5843000 	str	r3, [r4]
 c80:	e599300c 	ldr	r3, [r9, #12]
 c84:	e7933002 	ldr	r3, [r3, r2]
 c88:	e5834000 	str	r4, [r3]
 c8c:	e5993018 	ldr	r3, [r9, #24]
 c90:	e2844008 	add	r4, r4, #8
 c94:	e2833001 	add	r3, r3, #1
 c98:	e5893018 	str	r3, [r9, #24]
 c9c:	ea000004 	b	cb4 <_ZN4Font10DrawStringERKSs+0x2c0>
 ca0:	00000000 	andeq	r0, r0, r0
 ca4:	fffffe90 			; <UNDEFINED> instruction: 0xfffffe90
 ca8:	fffffe34 			; <UNDEFINED> instruction: 0xfffffe34
 cac:	e2844008 	add	r4, r4, #8
 cb0:	e28d5060 	add	r5, sp, #96	; 0x60
 cb4:	eeb74a00 	vmov.f32	s8, #112	; 0x70
 cb8:	e1d431b2 	ldrh	r3, [r4, #18]
 cbc:	ed993a0e 	vldr	s6, [r9, #56]	; 0x38
 cc0:	e1a01005 	mov	r1, r5
 cc4:	e51f5028 	ldr	r5, [pc, #-40]	; ca4 <_ZN4Font10DrawStringERKSs+0x2b0>
 cc8:	ee063a90 	vmov	s13, r3
 ccc:	e1d431b4 	ldrh	r3, [r4, #20]
 cd0:	edd95a0d 	vldr	s11, [r9, #52]	; 0x34
 cd4:	ee073a10 	vmov	s14, r3
 cd8:	e1d430fc 	ldrsh	r3, [r4, #12]
 cdc:	ed995a0c 	vldr	s10, [r9, #48]	; 0x30
 ce0:	ee843a03 	vdiv.f32	s6, s8, s6
 ce4:	ee073a90 	vmov	s15, r3
 ce8:	e1d430fe 	ldrsh	r3, [r4, #14]
 cec:	ee063a10 	vmov	s12, r3
 cf0:	e1d430b4 	ldrh	r3, [r4, #4]
 cf4:	ee033a90 	vmov	s7, r3
 cf8:	e1d430b6 	ldrh	r3, [r4, #6]
 cfc:	e1d440ba 	ldrh	r4, [r4, #10]
 d00:	ed8d4a22 	vstr	s8, [sp, #136]	; 0x88
 d04:	ee043a90 	vmov	s9, r3
 d08:	ed8d8a10 	vstr	s16, [sp, #64]	; 0x40
 d0c:	ed8d8a11 	vstr	s16, [sp, #68]	; 0x44
 d10:	ed8d8a13 	vstr	s16, [sp, #76]	; 0x4c
 d14:	ed8d8a12 	vstr	s16, [sp, #72]	; 0x48
 d18:	ed8d8a20 	vstr	s16, [sp, #128]	; 0x80
 d1c:	ed8d8a21 	vstr	s16, [sp, #132]	; 0x84
 d20:	ed8d8a23 	vstr	s16, [sp, #140]	; 0x8c
 d24:	eeb87ac7 	vcvt.f32.s32	s14, s14
 d28:	ee277a03 	vmul.f32	s14, s14, s6
 d2c:	eef86ae6 	vcvt.f32.s32	s13, s13
 d30:	eeb86ac6 	vcvt.f32.s32	s12, s12
 d34:	ee666a83 	vmul.f32	s13, s13, s6
 d38:	ee356ac6 	vsub.f32	s12, s11, s12
 d3c:	ee675a08 	vmul.f32	s11, s14, s16
 d40:	eef87ae7 	vcvt.f32.s32	s15, s15
 d44:	ee262a88 	vmul.f32	s4, s13, s16
 d48:	ee777a85 	vadd.f32	s15, s15, s10
 d4c:	ee265a08 	vmul.f32	s10, s12, s16
 d50:	ee766aa5 	vadd.f32	s13, s13, s11
 d54:	ee672a88 	vmul.f32	s5, s15, s16
 d58:	ee725a25 	vadd.f32	s11, s4, s11
 d5c:	ee377a02 	vadd.f32	s14, s14, s4
 d60:	ee777a85 	vadd.f32	s15, s15, s10
 d64:	ee766a88 	vadd.f32	s13, s13, s16
 d68:	ee325a85 	vadd.f32	s10, s5, s10
 d6c:	ee366a22 	vadd.f32	s12, s12, s5
 d70:	ee755a88 	vadd.f32	s11, s11, s16
 d74:	ee766a88 	vadd.f32	s13, s13, s16
 d78:	ee377a08 	vadd.f32	s14, s14, s16
 d7c:	edcd6a24 	vstr	s13, [sp, #144]	; 0x90
 d80:	ee777a88 	vadd.f32	s15, s15, s16
 d84:	eef82ae4 	vcvt.f32.s32	s5, s9
 d88:	eeb82ae3 	vcvt.f32.s32	s4, s7
 d8c:	ee222a03 	vmul.f32	s4, s4, s6
 d90:	ee223a83 	vmul.f32	s6, s5, s6
 d94:	ee366a08 	vadd.f32	s12, s12, s16
 d98:	ee756a88 	vadd.f32	s13, s11, s16
 d9c:	ee355a08 	vadd.f32	s10, s10, s16
 da0:	edcd6a26 	vstr	s13, [sp, #152]	; 0x98
 da4:	ee377a08 	vadd.f32	s14, s14, s16
 da8:	ee777a88 	vadd.f32	s15, s15, s16
 dac:	ed8d7a25 	vstr	s14, [sp, #148]	; 0x94
 db0:	eef83a63 	vcvt.f32.u32	s7, s7
 db4:	edcd7a14 	vstr	s15, [sp, #80]	; 0x50
 db8:	eef84a64 	vcvt.f32.u32	s9, s9
 dbc:	edcd3a08 	vstr	s7, [sp, #32]
 dc0:	edcd4a0d 	vstr	s9, [sp, #52]	; 0x34
 dc4:	ee633a88 	vmul.f32	s7, s7, s16
 dc8:	ee644a88 	vmul.f32	s9, s9, s16
 dcc:	edcd3a09 	vstr	s7, [sp, #36]	; 0x24
 dd0:	edcd3a0a 	vstr	s7, [sp, #40]	; 0x28
 dd4:	edcd3a0b 	vstr	s7, [sp, #44]	; 0x2c
 dd8:	ee626a08 	vmul.f32	s13, s4, s16
 ddc:	edcd4a0c 	vstr	s9, [sp, #48]	; 0x30
 de0:	edcd4a0e 	vstr	s9, [sp, #56]	; 0x38
 de4:	edcd4a0f 	vstr	s9, [sp, #60]	; 0x3c
 de8:	ee637a08 	vmul.f32	s15, s6, s16
 dec:	ee755a84 	vadd.f32	s11, s11, s8
 df0:	ee367a08 	vadd.f32	s14, s12, s16
 df4:	ee354a04 	vadd.f32	s8, s10, s8
 df8:	ed8d7a15 	vstr	s14, [sp, #84]	; 0x54
 dfc:	ee355a08 	vadd.f32	s10, s10, s16
 e00:	ed8d4a17 	vstr	s8, [sp, #92]	; 0x5c
 e04:	ed8d5a16 	vstr	s10, [sp, #88]	; 0x58
 e08:	edcd5a27 	vstr	s11, [sp, #156]	; 0x9c
 e0c:	e79f5005 	ldr	r5, [pc, r5]
 e10:	ed8d2a18 	vstr	s4, [sp, #96]	; 0x60
 e14:	e5953000 	ldr	r3, [r5]
 e18:	ed8d3a1d 	vstr	s6, [sp, #116]	; 0x74
 e1c:	edcd6a19 	vstr	s13, [sp, #100]	; 0x64
 e20:	edcd6a1a 	vstr	s13, [sp, #104]	; 0x68
 e24:	edcd6a1b 	vstr	s13, [sp, #108]	; 0x6c
 e28:	edcd7a1c 	vstr	s15, [sp, #112]	; 0x70
 e2c:	edcd7a1e 	vstr	s15, [sp, #120]	; 0x78
 e30:	edcd7a1f 	vstr	s15, [sp, #124]	; 0x7c
 e34:	e5930004 	ldr	r0, [r3, #4]
 e38:	e5903000 	ldr	r3, [r0]
 e3c:	e5933008 	ldr	r3, [r3, #8]
 e40:	e12fff33 	blx	r3
 e44:	e5953000 	ldr	r3, [r5]
 e48:	e28d1020 	add	r1, sp, #32
 e4c:	e5930004 	ldr	r0, [r3, #4]
 e50:	e5903000 	ldr	r3, [r0]
 e54:	e5933004 	ldr	r3, [r3, #4]
 e58:	e12fff33 	blx	r3
 e5c:	e5952000 	ldr	r2, [r5]
 e60:	e51f31c0 	ldr	r3, [pc, #-448]	; ca8 <_ZN4Font10DrawStringERKSs+0x2b4>
 e64:	e5991004 	ldr	r1, [r9, #4]
 e68:	e5920004 	ldr	r0, [r2, #4]
 e6c:	e79f3003 	ldr	r3, [pc, r3]
 e70:	e590c000 	ldr	ip, [r0]
 e74:	e59c2010 	ldr	r2, [ip, #16]
 e78:	e1520003 	cmp	r2, r3
 e7c:	1a00000f 	bne	ec0 <_ZN4Font10DrawStringERKSs+0x4cc>
 e80:	e3e02000 	mvn	r2, #0
 e84:	e59cc00c 	ldr	ip, [ip, #12]
 e88:	e1a03002 	mov	r3, r2
 e8c:	e12fff3c 	blx	ip
 e90:	e6bf4074 	sxth	r4, r4
 e94:	ed997a0c 	vldr	s14, [r9, #48]	; 0x30
 e98:	e2844001 	add	r4, r4, #1
 e9c:	e59d3014 	ldr	r3, [sp, #20]
 ea0:	e59d200c 	ldr	r2, [sp, #12]
 ea4:	ee074a90 	vmov	s15, r4
 ea8:	e1530002 	cmp	r3, r2
 eac:	eef87ae7 	vcvt.f32.s32	s15, s15
 eb0:	ee777a27 	vadd.f32	s15, s14, s15
 eb4:	edc97a0c 	vstr	s15, [r9, #48]	; 0x30
 eb8:	1afffee2 	bne	a48 <_ZN4Font10DrawStringERKSs+0x54>
 ebc:	eaffff03 	b	ad0 <_ZN4Font10DrawStringERKSs+0xdc>
 ec0:	e12fff32 	blx	r2
 ec4:	eafffff1 	b	e90 <_ZN4Font10DrawStringERKSs+0x49c>
 ec8:	e599800c 	ldr	r8, [r9, #12]
 ecc:	e59d2010 	ldr	r2, [sp, #16]
 ed0:	e7983002 	ldr	r3, [r8, r2]
 ed4:	e3530000 	cmp	r3, #0
 ed8:	1affff66 	bne	c78 <_ZN4Font10DrawStringERKSs+0x284>
 edc:	e5993014 	ldr	r3, [r9, #20]
 ee0:	e5843000 	str	r3, [r4]
 ee4:	e5894014 	str	r4, [r9, #20]
 ee8:	e5943000 	ldr	r3, [r4]
 eec:	e3530000 	cmp	r3, #0
 ef0:	0a000004 	beq	f08 <_ZN4Font10DrawStringERKSs+0x514>
 ef4:	e1d300b4 	ldrh	r0, [r3, #4]
 ef8:	e5991010 	ldr	r1, [r9, #16]
 efc:	ebfffffe 	bl	0 <__aeabi_uidivmod>
 f00:	e599300c 	ldr	r3, [r9, #12]
 f04:	e7834101 	str	r4, [r3, r1, lsl #2]
 f08:	e599300c 	ldr	r3, [r9, #12]
 f0c:	e59d2010 	ldr	r2, [sp, #16]
 f10:	e59d101c 	ldr	r1, [sp, #28]
 f14:	e7831002 	str	r1, [r3, r2]
 f18:	eaffff5b 	b	c8c <_ZN4Font10DrawStringERKSs+0x298>
 f1c:	ebfffffe 	bl	0 <__cxa_begin_catch>
 f20:	e5898020 	str	r8, [r9, #32]
 f24:	ebfffffe 	bl	0 <__cxa_rethrow>
 f28:	ebfffffe 	bl	0 <_ZSt17__throw_bad_allocv>
 f2c:	e1a05000 	mov	r5, r0
 f30:	ebfffffe 	bl	0 <__cxa_end_catch>
 f34:	e1a00005 	mov	r0, r5
 f38:	ebfffffe 	bl	0 <__cxa_begin_catch>
 f3c:	e1a00004 	mov	r0, r4
 f40:	ebfffffe 	bl	0 <_ZdlPv>
 f44:	ebfffffe 	bl	0 <__cxa_rethrow>
 f48:	ebfffffe 	bl	0 <__cxa_end_catch>
 f4c:	ebfffffe 	bl	0 <__cxa_end_cleanup>

Disassembly of section .text._ZN14VertexRenderer14RenderGeometryEP15GemeotryPointer:

00000000 <_ZN14VertexRenderer14RenderGeometryEP15GemeotryPointer>:
   0:	e590c000 	ldr	ip, [r0]
   4:	e3e02000 	mvn	r2, #0
   8:	e1a03002 	mov	r3, r2
   c:	e59cc00c 	ldr	ip, [ip, #12]
  10:	e12fff1c 	bx	ip

Disassembly of section .ARM.exidx.text._ZN14VertexRenderer14RenderGeometryEP15GemeotryPointer:

00000000 <.ARM.exidx.text._ZN14VertexRenderer14RenderGeometryEP15GemeotryPointer>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000001 	andeq	r0, r0, r1

Disassembly of section .ARM.extab:

00000000 <.ARM.extab>:
   0:	00000000 	andeq	r0, r0, r0
   4:	0006afb0 			; <UNDEFINED> instruction: 0x0006afb0
   8:	013590ff 	ldrsheq	r9, [r5, -pc]!
   c:	94018028 	strls	r8, [r1], #-40	; 0x28
  10:	c8000002 	stmdagt	r0, {r1}
  14:	07d80403 	ldrbeq	r0, [r8, r3, lsl #8]
  18:	5805d801 	stmdapl	r5, {r0, fp, ip, lr, pc}
  1c:	07e00000 	strbeq	r0, [r0, r0]!
  20:	0307e804 	movweq	lr, #30724	; 0x7804
  24:	d80407e4 	stmdale	r4, {r2, r5, r6, r7, r8, r9, sl}
  28:	08800107 	stmeq	r0, {r0, r1, r2, r8}
  2c:	00088404 	andeq	r8, r8, r4, lsl #8
  30:	00040888 	andeq	r0, r4, r8, lsl #17
  34:	00000100 	andeq	r0, r0, r0, lsl #2
  38:	0000007d 	andeq	r0, r0, sp, ror r0
	...
  44:	010ec980 	smlabbeq	lr, r0, r9, ip
  48:	afb0b0b0 	svcge	0x00b0b0b0
  4c:	1501ffff 	strne	pc, [r1, #-4095]	; 0xfff
  50:	00000424 	andeq	r0, r0, r4, lsr #8
  54:	06d86c34 			; <UNDEFINED> instruction: 0x06d86c34
  58:	cc01e400 	cfstrsgt	mvf14, [r1], {-0}
  5c:	0006f004 	andeq	pc, r6, r4
  60:	001c06e0 	andseq	r0, ip, r0, ror #13
	...
  6c:	0128c980 	smlawbeq	r8, r0, r9, ip
  70:	afb0b0b0 	svcge	0x00b0b0b0
  74:	013590ff 	ldrsheq	r9, [r5, -pc]!
  78:	02d42428 	sbcseq	r2, r4, #40, 8	; 0x28000000
  7c:	03ac0000 			; <UNDEFINED> instruction: 0x03ac0000
  80:	010aa804 	tsteq	sl, r4, lsl #16
  84:	018408cc 	orreq	r0, r4, ip, asr #17
  88:	0ab00000 	beq	fec00090 <_ZN4Font10DrawStringERKSs+0xfebff69c>
  8c:	030ab804 	movweq	fp, #43012	; 0xa804
  90:	a8040ab4 	stmdage	r4, {r2, r4, r5, r7, r9, fp}
  94:	0ad0010a 	beq	ff4004c4 <_ZN4Font10DrawStringERKSs+0xff3ffad0>
  98:	000ad404 	andeq	sp, sl, r4, lsl #8
  9c:	00040ad8 	ldrdeq	r0, [r4], -r8
  a0:	00000100 	andeq	r0, r0, r0, lsl #2
  a4:	0000007d 	andeq	r0, r0, sp, ror r0
  a8:	00000000 	andeq	r0, r0, r0

Disassembly of section .ARM.exidx:

00000000 <.ARM.exidx>:
   0:	00000000 	andeq	r0, r0, r0
   4:	80b108ab 	adcshi	r0, r1, fp, lsr #17
   8:	00000078 	andeq	r0, r0, r8, ror r0
   c:	80b108ab 	adcshi	r0, r1, fp, lsr #17
  10:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
  14:	80acb0b0 	strhthi	fp, [ip], r0
  18:	00000178 	andeq	r0, r0, r8, ror r1
  1c:	00000001 	andeq	r0, r0, r1
  20:	00000188 	andeq	r0, r0, r8, lsl #3
  24:	00000001 	andeq	r0, r0, r1
  28:	000001f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
  2c:	80b108a9 	adcshi	r0, r1, r9, lsr #17
  30:	00000250 	andeq	r0, r0, r0, asr r2
  34:	00000000 	andeq	r0, r0, r0
  38:	00000674 	andeq	r0, r0, r4, ror r6
  3c:	00000040 	andeq	r0, r0, r0, asr #32
  40:	000009f4 	strdeq	r0, [r0], -r4
  44:	00000068 	andeq	r0, r0, r8, rrx

Disassembly of section .rodata:

00000000 <_ZZN4Font7SetSizeEjE19__PRETTY_FUNCTION__>:
   0:	64696f76 	strbtvs	r6, [r9], #-3958	; 0xf76
   4:	6e6f4620 	cdpvs	6, 6, cr4, cr15, cr0, {1}
   8:	533a3a74 	teqpl	sl, #116, 20	; 0x74000
   c:	69537465 	ldmdbvs	r3, {r0, r2, r5, r6, sl, ip, sp, lr}^
  10:	7328657a 	teqvc	r8, #511705088	; 0x1e800000
  14:	5f657a69 	svcpl	0x00657a69
  18:	00002974 	andeq	r2, r0, r4, ror r9

0000001c <_ZZN4Font10BufferCharEtE19__PRETTY_FUNCTION__>:
  1c:	64696f76 	strbtvs	r6, [r9], #-3958	; 0xf76
  20:	6e6f4620 	cdpvs	6, 6, cr4, cr15, cr0, {1}
  24:	423a3a74 	eorsmi	r3, sl, #116, 20	; 0x74000
  28:	65666675 	strbvs	r6, [r6, #-1653]!	; 0x675
  2c:	61684372 	smcvs	33842	; 0x8432
  30:	69752872 	ldmdbvs	r5!, {r1, r4, r5, r6, fp, sp}^
  34:	3631746e 	ldrtcc	r7, [r1], -lr, ror #8
  38:	0029745f 	eoreq	r7, r9, pc, asr r4

Disassembly of section .rodata.str1.4:

00000000 <.LC0>:
   0:	512f2e2e 	teqpl	pc, lr, lsr #28
   4:	72646175 	rsbvc	r6, r4, #1073741853	; 0x4000001d
   8:	462f7369 	strtmi	r7, [pc], -r9, ror #6
   c:	2e746e6f 	cdpcs	14, 7, cr6, cr4, cr15, {3}
  10:	00707063 	rsbseq	r7, r0, r3, rrx

00000014 <.LC1>:
  14:	72665f6d 	rsbvc	r5, r6, #436	; 0x1b4
  18:	79746565 	ldmdbvc	r4!, {r0, r2, r5, r6, r8, sl, sp, lr}^
  1c:	61466570 	hvcvs	26192	; 0x6650
  20:	00006563 	andeq	r6, r0, r3, ror #10

00000024 <.LC2>:
  24:	6c675f6d 	stclvs	15, cr5, [r7], #-436	; 0xfffffe4c
  28:	4d687079 	stclmi	0, cr7, [r8, #-484]!	; 0xfffffe1c
  2c:	662e7061 	strtvs	r7, [lr], -r1, rrx
  30:	28646e69 	stmdacs	r4!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
  34:	3d202963 	stccc	9, cr2, [r0, #-396]!	; 0xfffffe74
  38:	5f6d203d 	svcpl	0x006d203d
  3c:	70796c67 	rsbsvc	r6, r9, r7, ror #24
  40:	70614d68 	rsbvc	r4, r1, r8, ror #26
  44:	646e652e 	strbtvs	r6, [lr], #-1326	; 0x52e
  48:	00002928 	andeq	r2, r0, r8, lsr #18

Disassembly of section .comment:

00000000 <.comment>:
   0:	43434700 	movtmi	r4, #14080	; 0x3700
   4:	4728203a 			; <UNDEFINED> instruction: 0x4728203a
   8:	2029554e 	eorcs	r5, r9, lr, asr #10
   c:	20392e34 	eorscs	r2, r9, r4, lsr lr
  10:	34313032 	ldrtcc	r3, [r1], #-50	; 0x32
  14:	37323830 			; <UNDEFINED> instruction: 0x37323830
  18:	72702820 	rsbsvc	r2, r0, #32, 16	; 0x200000
  1c:	6c657265 	sfmvs	f7, 2, [r5], #-404	; 0xfffffe6c
  20:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  24:	Address 0x0000000000000024 is out of bounds.


Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003441 	andeq	r3, r0, r1, asr #8
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	0000002a 	andeq	r0, r0, sl, lsr #32
  10:	412d3705 	teqmi	sp, r5, lsl #14
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	12040a02 	andne	r0, r4, #8192	; 0x2000
  20:	15011404 	strne	r1, [r1, #-1028]	; 0x404
  24:	18031701 	stmdane	r3, {r0, r8, r9, sl, ip}
  28:	1a011901 	bne	46434 <_ZN4Font10DrawStringERKSs+0x45a40>
  2c:	1c031b02 	stcne	11, cr1, [r3], {2}
  30:	22021e01 	andcs	r1, r2, #1, 28
  34:	Address 0x0000000000000034 is out of bounds.

