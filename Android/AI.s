
obj/AI.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_ZN2AIC1Ev>:
       0:	e92d4038 	push	{r3, r4, r5, lr}
       4:	e1a04000 	mov	r4, r0
       8:	e3a05000 	mov	r5, #0
       c:	e2800090 	add	r0, r0, #144	; 0x90
      10:	e5845088 	str	r5, [r4, #136]	; 0x88
      14:	ebfffffe 	bl	0 <_ZNSt18condition_variableC1Ev>
      18:	e58450a0 	str	r5, [r4, #160]	; 0xa0
      1c:	e58450a4 	str	r5, [r4, #164]	; 0xa4
      20:	e28400a8 	add	r0, r4, #168	; 0xa8
      24:	ebfffffe 	bl	0 <_ZNSt18condition_variableC1Ev>
      28:	e5c450ac 	strb	r5, [r4, #172]	; 0xac
      2c:	e58450b0 	str	r5, [r4, #176]	; 0xb0
      30:	e28400b4 	add	r0, r4, #180	; 0xb4
      34:	ebfffffe 	bl	0 <_ZNSt18condition_variableC1Ev>
      38:	e58450c4 	str	r5, [r4, #196]	; 0xc4
      3c:	e5c450b8 	strb	r5, [r4, #184]	; 0xb8
      40:	e28400d4 	add	r0, r4, #212	; 0xd4
      44:	e58450c8 	str	r5, [r4, #200]	; 0xc8
      48:	e5c450b9 	strb	r5, [r4, #185]	; 0xb9
      4c:	e58450cc 	str	r5, [r4, #204]	; 0xcc
      50:	e58450bc 	str	r5, [r4, #188]	; 0xbc
      54:	e58450c0 	str	r5, [r4, #192]	; 0xc0
      58:	e58450d0 	str	r5, [r4, #208]	; 0xd0
      5c:	ebfffffe 	bl	0 <_ZNSt18condition_variableC1Ev>
      60:	e28400d8 	add	r0, r4, #216	; 0xd8
      64:	ebfffffe 	bl	0 <_ZNSt18condition_variableC1Ev>
      68:	e28400dc 	add	r0, r4, #220	; 0xdc
      6c:	ebfffffe 	bl	0 <_ZNSt18condition_variableC1Ev>
      70:	e28400e0 	add	r0, r4, #224	; 0xe0
      74:	ebfffffe 	bl	0 <_ZNSt18condition_variableC1Ev>
      78:	e5c450e6 	strb	r5, [r4, #230]	; 0xe6
      7c:	e5c450e7 	strb	r5, [r4, #231]	; 0xe7
      80:	e1a00004 	mov	r0, r4
      84:	e8bd8038 	pop	{r3, r4, r5, pc}

00000088 <_ZN2AI19GenPredictionMatrixEP10QuadSquareP5PointIsE>:
      88:	e92d4010 	push	{r4, lr}
      8c:	e1a04002 	mov	r4, r2
      90:	e590c000 	ldr	ip, [r0]
      94:	e3a02d0a 	mov	r2, #640	; 0x280
      98:	e1a00001 	mov	r0, r1
      9c:	e1a0100c 	mov	r1, ip
      a0:	ebfffffe 	bl	0 <memcpy>
      a4:	e1d420bc 	ldrh	r2, [r4, #12]
      a8:	e1d410be 	ldrh	r1, [r4, #14]
      ac:	e6bf2072 	sxth	r2, r2
      b0:	e1a03000 	mov	r3, r0
      b4:	e3a00008 	mov	r0, #8
      b8:	e1022081 	smlabb	r2, r1, r0, r2
      bc:	e7d31102 	ldrb	r1, [r3, r2, lsl #2]
      c0:	e3811001 	orr	r1, r1, #1
      c4:	e7c31102 	strb	r1, [r3, r2, lsl #2]
      c8:	e1d420b8 	ldrh	r2, [r4, #8]
      cc:	e1d410ba 	ldrh	r1, [r4, #10]
      d0:	e6bf2072 	sxth	r2, r2
      d4:	e1022081 	smlabb	r2, r1, r0, r2
      d8:	e7d31102 	ldrb	r1, [r3, r2, lsl #2]
      dc:	e3811001 	orr	r1, r1, #1
      e0:	e7c31102 	strb	r1, [r3, r2, lsl #2]
      e4:	e1d420b4 	ldrh	r2, [r4, #4]
      e8:	e1d410b6 	ldrh	r1, [r4, #6]
      ec:	e6bf2072 	sxth	r2, r2
      f0:	e1022081 	smlabb	r2, r1, r0, r2
      f4:	e7d31102 	ldrb	r1, [r3, r2, lsl #2]
      f8:	e3811001 	orr	r1, r1, #1
      fc:	e7c31102 	strb	r1, [r3, r2, lsl #2]
     100:	e1d420b0 	ldrh	r2, [r4]
     104:	e1d410b2 	ldrh	r1, [r4, #2]
     108:	e6bf2072 	sxth	r2, r2
     10c:	e1022081 	smlabb	r2, r1, r0, r2
     110:	e7d31102 	ldrb	r1, [r3, r2, lsl #2]
     114:	e3811001 	orr	r1, r1, #1
     118:	e7c31102 	strb	r1, [r3, r2, lsl #2]
     11c:	e8bd8010 	pop	{r4, pc}

00000120 <_ZN2AI16LowerPlaceColumnEPK10QuadSquarejj>:
     120:	e3a03000 	mov	r3, #0
     124:	e0801101 	add	r1, r0, r1, lsl #2
     128:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     12c:	e1a0c003 	mov	ip, r3
     130:	e3e00000 	mvn	r0, #0
     134:	ea000006 	b	154 <_ZN2AI16LowerPlaceColumnEPK10QuadSquarejj+0x34>
     138:	e3700001 	cmn	r0, #1
     13c:	01a00003 	moveq	r0, r3
     140:	e15c0002 	cmp	ip, r2
     144:	0a00000d 	beq	180 <_ZN2AI16LowerPlaceColumnEPK10QuadSquarejj+0x60>
     148:	e2833001 	add	r3, r3, #1
     14c:	e3530014 	cmp	r3, #20
     150:	0a000008 	beq	178 <_ZN2AI16LowerPlaceColumnEPK10QuadSquarejj+0x58>
     154:	e7d1e283 	ldrb	lr, [r1, r3, lsl #5]
     158:	e28cc001 	add	ip, ip, #1
     15c:	e31e0001 	tst	lr, #1
     160:	0afffff4 	beq	138 <_ZN2AI16LowerPlaceColumnEPK10QuadSquarejj+0x18>
     164:	e2833001 	add	r3, r3, #1
     168:	e3e00000 	mvn	r0, #0
     16c:	e3530014 	cmp	r3, #20
     170:	e3a0c000 	mov	ip, #0
     174:	1afffff6 	bne	154 <_ZN2AI16LowerPlaceColumnEPK10QuadSquarejj+0x34>
     178:	e3e00000 	mvn	r0, #0
     17c:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
     180:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00000184 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE>:
     184:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     188:	e1a06001 	mov	r6, r1
     18c:	e1d120be 	ldrh	r2, [r1, #14]
     190:	e24dd01c 	sub	sp, sp, #28
     194:	e6bf3072 	sxth	r3, r2
     198:	e3530013 	cmp	r3, #19
     19c:	ca000057 	bgt	300 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x17c>
     1a0:	e1d1c0ba 	ldrh	ip, [r1, #10]
     1a4:	e1d110bc 	ldrh	r1, [r1, #12]
     1a8:	e6bf307c 	sxth	r3, ip
     1ac:	e3530013 	cmp	r3, #19
     1b0:	ca000052 	bgt	300 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x17c>
     1b4:	e1d6e0b6 	ldrh	lr, [r6, #6]
     1b8:	e1d640b8 	ldrh	r4, [r6, #8]
     1bc:	e6bf307e 	sxth	r3, lr
     1c0:	e3530013 	cmp	r3, #19
     1c4:	ca00004d 	bgt	300 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x17c>
     1c8:	e1d630b2 	ldrh	r3, [r6, #2]
     1cc:	e1d650b4 	ldrh	r5, [r6, #4]
     1d0:	e6bf7073 	sxth	r7, r3
     1d4:	e3570013 	cmp	r7, #19
     1d8:	ca000048 	bgt	300 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x17c>
     1dc:	e6ff707e 	uxth	r7, lr
     1e0:	e6ff9072 	uxth	r9, r2
     1e4:	e58d9000 	str	r9, [sp]
     1e8:	e2679013 	rsb	r9, r7, #19
     1ec:	e58d7008 	str	r7, [sp, #8]
     1f0:	e6ff807c 	uxth	r8, ip
     1f4:	e59d7000 	ldr	r7, [sp]
     1f8:	e6ffb073 	uxth	fp, r3
     1fc:	e1d660b0 	ldrh	r6, [r6]
     200:	e26ba013 	rsb	sl, fp, #19
     204:	e58d8004 	str	r8, [sp, #4]
     208:	e2677013 	rsb	r7, r7, #19
     20c:	e2688013 	rsb	r8, r8, #19
     210:	e6ffa07a 	uxth	sl, sl
     214:	e6ff7077 	uxth	r7, r7
     218:	e6ff9079 	uxth	r9, r9
     21c:	e6ff8078 	uxth	r8, r8
     220:	e6bf6076 	sxth	r6, r6
     224:	e6bf1071 	sxth	r1, r1
     228:	e6bf4074 	sxth	r4, r4
     22c:	e6bf5075 	sxth	r5, r5
     230:	e28aa001 	add	sl, sl, #1
     234:	e2899001 	add	r9, r9, #1
     238:	e58da014 	str	sl, [sp, #20]
     23c:	e58d9010 	str	r9, [sp, #16]
     240:	e288a001 	add	sl, r8, #1
     244:	e2879001 	add	r9, r7, #1
     248:	e3a08000 	mov	r8, #0
     24c:	e3a07008 	mov	r7, #8
     250:	e58da00c 	str	sl, [sp, #12]
     254:	e1021782 	smlabb	r2, r2, r7, r1
     258:	e10c478c 	smlabb	ip, ip, r7, r4
     25c:	e10e578e 	smlabb	lr, lr, r7, r5
     260:	e7d02102 	ldrb	r2, [r0, r2, lsl #2]
     264:	e1036783 	smlabb	r3, r3, r7, r6
     268:	e3120001 	tst	r2, #1
     26c:	1a00000b 	bne	2a0 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x11c>
     270:	e7d0210c 	ldrb	r2, [r0, ip, lsl #2]
     274:	e3120001 	tst	r2, #1
     278:	1a000008 	bne	2a0 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x11c>
     27c:	e7d0210e 	ldrb	r2, [r0, lr, lsl #2]
     280:	e3120001 	tst	r2, #1
     284:	1a000005 	bne	2a0 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x11c>
     288:	e7d03103 	ldrb	r3, [r0, r3, lsl #2]
     28c:	e3130001 	tst	r3, #1
     290:	1a000002 	bne	2a0 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x11c>
     294:	e1a00008 	mov	r0, r8
     298:	e28dd01c 	add	sp, sp, #28
     29c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     2a0:	e2888001 	add	r8, r8, #1
     2a4:	e59d2000 	ldr	r2, [sp]
     2a8:	e59dc004 	ldr	ip, [sp, #4]
     2ac:	e1580009 	cmp	r8, r9
     2b0:	e6ff3078 	uxth	r3, r8
     2b4:	e59de008 	ldr	lr, [sp, #8]
     2b8:	e0822003 	add	r2, r2, r3
     2bc:	e08cc003 	add	ip, ip, r3
     2c0:	e08ee003 	add	lr, lr, r3
     2c4:	e083300b 	add	r3, r3, fp
     2c8:	e6ff2072 	uxth	r2, r2
     2cc:	0a00000b 	beq	300 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x17c>
     2d0:	e59da00c 	ldr	sl, [sp, #12]
     2d4:	e6ffc07c 	uxth	ip, ip
     2d8:	e6ffe07e 	uxth	lr, lr
     2dc:	e6ff3073 	uxth	r3, r3
     2e0:	e158000a 	cmp	r8, sl
     2e4:	0a000005 	beq	300 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x17c>
     2e8:	e59da010 	ldr	sl, [sp, #16]
     2ec:	e158000a 	cmp	r8, sl
     2f0:	0a000002 	beq	300 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0x17c>
     2f4:	e59da014 	ldr	sl, [sp, #20]
     2f8:	e158000a 	cmp	r8, sl
     2fc:	1affffd4 	bne	254 <_ZN2AI11GravityQuadEPK10QuadSquarePK5PointIsE+0xd0>
     300:	e3e00000 	mvn	r0, #0
     304:	e28dd01c 	add	sp, sp, #28
     308:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

0000030c <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE>:
     30c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     310:	e24dd01c 	sub	sp, sp, #28
     314:	e59da040 	ldr	sl, [sp, #64]	; 0x40
     318:	e59d8044 	ldr	r8, [sp, #68]	; 0x44
     31c:	e35a0000 	cmp	sl, #0
     320:	0a000036 	beq	400 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0xf4>
     324:	e1a07003 	mov	r7, r3
     328:	e1a03103 	lsl	r3, r3, #2
     32c:	e58d3010 	str	r3, [sp, #16]
     330:	e28a3001 	add	r3, sl, #1
     334:	e58d3014 	str	r3, [sp, #20]
     338:	e1a0c002 	mov	ip, r2
     33c:	e59f30ec 	ldr	r3, [pc, #236]	; 430 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x124>
     340:	e1a0b001 	mov	fp, r1
     344:	e1a06000 	mov	r6, r0
     348:	e3a09001 	mov	r9, #1
     34c:	e08f3003 	add	r3, pc, r3
     350:	e58d3004 	str	r3, [sp, #4]
     354:	e59f30d8 	ldr	r3, [pc, #216]	; 434 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x128>
     358:	e3a05000 	mov	r5, #0
     35c:	e08f3003 	add	r3, pc, r3
     360:	e58d3008 	str	r3, [sp, #8]
     364:	e59f30cc 	ldr	r3, [pc, #204]	; 438 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x12c>
     368:	e08f3003 	add	r3, pc, r3
     36c:	e58d300c 	str	r3, [sp, #12]
     370:	e3570000 	cmp	r7, #0
     374:	13a04000 	movne	r4, #0
     378:	1a00000b 	bne	3ac <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0xa0>
     37c:	ea000017 	b	3e0 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0xd4>
     380:	e1a03105 	lsl	r3, r5, #2
     384:	e2855001 	add	r5, r5, #1
     388:	e0882003 	add	r2, r8, r3
     38c:	e084100b 	add	r1, r4, fp
     390:	e18810b3 	strh	r1, [r8, r3]
     394:	e08a300c 	add	r3, sl, ip
     398:	e0693003 	rsb	r3, r9, r3
     39c:	e1c230b2 	strh	r3, [r2, #2]
     3a0:	e2844001 	add	r4, r4, #1
     3a4:	e1540007 	cmp	r4, r7
     3a8:	0a00000c 	beq	3e0 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0xd4>
     3ac:	e7d63104 	ldrb	r3, [r6, r4, lsl #2]
     3b0:	e3130001 	tst	r3, #1
     3b4:	0afffff9 	beq	3a0 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x94>
     3b8:	e3550003 	cmp	r5, #3
     3bc:	9affffef 	bls	380 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x74>
     3c0:	e59d0004 	ldr	r0, [sp, #4]
     3c4:	e3001147 	movw	r1, #327	; 0x147
     3c8:	e59d2008 	ldr	r2, [sp, #8]
     3cc:	e59d300c 	ldr	r3, [sp, #12]
     3d0:	e58dc000 	str	ip, [sp]
     3d4:	ebfffffe 	bl	0 <__assert2>
     3d8:	e59dc000 	ldr	ip, [sp]
     3dc:	eaffffe7 	b	380 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x74>
     3e0:	e59d3010 	ldr	r3, [sp, #16]
     3e4:	e2899001 	add	r9, r9, #1
     3e8:	e0866003 	add	r6, r6, r3
     3ec:	e59d3014 	ldr	r3, [sp, #20]
     3f0:	e1590003 	cmp	r9, r3
     3f4:	1affffdd 	bne	370 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x64>
     3f8:	e3550004 	cmp	r5, #4
     3fc:	0a000009 	beq	428 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x11c>
     400:	e59f0034 	ldr	r0, [pc, #52]	; 43c <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x130>
     404:	e300114f 	movw	r1, #335	; 0x14f
     408:	e59f2030 	ldr	r2, [pc, #48]	; 440 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x134>
     40c:	e59f3030 	ldr	r3, [pc, #48]	; 444 <_ZN2AI9PlaceQuadEPK10QuadSquarejjjjP5PointIsE+0x138>
     410:	e08f0000 	add	r0, pc, r0
     414:	e08f2002 	add	r2, pc, r2
     418:	e08f3003 	add	r3, pc, r3
     41c:	e28dd01c 	add	sp, sp, #28
     420:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     424:	eafffffe 	b	0 <__assert2>
     428:	e28dd01c 	add	sp, sp, #28
     42c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     430:	000000dc 	.word	0x000000dc
     434:	000000d0 	.word	0x000000d0
     438:	000000c8 	.word	0x000000c8
     43c:	00000024 	.word	0x00000024
     440:	00000024 	.word	0x00000024
     444:	00000024 	.word	0x00000024

00000448 <_ZN2AI11NumberHolesEPK10QuadSquare>:
     448:	e1a03000 	mov	r3, r0
     44c:	e3a00000 	mov	r0, #0
     450:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     454:	e283ee26 	add	lr, r3, #608	; 0x260
     458:	e5d32000 	ldrb	r2, [r3]
     45c:	e5d3c004 	ldrb	ip, [r3, #4]
     460:	e3120001 	tst	r2, #1
     464:	05d31020 	ldrbeq	r1, [r3, #32]
     468:	13a01000 	movne	r1, #0
     46c:	03a02001 	moveq	r2, #1
     470:	11a02001 	movne	r2, r1
     474:	00011002 	andeq	r1, r1, r2
     478:	e31c0001 	tst	ip, #1
     47c:	1a000003 	bne	490 <_ZN2AI11NumberHolesEPK10QuadSquare+0x48>
     480:	e5d3c024 	ldrb	ip, [r3, #36]	; 0x24
     484:	e2822001 	add	r2, r2, #1
     488:	e31c0001 	tst	ip, #1
     48c:	12811001 	addne	r1, r1, #1
     490:	e5d3c008 	ldrb	ip, [r3, #8]
     494:	e31c0001 	tst	ip, #1
     498:	1a000003 	bne	4ac <_ZN2AI11NumberHolesEPK10QuadSquare+0x64>
     49c:	e5d3c028 	ldrb	ip, [r3, #40]	; 0x28
     4a0:	e2822001 	add	r2, r2, #1
     4a4:	e31c0001 	tst	ip, #1
     4a8:	12811001 	addne	r1, r1, #1
     4ac:	e5d3c00c 	ldrb	ip, [r3, #12]
     4b0:	e31c0001 	tst	ip, #1
     4b4:	1a000003 	bne	4c8 <_ZN2AI11NumberHolesEPK10QuadSquare+0x80>
     4b8:	e5d3c02c 	ldrb	ip, [r3, #44]	; 0x2c
     4bc:	e2822001 	add	r2, r2, #1
     4c0:	e31c0001 	tst	ip, #1
     4c4:	12811001 	addne	r1, r1, #1
     4c8:	e5d3c010 	ldrb	ip, [r3, #16]
     4cc:	e31c0001 	tst	ip, #1
     4d0:	1a000003 	bne	4e4 <_ZN2AI11NumberHolesEPK10QuadSquare+0x9c>
     4d4:	e5d3c030 	ldrb	ip, [r3, #48]	; 0x30
     4d8:	e2822001 	add	r2, r2, #1
     4dc:	e31c0001 	tst	ip, #1
     4e0:	12811001 	addne	r1, r1, #1
     4e4:	e5d3c014 	ldrb	ip, [r3, #20]
     4e8:	e31c0001 	tst	ip, #1
     4ec:	1a000003 	bne	500 <_ZN2AI11NumberHolesEPK10QuadSquare+0xb8>
     4f0:	e5d3c034 	ldrb	ip, [r3, #52]	; 0x34
     4f4:	e2822001 	add	r2, r2, #1
     4f8:	e31c0001 	tst	ip, #1
     4fc:	12811001 	addne	r1, r1, #1
     500:	e5d3c018 	ldrb	ip, [r3, #24]
     504:	e31c0001 	tst	ip, #1
     508:	1a000003 	bne	51c <_ZN2AI11NumberHolesEPK10QuadSquare+0xd4>
     50c:	e5d3c038 	ldrb	ip, [r3, #56]	; 0x38
     510:	e2822001 	add	r2, r2, #1
     514:	e31c0001 	tst	ip, #1
     518:	12811001 	addne	r1, r1, #1
     51c:	e5d3c01c 	ldrb	ip, [r3, #28]
     520:	e31c0001 	tst	ip, #1
     524:	1a000005 	bne	540 <_ZN2AI11NumberHolesEPK10QuadSquare+0xf8>
     528:	e5d3c03c 	ldrb	ip, [r3, #60]	; 0x3c
     52c:	e2822001 	add	r2, r2, #1
     530:	e31c0001 	tst	ip, #1
     534:	12811001 	addne	r1, r1, #1
     538:	e3520008 	cmp	r2, #8
     53c:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
     540:	e2833020 	add	r3, r3, #32
     544:	e0800001 	add	r0, r0, r1
     548:	e153000e 	cmp	r3, lr
     54c:	1affffc1 	bne	458 <_ZN2AI11NumberHolesEPK10QuadSquare+0x10>
     550:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00000554 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation>:
     554:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     558:	e24ddfc1 	sub	sp, sp, #772	; 0x304
     55c:	e3a08000 	mov	r8, #0
     560:	e3e0a000 	mvn	sl, #0
     564:	e28de084 	add	lr, sp, #132	; 0x84
     568:	e28d6fc1 	add	r6, sp, #772	; 0x304
     56c:	e1a0b001 	mov	fp, r1
     570:	e1a07002 	mov	r7, r2
     574:	e1a09003 	mov	r9, r3
     578:	e1a04008 	mov	r4, r8
     57c:	e1a0500a 	mov	r5, sl
     580:	e58d001c 	str	r0, [sp, #28]
     584:	e5cd8040 	strb	r8, [sp, #64]	; 0x40
     588:	e5cd8041 	strb	r8, [sp, #65]	; 0x41
     58c:	e5cd8042 	strb	r8, [sp, #66]	; 0x42
     590:	e5cd8044 	strb	r8, [sp, #68]	; 0x44
     594:	e5cd8045 	strb	r8, [sp, #69]	; 0x45
     598:	e5cd8046 	strb	r8, [sp, #70]	; 0x46
     59c:	e5cd8048 	strb	r8, [sp, #72]	; 0x48
     5a0:	e5cd8049 	strb	r8, [sp, #73]	; 0x49
     5a4:	e5cd804a 	strb	r8, [sp, #74]	; 0x4a
     5a8:	e5cd804c 	strb	r8, [sp, #76]	; 0x4c
     5ac:	e5cd804d 	strb	r8, [sp, #77]	; 0x4d
     5b0:	e5cd804e 	strb	r8, [sp, #78]	; 0x4e
     5b4:	e5cd8050 	strb	r8, [sp, #80]	; 0x50
     5b8:	e5cd8051 	strb	r8, [sp, #81]	; 0x51
     5bc:	e5cd8052 	strb	r8, [sp, #82]	; 0x52
     5c0:	e5cd8054 	strb	r8, [sp, #84]	; 0x54
     5c4:	e5cd8055 	strb	r8, [sp, #85]	; 0x55
     5c8:	e5cd8056 	strb	r8, [sp, #86]	; 0x56
     5cc:	e5cd8058 	strb	r8, [sp, #88]	; 0x58
     5d0:	e5cd8059 	strb	r8, [sp, #89]	; 0x59
     5d4:	e5cd805a 	strb	r8, [sp, #90]	; 0x5a
     5d8:	e5cd805c 	strb	r8, [sp, #92]	; 0x5c
     5dc:	e5cd805d 	strb	r8, [sp, #93]	; 0x5d
     5e0:	e5cd805e 	strb	r8, [sp, #94]	; 0x5e
     5e4:	e5cd8060 	strb	r8, [sp, #96]	; 0x60
     5e8:	e5cda043 	strb	sl, [sp, #67]	; 0x43
     5ec:	e5cda047 	strb	sl, [sp, #71]	; 0x47
     5f0:	e5cda04b 	strb	sl, [sp, #75]	; 0x4b
     5f4:	e5cda04f 	strb	sl, [sp, #79]	; 0x4f
     5f8:	e5cda053 	strb	sl, [sp, #83]	; 0x53
     5fc:	e5cda057 	strb	sl, [sp, #87]	; 0x57
     600:	e5cda05b 	strb	sl, [sp, #91]	; 0x5b
     604:	e5cda05f 	strb	sl, [sp, #95]	; 0x5f
     608:	e5cd8061 	strb	r8, [sp, #97]	; 0x61
     60c:	e5cd8062 	strb	r8, [sp, #98]	; 0x62
     610:	e5cda063 	strb	sl, [sp, #99]	; 0x63
     614:	e5cd8064 	strb	r8, [sp, #100]	; 0x64
     618:	e5cd8065 	strb	r8, [sp, #101]	; 0x65
     61c:	e5cd8066 	strb	r8, [sp, #102]	; 0x66
     620:	e5cda067 	strb	sl, [sp, #103]	; 0x67
     624:	e5cd8068 	strb	r8, [sp, #104]	; 0x68
     628:	e5cd8069 	strb	r8, [sp, #105]	; 0x69
     62c:	e5cd806a 	strb	r8, [sp, #106]	; 0x6a
     630:	e5cda06b 	strb	sl, [sp, #107]	; 0x6b
     634:	e5cd806c 	strb	r8, [sp, #108]	; 0x6c
     638:	e5cd806d 	strb	r8, [sp, #109]	; 0x6d
     63c:	e5cd806e 	strb	r8, [sp, #110]	; 0x6e
     640:	e5cda06f 	strb	sl, [sp, #111]	; 0x6f
     644:	e5cd8070 	strb	r8, [sp, #112]	; 0x70
     648:	e5cd8071 	strb	r8, [sp, #113]	; 0x71
     64c:	e5cd8072 	strb	r8, [sp, #114]	; 0x72
     650:	e5cda073 	strb	sl, [sp, #115]	; 0x73
     654:	e5cd8074 	strb	r8, [sp, #116]	; 0x74
     658:	e5cd8075 	strb	r8, [sp, #117]	; 0x75
     65c:	e5cd8076 	strb	r8, [sp, #118]	; 0x76
     660:	e5cda077 	strb	sl, [sp, #119]	; 0x77
     664:	e5cd8078 	strb	r8, [sp, #120]	; 0x78
     668:	e5cd8079 	strb	r8, [sp, #121]	; 0x79
     66c:	e5cd807a 	strb	r8, [sp, #122]	; 0x7a
     670:	e5cda07b 	strb	sl, [sp, #123]	; 0x7b
     674:	e5cd807c 	strb	r8, [sp, #124]	; 0x7c
     678:	e5cd807d 	strb	r8, [sp, #125]	; 0x7d
     67c:	e5cd807e 	strb	r8, [sp, #126]	; 0x7e
     680:	e5cda07f 	strb	sl, [sp, #127]	; 0x7f
     684:	e54e4004 	strb	r4, [lr, #-4]
     688:	e28ee004 	add	lr, lr, #4
     68c:	e54e4007 	strb	r4, [lr, #-7]
     690:	e54e4006 	strb	r4, [lr, #-6]
     694:	e54e5005 	strb	r5, [lr, #-5]
     698:	e15e0006 	cmp	lr, r6
     69c:	1afffff8 	bne	684 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x130>
     6a0:	e28d3080 	add	r3, sp, #128	; 0x80
     6a4:	e3a02d0a 	mov	r2, #640	; 0x280
     6a8:	e59d101c 	ldr	r1, [sp, #28]
     6ac:	e28d6040 	add	r6, sp, #64	; 0x40
     6b0:	e1a00003 	mov	r0, r3
     6b4:	e58d3018 	str	r3, [sp, #24]
     6b8:	ebfffffe 	bl	0 <memcpy>
     6bc:	e1a00007 	mov	r0, r7
     6c0:	ebfffffe 	bl	0 <_Z11GetQuadSize8QuadKind>
     6c4:	e28d402c 	add	r4, sp, #44	; 0x2c
     6c8:	e1a01007 	mov	r1, r7
     6cc:	e58d002c 	str	r0, [sp, #44]	; 0x2c
     6d0:	e1a00006 	mov	r0, r6
     6d4:	ebfffffe 	bl	0 <_Z10CreateQuadP10QuadSquare8QuadKind>
     6d8:	e1a03009 	mov	r3, r9
     6dc:	e1a00006 	mov	r0, r6
     6e0:	e1a01004 	mov	r1, r4
     6e4:	e28d202e 	add	r2, sp, #46	; 0x2e
     6e8:	ebfffffe 	bl	0 <_Z10RotateQuadP10QuadSquareRtS1_12QuadRotation>
     6ec:	e1d4a0b2 	ldrh	sl, [r4, #2]
     6f0:	e1d480b0 	ldrh	r8, [r4]
     6f4:	e35a0000 	cmp	sl, #0
     6f8:	0a000135 	beq	bd4 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x680>
     6fc:	e1a03108 	lsl	r3, r8, #2
     700:	e58d3010 	str	r3, [sp, #16]
     704:	e28a3001 	add	r3, sl, #1
     708:	e58d3014 	str	r3, [sp, #20]
     70c:	e59f34c8 	ldr	r3, [pc, #1224]	; bdc <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x688>
     710:	e28d7030 	add	r7, sp, #48	; 0x30
     714:	e3a09001 	mov	r9, #1
     718:	e3a05000 	mov	r5, #0
     71c:	e08f3003 	add	r3, pc, r3
     720:	e58d3004 	str	r3, [sp, #4]
     724:	e59f34b4 	ldr	r3, [pc, #1204]	; be0 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x68c>
     728:	e08f3003 	add	r3, pc, r3
     72c:	e58d3008 	str	r3, [sp, #8]
     730:	e59f34ac 	ldr	r3, [pc, #1196]	; be4 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x690>
     734:	e08f3003 	add	r3, pc, r3
     738:	e58d300c 	str	r3, [sp, #12]
     73c:	e3580000 	cmp	r8, #0
     740:	13a04000 	movne	r4, #0
     744:	1a00000a 	bne	774 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x220>
     748:	ea000014 	b	7a0 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x24c>
     74c:	e1a03105 	lsl	r3, r5, #2
     750:	e2855001 	add	r5, r5, #1
     754:	e0872003 	add	r2, r7, r3
     758:	e084100b 	add	r1, r4, fp
     75c:	e18710b3 	strh	r1, [r7, r3]
     760:	e069300a 	rsb	r3, r9, sl
     764:	e1c230b2 	strh	r3, [r2, #2]
     768:	e2844001 	add	r4, r4, #1
     76c:	e1580004 	cmp	r8, r4
     770:	0a00000a 	beq	7a0 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x24c>
     774:	e7d63104 	ldrb	r3, [r6, r4, lsl #2]
     778:	e3130001 	tst	r3, #1
     77c:	0afffff9 	beq	768 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x214>
     780:	e3550003 	cmp	r5, #3
     784:	9afffff0 	bls	74c <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x1f8>
     788:	e59d0004 	ldr	r0, [sp, #4]
     78c:	e3001147 	movw	r1, #327	; 0x147
     790:	e59d2008 	ldr	r2, [sp, #8]
     794:	e59d300c 	ldr	r3, [sp, #12]
     798:	ebfffffe 	bl	0 <__assert2>
     79c:	eaffffea 	b	74c <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x1f8>
     7a0:	e59d3010 	ldr	r3, [sp, #16]
     7a4:	e2899001 	add	r9, r9, #1
     7a8:	e0866003 	add	r6, r6, r3
     7ac:	e59d3014 	ldr	r3, [sp, #20]
     7b0:	e1590003 	cmp	r9, r3
     7b4:	1affffe0 	bne	73c <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x1e8>
     7b8:	e3550004 	cmp	r5, #4
     7bc:	0a000007 	beq	7e0 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x28c>
     7c0:	e59f0420 	ldr	r0, [pc, #1056]	; be8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x694>
     7c4:	e300114f 	movw	r1, #335	; 0x14f
     7c8:	e59f241c 	ldr	r2, [pc, #1052]	; bec <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x698>
     7cc:	e59f341c 	ldr	r3, [pc, #1052]	; bf0 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x69c>
     7d0:	e08f0000 	add	r0, pc, r0
     7d4:	e08f2002 	add	r2, pc, r2
     7d8:	e08f3003 	add	r3, pc, r3
     7dc:	ebfffffe 	bl	0 <__assert2>
     7e0:	e1d720be 	ldrh	r2, [r7, #14]
     7e4:	e6bf3072 	sxth	r3, r2
     7e8:	e3530013 	cmp	r3, #19
     7ec:	ca0000f5 	bgt	bc8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x674>
     7f0:	e1d710ba 	ldrh	r1, [r7, #10]
     7f4:	e1d790bc 	ldrh	r9, [r7, #12]
     7f8:	e6bf3071 	sxth	r3, r1
     7fc:	e3530013 	cmp	r3, #19
     800:	ca0000f0 	bgt	bc8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x674>
     804:	e1d700b6 	ldrh	r0, [r7, #6]
     808:	e1d780b8 	ldrh	r8, [r7, #8]
     80c:	e6bf3070 	sxth	r3, r0
     810:	e3530013 	cmp	r3, #19
     814:	ca0000eb 	bgt	bc8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x674>
     818:	e1d730b2 	ldrh	r3, [r7, #2]
     81c:	e1d760b4 	ldrh	r6, [r7, #4]
     820:	e6bfc073 	sxth	ip, r3
     824:	e35c0013 	cmp	ip, #19
     828:	ca0000e6 	bgt	bc8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x674>
     82c:	e6ff4072 	uxth	r4, r2
     830:	e6ffb073 	uxth	fp, r3
     834:	e6ffc070 	uxth	ip, r0
     838:	e26b5013 	rsb	r5, fp, #19
     83c:	e6ffe071 	uxth	lr, r1
     840:	e1a0a004 	mov	sl, r4
     844:	e58dc020 	str	ip, [sp, #32]
     848:	e6ff5075 	uxth	r5, r5
     84c:	e58d4008 	str	r4, [sp, #8]
     850:	e26c4013 	rsb	r4, ip, #19
     854:	e26ac013 	rsb	ip, sl, #19
     858:	e1d7a0b0 	ldrh	sl, [r7]
     85c:	e58de010 	str	lr, [sp, #16]
     860:	e26ee013 	rsb	lr, lr, #19
     864:	e2855001 	add	r5, r5, #1
     868:	e6ff4074 	uxth	r4, r4
     86c:	e58d5024 	str	r5, [sp, #36]	; 0x24
     870:	e2844001 	add	r4, r4, #1
     874:	e59d501c 	ldr	r5, [sp, #28]
     878:	e6ffe07e 	uxth	lr, lr
     87c:	e6ffc07c 	uxth	ip, ip
     880:	e58d4014 	str	r4, [sp, #20]
     884:	e6bf9079 	sxth	r9, r9
     888:	e1a04002 	mov	r4, r2
     88c:	e6bf8078 	sxth	r8, r8
     890:	e6bf6076 	sxth	r6, r6
     894:	e6bfa07a 	sxth	sl, sl
     898:	e28ee001 	add	lr, lr, #1
     89c:	e28cc001 	add	ip, ip, #1
     8a0:	e58de00c 	str	lr, [sp, #12]
     8a4:	e58dc004 	str	ip, [sp, #4]
     8a8:	e1a02001 	mov	r2, r1
     8ac:	e3a0c000 	mov	ip, #0
     8b0:	e3a0e008 	mov	lr, #8
     8b4:	e1a01004 	mov	r1, r4
     8b8:	e1019e81 	smlabb	r1, r1, lr, r9
     8bc:	e3a04008 	mov	r4, #8
     8c0:	e1028e82 	smlabb	r2, r2, lr, r8
     8c4:	e1006e80 	smlabb	r0, r0, lr, r6
     8c8:	e7d51101 	ldrb	r1, [r5, r1, lsl #2]
     8cc:	e103ae83 	smlabb	r3, r3, lr, sl
     8d0:	e3110001 	tst	r1, #1
     8d4:	1a0000a2 	bne	b64 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x610>
     8d8:	e7d52102 	ldrb	r2, [r5, r2, lsl #2]
     8dc:	e3120001 	tst	r2, #1
     8e0:	1a00009f 	bne	b64 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x610>
     8e4:	e7d52100 	ldrb	r2, [r5, r0, lsl #2]
     8e8:	e3120001 	tst	r2, #1
     8ec:	1a00009c 	bne	b64 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x610>
     8f0:	e7d53103 	ldrb	r3, [r5, r3, lsl #2]
     8f4:	e2133001 	ands	r3, r3, #1
     8f8:	1a000099 	bne	b64 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x610>
     8fc:	e1d710b0 	ldrh	r1, [r7]
     900:	e6ffc07c 	uxth	ip, ip
     904:	e1d760b2 	ldrh	r6, [r7, #2]
     908:	e1a0e003 	mov	lr, r3
     90c:	e1d750b4 	ldrh	r5, [r7, #4]
     910:	e08c6006 	add	r6, ip, r6
     914:	e6bf1071 	sxth	r1, r1
     918:	e1d7a0b6 	ldrh	sl, [r7, #6]
     91c:	e1d700b8 	ldrh	r0, [r7, #8]
     920:	e6bf5075 	sxth	r5, r5
     924:	e1061486 	smlabb	r6, r6, r4, r1
     928:	e08ca00a 	add	sl, ip, sl
     92c:	e1d710ba 	ldrh	r1, [r7, #10]
     930:	e6bf9070 	sxth	r9, r0
     934:	e1d780bc 	ldrh	r8, [r7, #12]
     938:	e08c0001 	add	r0, ip, r1
     93c:	e1d770be 	ldrh	r7, [r7, #14]
     940:	e105548a 	smlabb	r5, sl, r4, r5
     944:	e08cc007 	add	ip, ip, r7
     948:	e1009480 	smlabb	r0, r0, r4, r9
     94c:	e6bf1078 	sxth	r1, r8
     950:	e28d7c03 	add	r7, sp, #768	; 0x300
     954:	e59db018 	ldr	fp, [sp, #24]
     958:	e101148c 	smlabb	r1, ip, r4, r1
     95c:	e0876106 	add	r6, r7, r6, lsl #2
     960:	e087c105 	add	ip, r7, r5, lsl #2
     964:	e1a0200b 	mov	r2, fp
     968:	e5564280 	ldrb	r4, [r6, #-640]	; 0x280
     96c:	e0870100 	add	r0, r7, r0, lsl #2
     970:	e3844001 	orr	r4, r4, #1
     974:	e5464280 	strb	r4, [r6, #-640]	; 0x280
     978:	e55c4280 	ldrb	r4, [ip, #-640]	; 0x280
     97c:	e0871101 	add	r1, r7, r1, lsl #2
     980:	e3844001 	orr	r4, r4, #1
     984:	e54c4280 	strb	r4, [ip, #-640]	; 0x280
     988:	e550c280 	ldrb	ip, [r0, #-640]	; 0x280
     98c:	e1a0400b 	mov	r4, fp
     990:	e38cc001 	orr	ip, ip, #1
     994:	e540c280 	strb	ip, [r0, #-640]	; 0x280
     998:	e5510280 	ldrb	r0, [r1, #-640]	; 0x280
     99c:	e3800001 	orr	r0, r0, #1
     9a0:	e5410280 	strb	r0, [r1, #-640]	; 0x280
     9a4:	e7d4128e 	ldrb	r1, [r4, lr, lsl #5]
     9a8:	e5d2c004 	ldrb	ip, [r2, #4]
     9ac:	e3110001 	tst	r1, #1
     9b0:	05d20020 	ldrbeq	r0, [r2, #32]
     9b4:	13a00000 	movne	r0, #0
     9b8:	03a01001 	moveq	r1, #1
     9bc:	11a01000 	movne	r1, r0
     9c0:	00000001 	andeq	r0, r0, r1
     9c4:	e31c0001 	tst	ip, #1
     9c8:	1a000003 	bne	9dc <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x488>
     9cc:	e5d2c024 	ldrb	ip, [r2, #36]	; 0x24
     9d0:	e2811001 	add	r1, r1, #1
     9d4:	e31c0001 	tst	ip, #1
     9d8:	12800001 	addne	r0, r0, #1
     9dc:	e5d2c008 	ldrb	ip, [r2, #8]
     9e0:	e31c0001 	tst	ip, #1
     9e4:	1a000003 	bne	9f8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x4a4>
     9e8:	e5d2c028 	ldrb	ip, [r2, #40]	; 0x28
     9ec:	e2811001 	add	r1, r1, #1
     9f0:	e31c0001 	tst	ip, #1
     9f4:	12800001 	addne	r0, r0, #1
     9f8:	e5d2c00c 	ldrb	ip, [r2, #12]
     9fc:	e31c0001 	tst	ip, #1
     a00:	1a000003 	bne	a14 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x4c0>
     a04:	e5d2c02c 	ldrb	ip, [r2, #44]	; 0x2c
     a08:	e2811001 	add	r1, r1, #1
     a0c:	e31c0001 	tst	ip, #1
     a10:	12800001 	addne	r0, r0, #1
     a14:	e5d2c010 	ldrb	ip, [r2, #16]
     a18:	e31c0001 	tst	ip, #1
     a1c:	1a000003 	bne	a30 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x4dc>
     a20:	e5d2c030 	ldrb	ip, [r2, #48]	; 0x30
     a24:	e2811001 	add	r1, r1, #1
     a28:	e31c0001 	tst	ip, #1
     a2c:	12800001 	addne	r0, r0, #1
     a30:	e5d2c014 	ldrb	ip, [r2, #20]
     a34:	e31c0001 	tst	ip, #1
     a38:	1a000003 	bne	a4c <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x4f8>
     a3c:	e5d2c034 	ldrb	ip, [r2, #52]	; 0x34
     a40:	e2811001 	add	r1, r1, #1
     a44:	e31c0001 	tst	ip, #1
     a48:	12800001 	addne	r0, r0, #1
     a4c:	e5d2c018 	ldrb	ip, [r2, #24]
     a50:	e31c0001 	tst	ip, #1
     a54:	1a000003 	bne	a68 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x514>
     a58:	e5d2c038 	ldrb	ip, [r2, #56]	; 0x38
     a5c:	e2811001 	add	r1, r1, #1
     a60:	e31c0001 	tst	ip, #1
     a64:	12800001 	addne	r0, r0, #1
     a68:	e5d2c01c 	ldrb	ip, [r2, #28]
     a6c:	e31c0001 	tst	ip, #1
     a70:	1a000005 	bne	a8c <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x538>
     a74:	e5d2c03c 	ldrb	ip, [r2, #60]	; 0x3c
     a78:	e2811001 	add	r1, r1, #1
     a7c:	e31c0001 	tst	ip, #1
     a80:	12800001 	addne	r0, r0, #1
     a84:	e3510008 	cmp	r1, #8
     a88:	0a000004 	beq	aa0 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x54c>
     a8c:	e28ee001 	add	lr, lr, #1
     a90:	e0833000 	add	r3, r3, r0
     a94:	e35e0013 	cmp	lr, #19
     a98:	e2822020 	add	r2, r2, #32
     a9c:	1affffc0 	bne	9a4 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x450>
     aa0:	e59d0018 	ldr	r0, [sp, #24]
     aa4:	e3a02000 	mov	r2, #0
     aa8:	e7d01282 	ldrb	r1, [r0, r2, lsl #5]
     aac:	e3110001 	tst	r1, #1
     ab0:	0a000002 	beq	ac0 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x56c>
     ab4:	e2822001 	add	r2, r2, #1
     ab8:	e3520014 	cmp	r2, #20
     abc:	1afffff9 	bne	aa8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x554>
     ac0:	e59d5018 	ldr	r5, [sp, #24]
     ac4:	e1a0e002 	mov	lr, r2
     ac8:	e3a04001 	mov	r4, #1
     acc:	e35e0013 	cmp	lr, #19
     ad0:	8a00001d 	bhi	b4c <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x5f8>
     ad4:	e084c18e 	add	ip, r4, lr, lsl #3
     ad8:	e7d5010c 	ldrb	r0, [r5, ip, lsl #2]
     adc:	e085c10c 	add	ip, r5, ip, lsl #2
     ae0:	e2100001 	ands	r0, r0, #1
     ae4:	0a000008 	beq	b0c <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x5b8>
     ae8:	e26e0014 	rsb	r0, lr, #20
     aec:	e3a02000 	mov	r2, #0
     af0:	ea000002 	b	b00 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x5ac>
     af4:	e7dc1282 	ldrb	r1, [ip, r2, lsl #5]
     af8:	e3110001 	tst	r1, #1
     afc:	0a00000c 	beq	b34 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x5e0>
     b00:	e2822001 	add	r2, r2, #1
     b04:	e1520000 	cmp	r2, r0
     b08:	1afffff9 	bne	af4 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x5a0>
     b0c:	e2844001 	add	r4, r4, #1
     b10:	e080e00e 	add	lr, r0, lr
     b14:	e3540008 	cmp	r4, #8
     b18:	1affffeb 	bne	acc <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x578>
     b1c:	e0632e83 	rsb	r2, r3, r3, lsl #29
     b20:	e0633102 	rsb	r3, r3, r2, lsl #2
     b24:	e06e2083 	rsb	r2, lr, r3, lsl #1
     b28:	e2820f82 	add	r0, r2, #520	; 0x208
     b2c:	e28ddfc1 	add	sp, sp, #772	; 0x304
     b30:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     b34:	e2844001 	add	r4, r4, #1
     b38:	e1a00002 	mov	r0, r2
     b3c:	e3540008 	cmp	r4, #8
     b40:	e080e00e 	add	lr, r0, lr
     b44:	1affffe0 	bne	acc <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x578>
     b48:	eafffff3 	b	b1c <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x5c8>
     b4c:	e2844001 	add	r4, r4, #1
     b50:	e3a00000 	mov	r0, #0
     b54:	e3540008 	cmp	r4, #8
     b58:	e080e00e 	add	lr, r0, lr
     b5c:	1affffda 	bne	acc <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x578>
     b60:	eaffffed 	b	b1c <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x5c8>
     b64:	e28cc001 	add	ip, ip, #1
     b68:	e59d3004 	ldr	r3, [sp, #4]
     b6c:	e59d2008 	ldr	r2, [sp, #8]
     b70:	e15c0003 	cmp	ip, r3
     b74:	e6ff307c 	uxth	r3, ip
     b78:	e0831002 	add	r1, r3, r2
     b7c:	e59d0020 	ldr	r0, [sp, #32]
     b80:	e59d2010 	ldr	r2, [sp, #16]
     b84:	e0830000 	add	r0, r3, r0
     b88:	e6ff1071 	uxth	r1, r1
     b8c:	e0832002 	add	r2, r3, r2
     b90:	e083300b 	add	r3, r3, fp
     b94:	0a00000b 	beq	bc8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x674>
     b98:	e59d400c 	ldr	r4, [sp, #12]
     b9c:	e6ff2072 	uxth	r2, r2
     ba0:	e6ff0070 	uxth	r0, r0
     ba4:	e6ff3073 	uxth	r3, r3
     ba8:	e15c0004 	cmp	ip, r4
     bac:	0a000005 	beq	bc8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x674>
     bb0:	e59d4014 	ldr	r4, [sp, #20]
     bb4:	e15c0004 	cmp	ip, r4
     bb8:	0a000002 	beq	bc8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x674>
     bbc:	e59d4024 	ldr	r4, [sp, #36]	; 0x24
     bc0:	e15c0004 	cmp	ip, r4
     bc4:	1affff3b 	bne	8b8 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x364>
     bc8:	e3a00000 	mov	r0, #0
     bcc:	e28ddfc1 	add	sp, sp, #772	; 0x304
     bd0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     bd4:	e28d7030 	add	r7, sp, #48	; 0x30
     bd8:	eafffef8 	b	7c0 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation+0x26c>
     bdc:	000004b8 	.word	0x000004b8
     be0:	000004b0 	.word	0x000004b0
     be4:	000004a8 	.word	0x000004a8
     be8:	00000410 	.word	0x00000410
     bec:	00000410 	.word	0x00000410
     bf0:	00000410 	.word	0x00000410

00000bf4 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE>:
     bf4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     bf8:	e24dd024 	sub	sp, sp, #36	; 0x24
     bfc:	e1a06000 	mov	r6, r0
     c00:	e1a00001 	mov	r0, r1
     c04:	e1a07002 	mov	r7, r2
     c08:	e1a0b003 	mov	fp, r3
     c0c:	e1a05001 	mov	r5, r1
     c10:	e59d8048 	ldr	r8, [sp, #72]	; 0x48
     c14:	ebfffffe 	bl	0 <_Z11GetQuadSize8QuadKind>
     c18:	e28d4020 	add	r4, sp, #32
     c1c:	e1a01005 	mov	r1, r5
     c20:	e5240004 	str	r0, [r4, #-4]!
     c24:	e1a00006 	mov	r0, r6
     c28:	ebfffffe 	bl	0 <_Z10CreateQuadP10QuadSquare8QuadKind>
     c2c:	e1a03007 	mov	r3, r7
     c30:	e1a00006 	mov	r0, r6
     c34:	e1a01004 	mov	r1, r4
     c38:	e28d201e 	add	r2, sp, #30
     c3c:	ebfffffe 	bl	0 <_Z10RotateQuadP10QuadSquareRtS1_12QuadRotation>
     c40:	e1dda1be 	ldrh	sl, [sp, #30]
     c44:	e1dd71bc 	ldrh	r7, [sp, #28]
     c48:	e35a0000 	cmp	sl, #0
     c4c:	0a00002f 	beq	d10 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0x11c>
     c50:	e1a03107 	lsl	r3, r7, #2
     c54:	e58d3010 	str	r3, [sp, #16]
     c58:	e28a3001 	add	r3, sl, #1
     c5c:	e58d3014 	str	r3, [sp, #20]
     c60:	e59f30d0 	ldr	r3, [pc, #208]	; d38 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0x144>
     c64:	e3a09001 	mov	r9, #1
     c68:	e3a05000 	mov	r5, #0
     c6c:	e08f3003 	add	r3, pc, r3
     c70:	e58d3004 	str	r3, [sp, #4]
     c74:	e59f30c0 	ldr	r3, [pc, #192]	; d3c <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0x148>
     c78:	e08f3003 	add	r3, pc, r3
     c7c:	e58d3008 	str	r3, [sp, #8]
     c80:	e59f30b8 	ldr	r3, [pc, #184]	; d40 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0x14c>
     c84:	e08f3003 	add	r3, pc, r3
     c88:	e58d300c 	str	r3, [sp, #12]
     c8c:	e3570000 	cmp	r7, #0
     c90:	13a04000 	movne	r4, #0
     c94:	1a00000a 	bne	cc4 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0xd0>
     c98:	ea000014 	b	cf0 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0xfc>
     c9c:	e1a03105 	lsl	r3, r5, #2
     ca0:	e2855001 	add	r5, r5, #1
     ca4:	e0882003 	add	r2, r8, r3
     ca8:	e084100b 	add	r1, r4, fp
     cac:	e18810b3 	strh	r1, [r8, r3]
     cb0:	e069300a 	rsb	r3, r9, sl
     cb4:	e1c230b2 	strh	r3, [r2, #2]
     cb8:	e2844001 	add	r4, r4, #1
     cbc:	e1570004 	cmp	r7, r4
     cc0:	0a00000a 	beq	cf0 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0xfc>
     cc4:	e7d63104 	ldrb	r3, [r6, r4, lsl #2]
     cc8:	e3130001 	tst	r3, #1
     ccc:	0afffff9 	beq	cb8 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0xc4>
     cd0:	e3550003 	cmp	r5, #3
     cd4:	9afffff0 	bls	c9c <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0xa8>
     cd8:	e59d0004 	ldr	r0, [sp, #4]
     cdc:	e3001147 	movw	r1, #327	; 0x147
     ce0:	e59d2008 	ldr	r2, [sp, #8]
     ce4:	e59d300c 	ldr	r3, [sp, #12]
     ce8:	ebfffffe 	bl	0 <__assert2>
     cec:	eaffffea 	b	c9c <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0xa8>
     cf0:	e59d3010 	ldr	r3, [sp, #16]
     cf4:	e2899001 	add	r9, r9, #1
     cf8:	e0866003 	add	r6, r6, r3
     cfc:	e59d3014 	ldr	r3, [sp, #20]
     d00:	e1590003 	cmp	r9, r3
     d04:	1affffe0 	bne	c8c <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0x98>
     d08:	e3550004 	cmp	r5, #4
     d0c:	0a000007 	beq	d30 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0x13c>
     d10:	e59f002c 	ldr	r0, [pc, #44]	; d44 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0x150>
     d14:	e300114f 	movw	r1, #335	; 0x14f
     d18:	e59f2028 	ldr	r2, [pc, #40]	; d48 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0x154>
     d1c:	e59f3028 	ldr	r3, [pc, #40]	; d4c <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE+0x158>
     d20:	e08f0000 	add	r0, pc, r0
     d24:	e08f2002 	add	r2, pc, r2
     d28:	e08f3003 	add	r3, pc, r3
     d2c:	ebfffffe 	bl	0 <__assert2>
     d30:	e28dd024 	add	sp, sp, #36	; 0x24
     d34:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     d38:	000000c4 	.word	0x000000c4
     d3c:	000000bc 	.word	0x000000bc
     d40:	000000b4 	.word	0x000000b4
     d44:	0000001c 	.word	0x0000001c
     d48:	0000001c 	.word	0x0000001c
     d4c:	0000001c 	.word	0x0000001c

00000d50 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind>:
     d50:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     d54:	e24dd0bc 	sub	sp, sp, #188	; 0xbc
     d58:	e1a0b000 	mov	fp, r0
     d5c:	e58d2038 	str	r2, [sp, #56]	; 0x38
     d60:	e1a02000 	mov	r2, r0
     d64:	e58d3024 	str	r3, [sp, #36]	; 0x24
     d68:	e3a03000 	mov	r3, #0
     d6c:	e58d1010 	str	r1, [sp, #16]
     d70:	ea000003 	b	d84 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x34>
     d74:	e2833001 	add	r3, r3, #1
     d78:	e2822020 	add	r2, r2, #32
     d7c:	e3530014 	cmp	r3, #20
     d80:	0a00004a 	beq	eb0 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x160>
     d84:	e5d20004 	ldrb	r0, [r2, #4]
     d88:	e7db1283 	ldrb	r1, [fp, r3, lsl #5]
     d8c:	e3100001 	tst	r0, #1
     d90:	e5d20008 	ldrb	r0, [r2, #8]
     d94:	e2011001 	and	r1, r1, #1
     d98:	12811001 	addne	r1, r1, #1
     d9c:	e3100001 	tst	r0, #1
     da0:	e5d2000c 	ldrb	r0, [r2, #12]
     da4:	12811001 	addne	r1, r1, #1
     da8:	e3100001 	tst	r0, #1
     dac:	e5d20010 	ldrb	r0, [r2, #16]
     db0:	12811001 	addne	r1, r1, #1
     db4:	e3100001 	tst	r0, #1
     db8:	e5d20014 	ldrb	r0, [r2, #20]
     dbc:	12811001 	addne	r1, r1, #1
     dc0:	e3100001 	tst	r0, #1
     dc4:	e5d20018 	ldrb	r0, [r2, #24]
     dc8:	12811001 	addne	r1, r1, #1
     dcc:	e3100001 	tst	r0, #1
     dd0:	0affffe7 	beq	d74 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x24>
     dd4:	e5d2001c 	ldrb	r0, [r2, #28]
     dd8:	e3100001 	tst	r0, #1
     ddc:	0affffe4 	beq	d74 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x24>
     de0:	e3510006 	cmp	r1, #6
     de4:	1affffe2 	bne	d74 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x24>
     de8:	e1a01003 	mov	r1, r3
     dec:	e3510013 	cmp	r1, #19
     df0:	0a000109 	beq	121c <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x4cc>
     df4:	e2814001 	add	r4, r1, #1
     df8:	e08b3281 	add	r3, fp, r1, lsl #5
     dfc:	e1a02184 	lsl	r2, r4, #3
     e00:	e2826008 	add	r6, r2, #8
     e04:	e2835020 	add	r5, r3, #32
     e08:	e1520006 	cmp	r2, r6
     e0c:	e1a00003 	mov	r0, r3
     e10:	e1a01005 	mov	r1, r5
     e14:	e3a02020 	mov	r2, #32
     e18:	e2844001 	add	r4, r4, #1
     e1c:	2a000000 	bcs	e24 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0xd4>
     e20:	ebfffffe 	bl	0 <memmove>
     e24:	e3540014 	cmp	r4, #20
     e28:	e1a02006 	mov	r2, r6
     e2c:	e1a03005 	mov	r3, r5
     e30:	1afffff2 	bne	e00 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0xb0>
     e34:	e1a0300b 	mov	r3, fp
     e38:	e3a01000 	mov	r1, #0
     e3c:	e5d30004 	ldrb	r0, [r3, #4]
     e40:	e7db2281 	ldrb	r2, [fp, r1, lsl #5]
     e44:	e3100001 	tst	r0, #1
     e48:	e5d30008 	ldrb	r0, [r3, #8]
     e4c:	e2022001 	and	r2, r2, #1
     e50:	12822001 	addne	r2, r2, #1
     e54:	e3100001 	tst	r0, #1
     e58:	e5d3000c 	ldrb	r0, [r3, #12]
     e5c:	12822001 	addne	r2, r2, #1
     e60:	e3100001 	tst	r0, #1
     e64:	e5d30010 	ldrb	r0, [r3, #16]
     e68:	12822001 	addne	r2, r2, #1
     e6c:	e3100001 	tst	r0, #1
     e70:	e5d30014 	ldrb	r0, [r3, #20]
     e74:	12822001 	addne	r2, r2, #1
     e78:	e3100001 	tst	r0, #1
     e7c:	e5d30018 	ldrb	r0, [r3, #24]
     e80:	12822001 	addne	r2, r2, #1
     e84:	e3100001 	tst	r0, #1
     e88:	0a000004 	beq	ea0 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x150>
     e8c:	e5d3001c 	ldrb	r0, [r3, #28]
     e90:	e3100001 	tst	r0, #1
     e94:	0a000001 	beq	ea0 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x150>
     e98:	e3520006 	cmp	r2, #6
     e9c:	0affffd2 	beq	dec <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x9c>
     ea0:	e2811001 	add	r1, r1, #1
     ea4:	e2833020 	add	r3, r3, #32
     ea8:	e3510014 	cmp	r1, #20
     eac:	1affffe2 	bne	e3c <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0xec>
     eb0:	e59d7024 	ldr	r7, [sp, #36]	; 0x24
     eb4:	e3a09000 	mov	r9, #0
     eb8:	e1a06009 	mov	r6, r9
     ebc:	e1a05009 	mov	r5, r9
     ec0:	e58d9008 	str	r9, [sp, #8]
     ec4:	e1a00007 	mov	r0, r7
     ec8:	e1a01009 	mov	r1, r9
     ecc:	ebfffffe 	bl	0 <_Z11GetQuadSize8QuadKind12QuadRotation>
     ed0:	e6ff8070 	uxth	r8, r0
     ed4:	e58d0078 	str	r0, [sp, #120]	; 0x78
     ed8:	e2684008 	rsb	r4, r8, #8
     edc:	e3540000 	cmp	r4, #0
     ee0:	da000010 	ble	f28 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x1d8>
     ee4:	e3a0a000 	mov	sl, #0
     ee8:	e1a03008 	mov	r3, r8
     eec:	e1a0800a 	mov	r8, sl
     ef0:	e1a0a003 	mov	sl, r3
     ef4:	e1a01008 	mov	r1, r8
     ef8:	e1a0000b 	mov	r0, fp
     efc:	e1a02007 	mov	r2, r7
     f00:	e1a03009 	mov	r3, r9
     f04:	ebfffffe 	bl	554 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation>
     f08:	e1500005 	cmp	r0, r5
     f0c:	858d8008 	strhi	r8, [sp, #8]
     f10:	e2888001 	add	r8, r8, #1
     f14:	858d9018 	strhi	r9, [sp, #24]
     f18:	81a05000 	movhi	r5, r0
     f1c:	81a0600a 	movhi	r6, sl
     f20:	e1580004 	cmp	r8, r4
     f24:	1afffff2 	bne	ef4 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x1a4>
     f28:	e2899001 	add	r9, r9, #1
     f2c:	e3590004 	cmp	r9, #4
     f30:	1affffe3 	bne	ec4 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x174>
     f34:	e59d9028 	ldr	r9, [sp, #40]	; 0x28
     f38:	e3a04000 	mov	r4, #0
     f3c:	e59d7024 	ldr	r7, [sp, #36]	; 0x24
     f40:	e1a0a004 	mov	sl, r4
     f44:	e59d3008 	ldr	r3, [sp, #8]
     f48:	e1a05004 	mov	r5, r4
     f4c:	e0836006 	add	r6, r3, r6
     f50:	e58d600c 	str	r6, [sp, #12]
     f54:	e1a00007 	mov	r0, r7
     f58:	e1a01004 	mov	r1, r4
     f5c:	ebfffffe 	bl	0 <_Z11GetQuadSize8QuadKind12QuadRotation>
     f60:	e6ff8070 	uxth	r8, r0
     f64:	e58d0078 	str	r0, [sp, #120]	; 0x78
     f68:	e2786008 	rsbs	r6, r8, #8
     f6c:	5a000007 	bpl	f90 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x240>
     f70:	ea000016 	b	fd0 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x280>
     f74:	e59d2008 	ldr	r2, [sp, #8]
     f78:	e1530002 	cmp	r3, r2
     f7c:	b1a0a006 	movlt	sl, r6
     f80:	b1a09004 	movlt	r9, r4
     f84:	b1a05000 	movlt	r5, r0
     f88:	e2566001 	subs	r6, r6, #1
     f8c:	3a00000f 	bcc	fd0 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x280>
     f90:	e1a0000b 	mov	r0, fp
     f94:	e1a01006 	mov	r1, r6
     f98:	e1a02007 	mov	r2, r7
     f9c:	e1a03004 	mov	r3, r4
     fa0:	ebfffffe 	bl	554 <_ZN2AI14EvaluateMatrixEPK10QuadSquarei8QuadKind12QuadRotation>
     fa4:	e1500005 	cmp	r0, r5
     fa8:	9afffff6 	bls	f88 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x238>
     fac:	e59d200c 	ldr	r2, [sp, #12]
     fb0:	e0863008 	add	r3, r6, r8
     fb4:	e1520006 	cmp	r2, r6
     fb8:	caffffed 	bgt	f74 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x224>
     fbc:	e1a0a006 	mov	sl, r6
     fc0:	e2566001 	subs	r6, r6, #1
     fc4:	e1a05000 	mov	r5, r0
     fc8:	e1a09004 	mov	r9, r4
     fcc:	2affffef 	bcs	f90 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x240>
     fd0:	e2844001 	add	r4, r4, #1
     fd4:	e3540004 	cmp	r4, #4
     fd8:	1affffdd 	bne	f54 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x204>
     fdc:	e59d3010 	ldr	r3, [sp, #16]
     fe0:	e58d9028 	str	r9, [sp, #40]	; 0x28
     fe4:	e28d9068 	add	r9, sp, #104	; 0x68
     fe8:	e2833004 	add	r3, r3, #4
     fec:	e58d3030 	str	r3, [sp, #48]	; 0x30
     ff0:	e3a03000 	mov	r3, #0
     ff4:	e58d302c 	str	r3, [sp, #44]	; 0x2c
     ff8:	e28d3078 	add	r3, sp, #120	; 0x78
     ffc:	e58d3034 	str	r3, [sp, #52]	; 0x34
    1000:	e28d306c 	add	r3, sp, #108	; 0x6c
    1004:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    1008:	e28d3070 	add	r3, sp, #112	; 0x70
    100c:	e58d3040 	str	r3, [sp, #64]	; 0x40
    1010:	e28d3074 	add	r3, sp, #116	; 0x74
    1014:	e58d3044 	str	r3, [sp, #68]	; 0x44
    1018:	e59f34fc 	ldr	r3, [pc, #1276]	; 151c <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x7cc>
    101c:	e58db05c 	str	fp, [sp, #92]	; 0x5c
    1020:	e1a0b00a 	mov	fp, sl
    1024:	e08f3003 	add	r3, pc, r3
    1028:	e58d3010 	str	r3, [sp, #16]
    102c:	e59f34ec 	ldr	r3, [pc, #1260]	; 1520 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x7d0>
    1030:	e08f3003 	add	r3, pc, r3
    1034:	e58d3014 	str	r3, [sp, #20]
    1038:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
    103c:	e3530000 	cmp	r3, #0
    1040:	e3a05000 	mov	r5, #0
    1044:	e3e03000 	mvn	r3, #0
    1048:	e5cd5078 	strb	r5, [sp, #120]	; 0x78
    104c:	e5cd5079 	strb	r5, [sp, #121]	; 0x79
    1050:	e5cd507a 	strb	r5, [sp, #122]	; 0x7a
    1054:	e5cd507c 	strb	r5, [sp, #124]	; 0x7c
    1058:	e5cd507d 	strb	r5, [sp, #125]	; 0x7d
    105c:	e5cd507e 	strb	r5, [sp, #126]	; 0x7e
    1060:	e5cd5080 	strb	r5, [sp, #128]	; 0x80
    1064:	e5cd5081 	strb	r5, [sp, #129]	; 0x81
    1068:	e5cd5082 	strb	r5, [sp, #130]	; 0x82
    106c:	e5cd5084 	strb	r5, [sp, #132]	; 0x84
    1070:	e5cd5085 	strb	r5, [sp, #133]	; 0x85
    1074:	e5cd5086 	strb	r5, [sp, #134]	; 0x86
    1078:	e5cd5088 	strb	r5, [sp, #136]	; 0x88
    107c:	e5cd5089 	strb	r5, [sp, #137]	; 0x89
    1080:	e5cd508a 	strb	r5, [sp, #138]	; 0x8a
    1084:	e5cd508c 	strb	r5, [sp, #140]	; 0x8c
    1088:	e5cd508d 	strb	r5, [sp, #141]	; 0x8d
    108c:	e5cd508e 	strb	r5, [sp, #142]	; 0x8e
    1090:	e5cd5090 	strb	r5, [sp, #144]	; 0x90
    1094:	e5cd5091 	strb	r5, [sp, #145]	; 0x91
    1098:	e5cd5092 	strb	r5, [sp, #146]	; 0x92
    109c:	e5cd5094 	strb	r5, [sp, #148]	; 0x94
    10a0:	e5cd5095 	strb	r5, [sp, #149]	; 0x95
    10a4:	e5cd5096 	strb	r5, [sp, #150]	; 0x96
    10a8:	e5cd5098 	strb	r5, [sp, #152]	; 0x98
    10ac:	e5cd307b 	strb	r3, [sp, #123]	; 0x7b
    10b0:	e5cd307f 	strb	r3, [sp, #127]	; 0x7f
    10b4:	e5cd3083 	strb	r3, [sp, #131]	; 0x83
    10b8:	e5cd3087 	strb	r3, [sp, #135]	; 0x87
    10bc:	e5cd308b 	strb	r3, [sp, #139]	; 0x8b
    10c0:	e5cd308f 	strb	r3, [sp, #143]	; 0x8f
    10c4:	e5cd3093 	strb	r3, [sp, #147]	; 0x93
    10c8:	e5cd3097 	strb	r3, [sp, #151]	; 0x97
    10cc:	e5cd5099 	strb	r5, [sp, #153]	; 0x99
    10d0:	e5cd509a 	strb	r5, [sp, #154]	; 0x9a
    10d4:	e5cd309b 	strb	r3, [sp, #155]	; 0x9b
    10d8:	e5cd509c 	strb	r5, [sp, #156]	; 0x9c
    10dc:	e5cd509d 	strb	r5, [sp, #157]	; 0x9d
    10e0:	e5cd509e 	strb	r5, [sp, #158]	; 0x9e
    10e4:	e5cd309f 	strb	r3, [sp, #159]	; 0x9f
    10e8:	e5cd50a0 	strb	r5, [sp, #160]	; 0xa0
    10ec:	e5cd50a1 	strb	r5, [sp, #161]	; 0xa1
    10f0:	e5cd50a2 	strb	r5, [sp, #162]	; 0xa2
    10f4:	e5cd30a3 	strb	r3, [sp, #163]	; 0xa3
    10f8:	e5cd50a4 	strb	r5, [sp, #164]	; 0xa4
    10fc:	e5cd50a5 	strb	r5, [sp, #165]	; 0xa5
    1100:	e5cd50a6 	strb	r5, [sp, #166]	; 0xa6
    1104:	e5cd30a7 	strb	r3, [sp, #167]	; 0xa7
    1108:	e5cd50a8 	strb	r5, [sp, #168]	; 0xa8
    110c:	e5cd50a9 	strb	r5, [sp, #169]	; 0xa9
    1110:	e5cd50aa 	strb	r5, [sp, #170]	; 0xaa
    1114:	e5cd30ab 	strb	r3, [sp, #171]	; 0xab
    1118:	e5cd50ac 	strb	r5, [sp, #172]	; 0xac
    111c:	e5cd50ad 	strb	r5, [sp, #173]	; 0xad
    1120:	e5cd50ae 	strb	r5, [sp, #174]	; 0xae
    1124:	e5cd30af 	strb	r3, [sp, #175]	; 0xaf
    1128:	e5cd50b0 	strb	r5, [sp, #176]	; 0xb0
    112c:	e5cd50b1 	strb	r5, [sp, #177]	; 0xb1
    1130:	e5cd50b2 	strb	r5, [sp, #178]	; 0xb2
    1134:	e5cd30b3 	strb	r3, [sp, #179]	; 0xb3
    1138:	e5cd50b4 	strb	r5, [sp, #180]	; 0xb4
    113c:	e5cd50b5 	strb	r5, [sp, #181]	; 0xb5
    1140:	e5cd50b6 	strb	r5, [sp, #182]	; 0xb6
    1144:	e5cd30b7 	strb	r3, [sp, #183]	; 0xb7
    1148:	0a0000e9 	beq	14f4 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x7a4>
    114c:	e59d6024 	ldr	r6, [sp, #36]	; 0x24
    1150:	e28d40b8 	add	r4, sp, #184	; 0xb8
    1154:	e1a00006 	mov	r0, r6
    1158:	ebfffffe 	bl	0 <_Z11GetQuadSize8QuadKind>
    115c:	e1a01006 	mov	r1, r6
    1160:	e59d6034 	ldr	r6, [sp, #52]	; 0x34
    1164:	e5240054 	str	r0, [r4, #-84]!	; 0x54
    1168:	e1a00006 	mov	r0, r6
    116c:	ebfffffe 	bl	0 <_Z10CreateQuadP10QuadSquare8QuadKind>
    1170:	e1a00006 	mov	r0, r6
    1174:	e1a01004 	mov	r1, r4
    1178:	e28d2066 	add	r2, sp, #102	; 0x66
    117c:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    1180:	ebfffffe 	bl	0 <_Z10RotateQuadP10QuadSquareRtS1_12QuadRotation>
    1184:	e1dda6b6 	ldrh	sl, [sp, #102]	; 0x66
    1188:	e1dd76b4 	ldrh	r7, [sp, #100]	; 0x64
    118c:	e35a0000 	cmp	sl, #0
    1190:	0a000042 	beq	12a0 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x550>
    1194:	e59d6034 	ldr	r6, [sp, #52]	; 0x34
    1198:	e1a03107 	lsl	r3, r7, #2
    119c:	e58d301c 	str	r3, [sp, #28]
    11a0:	e28a3001 	add	r3, sl, #1
    11a4:	e58d3020 	str	r3, [sp, #32]
    11a8:	e3a08001 	mov	r8, #1
    11ac:	e59f3370 	ldr	r3, [pc, #880]	; 1524 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x7d4>
    11b0:	e08f3003 	add	r3, pc, r3
    11b4:	e58d300c 	str	r3, [sp, #12]
    11b8:	e3570000 	cmp	r7, #0
    11bc:	13a04000 	movne	r4, #0
    11c0:	1a00000a 	bne	11f0 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x4a0>
    11c4:	ea00002d 	b	1280 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x530>
    11c8:	e1a03105 	lsl	r3, r5, #2
    11cc:	e2855001 	add	r5, r5, #1
    11d0:	e0892003 	add	r2, r9, r3
    11d4:	e084100b 	add	r1, r4, fp
    11d8:	e18910b3 	strh	r1, [r9, r3]
    11dc:	e068300a 	rsb	r3, r8, sl
    11e0:	e1c230b2 	strh	r3, [r2, #2]
    11e4:	e2844001 	add	r4, r4, #1
    11e8:	e1570004 	cmp	r7, r4
    11ec:	0a000023 	beq	1280 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x530>
    11f0:	e7d63104 	ldrb	r3, [r6, r4, lsl #2]
    11f4:	e3130001 	tst	r3, #1
    11f8:	0afffff9 	beq	11e4 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x494>
    11fc:	e3550003 	cmp	r5, #3
    1200:	9afffff0 	bls	11c8 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x478>
    1204:	e59d0010 	ldr	r0, [sp, #16]
    1208:	e3001147 	movw	r1, #327	; 0x147
    120c:	e59d200c 	ldr	r2, [sp, #12]
    1210:	e59d3014 	ldr	r3, [sp, #20]
    1214:	ebfffffe 	bl	0 <__assert2>
    1218:	eaffffea 	b	11c8 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x478>
    121c:	e5db5260 	ldrb	r5, [fp, #608]	; 0x260
    1220:	e5db4264 	ldrb	r4, [fp, #612]	; 0x264
    1224:	e5dbe268 	ldrb	lr, [fp, #616]	; 0x268
    1228:	e3c55001 	bic	r5, r5, #1
    122c:	e5dbc26c 	ldrb	ip, [fp, #620]	; 0x26c
    1230:	e3c44001 	bic	r4, r4, #1
    1234:	e5db0270 	ldrb	r0, [fp, #624]	; 0x270
    1238:	e3cee001 	bic	lr, lr, #1
    123c:	e5db1274 	ldrb	r1, [fp, #628]	; 0x274
    1240:	e3ccc001 	bic	ip, ip, #1
    1244:	e5db2278 	ldrb	r2, [fp, #632]	; 0x278
    1248:	e3c00001 	bic	r0, r0, #1
    124c:	e5db327c 	ldrb	r3, [fp, #636]	; 0x27c
    1250:	e3c11001 	bic	r1, r1, #1
    1254:	e3c22001 	bic	r2, r2, #1
    1258:	e5cb5260 	strb	r5, [fp, #608]	; 0x260
    125c:	e3c33001 	bic	r3, r3, #1
    1260:	e5cb4264 	strb	r4, [fp, #612]	; 0x264
    1264:	e5cbe268 	strb	lr, [fp, #616]	; 0x268
    1268:	e5cbc26c 	strb	ip, [fp, #620]	; 0x26c
    126c:	e5cb0270 	strb	r0, [fp, #624]	; 0x270
    1270:	e5cb1274 	strb	r1, [fp, #628]	; 0x274
    1274:	e5cb2278 	strb	r2, [fp, #632]	; 0x278
    1278:	e5cb327c 	strb	r3, [fp, #636]	; 0x27c
    127c:	eafffeec 	b	e34 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0xe4>
    1280:	e59d301c 	ldr	r3, [sp, #28]
    1284:	e2888001 	add	r8, r8, #1
    1288:	e0866003 	add	r6, r6, r3
    128c:	e59d3020 	ldr	r3, [sp, #32]
    1290:	e1580003 	cmp	r8, r3
    1294:	1affffc7 	bne	11b8 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x468>
    1298:	e3550004 	cmp	r5, #4
    129c:	0a000007 	beq	12c0 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x570>
    12a0:	e59f0280 	ldr	r0, [pc, #640]	; 1528 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x7d8>
    12a4:	e300114f 	movw	r1, #335	; 0x14f
    12a8:	e59f227c 	ldr	r2, [pc, #636]	; 152c <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x7dc>
    12ac:	e59f327c 	ldr	r3, [pc, #636]	; 1530 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x7e0>
    12b0:	e08f0000 	add	r0, pc, r0
    12b4:	e08f2002 	add	r2, pc, r2
    12b8:	e08f3003 	add	r3, pc, r3
    12bc:	ebfffffe 	bl	0 <__assert2>
    12c0:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    12c4:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
    12c8:	e5832004 	str	r2, [r3, #4]
    12cc:	e1dd27b6 	ldrh	r2, [sp, #118]	; 0x76
    12d0:	e6bf3072 	sxth	r3, r2
    12d4:	e6ffa072 	uxth	sl, r2
    12d8:	e3530013 	cmp	r3, #19
    12dc:	ca000066 	bgt	147c <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x72c>
    12e0:	e1dd37b4 	ldrh	r3, [sp, #116]	; 0x74
    12e4:	e1dd17b2 	ldrh	r1, [sp, #114]	; 0x72
    12e8:	e1a00003 	mov	r0, r3
    12ec:	e6bf3071 	sxth	r3, r1
    12f0:	e3530013 	cmp	r3, #19
    12f4:	ca000060 	bgt	147c <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x72c>
    12f8:	e1dd36be 	ldrh	r3, [sp, #110]	; 0x6e
    12fc:	e1ddc7b0 	ldrh	ip, [sp, #112]	; 0x70
    1300:	e58d300c 	str	r3, [sp, #12]
    1304:	e6bf3073 	sxth	r3, r3
    1308:	e3530013 	cmp	r3, #19
    130c:	e58dc020 	str	ip, [sp, #32]
    1310:	ca000059 	bgt	147c <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x72c>
    1314:	e1dd36ba 	ldrh	r3, [sp, #106]	; 0x6a
    1318:	e6ff8071 	uxth	r8, r1
    131c:	e1dde6bc 	ldrh	lr, [sp, #108]	; 0x6c
    1320:	e1dd70bc 	ldrh	r7, [sp, #12]
    1324:	e6bfc073 	sxth	ip, r3
    1328:	e6ff6073 	uxth	r6, r3
    132c:	e35c0013 	cmp	ip, #19
    1330:	e58de048 	str	lr, [sp, #72]	; 0x48
    1334:	ca00006c 	bgt	14ec <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x79c>
    1338:	e1dd46b8 	ldrh	r4, [sp, #104]	; 0x68
    133c:	e267c013 	rsb	ip, r7, #19
    1340:	e6bf0070 	sxth	r0, r0
    1344:	e58dc01c 	str	ip, [sp, #28]
    1348:	e268e013 	rsb	lr, r8, #19
    134c:	e26ac013 	rsb	ip, sl, #19
    1350:	e58d4050 	str	r4, [sp, #80]	; 0x50
    1354:	e2665013 	rsb	r5, r6, #19
    1358:	e1dd41bc 	ldrh	r4, [sp, #28]
    135c:	e6ffe07e 	uxth	lr, lr
    1360:	e58d001c 	str	r0, [sp, #28]
    1364:	e6ffc07c 	uxth	ip, ip
    1368:	e1dd02f0 	ldrsh	r0, [sp, #32]
    136c:	e6ff5075 	uxth	r5, r5
    1370:	e2855001 	add	r5, r5, #1
    1374:	e58d0020 	str	r0, [sp, #32]
    1378:	e1dd04f8 	ldrsh	r0, [sp, #72]	; 0x48
    137c:	e58d0048 	str	r0, [sp, #72]	; 0x48
    1380:	e2840001 	add	r0, r4, #1
    1384:	e58d0054 	str	r0, [sp, #84]	; 0x54
    1388:	e28e0001 	add	r0, lr, #1
    138c:	e58d0058 	str	r0, [sp, #88]	; 0x58
    1390:	e28c0001 	add	r0, ip, #1
    1394:	e58d004c 	str	r0, [sp, #76]	; 0x4c
    1398:	e3a0c000 	mov	ip, #0
    139c:	e59d000c 	ldr	r0, [sp, #12]
    13a0:	e3a0e008 	mov	lr, #8
    13a4:	e58d900c 	str	r9, [sp, #12]
    13a8:	e59d905c 	ldr	r9, [sp, #92]	; 0x5c
    13ac:	e1dd45f0 	ldrsh	r4, [sp, #80]	; 0x50
    13b0:	e58d5050 	str	r5, [sp, #80]	; 0x50
    13b4:	e59d501c 	ldr	r5, [sp, #28]
    13b8:	e1034e83 	smlabb	r3, r3, lr, r4
    13bc:	e1025e82 	smlabb	r2, r2, lr, r5
    13c0:	e59d5020 	ldr	r5, [sp, #32]
    13c4:	e1015e81 	smlabb	r1, r1, lr, r5
    13c8:	e59d5048 	ldr	r5, [sp, #72]	; 0x48
    13cc:	e7d92102 	ldrb	r2, [r9, r2, lsl #2]
    13d0:	e3120001 	tst	r2, #1
    13d4:	e1005e80 	smlabb	r0, r0, lr, r5
    13d8:	1a00002c 	bne	1490 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x740>
    13dc:	e7d92101 	ldrb	r2, [r9, r1, lsl #2]
    13e0:	e3120001 	tst	r2, #1
    13e4:	1a000029 	bne	1490 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x740>
    13e8:	e7d92100 	ldrb	r2, [r9, r0, lsl #2]
    13ec:	e3120001 	tst	r2, #1
    13f0:	1a000026 	bne	1490 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x740>
    13f4:	e7d93103 	ldrb	r3, [r9, r3, lsl #2]
    13f8:	e3130001 	tst	r3, #1
    13fc:	1a000023 	bne	1490 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x740>
    1400:	e59d900c 	ldr	r9, [sp, #12]
    1404:	e6ffc07c 	uxth	ip, ip
    1408:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    140c:	e08c6006 	add	r6, ip, r6
    1410:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    1414:	e087700c 	add	r7, r7, ip
    1418:	e1cd66ba 	strh	r6, [sp, #106]	; 0x6a
    141c:	e3520001 	cmp	r2, #1
    1420:	e5990000 	ldr	r0, [r9]
    1424:	e088800c 	add	r8, r8, ip
    1428:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
    142c:	e08cc00a 	add	ip, ip, sl
    1430:	e1cd87b2 	strh	r8, [sp, #114]	; 0x72
    1434:	e2833010 	add	r3, r3, #16
    1438:	e5030014 	str	r0, [r3, #-20]
    143c:	e1cd76be 	strh	r7, [sp, #110]	; 0x6e
    1440:	e5920000 	ldr	r0, [r2]
    1444:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
    1448:	e1cdc7b6 	strh	ip, [sp, #118]	; 0x76
    144c:	e5030010 	str	r0, [r3, #-16]
    1450:	e5920000 	ldr	r0, [r2]
    1454:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    1458:	e503000c 	str	r0, [r3, #-12]
    145c:	e5920000 	ldr	r0, [r2]
    1460:	e5030008 	str	r0, [r3, #-8]
    1464:	e58d3030 	str	r3, [sp, #48]	; 0x30
    1468:	13a03001 	movne	r3, #1
    146c:	158d302c 	strne	r3, [sp, #44]	; 0x2c
    1470:	1afffef1 	bne	103c <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x2ec>
    1474:	e28dd0bc 	add	sp, sp, #188	; 0xbc
    1478:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    147c:	e1dd66ba 	ldrh	r6, [sp, #106]	; 0x6a
    1480:	e30fcfff 	movw	ip, #65535	; 0xffff
    1484:	e1dd76be 	ldrh	r7, [sp, #110]	; 0x6e
    1488:	e1dd87b2 	ldrh	r8, [sp, #114]	; 0x72
    148c:	eaffffdd 	b	1408 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x6b8>
    1490:	e28cc001 	add	ip, ip, #1
    1494:	e59d304c 	ldr	r3, [sp, #76]	; 0x4c
    1498:	e15c0003 	cmp	ip, r3
    149c:	e6ff307c 	uxth	r3, ip
    14a0:	e08a2003 	add	r2, sl, r3
    14a4:	e0831008 	add	r1, r3, r8
    14a8:	e0830007 	add	r0, r3, r7
    14ac:	e0833006 	add	r3, r3, r6
    14b0:	e6ff2072 	uxth	r2, r2
    14b4:	0a00000b 	beq	14e8 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x798>
    14b8:	e59d5058 	ldr	r5, [sp, #88]	; 0x58
    14bc:	e6ff1071 	uxth	r1, r1
    14c0:	e6ff0070 	uxth	r0, r0
    14c4:	e6ff3073 	uxth	r3, r3
    14c8:	e15c0005 	cmp	ip, r5
    14cc:	0a000005 	beq	14e8 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x798>
    14d0:	e59d5054 	ldr	r5, [sp, #84]	; 0x54
    14d4:	e15c0005 	cmp	ip, r5
    14d8:	0a000002 	beq	14e8 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x798>
    14dc:	e59d5050 	ldr	r5, [sp, #80]	; 0x50
    14e0:	e15c0005 	cmp	ip, r5
    14e4:	1affffb2 	bne	13b4 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x664>
    14e8:	e59d900c 	ldr	r9, [sp, #12]
    14ec:	e30fcfff 	movw	ip, #65535	; 0xffff
    14f0:	eaffffc4 	b	1408 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x6b8>
    14f4:	e59d4018 	ldr	r4, [sp, #24]
    14f8:	e58d9000 	str	r9, [sp]
    14fc:	e59d0034 	ldr	r0, [sp, #52]	; 0x34
    1500:	e1a02004 	mov	r2, r4
    1504:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    1508:	e59d3008 	ldr	r3, [sp, #8]
    150c:	ebfffffe 	bl	bf4 <_ZN2AI14CreateAndPlaceEP10QuadSquare8QuadKind12QuadRotationiP5PointIsE>
    1510:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    1514:	e5824000 	str	r4, [r2]
    1518:	eaffff6b 	b	12cc <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind+0x57c>
    151c:	000004f0 	.word	0x000004f0
    1520:	000004e8 	.word	0x000004e8
    1524:	0000036c 	.word	0x0000036c
    1528:	00000270 	.word	0x00000270
    152c:	00000270 	.word	0x00000270
    1530:	00000270 	.word	0x00000270

00001534 <_ZN2AI10PredThreadEj>:
    1534:	e59f31e0 	ldr	r3, [pc, #480]	; 171c <_ZN2AI10PredThreadEj+0x1e8>
    1538:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    153c:	e24dd03c 	sub	sp, sp, #60	; 0x3c
    1540:	e79f3003 	ldr	r3, [pc, r3]
    1544:	e58d301c 	str	r3, [sp, #28]
    1548:	e5933000 	ldr	r3, [r3]
    154c:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    1550:	e3530000 	cmp	r3, #0
    1554:	1a000068 	bne	16fc <_ZN2AI10PredThreadEj+0x1c8>
    1558:	e1a02101 	lsl	r2, r1, #2
    155c:	e28030cc 	add	r3, r0, #204	; 0xcc
    1560:	e0933002 	adds	r3, r3, r2
    1564:	e1a0a001 	mov	sl, r1
    1568:	e58d000c 	str	r0, [sp, #12]
    156c:	e58d2010 	str	r2, [sp, #16]
    1570:	e58d3018 	str	r3, [sp, #24]
    1574:	0a000062 	beq	1704 <_ZN2AI10PredThreadEj+0x1d0>
    1578:	e59d100c 	ldr	r1, [sp, #12]
    157c:	e081228a 	add	r2, r1, sl, lsl #5
    1580:	e081318a 	add	r3, r1, sl, lsl #3
    1584:	e081a00a 	add	sl, r1, sl
    1588:	e2833078 	add	r3, r3, #120	; 0x78
    158c:	e58d3020 	str	r3, [sp, #32]
    1590:	e3a03cca 	mov	r3, #51712	; 0xca00
    1594:	e2822038 	add	r2, r2, #56	; 0x38
    1598:	e3433b9a 	movt	r3, #15258	; 0x3b9a
    159c:	e58d2024 	str	r2, [sp, #36]	; 0x24
    15a0:	e58d3014 	str	r3, [sp, #20]
    15a4:	e59d0018 	ldr	r0, [sp, #24]
    15a8:	ebfffffe 	bl	0 <pthread_mutex_lock>
    15ac:	e3500000 	cmp	r0, #0
    15b0:	1a000055 	bne	170c <_ZN2AI10PredThreadEj+0x1d8>
    15b4:	e59d9018 	ldr	r9, [sp, #24]
    15b8:	e59db01c 	ldr	fp, [sp, #28]
    15bc:	ea000003 	b	15d0 <_ZN2AI10PredThreadEj+0x9c>
    15c0:	e59b3000 	ldr	r3, [fp]
    15c4:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    15c8:	e3530000 	cmp	r3, #0
    15cc:	1a000032 	bne	169c <_ZN2AI10PredThreadEj+0x168>
    15d0:	e5da30e6 	ldrb	r3, [sl, #230]	; 0xe6
    15d4:	e3530000 	cmp	r3, #0
    15d8:	1a000032 	bne	16a8 <_ZN2AI10PredThreadEj+0x174>
    15dc:	e28d7028 	add	r7, sp, #40	; 0x28
    15e0:	e3a04c2f 	mov	r4, #12032	; 0x2f00
    15e4:	e3454968 	movt	r4, #22888	; 0x5968
    15e8:	e3a05000 	mov	r5, #0
    15ec:	e1a00007 	mov	r0, r7
    15f0:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    15f4:	e1cd02d8 	ldrd	r0, [sp, #40]	; 0x28
    15f8:	e5da30e6 	ldrb	r3, [sl, #230]	; 0xe6
    15fc:	e0944000 	adds	r4, r4, r0
    1600:	e0a55001 	adc	r5, r5, r1
    1604:	e3530000 	cmp	r3, #0
    1608:	e1cd40f0 	strd	r4, [sp]
    160c:	1affffeb 	bne	15c0 <_ZN2AI10PredThreadEj+0x8c>
    1610:	e3a02cca 	mov	r2, #51712	; 0xca00
    1614:	e1a00004 	mov	r0, r4
    1618:	e1a01005 	mov	r1, r5
    161c:	e3432b9a 	movt	r2, #15258	; 0x3b9a
    1620:	e3a03000 	mov	r3, #0
    1624:	e28d8030 	add	r8, sp, #48	; 0x30
    1628:	ebfffffe 	bl	0 <__aeabi_ldivmod>
    162c:	e59d3014 	ldr	r3, [sp, #20]
    1630:	e59d100c 	ldr	r1, [sp, #12]
    1634:	e28160dc 	add	r6, r1, #220	; 0xdc
    1638:	e59d1010 	ldr	r1, [sp, #16]
    163c:	e0866001 	add	r6, r6, r1
    1640:	e0832390 	umull	r2, r3, r0, r3
    1644:	e0625004 	rsb	r5, r2, r4
    1648:	e1a04000 	mov	r4, r0
    164c:	e1a00006 	mov	r0, r6
    1650:	e1a01009 	mov	r1, r9
    1654:	e1a02008 	mov	r2, r8
    1658:	e58d4030 	str	r4, [sp, #48]	; 0x30
    165c:	e58d5034 	str	r5, [sp, #52]	; 0x34
    1660:	ebfffffe 	bl	0 <pthread_cond_timedwait>
    1664:	e1a00007 	mov	r0, r7
    1668:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    166c:	e1cd22d8 	ldrd	r2, [sp, #40]	; 0x28
    1670:	e1cd00d0 	ldrd	r0, [sp]
    1674:	e1520000 	cmp	r2, r0
    1678:	e0d33001 	sbcs	r3, r3, r1
    167c:	aaffffcf 	bge	15c0 <_ZN2AI10PredThreadEj+0x8c>
    1680:	e5da30e6 	ldrb	r3, [sl, #230]	; 0xe6
    1684:	e3530000 	cmp	r3, #0
    1688:	0affffef 	beq	164c <_ZN2AI10PredThreadEj+0x118>
    168c:	e59b3000 	ldr	r3, [fp]
    1690:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    1694:	e3530000 	cmp	r3, #0
    1698:	0affffcc 	beq	15d0 <_ZN2AI10PredThreadEj+0x9c>
    169c:	e59d0018 	ldr	r0, [sp, #24]
    16a0:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    16a4:	ea000003 	b	16b8 <_ZN2AI10PredThreadEj+0x184>
    16a8:	e3a03000 	mov	r3, #0
    16ac:	e59d0018 	ldr	r0, [sp, #24]
    16b0:	e5ca30e6 	strb	r3, [sl, #230]	; 0xe6
    16b4:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    16b8:	e59dc00c 	ldr	ip, [sp, #12]
    16bc:	e59d2010 	ldr	r2, [sp, #16]
    16c0:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    16c4:	e08c3002 	add	r3, ip, r2
    16c8:	e3a02000 	mov	r2, #0
    16cc:	e5ca2094 	strb	r2, [sl, #148]	; 0x94
    16d0:	e59d2020 	ldr	r2, [sp, #32]
    16d4:	e5930004 	ldr	r0, [r3, #4]
    16d8:	e59c309c 	ldr	r3, [ip, #156]	; 0x9c
    16dc:	ebfffffe 	bl	d50 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind>
    16e0:	e59d301c 	ldr	r3, [sp, #28]
    16e4:	e3a02001 	mov	r2, #1
    16e8:	e5ca2094 	strb	r2, [sl, #148]	; 0x94
    16ec:	e5933000 	ldr	r3, [r3]
    16f0:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    16f4:	e3530000 	cmp	r3, #0
    16f8:	0affffa9 	beq	15a4 <_ZN2AI10PredThreadEj+0x70>
    16fc:	e28dd03c 	add	sp, sp, #60	; 0x3c
    1700:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1704:	e3a00001 	mov	r0, #1
    1708:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>
    170c:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>
    1710:	e59d0018 	ldr	r0, [sp, #24]
    1714:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    1718:	ebfffffe 	bl	0 <__cxa_end_cleanup>
    171c:	000001d4 	.word	0x000001d4

00001720 <_ZN2AI10MainThreadEv>:
    1720:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    1724:	e24dd05c 	sub	sp, sp, #92	; 0x5c
    1728:	e59f6f8c 	ldr	r6, [pc, #3980]	; 26bc <_ZN2AI10MainThreadEv+0xf9c>
    172c:	e1a0b000 	mov	fp, r0
    1730:	e08f6006 	add	r6, pc, r6
    1734:	e5963000 	ldr	r3, [r6]
    1738:	e5964004 	ldr	r4, [r6, #4]
    173c:	e0634004 	rsb	r4, r3, r4
    1740:	e58d3000 	str	r3, [sp]
    1744:	e3740001 	cmn	r4, #1
    1748:	0a0003c5 	beq	2664 <_ZN2AI10MainThreadEv+0xf44>
    174c:	e2844001 	add	r4, r4, #1
    1750:	e3e00000 	mvn	r0, #0
    1754:	e59f9f64 	ldr	r9, [pc, #3940]	; 26c0 <_ZN2AI10MainThreadEv+0xfa0>
    1758:	e30b50df 	movw	r5, #45279	; 0xb0df
    175c:	e1a01004 	mov	r1, r4
    1760:	e59faf5c 	ldr	sl, [pc, #3932]	; 26c4 <_ZN2AI10MainThreadEv+0xfa4>
    1764:	ebfffffe 	bl	0 <__aeabi_uidiv>
    1768:	e59f1f58 	ldr	r1, [pc, #3928]	; 26c8 <_ZN2AI10MainThreadEv+0xfa8>
    176c:	e08f9009 	add	r9, pc, r9
    1770:	e59f2f54 	ldr	r2, [pc, #3924]	; 26cc <_ZN2AI10MainThreadEv+0xfac>
    1774:	e08f1001 	add	r1, pc, r1
    1778:	e596c9c8 	ldr	ip, [r6, #2504]	; 0x9c8
    177c:	e2817d27 	add	r7, r1, #2496	; 0x9c0
    1780:	e08f2002 	add	r2, pc, r2
    1784:	e08fa00a 	add	sl, pc, sl
    1788:	e2877004 	add	r7, r7, #4
    178c:	e58d2018 	str	r2, [sp, #24]
    1790:	e3495908 	movt	r5, #39176	; 0x9908
    1794:	e0030094 	mul	r3, r4, r0
    1798:	e58d000c 	str	r0, [sp, #12]
    179c:	e58d3010 	str	r3, [sp, #16]
    17a0:	e59f3f28 	ldr	r3, [pc, #3880]	; 26d0 <_ZN2AI10MainThreadEv+0xfb0>
    17a4:	e08f3003 	add	r3, pc, r3
    17a8:	e58d3014 	str	r3, [sp, #20]
    17ac:	e2893008 	add	r3, r9, #8
    17b0:	e1a04003 	mov	r4, r3
    17b4:	ea000012 	b	1804 <_ZN2AI10MainThreadEv+0xe4>
    17b8:	e59d3018 	ldr	r3, [sp, #24]
    17bc:	e083310c 	add	r3, r3, ip, lsl #2
    17c0:	e28cc001 	add	ip, ip, #1
    17c4:	e5933008 	ldr	r3, [r3, #8]
    17c8:	e02335a3 	eor	r3, r3, r3, lsr #11
    17cc:	e3050680 	movw	r0, #22144	; 0x5680
    17d0:	e3490d2c 	movt	r0, #40236	; 0x9d2c
    17d4:	e3a02000 	mov	r2, #0
    17d8:	e1a0e383 	lsl	lr, r3, #7
    17dc:	e34e2fc6 	movt	r2, #61382	; 0xefc6
    17e0:	e000000e 	and	r0, r0, lr
    17e4:	e0233000 	eor	r3, r3, r0
    17e8:	e1a00783 	lsl	r0, r3, #15
    17ec:	e0022000 	and	r2, r2, r0
    17f0:	e0220003 	eor	r0, r2, r3
    17f4:	e59d3010 	ldr	r3, [sp, #16]
    17f8:	e0200920 	eor	r0, r0, r0, lsr #18
    17fc:	e1530000 	cmp	r3, r0
    1800:	8a000032 	bhi	18d0 <_ZN2AI10MainThreadEv+0x1b0>
    1804:	e35c0e27 	cmp	ip, #624	; 0x270
    1808:	3affffea 	bcc	17b8 <_ZN2AI10MainThreadEv+0x98>
    180c:	e599c008 	ldr	ip, [r9, #8]
    1810:	e284ee63 	add	lr, r4, #1584	; 0x630
    1814:	e2896fe5 	add	r6, r9, #916	; 0x394
    1818:	e1a00004 	mov	r0, r4
    181c:	e20c3102 	and	r3, ip, #-2147483648	; 0x80000000
    1820:	e5b0c004 	ldr	ip, [r0, #4]!
    1824:	e5be2004 	ldr	r2, [lr, #4]!
    1828:	e3cc8102 	bic	r8, ip, #-2147483648	; 0x80000000
    182c:	e1888003 	orr	r8, r8, r3
    1830:	e3180001 	tst	r8, #1
    1834:	11a03005 	movne	r3, r5
    1838:	03a03000 	moveq	r3, #0
    183c:	e1500006 	cmp	r0, r6
    1840:	e0233002 	eor	r3, r3, r2
    1844:	e02330a8 	eor	r3, r3, r8, lsr #1
    1848:	e5003004 	str	r3, [r0, #-4]
    184c:	1afffff2 	bne	181c <_ZN2AI10MainThreadEv+0xfc>
    1850:	e1a00001 	mov	r0, r1
    1854:	e281e004 	add	lr, r1, #4
    1858:	e5b0c394 	ldr	ip, [r0, #916]!	; 0x394
    185c:	e20c3102 	and	r3, ip, #-2147483648	; 0x80000000
    1860:	e5b0c004 	ldr	ip, [r0, #4]!
    1864:	e5be2004 	ldr	r2, [lr, #4]!
    1868:	e3cc6102 	bic	r6, ip, #-2147483648	; 0x80000000
    186c:	e1866003 	orr	r6, r6, r3
    1870:	e3160001 	tst	r6, #1
    1874:	11a03005 	movne	r3, r5
    1878:	03a03000 	moveq	r3, #0
    187c:	e1500007 	cmp	r0, r7
    1880:	e0233002 	eor	r3, r3, r2
    1884:	e02330a6 	eor	r3, r3, r6, lsr #1
    1888:	e5003004 	str	r3, [r0, #-4]
    188c:	1afffff2 	bne	185c <_ZN2AI10MainThreadEv+0x13c>
    1890:	e59a29c4 	ldr	r2, [sl, #2500]	; 0x9c4
    1894:	e30be0df 	movw	lr, #45279	; 0xb0df
    1898:	e59a3008 	ldr	r3, [sl, #8]
    189c:	e349e908 	movt	lr, #39176	; 0x9908
    18a0:	e2022102 	and	r2, r2, #-2147483648	; 0x80000000
    18a4:	e59ac638 	ldr	ip, [sl, #1592]	; 0x638
    18a8:	e3c30102 	bic	r0, r3, #-2147483648	; 0x80000000
    18ac:	e1802002 	orr	r2, r0, r2
    18b0:	e2120001 	ands	r0, r2, #1
    18b4:	e02c20a2 	eor	r2, ip, r2, lsr #1
    18b8:	e3a0c001 	mov	ip, #1
    18bc:	11a0000e 	movne	r0, lr
    18c0:	e0200002 	eor	r0, r0, r2
    18c4:	e59d2014 	ldr	r2, [sp, #20]
    18c8:	e58209c4 	str	r0, [r2, #2500]	; 0x9c4
    18cc:	eaffffbd 	b	17c8 <_ZN2AI10MainThreadEv+0xa8>
    18d0:	e59f3dfc 	ldr	r3, [pc, #3580]	; 26d4 <_ZN2AI10MainThreadEv+0xfb4>
    18d4:	e59d100c 	ldr	r1, [sp, #12]
    18d8:	e08f3003 	add	r3, pc, r3
    18dc:	e583c9c8 	str	ip, [r3, #2504]	; 0x9c8
    18e0:	ebfffffe 	bl	0 <__aeabi_uidiv>
    18e4:	e59d3000 	ldr	r3, [sp]
    18e8:	e3044925 	movw	r4, #18725	; 0x4925
    18ec:	e3424492 	movt	r4, #9362	; 0x2492
    18f0:	e28b2010 	add	r2, fp, #16
    18f4:	e0801003 	add	r1, r0, r3
    18f8:	e0854491 	umull	r4, r5, r1, r4
    18fc:	e59f4dd4 	ldr	r4, [pc, #3540]	; 26d8 <_ZN2AI10MainThreadEv+0xfb8>
    1900:	e0653001 	rsb	r3, r5, r1
    1904:	e08f4004 	add	r4, pc, r4
    1908:	e08530a3 	add	r3, r5, r3, lsr #1
    190c:	e1a03123 	lsr	r3, r3, #2
    1910:	e0633183 	rsb	r3, r3, r3, lsl #3
    1914:	e0633001 	rsb	r3, r3, r1
    1918:	e1a0100b 	mov	r1, fp
    191c:	e58b309c 	str	r3, [fp, #156]	; 0x9c
    1920:	e58b300c 	str	r3, [fp, #12]
    1924:	e4910018 	ldr	r0, [r1], #24
    1928:	e58d103c 	str	r1, [sp, #60]	; 0x3c
    192c:	ebfffffe 	bl	d50 <_ZN2AI9ProcessAIEP10QuadSquarePA4_5PointIsEP12QuadRotation8QuadKind>
    1930:	e5943000 	ldr	r3, [r4]
    1934:	e5945004 	ldr	r5, [r4, #4]
    1938:	e0635005 	rsb	r5, r3, r5
    193c:	e58d3000 	str	r3, [sp]
    1940:	e3750001 	cmn	r5, #1
    1944:	0a000330 	beq	260c <_ZN2AI10MainThreadEv+0xeec>
    1948:	e2855001 	add	r5, r5, #1
    194c:	e3e00000 	mvn	r0, #0
    1950:	e59f7d84 	ldr	r7, [pc, #3460]	; 26dc <_ZN2AI10MainThreadEv+0xfbc>
    1954:	e1a01005 	mov	r1, r5
    1958:	e59f9d80 	ldr	r9, [pc, #3456]	; 26e0 <_ZN2AI10MainThreadEv+0xfc0>
    195c:	ebfffffe 	bl	0 <__aeabi_uidiv>
    1960:	e08f7007 	add	r7, pc, r7
    1964:	e08f9009 	add	r9, pc, r9
    1968:	e59f8d74 	ldr	r8, [pc, #3444]	; 26e4 <_ZN2AI10MainThreadEv+0xfc4>
    196c:	e30be0df 	movw	lr, #45279	; 0xb0df
    1970:	e594c9c8 	ldr	ip, [r4, #2504]	; 0x9c8
    1974:	e08f8008 	add	r8, pc, r8
    1978:	e349e908 	movt	lr, #39176	; 0x9908
    197c:	e0030095 	mul	r3, r5, r0
    1980:	e2895d27 	add	r5, r9, #2496	; 0x9c0
    1984:	e1a0a000 	mov	sl, r0
    1988:	e2855004 	add	r5, r5, #4
    198c:	e58d300c 	str	r3, [sp, #12]
    1990:	e59f3d50 	ldr	r3, [pc, #3408]	; 26e8 <_ZN2AI10MainThreadEv+0xfc8>
    1994:	e08f3003 	add	r3, pc, r3
    1998:	e58d3014 	str	r3, [sp, #20]
    199c:	e2873008 	add	r3, r7, #8
    19a0:	e58d3010 	str	r3, [sp, #16]
    19a4:	e59f3d40 	ldr	r3, [pc, #3392]	; 26ec <_ZN2AI10MainThreadEv+0xfcc>
    19a8:	e08f3003 	add	r3, pc, r3
    19ac:	e58d3018 	str	r3, [sp, #24]
    19b0:	ea000012 	b	1a00 <_ZN2AI10MainThreadEv+0x2e0>
    19b4:	e59d3018 	ldr	r3, [sp, #24]
    19b8:	e083310c 	add	r3, r3, ip, lsl #2
    19bc:	e28cc001 	add	ip, ip, #1
    19c0:	e5933008 	ldr	r3, [r3, #8]
    19c4:	e02335a3 	eor	r3, r3, r3, lsr #11
    19c8:	e3050680 	movw	r0, #22144	; 0x5680
    19cc:	e3490d2c 	movt	r0, #40236	; 0x9d2c
    19d0:	e3a02000 	mov	r2, #0
    19d4:	e1a01383 	lsl	r1, r3, #7
    19d8:	e34e2fc6 	movt	r2, #61382	; 0xefc6
    19dc:	e0000001 	and	r0, r0, r1
    19e0:	e0233000 	eor	r3, r3, r0
    19e4:	e1a01783 	lsl	r1, r3, #15
    19e8:	e0022001 	and	r2, r2, r1
    19ec:	e0220003 	eor	r0, r2, r3
    19f0:	e59d300c 	ldr	r3, [sp, #12]
    19f4:	e0200920 	eor	r0, r0, r0, lsr #18
    19f8:	e1530000 	cmp	r3, r0
    19fc:	8a000033 	bhi	1ad0 <_ZN2AI10MainThreadEv+0x3b0>
    1a00:	e35c0e27 	cmp	ip, #624	; 0x270
    1a04:	3affffea 	bcc	19b4 <_ZN2AI10MainThreadEv+0x294>
    1a08:	e59d3010 	ldr	r3, [sp, #16]
    1a0c:	e2876fe5 	add	r6, r7, #916	; 0x394
    1a10:	e597c008 	ldr	ip, [r7, #8]
    1a14:	e2834e63 	add	r4, r3, #1584	; 0x630
    1a18:	e1a00003 	mov	r0, r3
    1a1c:	e20c3102 	and	r3, ip, #-2147483648	; 0x80000000
    1a20:	e5b0c004 	ldr	ip, [r0, #4]!
    1a24:	e5b42004 	ldr	r2, [r4, #4]!
    1a28:	e3cc1102 	bic	r1, ip, #-2147483648	; 0x80000000
    1a2c:	e1811003 	orr	r1, r1, r3
    1a30:	e3110001 	tst	r1, #1
    1a34:	11a0300e 	movne	r3, lr
    1a38:	03a03000 	moveq	r3, #0
    1a3c:	e1500006 	cmp	r0, r6
    1a40:	e0233002 	eor	r3, r3, r2
    1a44:	e02330a1 	eor	r3, r3, r1, lsr #1
    1a48:	e5003004 	str	r3, [r0, #-4]
    1a4c:	1afffff2 	bne	1a1c <_ZN2AI10MainThreadEv+0x2fc>
    1a50:	e1a01009 	mov	r1, r9
    1a54:	e289c004 	add	ip, r9, #4
    1a58:	e5b10394 	ldr	r0, [r1, #916]!	; 0x394
    1a5c:	e2003102 	and	r3, r0, #-2147483648	; 0x80000000
    1a60:	e5b10004 	ldr	r0, [r1, #4]!
    1a64:	e5bc2004 	ldr	r2, [ip, #4]!
    1a68:	e3c04102 	bic	r4, r0, #-2147483648	; 0x80000000
    1a6c:	e1844003 	orr	r4, r4, r3
    1a70:	e3140001 	tst	r4, #1
    1a74:	11a0300e 	movne	r3, lr
    1a78:	03a03000 	moveq	r3, #0
    1a7c:	e1510005 	cmp	r1, r5
    1a80:	e0233002 	eor	r3, r3, r2
    1a84:	e02330a4 	eor	r3, r3, r4, lsr #1
    1a88:	e5013004 	str	r3, [r1, #-4]
    1a8c:	1afffff2 	bne	1a5c <_ZN2AI10MainThreadEv+0x33c>
    1a90:	e59829c4 	ldr	r2, [r8, #2500]	; 0x9c4
    1a94:	e30b10df 	movw	r1, #45279	; 0xb0df
    1a98:	e5983008 	ldr	r3, [r8, #8]
    1a9c:	e3491908 	movt	r1, #39176	; 0x9908
    1aa0:	e2022102 	and	r2, r2, #-2147483648	; 0x80000000
    1aa4:	e5980638 	ldr	r0, [r8, #1592]	; 0x638
    1aa8:	e3c3c102 	bic	ip, r3, #-2147483648	; 0x80000000
    1aac:	e18c2002 	orr	r2, ip, r2
    1ab0:	e3a0c001 	mov	ip, #1
    1ab4:	e2124001 	ands	r4, r2, #1
    1ab8:	e02020a2 	eor	r2, r0, r2, lsr #1
    1abc:	11a04001 	movne	r4, r1
    1ac0:	e0244002 	eor	r4, r4, r2
    1ac4:	e59d2014 	ldr	r2, [sp, #20]
    1ac8:	e58249c4 	str	r4, [r2, #2500]	; 0x9c4
    1acc:	eaffffbc 	b	19c4 <_ZN2AI10MainThreadEv+0x2a4>
    1ad0:	e59f3c18 	ldr	r3, [pc, #3096]	; 26f0 <_ZN2AI10MainThreadEv+0xfd0>
    1ad4:	e1a0100a 	mov	r1, sl
    1ad8:	e08f3003 	add	r3, pc, r3
    1adc:	e583c9c8 	str	ip, [r3, #2504]	; 0x9c8
    1ae0:	ebfffffe 	bl	0 <__aeabi_uidiv>
    1ae4:	e59d3000 	ldr	r3, [sp]
    1ae8:	e28b2020 	add	r2, fp, #32
    1aec:	e58d2028 	str	r2, [sp, #40]	; 0x28
    1af0:	e1a0400b 	mov	r4, fp
    1af4:	e0803003 	add	r3, r0, r3
    1af8:	e3040925 	movw	r0, #18725	; 0x4925
    1afc:	e3420492 	movt	r0, #9362	; 0x2492
    1b00:	e1a0600b 	mov	r6, fp
    1b04:	e0810093 	umull	r0, r1, r3, r0
    1b08:	e3a05008 	mov	r5, #8
    1b0c:	e0612003 	rsb	r2, r1, r3
    1b10:	e08120a2 	add	r2, r1, r2, lsr #1
    1b14:	e1a02122 	lsr	r2, r2, #2
    1b18:	e0622182 	rsb	r2, r2, r2, lsl #3
    1b1c:	e0623003 	rsb	r3, r2, r3
    1b20:	e58b309c 	str	r3, [fp, #156]	; 0x9c
    1b24:	e5b63004 	ldr	r3, [r6, #4]!
    1b28:	e3a02d0a 	mov	r2, #640	; 0x280
    1b2c:	e59b1000 	ldr	r1, [fp]
    1b30:	e2844010 	add	r4, r4, #16
    1b34:	e1a00003 	mov	r0, r3
    1b38:	ebfffffe 	bl	0 <memcpy>
    1b3c:	e1d411b4 	ldrh	r1, [r4, #20]
    1b40:	e1d421b6 	ldrh	r2, [r4, #22]
    1b44:	e6bf1071 	sxth	r1, r1
    1b48:	e1021582 	smlabb	r2, r2, r5, r1
    1b4c:	e7d01102 	ldrb	r1, [r0, r2, lsl #2]
    1b50:	e1a03000 	mov	r3, r0
    1b54:	e3811001 	orr	r1, r1, #1
    1b58:	e7c01102 	strb	r1, [r0, r2, lsl #2]
    1b5c:	e1d411b0 	ldrh	r1, [r4, #16]
    1b60:	e1d421b2 	ldrh	r2, [r4, #18]
    1b64:	e6bf1071 	sxth	r1, r1
    1b68:	e1021582 	smlabb	r2, r2, r5, r1
    1b6c:	e7d01102 	ldrb	r1, [r0, r2, lsl #2]
    1b70:	e3811001 	orr	r1, r1, #1
    1b74:	e7c01102 	strb	r1, [r0, r2, lsl #2]
    1b78:	e1d410bc 	ldrh	r1, [r4, #12]
    1b7c:	e1d420be 	ldrh	r2, [r4, #14]
    1b80:	e6bf1071 	sxth	r1, r1
    1b84:	e1021582 	smlabb	r2, r2, r5, r1
    1b88:	e7d01102 	ldrb	r1, [r0, r2, lsl #2]
    1b8c:	e3811001 	orr	r1, r1, #1
    1b90:	e7c01102 	strb	r1, [r0, r2, lsl #2]
    1b94:	e1d410b8 	ldrh	r1, [r4, #8]
    1b98:	e1d420ba 	ldrh	r2, [r4, #10]
    1b9c:	e59d0028 	ldr	r0, [sp, #40]	; 0x28
    1ba0:	e6bf1071 	sxth	r1, r1
    1ba4:	e1540000 	cmp	r4, r0
    1ba8:	e1021582 	smlabb	r2, r2, r5, r1
    1bac:	e7d31102 	ldrb	r1, [r3, r2, lsl #2]
    1bb0:	e3811001 	orr	r1, r1, #1
    1bb4:	e7c31102 	strb	r1, [r3, r2, lsl #2]
    1bb8:	1affffd9 	bne	1b24 <_ZN2AI10MainThreadEv+0x404>
    1bbc:	e28b30e0 	add	r3, fp, #224	; 0xe0
    1bc0:	e58d3038 	str	r3, [sp, #56]	; 0x38
    1bc4:	e3a04001 	mov	r4, #1
    1bc8:	e5cb40e7 	strb	r4, [fp, #231]	; 0xe7
    1bcc:	e1a02003 	mov	r2, r3
    1bd0:	e28b30dc 	add	r3, fp, #220	; 0xdc
    1bd4:	e58d3018 	str	r3, [sp, #24]
    1bd8:	e1a00002 	mov	r0, r2
    1bdc:	e1a05003 	mov	r5, r3
    1be0:	e28b30a4 	add	r3, fp, #164	; 0xa4
    1be4:	e58d3014 	str	r3, [sp, #20]
    1be8:	e1a09003 	mov	r9, r3
    1bec:	ebfffffe 	bl	0 <_ZNSt18condition_variable10notify_oneEv>
    1bf0:	e1a00005 	mov	r0, r5
    1bf4:	e5cb40e6 	strb	r4, [fp, #230]	; 0xe6
    1bf8:	ebfffffe 	bl	0 <_ZNSt18condition_variable10notify_oneEv>
    1bfc:	e1a00009 	mov	r0, r9
    1c00:	ebfffffe 	bl	0 <pthread_mutex_lock>
    1c04:	e3500000 	cmp	r0, #0
    1c08:	1a00027b 	bne	25fc <_ZN2AI10MainThreadEv+0xedc>
    1c0c:	e3a03cca 	mov	r3, #51712	; 0xca00
    1c10:	e3433b9a 	movt	r3, #15258	; 0x3b9a
    1c14:	e1a0a003 	mov	sl, r3
    1c18:	ea000005 	b	1c34 <_ZN2AI10MainThreadEv+0x514>
    1c1c:	e59f3ad0 	ldr	r3, [pc, #2768]	; 26f4 <_ZN2AI10MainThreadEv+0xfd4>
    1c20:	e79f3003 	ldr	r3, [pc, r3]
    1c24:	e5932000 	ldr	r2, [r3]
    1c28:	e5d22024 	ldrb	r2, [r2, #36]	; 0x24
    1c2c:	e3520000 	cmp	r2, #0
    1c30:	1a000262 	bne	25c0 <_ZN2AI10MainThreadEv+0xea0>
    1c34:	e5db30ac 	ldrb	r3, [fp, #172]	; 0xac
    1c38:	e3530000 	cmp	r3, #0
    1c3c:	1a00002a 	bne	1cec <_ZN2AI10MainThreadEv+0x5cc>
    1c40:	e28d6048 	add	r6, sp, #72	; 0x48
    1c44:	e3a04c2f 	mov	r4, #12032	; 0x2f00
    1c48:	e3454968 	movt	r4, #22888	; 0x5968
    1c4c:	e3a05000 	mov	r5, #0
    1c50:	e1a00006 	mov	r0, r6
    1c54:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    1c58:	e1cd04d8 	ldrd	r0, [sp, #72]	; 0x48
    1c5c:	e5db30ac 	ldrb	r3, [fp, #172]	; 0xac
    1c60:	e0944000 	adds	r4, r4, r0
    1c64:	e0a55001 	adc	r5, r5, r1
    1c68:	e3530000 	cmp	r3, #0
    1c6c:	e1cd40f0 	strd	r4, [sp]
    1c70:	1affffe9 	bne	1c1c <_ZN2AI10MainThreadEv+0x4fc>
    1c74:	e3a02cca 	mov	r2, #51712	; 0xca00
    1c78:	e1a00004 	mov	r0, r4
    1c7c:	e1a01005 	mov	r1, r5
    1c80:	e3432b9a 	movt	r2, #15258	; 0x3b9a
    1c84:	e3a03000 	mov	r3, #0
    1c88:	e28b80a8 	add	r8, fp, #168	; 0xa8
    1c8c:	ebfffffe 	bl	0 <__aeabi_ldivmod>
    1c90:	e1a0300a 	mov	r3, sl
    1c94:	e59d1000 	ldr	r1, [sp]
    1c98:	e28d7050 	add	r7, sp, #80	; 0x50
    1c9c:	e0832390 	umull	r2, r3, r0, r3
    1ca0:	e1a04000 	mov	r4, r0
    1ca4:	e0625001 	rsb	r5, r2, r1
    1ca8:	e1a00008 	mov	r0, r8
    1cac:	e1a01009 	mov	r1, r9
    1cb0:	e1a02007 	mov	r2, r7
    1cb4:	e58d4050 	str	r4, [sp, #80]	; 0x50
    1cb8:	e58d5054 	str	r5, [sp, #84]	; 0x54
    1cbc:	ebfffffe 	bl	0 <pthread_cond_timedwait>
    1cc0:	e1a00006 	mov	r0, r6
    1cc4:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    1cc8:	e1cd24d8 	ldrd	r2, [sp, #72]	; 0x48
    1ccc:	e1cd00d0 	ldrd	r0, [sp]
    1cd0:	e1520000 	cmp	r2, r0
    1cd4:	e0d33001 	sbcs	r3, r3, r1
    1cd8:	aaffffcf 	bge	1c1c <_ZN2AI10MainThreadEv+0x4fc>
    1cdc:	e5db30ac 	ldrb	r3, [fp, #172]	; 0xac
    1ce0:	e3530000 	cmp	r3, #0
    1ce4:	0affffef 	beq	1ca8 <_ZN2AI10MainThreadEv+0x588>
    1ce8:	eaffffcb 	b	1c1c <_ZN2AI10MainThreadEv+0x4fc>
    1cec:	e59f3a04 	ldr	r3, [pc, #2564]	; 26f8 <_ZN2AI10MainThreadEv+0xfd8>
    1cf0:	e59d0014 	ldr	r0, [sp, #20]
    1cf4:	e1a04003 	mov	r4, r3
    1cf8:	e3a03000 	mov	r3, #0
    1cfc:	e5cb30ac 	strb	r3, [fp, #172]	; 0xac
    1d00:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    1d04:	e79f3004 	ldr	r3, [pc, r4]
    1d08:	e58d3010 	str	r3, [sp, #16]
    1d0c:	e28b30b4 	add	r3, fp, #180	; 0xb4
    1d10:	e58d3034 	str	r3, [sp, #52]	; 0x34
    1d14:	e1a00003 	mov	r0, r3
    1d18:	e3a03001 	mov	r3, #1
    1d1c:	e5cb30b8 	strb	r3, [fp, #184]	; 0xb8
    1d20:	e5cb30b9 	strb	r3, [fp, #185]	; 0xb9
    1d24:	ebfffffe 	bl	0 <_ZNSt18condition_variable10notify_oneEv>
    1d28:	e59d3010 	ldr	r3, [sp, #16]
    1d2c:	e5933000 	ldr	r3, [r3]
    1d30:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    1d34:	e3530000 	cmp	r3, #0
    1d38:	1a0001bc 	bne	2430 <_ZN2AI10MainThreadEv+0xd10>
    1d3c:	e59f29b8 	ldr	r2, [pc, #2488]	; 26fc <_ZN2AI10MainThreadEv+0xfdc>
    1d40:	e59f39b8 	ldr	r3, [pc, #2488]	; 2700 <_ZN2AI10MainThreadEv+0xfe0>
    1d44:	e08f2002 	add	r2, pc, r2
    1d48:	e59f19b4 	ldr	r1, [pc, #2484]	; 2704 <_ZN2AI10MainThreadEv+0xfe4>
    1d4c:	e282ad27 	add	sl, r2, #2496	; 0x9c0
    1d50:	e08f3003 	add	r3, pc, r3
    1d54:	e28aa004 	add	sl, sl, #4
    1d58:	e58d3040 	str	r3, [sp, #64]	; 0x40
    1d5c:	e2833d27 	add	r3, r3, #2496	; 0x9c0
    1d60:	e08f1001 	add	r1, pc, r1
    1d64:	e2833004 	add	r3, r3, #4
    1d68:	e58d2024 	str	r2, [sp, #36]	; 0x24
    1d6c:	e58d1020 	str	r1, [sp, #32]
    1d70:	e58d3044 	str	r3, [sp, #68]	; 0x44
    1d74:	e59d9014 	ldr	r9, [sp, #20]
    1d78:	e1a00009 	mov	r0, r9
    1d7c:	ebfffffe 	bl	0 <pthread_mutex_lock>
    1d80:	e3500000 	cmp	r0, #0
    1d84:	1a00021c 	bne	25fc <_ZN2AI10MainThreadEv+0xedc>
    1d88:	e3a03cca 	mov	r3, #51712	; 0xca00
    1d8c:	e58da01c 	str	sl, [sp, #28]
    1d90:	e3433b9a 	movt	r3, #15258	; 0x3b9a
    1d94:	e59da010 	ldr	sl, [sp, #16]
    1d98:	e58d300c 	str	r3, [sp, #12]
    1d9c:	ea000003 	b	1db0 <_ZN2AI10MainThreadEv+0x690>
    1da0:	e59a3000 	ldr	r3, [sl]
    1da4:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    1da8:	e3530000 	cmp	r3, #0
    1dac:	1a000030 	bne	1e74 <_ZN2AI10MainThreadEv+0x754>
    1db0:	e5db30ac 	ldrb	r3, [fp, #172]	; 0xac
    1db4:	e3530000 	cmp	r3, #0
    1db8:	1a000031 	bne	1e84 <_ZN2AI10MainThreadEv+0x764>
    1dbc:	e28d6048 	add	r6, sp, #72	; 0x48
    1dc0:	e3a04c2f 	mov	r4, #12032	; 0x2f00
    1dc4:	e3454968 	movt	r4, #22888	; 0x5968
    1dc8:	e3a05000 	mov	r5, #0
    1dcc:	e1a00006 	mov	r0, r6
    1dd0:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    1dd4:	e1cd04d8 	ldrd	r0, [sp, #72]	; 0x48
    1dd8:	e5db30ac 	ldrb	r3, [fp, #172]	; 0xac
    1ddc:	e0944000 	adds	r4, r4, r0
    1de0:	e0a55001 	adc	r5, r5, r1
    1de4:	e3530000 	cmp	r3, #0
    1de8:	e1cd40f0 	strd	r4, [sp]
    1dec:	1affffeb 	bne	1da0 <_ZN2AI10MainThreadEv+0x680>
    1df0:	e3a02cca 	mov	r2, #51712	; 0xca00
    1df4:	e1a00004 	mov	r0, r4
    1df8:	e1a01005 	mov	r1, r5
    1dfc:	e3432b9a 	movt	r2, #15258	; 0x3b9a
    1e00:	e3a03000 	mov	r3, #0
    1e04:	e28b80a8 	add	r8, fp, #168	; 0xa8
    1e08:	ebfffffe 	bl	0 <__aeabi_ldivmod>
    1e0c:	e59d300c 	ldr	r3, [sp, #12]
    1e10:	e59d1000 	ldr	r1, [sp]
    1e14:	e28d7050 	add	r7, sp, #80	; 0x50
    1e18:	e0832390 	umull	r2, r3, r0, r3
    1e1c:	e1a04000 	mov	r4, r0
    1e20:	e0625001 	rsb	r5, r2, r1
    1e24:	e1a00008 	mov	r0, r8
    1e28:	e1a01009 	mov	r1, r9
    1e2c:	e1a02007 	mov	r2, r7
    1e30:	e58d4050 	str	r4, [sp, #80]	; 0x50
    1e34:	e58d5054 	str	r5, [sp, #84]	; 0x54
    1e38:	ebfffffe 	bl	0 <pthread_cond_timedwait>
    1e3c:	e1a00006 	mov	r0, r6
    1e40:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    1e44:	e1cd24d8 	ldrd	r2, [sp, #72]	; 0x48
    1e48:	e1cd00d0 	ldrd	r0, [sp]
    1e4c:	e1520000 	cmp	r2, r0
    1e50:	e0d33001 	sbcs	r3, r3, r1
    1e54:	aaffffd1 	bge	1da0 <_ZN2AI10MainThreadEv+0x680>
    1e58:	e5db30ac 	ldrb	r3, [fp, #172]	; 0xac
    1e5c:	e3530000 	cmp	r3, #0
    1e60:	0affffef 	beq	1e24 <_ZN2AI10MainThreadEv+0x704>
    1e64:	e59a3000 	ldr	r3, [sl]
    1e68:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    1e6c:	e3530000 	cmp	r3, #0
    1e70:	0affffce 	beq	1db0 <_ZN2AI10MainThreadEv+0x690>
    1e74:	e59d0014 	ldr	r0, [sp, #20]
    1e78:	e59da01c 	ldr	sl, [sp, #28]
    1e7c:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    1e80:	ea000004 	b	1e98 <_ZN2AI10MainThreadEv+0x778>
    1e84:	e3a03000 	mov	r3, #0
    1e88:	e59d0014 	ldr	r0, [sp, #20]
    1e8c:	e5cb30ac 	strb	r3, [fp, #172]	; 0xac
    1e90:	e59da01c 	ldr	sl, [sp, #28]
    1e94:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    1e98:	e59b2098 	ldr	r2, [fp, #152]	; 0x98
    1e9c:	e3a01008 	mov	r1, #8
    1ea0:	e59b0000 	ldr	r0, [fp]
    1ea4:	e3a03000 	mov	r3, #0
    1ea8:	e08b2202 	add	r2, fp, r2, lsl #4
    1eac:	e2822018 	add	r2, r2, #24
    1eb0:	e1d2c0bc 	ldrh	ip, [r2, #12]
    1eb4:	e1d220be 	ldrh	r2, [r2, #14]
    1eb8:	e6bfc07c 	sxth	ip, ip
    1ebc:	e102c182 	smlabb	r2, r2, r1, ip
    1ec0:	e7d0c102 	ldrb	ip, [r0, r2, lsl #2]
    1ec4:	e38cc001 	orr	ip, ip, #1
    1ec8:	e7c0c102 	strb	ip, [r0, r2, lsl #2]
    1ecc:	e59b2098 	ldr	r2, [fp, #152]	; 0x98
    1ed0:	e59b0000 	ldr	r0, [fp]
    1ed4:	e08b2202 	add	r2, fp, r2, lsl #4
    1ed8:	e2822018 	add	r2, r2, #24
    1edc:	e1d2c0b8 	ldrh	ip, [r2, #8]
    1ee0:	e1d220ba 	ldrh	r2, [r2, #10]
    1ee4:	e6bfc07c 	sxth	ip, ip
    1ee8:	e102c182 	smlabb	r2, r2, r1, ip
    1eec:	e7d0c102 	ldrb	ip, [r0, r2, lsl #2]
    1ef0:	e38cc001 	orr	ip, ip, #1
    1ef4:	e7c0c102 	strb	ip, [r0, r2, lsl #2]
    1ef8:	e59b2098 	ldr	r2, [fp, #152]	; 0x98
    1efc:	e59b0000 	ldr	r0, [fp]
    1f00:	e08b2202 	add	r2, fp, r2, lsl #4
    1f04:	e2822018 	add	r2, r2, #24
    1f08:	e1d2c0b4 	ldrh	ip, [r2, #4]
    1f0c:	e1d220b6 	ldrh	r2, [r2, #6]
    1f10:	e6bfc07c 	sxth	ip, ip
    1f14:	e102c182 	smlabb	r2, r2, r1, ip
    1f18:	e7d0c102 	ldrb	ip, [r0, r2, lsl #2]
    1f1c:	e38cc001 	orr	ip, ip, #1
    1f20:	e7c0c102 	strb	ip, [r0, r2, lsl #2]
    1f24:	e59b2098 	ldr	r2, [fp, #152]	; 0x98
    1f28:	e59b0000 	ldr	r0, [fp]
    1f2c:	e1a02202 	lsl	r2, r2, #4
    1f30:	e2822018 	add	r2, r2, #24
    1f34:	e08be002 	add	lr, fp, r2
    1f38:	e19bc0b2 	ldrh	ip, [fp, r2]
    1f3c:	e1de20b2 	ldrh	r2, [lr, #2]
    1f40:	e6bfc07c 	sxth	ip, ip
    1f44:	e101c182 	smlabb	r1, r2, r1, ip
    1f48:	e7d02101 	ldrb	r2, [r0, r1, lsl #2]
    1f4c:	e3822001 	orr	r2, r2, #1
    1f50:	e7c02101 	strb	r2, [r0, r1, lsl #2]
    1f54:	e59b4000 	ldr	r4, [fp]
    1f58:	e1a02004 	mov	r2, r4
    1f5c:	ea000003 	b	1f70 <_ZN2AI10MainThreadEv+0x850>
    1f60:	e2833001 	add	r3, r3, #1
    1f64:	e2822020 	add	r2, r2, #32
    1f68:	e3530014 	cmp	r3, #20
    1f6c:	0a000049 	beq	2098 <_ZN2AI10MainThreadEv+0x978>
    1f70:	e5d20004 	ldrb	r0, [r2, #4]
    1f74:	e7d41283 	ldrb	r1, [r4, r3, lsl #5]
    1f78:	e3100001 	tst	r0, #1
    1f7c:	e5d20008 	ldrb	r0, [r2, #8]
    1f80:	e2011001 	and	r1, r1, #1
    1f84:	12811001 	addne	r1, r1, #1
    1f88:	e3100001 	tst	r0, #1
    1f8c:	e5d2000c 	ldrb	r0, [r2, #12]
    1f90:	12811001 	addne	r1, r1, #1
    1f94:	e3100001 	tst	r0, #1
    1f98:	e5d20010 	ldrb	r0, [r2, #16]
    1f9c:	12811001 	addne	r1, r1, #1
    1fa0:	e3100001 	tst	r0, #1
    1fa4:	e5d20014 	ldrb	r0, [r2, #20]
    1fa8:	12811001 	addne	r1, r1, #1
    1fac:	e3100001 	tst	r0, #1
    1fb0:	e5d20018 	ldrb	r0, [r2, #24]
    1fb4:	12811001 	addne	r1, r1, #1
    1fb8:	e3100001 	tst	r0, #1
    1fbc:	0affffe7 	beq	1f60 <_ZN2AI10MainThreadEv+0x840>
    1fc0:	e5d2001c 	ldrb	r0, [r2, #28]
    1fc4:	e3100001 	tst	r0, #1
    1fc8:	0affffe4 	beq	1f60 <_ZN2AI10MainThreadEv+0x840>
    1fcc:	e3510006 	cmp	r1, #6
    1fd0:	1affffe2 	bne	1f60 <_ZN2AI10MainThreadEv+0x840>
    1fd4:	e1a01003 	mov	r1, r3
    1fd8:	e3510013 	cmp	r1, #19
    1fdc:	0a00004c 	beq	2114 <_ZN2AI10MainThreadEv+0x9f4>
    1fe0:	e2815002 	add	r5, r1, #2
    1fe4:	e2816001 	add	r6, r1, #1
    1fe8:	e0840281 	add	r0, r4, r1, lsl #5
    1fec:	e1a05185 	lsl	r5, r5, #3
    1ff0:	e3550007 	cmp	r5, #7
    1ff4:	e2807020 	add	r7, r0, #32
    1ff8:	e2866001 	add	r6, r6, #1
    1ffc:	9a000002 	bls	200c <_ZN2AI10MainThreadEv+0x8ec>
    2000:	e3a02020 	mov	r2, #32
    2004:	e1a01007 	mov	r1, r7
    2008:	ebfffffe 	bl	0 <memmove>
    200c:	e3560014 	cmp	r6, #20
    2010:	e2855008 	add	r5, r5, #8
    2014:	e1a00007 	mov	r0, r7
    2018:	1afffff4 	bne	1ff0 <_ZN2AI10MainThreadEv+0x8d0>
    201c:	e1a03004 	mov	r3, r4
    2020:	e3a01000 	mov	r1, #0
    2024:	e5d30004 	ldrb	r0, [r3, #4]
    2028:	e7d42281 	ldrb	r2, [r4, r1, lsl #5]
    202c:	e3100001 	tst	r0, #1
    2030:	e5d30008 	ldrb	r0, [r3, #8]
    2034:	e2022001 	and	r2, r2, #1
    2038:	12822001 	addne	r2, r2, #1
    203c:	e3100001 	tst	r0, #1
    2040:	e5d3000c 	ldrb	r0, [r3, #12]
    2044:	12822001 	addne	r2, r2, #1
    2048:	e3100001 	tst	r0, #1
    204c:	e5d30010 	ldrb	r0, [r3, #16]
    2050:	12822001 	addne	r2, r2, #1
    2054:	e3100001 	tst	r0, #1
    2058:	e5d30014 	ldrb	r0, [r3, #20]
    205c:	12822001 	addne	r2, r2, #1
    2060:	e3100001 	tst	r0, #1
    2064:	e5d30018 	ldrb	r0, [r3, #24]
    2068:	12822001 	addne	r2, r2, #1
    206c:	e3100001 	tst	r0, #1
    2070:	0a000004 	beq	2088 <_ZN2AI10MainThreadEv+0x968>
    2074:	e5d3001c 	ldrb	r0, [r3, #28]
    2078:	e3100001 	tst	r0, #1
    207c:	0a000001 	beq	2088 <_ZN2AI10MainThreadEv+0x968>
    2080:	e3520006 	cmp	r2, #6
    2084:	0affffd3 	beq	1fd8 <_ZN2AI10MainThreadEv+0x8b8>
    2088:	e2811001 	add	r1, r1, #1
    208c:	e2833020 	add	r3, r3, #32
    2090:	e3510014 	cmp	r1, #20
    2094:	1affffe2 	bne	2024 <_ZN2AI10MainThreadEv+0x904>
    2098:	e59b3098 	ldr	r3, [fp, #152]	; 0x98
    209c:	e08b6003 	add	r6, fp, r3
    20a0:	e5d62094 	ldrb	r2, [r6, #148]	; 0x94
    20a4:	e3520000 	cmp	r2, #0
    20a8:	0a0000e2 	beq	2438 <_ZN2AI10MainThreadEv+0xd18>
    20ac:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
    20b0:	e1a03083 	lsl	r3, r3, #1
    20b4:	e28b000c 	add	r0, fp, #12
    20b8:	e3a01000 	mov	r1, #0
    20bc:	e0813003 	add	r3, r1, r3
    20c0:	e3510001 	cmp	r1, #1
    20c4:	e2822010 	add	r2, r2, #16
    20c8:	e08b3203 	add	r3, fp, r3, lsl #4
    20cc:	e2833038 	add	r3, r3, #56	; 0x38
    20d0:	e593c008 	ldr	ip, [r3, #8]
    20d4:	e5934000 	ldr	r4, [r3]
    20d8:	e593e004 	ldr	lr, [r3, #4]
    20dc:	e593300c 	ldr	r3, [r3, #12]
    20e0:	e502c008 	str	ip, [r2, #-8]
    20e4:	e5024010 	str	r4, [r2, #-16]
    20e8:	e502e00c 	str	lr, [r2, #-12]
    20ec:	e5023004 	str	r3, [r2, #-4]
    20f0:	e59b3098 	ldr	r3, [fp, #152]	; 0x98
    20f4:	e1a03083 	lsl	r3, r3, #1
    20f8:	e083c001 	add	ip, r3, r1
    20fc:	e28cc01e 	add	ip, ip, #30
    2100:	e79bc10c 	ldr	ip, [fp, ip, lsl #2]
    2104:	e5a0c004 	str	ip, [r0, #4]!
    2108:	0a00001a 	beq	2178 <_ZN2AI10MainThreadEv+0xa58>
    210c:	e3a01001 	mov	r1, #1
    2110:	eaffffe9 	b	20bc <_ZN2AI10MainThreadEv+0x99c>
    2114:	e5d43264 	ldrb	r3, [r4, #612]	; 0x264
    2118:	e5d42268 	ldrb	r2, [r4, #616]	; 0x268
    211c:	e3c33001 	bic	r3, r3, #1
    2120:	e5c43264 	strb	r3, [r4, #612]	; 0x264
    2124:	e5d4326c 	ldrb	r3, [r4, #620]	; 0x26c
    2128:	e3c22001 	bic	r2, r2, #1
    212c:	e5c42268 	strb	r2, [r4, #616]	; 0x268
    2130:	e3c33001 	bic	r3, r3, #1
    2134:	e5d42270 	ldrb	r2, [r4, #624]	; 0x270
    2138:	e5c4326c 	strb	r3, [r4, #620]	; 0x26c
    213c:	e5d43274 	ldrb	r3, [r4, #628]	; 0x274
    2140:	e3c22001 	bic	r2, r2, #1
    2144:	e5d41260 	ldrb	r1, [r4, #608]	; 0x260
    2148:	e3c33001 	bic	r3, r3, #1
    214c:	e5c42270 	strb	r2, [r4, #624]	; 0x270
    2150:	e5c43274 	strb	r3, [r4, #628]	; 0x274
    2154:	e3c11001 	bic	r1, r1, #1
    2158:	e5d42278 	ldrb	r2, [r4, #632]	; 0x278
    215c:	e5d4327c 	ldrb	r3, [r4, #636]	; 0x27c
    2160:	e3c22001 	bic	r2, r2, #1
    2164:	e5c41260 	strb	r1, [r4, #608]	; 0x260
    2168:	e3c33001 	bic	r3, r3, #1
    216c:	e5c42278 	strb	r2, [r4, #632]	; 0x278
    2170:	e5c4327c 	strb	r3, [r4, #636]	; 0x27c
    2174:	eaffffa8 	b	201c <_ZN2AI10MainThreadEv+0x8fc>
    2178:	e59b309c 	ldr	r3, [fp, #156]	; 0x9c
    217c:	e59d0034 	ldr	r0, [sp, #52]	; 0x34
    2180:	e5cb10b8 	strb	r1, [fp, #184]	; 0xb8
    2184:	e5cb10b9 	strb	r1, [fp, #185]	; 0xb9
    2188:	e58b300c 	str	r3, [fp, #12]
    218c:	ebfffffe 	bl	0 <_ZNSt18condition_variable10notify_oneEv>
    2190:	e59d4020 	ldr	r4, [sp, #32]
    2194:	e5942000 	ldr	r2, [r4]
    2198:	e5946004 	ldr	r6, [r4, #4]
    219c:	e0626006 	rsb	r6, r2, r6
    21a0:	e58d200c 	str	r2, [sp, #12]
    21a4:	e3760001 	cmn	r6, #1
    21a8:	0a0000ed 	beq	2564 <_ZN2AI10MainThreadEv+0xe44>
    21ac:	e2866001 	add	r6, r6, #1
    21b0:	e3e00000 	mvn	r0, #0
    21b4:	e59f854c 	ldr	r8, [pc, #1356]	; 2708 <_ZN2AI10MainThreadEv+0xfe8>
    21b8:	e1a01006 	mov	r1, r6
    21bc:	e59f7548 	ldr	r7, [pc, #1352]	; 270c <_ZN2AI10MainThreadEv+0xfec>
    21c0:	ebfffffe 	bl	0 <__aeabi_uidiv>
    21c4:	e59f3544 	ldr	r3, [pc, #1348]	; 2710 <_ZN2AI10MainThreadEv+0xff0>
    21c8:	e08f8008 	add	r8, pc, r8
    21cc:	e594c9c8 	ldr	ip, [r4, #2504]	; 0x9c8
    21d0:	e08f3003 	add	r3, pc, r3
    21d4:	e58d3000 	str	r3, [sp]
    21d8:	e59f3534 	ldr	r3, [pc, #1332]	; 2714 <_ZN2AI10MainThreadEv+0xff4>
    21dc:	e30b40df 	movw	r4, #45279	; 0xb0df
    21e0:	e58db02c 	str	fp, [sp, #44]	; 0x2c
    21e4:	e08f7007 	add	r7, pc, r7
    21e8:	e08f3003 	add	r3, pc, r3
    21ec:	e2889008 	add	r9, r8, #8
    21f0:	e3494908 	movt	r4, #39176	; 0x9908
    21f4:	e1a0b003 	mov	fp, r3
    21f8:	e58d001c 	str	r0, [sp, #28]
    21fc:	e0060096 	mul	r6, r6, r0
    2200:	ea000010 	b	2248 <_ZN2AI10MainThreadEv+0xb28>
    2204:	e08b310c 	add	r3, fp, ip, lsl #2
    2208:	e28cc001 	add	ip, ip, #1
    220c:	e5933008 	ldr	r3, [r3, #8]
    2210:	e02335a3 	eor	r3, r3, r3, lsr #11
    2214:	e3051680 	movw	r1, #22144	; 0x5680
    2218:	e3491d2c 	movt	r1, #40236	; 0x9d2c
    221c:	e3a02000 	mov	r2, #0
    2220:	e1a00383 	lsl	r0, r3, #7
    2224:	e34e2fc6 	movt	r2, #61382	; 0xefc6
    2228:	e0011000 	and	r1, r1, r0
    222c:	e0233001 	eor	r3, r3, r1
    2230:	e1a01783 	lsl	r1, r3, #15
    2234:	e0022001 	and	r2, r2, r1
    2238:	e0222003 	eor	r2, r2, r3
    223c:	e0222922 	eor	r2, r2, r2, lsr #18
    2240:	e1560002 	cmp	r6, r2
    2244:	8a000033 	bhi	2318 <_ZN2AI10MainThreadEv+0xbf8>
    2248:	e35c0e27 	cmp	ip, #624	; 0x270
    224c:	3affffec 	bcc	2204 <_ZN2AI10MainThreadEv+0xae4>
    2250:	e598c008 	ldr	ip, [r8, #8]
    2254:	e289ee63 	add	lr, r9, #1584	; 0x630
    2258:	e2885fe5 	add	r5, r8, #916	; 0x394
    225c:	e1a00009 	mov	r0, r9
    2260:	e20c3102 	and	r3, ip, #-2147483648	; 0x80000000
    2264:	e5b0c004 	ldr	ip, [r0, #4]!
    2268:	e5be2004 	ldr	r2, [lr, #4]!
    226c:	e3cc1102 	bic	r1, ip, #-2147483648	; 0x80000000
    2270:	e1811003 	orr	r1, r1, r3
    2274:	e3110001 	tst	r1, #1
    2278:	11a03004 	movne	r3, r4
    227c:	03a03000 	moveq	r3, #0
    2280:	e1500005 	cmp	r0, r5
    2284:	e0233002 	eor	r3, r3, r2
    2288:	e02330a1 	eor	r3, r3, r1, lsr #1
    228c:	e5003004 	str	r3, [r0, #-4]
    2290:	1afffff2 	bne	2260 <_ZN2AI10MainThreadEv+0xb40>
    2294:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    2298:	e283e004 	add	lr, r3, #4
    229c:	e1a00003 	mov	r0, r3
    22a0:	e5b0c394 	ldr	ip, [r0, #916]!	; 0x394
    22a4:	e20c3102 	and	r3, ip, #-2147483648	; 0x80000000
    22a8:	e5b0c004 	ldr	ip, [r0, #4]!
    22ac:	e5be2004 	ldr	r2, [lr, #4]!
    22b0:	e3cc1102 	bic	r1, ip, #-2147483648	; 0x80000000
    22b4:	e1811003 	orr	r1, r1, r3
    22b8:	e3110001 	tst	r1, #1
    22bc:	11a03004 	movne	r3, r4
    22c0:	03a03000 	moveq	r3, #0
    22c4:	e150000a 	cmp	r0, sl
    22c8:	e0233002 	eor	r3, r3, r2
    22cc:	e02330a1 	eor	r3, r3, r1, lsr #1
    22d0:	e5003004 	str	r3, [r0, #-4]
    22d4:	1afffff2 	bne	22a4 <_ZN2AI10MainThreadEv+0xb84>
    22d8:	e59729c4 	ldr	r2, [r7, #2500]	; 0x9c4
    22dc:	e30b00df 	movw	r0, #45279	; 0xb0df
    22e0:	e5973008 	ldr	r3, [r7, #8]
    22e4:	e3490908 	movt	r0, #39176	; 0x9908
    22e8:	e2022102 	and	r2, r2, #-2147483648	; 0x80000000
    22ec:	e597c638 	ldr	ip, [r7, #1592]	; 0x638
    22f0:	e3c31102 	bic	r1, r3, #-2147483648	; 0x80000000
    22f4:	e1812002 	orr	r2, r1, r2
    22f8:	e2121001 	ands	r1, r2, #1
    22fc:	e02c20a2 	eor	r2, ip, r2, lsr #1
    2300:	e3a0c001 	mov	ip, #1
    2304:	11a01000 	movne	r1, r0
    2308:	e0222001 	eor	r2, r2, r1
    230c:	e59d1000 	ldr	r1, [sp]
    2310:	e58129c4 	str	r2, [r1, #2500]	; 0x9c4
    2314:	eaffffbd 	b	2210 <_ZN2AI10MainThreadEv+0xaf0>
    2318:	e59f33f8 	ldr	r3, [pc, #1016]	; 2718 <_ZN2AI10MainThreadEv+0xff8>
    231c:	e1a00002 	mov	r0, r2
    2320:	e59d101c 	ldr	r1, [sp, #28]
    2324:	e08f3003 	add	r3, pc, r3
    2328:	e59db02c 	ldr	fp, [sp, #44]	; 0x2c
    232c:	e583c9c8 	str	ip, [r3, #2504]	; 0x9c8
    2330:	ebfffffe 	bl	0 <__aeabi_uidiv>
    2334:	e59d300c 	ldr	r3, [sp, #12]
    2338:	e1a0400b 	mov	r4, fp
    233c:	e59d7028 	ldr	r7, [sp, #40]	; 0x28
    2340:	e1a0600b 	mov	r6, fp
    2344:	e0803003 	add	r3, r0, r3
    2348:	e3040925 	movw	r0, #18725	; 0x4925
    234c:	e3420492 	movt	r0, #9362	; 0x2492
    2350:	e3a05008 	mov	r5, #8
    2354:	e0810093 	umull	r0, r1, r3, r0
    2358:	e0612003 	rsb	r2, r1, r3
    235c:	e08120a2 	add	r2, r1, r2, lsr #1
    2360:	e1a02122 	lsr	r2, r2, #2
    2364:	e0622182 	rsb	r2, r2, r2, lsl #3
    2368:	e0622003 	rsb	r2, r2, r3
    236c:	e58b209c 	str	r2, [fp, #156]	; 0x9c
    2370:	e5b63004 	ldr	r3, [r6, #4]!
    2374:	e3a02d0a 	mov	r2, #640	; 0x280
    2378:	e59b1000 	ldr	r1, [fp]
    237c:	e2844010 	add	r4, r4, #16
    2380:	e1a00003 	mov	r0, r3
    2384:	ebfffffe 	bl	0 <memcpy>
    2388:	e1d411b4 	ldrh	r1, [r4, #20]
    238c:	e1d421b6 	ldrh	r2, [r4, #22]
    2390:	e6bf1071 	sxth	r1, r1
    2394:	e1021582 	smlabb	r2, r2, r5, r1
    2398:	e7d01102 	ldrb	r1, [r0, r2, lsl #2]
    239c:	e3811001 	orr	r1, r1, #1
    23a0:	e7c01102 	strb	r1, [r0, r2, lsl #2]
    23a4:	e1d411b0 	ldrh	r1, [r4, #16]
    23a8:	e1d421b2 	ldrh	r2, [r4, #18]
    23ac:	e6bf1071 	sxth	r1, r1
    23b0:	e1021582 	smlabb	r2, r2, r5, r1
    23b4:	e7d01102 	ldrb	r1, [r0, r2, lsl #2]
    23b8:	e3811001 	orr	r1, r1, #1
    23bc:	e7c01102 	strb	r1, [r0, r2, lsl #2]
    23c0:	e1d410bc 	ldrh	r1, [r4, #12]
    23c4:	e1d420be 	ldrh	r2, [r4, #14]
    23c8:	e6bf1071 	sxth	r1, r1
    23cc:	e1021582 	smlabb	r2, r2, r5, r1
    23d0:	e7d01102 	ldrb	r1, [r0, r2, lsl #2]
    23d4:	e3811001 	orr	r1, r1, #1
    23d8:	e7c01102 	strb	r1, [r0, r2, lsl #2]
    23dc:	e1d410b8 	ldrh	r1, [r4, #8]
    23e0:	e1d420ba 	ldrh	r2, [r4, #10]
    23e4:	e1570004 	cmp	r7, r4
    23e8:	e6bf1071 	sxth	r1, r1
    23ec:	e1021582 	smlabb	r2, r2, r5, r1
    23f0:	e7d01102 	ldrb	r1, [r0, r2, lsl #2]
    23f4:	e3811001 	orr	r1, r1, #1
    23f8:	e7c01102 	strb	r1, [r0, r2, lsl #2]
    23fc:	1affffdb 	bne	2370 <_ZN2AI10MainThreadEv+0xc50>
    2400:	e3a04001 	mov	r4, #1
    2404:	e59d0038 	ldr	r0, [sp, #56]	; 0x38
    2408:	e5cb40e7 	strb	r4, [fp, #231]	; 0xe7
    240c:	ebfffffe 	bl	0 <_ZNSt18condition_variable10notify_oneEv>
    2410:	e5cb40e6 	strb	r4, [fp, #230]	; 0xe6
    2414:	e59d0018 	ldr	r0, [sp, #24]
    2418:	ebfffffe 	bl	0 <_ZNSt18condition_variable10notify_oneEv>
    241c:	e59d3010 	ldr	r3, [sp, #16]
    2420:	e5933000 	ldr	r3, [r3]
    2424:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    2428:	e3530000 	cmp	r3, #0
    242c:	0afffe50 	beq	1d74 <_ZN2AI10MainThreadEv+0x654>
    2430:	e28dd05c 	add	sp, sp, #92	; 0x5c
    2434:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2438:	e1a03103 	lsl	r3, r3, #2
    243c:	e58d300c 	str	r3, [sp, #12]
    2440:	e1a02003 	mov	r2, r3
    2444:	e28b30c4 	add	r3, fp, #196	; 0xc4
    2448:	e0837002 	add	r7, r3, r2
    244c:	e1a00007 	mov	r0, r7
    2450:	ebfffffe 	bl	0 <pthread_mutex_lock>
    2454:	e3500000 	cmp	r0, #0
    2458:	1a000067 	bne	25fc <_ZN2AI10MainThreadEv+0xedc>
    245c:	e3a03cca 	mov	r3, #51712	; 0xca00
    2460:	e58d7000 	str	r7, [sp]
    2464:	e3433b9a 	movt	r3, #15258	; 0x3b9a
    2468:	e58db02c 	str	fp, [sp, #44]	; 0x2c
    246c:	e58d301c 	str	r3, [sp, #28]
    2470:	e58da030 	str	sl, [sp, #48]	; 0x30
    2474:	ea000004 	b	248c <_ZN2AI10MainThreadEv+0xd6c>
    2478:	e59d3010 	ldr	r3, [sp, #16]
    247c:	e5933000 	ldr	r3, [r3]
    2480:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    2484:	e3530000 	cmp	r3, #0
    2488:	1a000050 	bne	25d0 <_ZN2AI10MainThreadEv+0xeb0>
    248c:	e5d630e4 	ldrb	r3, [r6, #228]	; 0xe4
    2490:	e3530000 	cmp	r3, #0
    2494:	1a000029 	bne	2540 <_ZN2AI10MainThreadEv+0xe20>
    2498:	e28d8048 	add	r8, sp, #72	; 0x48
    249c:	e3a0ac2f 	mov	sl, #12032	; 0x2f00
    24a0:	e345a968 	movt	sl, #22888	; 0x5968
    24a4:	e3a0b000 	mov	fp, #0
    24a8:	e1a00008 	mov	r0, r8
    24ac:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    24b0:	e1cd04d8 	ldrd	r0, [sp, #72]	; 0x48
    24b4:	e5d630e4 	ldrb	r3, [r6, #228]	; 0xe4
    24b8:	e09aa000 	adds	sl, sl, r0
    24bc:	e0abb001 	adc	fp, fp, r1
    24c0:	e3530000 	cmp	r3, #0
    24c4:	1affffeb 	bne	2478 <_ZN2AI10MainThreadEv+0xd58>
    24c8:	e3a02cca 	mov	r2, #51712	; 0xca00
    24cc:	e3a03000 	mov	r3, #0
    24d0:	e3432b9a 	movt	r2, #15258	; 0x3b9a
    24d4:	e1a0000a 	mov	r0, sl
    24d8:	e1a0100b 	mov	r1, fp
    24dc:	e28d9050 	add	r9, sp, #80	; 0x50
    24e0:	ebfffffe 	bl	0 <__aeabi_ldivmod>
    24e4:	e59d301c 	ldr	r3, [sp, #28]
    24e8:	e59d1018 	ldr	r1, [sp, #24]
    24ec:	e59dc00c 	ldr	ip, [sp, #12]
    24f0:	e081700c 	add	r7, r1, ip
    24f4:	e0832390 	umull	r2, r3, r0, r3
    24f8:	e1a04000 	mov	r4, r0
    24fc:	e062500a 	rsb	r5, r2, sl
    2500:	e1a00007 	mov	r0, r7
    2504:	e59d1000 	ldr	r1, [sp]
    2508:	e1a02009 	mov	r2, r9
    250c:	e58d4050 	str	r4, [sp, #80]	; 0x50
    2510:	e58d5054 	str	r5, [sp, #84]	; 0x54
    2514:	ebfffffe 	bl	0 <pthread_cond_timedwait>
    2518:	e1a00008 	mov	r0, r8
    251c:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    2520:	e1cd24d8 	ldrd	r2, [sp, #72]	; 0x48
    2524:	e152000a 	cmp	r2, sl
    2528:	e0d3300b 	sbcs	r3, r3, fp
    252c:	aaffffd1 	bge	2478 <_ZN2AI10MainThreadEv+0xd58>
    2530:	e5d630e4 	ldrb	r3, [r6, #228]	; 0xe4
    2534:	e3530000 	cmp	r3, #0
    2538:	0afffff0 	beq	2500 <_ZN2AI10MainThreadEv+0xde0>
    253c:	eaffffcd 	b	2478 <_ZN2AI10MainThreadEv+0xd58>
    2540:	e59d7000 	ldr	r7, [sp]
    2544:	e3a03000 	mov	r3, #0
    2548:	e59db02c 	ldr	fp, [sp, #44]	; 0x2c
    254c:	e5c630e4 	strb	r3, [r6, #228]	; 0xe4
    2550:	e1a00007 	mov	r0, r7
    2554:	e59da030 	ldr	sl, [sp, #48]	; 0x30
    2558:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    255c:	e59b3098 	ldr	r3, [fp, #152]	; 0x98
    2560:	eafffed1 	b	20ac <_ZN2AI10MainThreadEv+0x98c>
    2564:	e59419c8 	ldr	r1, [r4, #2504]	; 0x9c8
    2568:	e1a03004 	mov	r3, r4
    256c:	e3510e27 	cmp	r1, #624	; 0x270
    2570:	2a0000e5 	bcs	290c <_ZN2AI10MainThreadEv+0x11ec>
    2574:	e0843101 	add	r3, r4, r1, lsl #2
    2578:	e2811001 	add	r1, r1, #1
    257c:	e5933008 	ldr	r3, [r3, #8]
    2580:	e02335a3 	eor	r3, r3, r3, lsr #11
    2584:	e3052680 	movw	r2, #22144	; 0x5680
    2588:	e3492d2c 	movt	r2, #40236	; 0x9d2c
    258c:	e3a00000 	mov	r0, #0
    2590:	e1a0c383 	lsl	ip, r3, #7
    2594:	e34e0fc6 	movt	r0, #61382	; 0xefc6
    2598:	e002200c 	and	r2, r2, ip
    259c:	e59fc178 	ldr	ip, [pc, #376]	; 271c <_ZN2AI10MainThreadEv+0xffc>
    25a0:	e0233002 	eor	r3, r3, r2
    25a4:	e08fc00c 	add	ip, pc, ip
    25a8:	e1a0e783 	lsl	lr, r3, #15
    25ac:	e000000e 	and	r0, r0, lr
    25b0:	e58c19c8 	str	r1, [ip, #2504]	; 0x9c8
    25b4:	e0233000 	eor	r3, r3, r0
    25b8:	e0230923 	eor	r0, r3, r3, lsr #18
    25bc:	eaffff5c 	b	2334 <_ZN2AI10MainThreadEv+0xc14>
    25c0:	e59d0014 	ldr	r0, [sp, #20]
    25c4:	e58d3010 	str	r3, [sp, #16]
    25c8:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    25cc:	eafffdce 	b	1d0c <_ZN2AI10MainThreadEv+0x5ec>
    25d0:	e59d7000 	ldr	r7, [sp]
    25d4:	e59db02c 	ldr	fp, [sp, #44]	; 0x2c
    25d8:	e59da030 	ldr	sl, [sp, #48]	; 0x30
    25dc:	e1a00007 	mov	r0, r7
    25e0:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    25e4:	e59b3098 	ldr	r3, [fp, #152]	; 0x98
    25e8:	eafffeaf 	b	20ac <_ZN2AI10MainThreadEv+0x98c>
    25ec:	e59d7000 	ldr	r7, [sp]
    25f0:	e1a00007 	mov	r0, r7
    25f4:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    25f8:	ebfffffe 	bl	0 <__cxa_end_cleanup>
    25fc:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>
    2600:	e59d0014 	ldr	r0, [sp, #20]
    2604:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    2608:	ebfffffe 	bl	0 <__cxa_end_cleanup>
    260c:	e59419c8 	ldr	r1, [r4, #2504]	; 0x9c8
    2610:	e3510e27 	cmp	r1, #624	; 0x270
    2614:	2a000048 	bcs	273c <_ZN2AI10MainThreadEv+0x101c>
    2618:	e0844101 	add	r4, r4, r1, lsl #2
    261c:	e2811001 	add	r1, r1, #1
    2620:	e5943008 	ldr	r3, [r4, #8]
    2624:	e02335a3 	eor	r3, r3, r3, lsr #11
    2628:	e3052680 	movw	r2, #22144	; 0x5680
    262c:	e3492d2c 	movt	r2, #40236	; 0x9d2c
    2630:	e3a00000 	mov	r0, #0
    2634:	e1a0c383 	lsl	ip, r3, #7
    2638:	e34e0fc6 	movt	r0, #61382	; 0xefc6
    263c:	e002200c 	and	r2, r2, ip
    2640:	e59fc0d8 	ldr	ip, [pc, #216]	; 2720 <_ZN2AI10MainThreadEv+0x1000>
    2644:	e0233002 	eor	r3, r3, r2
    2648:	e08fc00c 	add	ip, pc, ip
    264c:	e1a0e783 	lsl	lr, r3, #15
    2650:	e000000e 	and	r0, r0, lr
    2654:	e58c19c8 	str	r1, [ip, #2504]	; 0x9c8
    2658:	e0233000 	eor	r3, r3, r0
    265c:	e0230923 	eor	r0, r3, r3, lsr #18
    2660:	eafffd1f 	b	1ae4 <_ZN2AI10MainThreadEv+0x3c4>
    2664:	e596c9c8 	ldr	ip, [r6, #2504]	; 0x9c8
    2668:	e35c0e27 	cmp	ip, #624	; 0x270
    266c:	2a00006a 	bcs	281c <_ZN2AI10MainThreadEv+0x10fc>
    2670:	e086310c 	add	r3, r6, ip, lsl #2
    2674:	e28cc001 	add	ip, ip, #1
    2678:	e5933008 	ldr	r3, [r3, #8]
    267c:	e02335a3 	eor	r3, r3, r3, lsr #11
    2680:	e3051680 	movw	r1, #22144	; 0x5680
    2684:	e3491d2c 	movt	r1, #40236	; 0x9d2c
    2688:	e3a00000 	mov	r0, #0
    268c:	e1a02383 	lsl	r2, r3, #7
    2690:	e34e0fc6 	movt	r0, #61382	; 0xefc6
    2694:	e0011002 	and	r1, r1, r2
    2698:	e59f2084 	ldr	r2, [pc, #132]	; 2724 <_ZN2AI10MainThreadEv+0x1004>
    269c:	e0233001 	eor	r3, r3, r1
    26a0:	e08f2002 	add	r2, pc, r2
    26a4:	e1a01783 	lsl	r1, r3, #15
    26a8:	e0000001 	and	r0, r0, r1
    26ac:	e582c9c8 	str	ip, [r2, #2504]	; 0x9c8
    26b0:	e0201003 	eor	r1, r0, r3
    26b4:	e0210921 	eor	r0, r1, r1, lsr #18
    26b8:	eafffc89 	b	18e4 <_ZN2AI10MainThreadEv+0x1c4>
    26bc:	00000f84 	.word	0x00000f84
    26c0:	00000f4c 	.word	0x00000f4c
    26c4:	00000f38 	.word	0x00000f38
    26c8:	00000f4c 	.word	0x00000f4c
    26cc:	00000f44 	.word	0x00000f44
    26d0:	00000f24 	.word	0x00000f24
    26d4:	00000df4 	.word	0x00000df4
    26d8:	00000dcc 	.word	0x00000dcc
    26dc:	00000d74 	.word	0x00000d74
    26e0:	00000d74 	.word	0x00000d74
    26e4:	00000d68 	.word	0x00000d68
    26e8:	00000d4c 	.word	0x00000d4c
    26ec:	00000d3c 	.word	0x00000d3c
    26f0:	00000c10 	.word	0x00000c10
    26f4:	00000acc 	.word	0x00000acc
    26f8:	000009ec 	.word	0x000009ec
    26fc:	000009b0 	.word	0x000009b0
    2700:	000009a8 	.word	0x000009a8
    2704:	0000099c 	.word	0x0000099c
    2708:	00000538 	.word	0x00000538
    270c:	00000520 	.word	0x00000520
    2710:	00000538 	.word	0x00000538
    2714:	00000524 	.word	0x00000524
    2718:	000003ec 	.word	0x000003ec
    271c:	00000170 	.word	0x00000170
    2720:	000000d0 	.word	0x000000d0
    2724:	0000007c 	.word	0x0000007c
    2728:	ffffff90 	.word	0xffffff90
    272c:	ffffff40 	.word	0xffffff40
    2730:	fffffeb4 	.word	0xfffffeb4
    2734:	fffffe64 	.word	0xfffffe64
    2738:	fffffd7c 	.word	0xfffffd7c
    273c:	e2845fe5 	add	r5, r4, #916	; 0x394
    2740:	e5b40008 	ldr	r0, [r4, #8]!
    2744:	e30be0df 	movw	lr, #45279	; 0xb0df
    2748:	e284ce63 	add	ip, r4, #1584	; 0x630
    274c:	e349e908 	movt	lr, #39176	; 0x9908
    2750:	e2003102 	and	r3, r0, #-2147483648	; 0x80000000
    2754:	e5b40004 	ldr	r0, [r4, #4]!
    2758:	e5bc2004 	ldr	r2, [ip, #4]!
    275c:	e3c01102 	bic	r1, r0, #-2147483648	; 0x80000000
    2760:	e1811003 	orr	r1, r1, r3
    2764:	e3110001 	tst	r1, #1
    2768:	11a0300e 	movne	r3, lr
    276c:	03a03000 	moveq	r3, #0
    2770:	e1540005 	cmp	r4, r5
    2774:	e0233002 	eor	r3, r3, r2
    2778:	e02330a1 	eor	r3, r3, r1, lsr #1
    277c:	e5043004 	str	r3, [r4, #-4]
    2780:	1afffff2 	bne	2750 <_ZN2AI10MainThreadEv+0x1030>
    2784:	e51f0064 	ldr	r0, [pc, #-100]	; 2728 <_ZN2AI10MainThreadEv+0x1008>
    2788:	e30b50df 	movw	r5, #45279	; 0xb0df
    278c:	e3495908 	movt	r5, #39176	; 0x9908
    2790:	e08f0000 	add	r0, pc, r0
    2794:	e280ed27 	add	lr, r0, #2496	; 0x9c0
    2798:	e2804004 	add	r4, r0, #4
    279c:	e5b0c394 	ldr	ip, [r0, #916]!	; 0x394
    27a0:	e28ee004 	add	lr, lr, #4
    27a4:	e20c3102 	and	r3, ip, #-2147483648	; 0x80000000
    27a8:	e5b0c004 	ldr	ip, [r0, #4]!
    27ac:	e5b42004 	ldr	r2, [r4, #4]!
    27b0:	e3cc1102 	bic	r1, ip, #-2147483648	; 0x80000000
    27b4:	e1811003 	orr	r1, r1, r3
    27b8:	e3110001 	tst	r1, #1
    27bc:	11a03005 	movne	r3, r5
    27c0:	03a03000 	moveq	r3, #0
    27c4:	e150000e 	cmp	r0, lr
    27c8:	e0233002 	eor	r3, r3, r2
    27cc:	e02330a1 	eor	r3, r3, r1, lsr #1
    27d0:	e5003004 	str	r3, [r0, #-4]
    27d4:	1afffff2 	bne	27a4 <_ZN2AI10MainThreadEv+0x1084>
    27d8:	e51fc0b4 	ldr	ip, [pc, #-180]	; 272c <_ZN2AI10MainThreadEv+0x100c>
    27dc:	e3a01001 	mov	r1, #1
    27e0:	e30b40df 	movw	r4, #45279	; 0xb0df
    27e4:	e08fc00c 	add	ip, pc, ip
    27e8:	e3494908 	movt	r4, #39176	; 0x9908
    27ec:	e59c29c4 	ldr	r2, [ip, #2500]	; 0x9c4
    27f0:	e59c3008 	ldr	r3, [ip, #8]
    27f4:	e2022102 	and	r2, r2, #-2147483648	; 0x80000000
    27f8:	e59ce638 	ldr	lr, [ip, #1592]	; 0x638
    27fc:	e3c30102 	bic	r0, r3, #-2147483648	; 0x80000000
    2800:	e1802002 	orr	r2, r0, r2
    2804:	e0120001 	ands	r0, r2, r1
    2808:	e02e2132 	eor	r2, lr, r2, lsr r1
    280c:	11a00004 	movne	r0, r4
    2810:	e0200002 	eor	r0, r0, r2
    2814:	e58c09c4 	str	r0, [ip, #2500]	; 0x9c4
    2818:	eaffff81 	b	2624 <_ZN2AI10MainThreadEv+0xf04>
    281c:	e1a03006 	mov	r3, r6
    2820:	e30b40df 	movw	r4, #45279	; 0xb0df
    2824:	e5b3c008 	ldr	ip, [r3, #8]!
    2828:	e2865fe5 	add	r5, r6, #916	; 0x394
    282c:	e3494908 	movt	r4, #39176	; 0x9908
    2830:	e283ee63 	add	lr, r3, #1584	; 0x630
    2834:	e20c2102 	and	r2, ip, #-2147483648	; 0x80000000
    2838:	e5b3c004 	ldr	ip, [r3, #4]!
    283c:	e5be1004 	ldr	r1, [lr, #4]!
    2840:	e3cc0102 	bic	r0, ip, #-2147483648	; 0x80000000
    2844:	e1800002 	orr	r0, r0, r2
    2848:	e3100001 	tst	r0, #1
    284c:	11a02004 	movne	r2, r4
    2850:	03a02000 	moveq	r2, #0
    2854:	e1530005 	cmp	r3, r5
    2858:	e0222001 	eor	r2, r2, r1
    285c:	e02220a0 	eor	r2, r2, r0, lsr #1
    2860:	e5032004 	str	r2, [r3, #-4]
    2864:	1afffff2 	bne	2834 <_ZN2AI10MainThreadEv+0x1114>
    2868:	e51f0140 	ldr	r0, [pc, #-320]	; 2730 <_ZN2AI10MainThreadEv+0x1010>
    286c:	e30be0df 	movw	lr, #45279	; 0xb0df
    2870:	e349e908 	movt	lr, #39176	; 0x9908
    2874:	e08f0000 	add	r0, pc, r0
    2878:	e280cd27 	add	ip, r0, #2496	; 0x9c0
    287c:	e2804004 	add	r4, r0, #4
    2880:	e5b05394 	ldr	r5, [r0, #916]!	; 0x394
    2884:	e28cc004 	add	ip, ip, #4
    2888:	e2053102 	and	r3, r5, #-2147483648	; 0x80000000
    288c:	e5b05004 	ldr	r5, [r0, #4]!
    2890:	e5b42004 	ldr	r2, [r4, #4]!
    2894:	e3c51102 	bic	r1, r5, #-2147483648	; 0x80000000
    2898:	e1811003 	orr	r1, r1, r3
    289c:	e3110001 	tst	r1, #1
    28a0:	11a0300e 	movne	r3, lr
    28a4:	03a03000 	moveq	r3, #0
    28a8:	e150000c 	cmp	r0, ip
    28ac:	e0233002 	eor	r3, r3, r2
    28b0:	e02330a1 	eor	r3, r3, r1, lsr #1
    28b4:	e5003004 	str	r3, [r0, #-4]
    28b8:	1afffff2 	bne	2888 <_ZN2AI10MainThreadEv+0x1168>
    28bc:	e51f0190 	ldr	r0, [pc, #-400]	; 2734 <_ZN2AI10MainThreadEv+0x1014>
    28c0:	e3a0c001 	mov	ip, #1
    28c4:	e30b40df 	movw	r4, #45279	; 0xb0df
    28c8:	e08f0000 	add	r0, pc, r0
    28cc:	e3494908 	movt	r4, #39176	; 0x9908
    28d0:	e59029c4 	ldr	r2, [r0, #2500]	; 0x9c4
    28d4:	e5903008 	ldr	r3, [r0, #8]
    28d8:	e2022102 	and	r2, r2, #-2147483648	; 0x80000000
    28dc:	e590e638 	ldr	lr, [r0, #1592]	; 0x638
    28e0:	e3c31102 	bic	r1, r3, #-2147483648	; 0x80000000
    28e4:	e1812002 	orr	r2, r1, r2
    28e8:	e012100c 	ands	r1, r2, ip
    28ec:	e02e2c32 	eor	r2, lr, r2, lsr ip
    28f0:	11a01004 	movne	r1, r4
    28f4:	e0211002 	eor	r1, r1, r2
    28f8:	e58019c4 	str	r1, [r0, #2500]	; 0x9c4
    28fc:	eaffff5e 	b	267c <_ZN2AI10MainThreadEv+0xf5c>
    2900:	e59d0014 	ldr	r0, [sp, #20]
    2904:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    2908:	ebfffffe 	bl	0 <__cxa_end_cleanup>
    290c:	e1a00004 	mov	r0, r4
    2910:	e2835fe5 	add	r5, r3, #916	; 0x394
    2914:	e5b0c008 	ldr	ip, [r0, #8]!
    2918:	e30b40df 	movw	r4, #45279	; 0xb0df
    291c:	e3494908 	movt	r4, #39176	; 0x9908
    2920:	e280ee63 	add	lr, r0, #1584	; 0x630
    2924:	e20c3102 	and	r3, ip, #-2147483648	; 0x80000000
    2928:	e5b0c004 	ldr	ip, [r0, #4]!
    292c:	e5be2004 	ldr	r2, [lr, #4]!
    2930:	e3cc1102 	bic	r1, ip, #-2147483648	; 0x80000000
    2934:	e1811003 	orr	r1, r1, r3
    2938:	e3110001 	tst	r1, #1
    293c:	11a03004 	movne	r3, r4
    2940:	03a03000 	moveq	r3, #0
    2944:	e1500005 	cmp	r0, r5
    2948:	e0233002 	eor	r3, r3, r2
    294c:	e02330a1 	eor	r3, r3, r1, lsr #1
    2950:	e5003004 	str	r3, [r0, #-4]
    2954:	1afffff2 	bne	2924 <_ZN2AI10MainThreadEv+0x1204>
    2958:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
    295c:	e30b40df 	movw	r4, #45279	; 0xb0df
    2960:	e59d5044 	ldr	r5, [sp, #68]	; 0x44
    2964:	e3494908 	movt	r4, #39176	; 0x9908
    2968:	e283e004 	add	lr, r3, #4
    296c:	e1a00003 	mov	r0, r3
    2970:	e5b0c394 	ldr	ip, [r0, #916]!	; 0x394
    2974:	e20c3102 	and	r3, ip, #-2147483648	; 0x80000000
    2978:	e5b0c004 	ldr	ip, [r0, #4]!
    297c:	e5be2004 	ldr	r2, [lr, #4]!
    2980:	e3cc1102 	bic	r1, ip, #-2147483648	; 0x80000000
    2984:	e1811003 	orr	r1, r1, r3
    2988:	e3110001 	tst	r1, #1
    298c:	11a03004 	movne	r3, r4
    2990:	03a03000 	moveq	r3, #0
    2994:	e1500005 	cmp	r0, r5
    2998:	e0233002 	eor	r3, r3, r2
    299c:	e02330a1 	eor	r3, r3, r1, lsr #1
    29a0:	e5003004 	str	r3, [r0, #-4]
    29a4:	1afffff2 	bne	2974 <_ZN2AI10MainThreadEv+0x1254>
    29a8:	e51fc278 	ldr	ip, [pc, #-632]	; 2738 <_ZN2AI10MainThreadEv+0x1018>
    29ac:	e3a01001 	mov	r1, #1
    29b0:	e30b40df 	movw	r4, #45279	; 0xb0df
    29b4:	e08fc00c 	add	ip, pc, ip
    29b8:	e3494908 	movt	r4, #39176	; 0x9908
    29bc:	e59c29c4 	ldr	r2, [ip, #2500]	; 0x9c4
    29c0:	e59c3008 	ldr	r3, [ip, #8]
    29c4:	e2022102 	and	r2, r2, #-2147483648	; 0x80000000
    29c8:	e59ce638 	ldr	lr, [ip, #1592]	; 0x638
    29cc:	e3c30102 	bic	r0, r3, #-2147483648	; 0x80000000
    29d0:	e1802002 	orr	r2, r0, r2
    29d4:	e0120001 	ands	r0, r2, r1
    29d8:	e02e2132 	eor	r2, lr, r2, lsr r1
    29dc:	11a00004 	movne	r0, r4
    29e0:	e0200002 	eor	r0, r0, r2
    29e4:	e58c09c4 	str	r0, [ip, #2500]	; 0x9c4
    29e8:	eafffee4 	b	2580 <_ZN2AI10MainThreadEv+0xe60>

000029ec <_ZN2AI9MaxHeightEPK10QuadSquare>:
    29ec:	e92d4010 	push	{r4, lr}
    29f0:	e3a03000 	mov	r3, #0
    29f4:	e1a04000 	mov	r4, r0
    29f8:	e7d42283 	ldrb	r2, [r4, r3, lsl #5]
    29fc:	e3120001 	tst	r2, #1
    2a00:	0a000002 	beq	2a10 <_ZN2AI9MaxHeightEPK10QuadSquare+0x24>
    2a04:	e2833001 	add	r3, r3, #1
    2a08:	e3530014 	cmp	r3, #20
    2a0c:	1afffff9 	bne	29f8 <_ZN2AI9MaxHeightEPK10QuadSquare+0xc>
    2a10:	e1a00003 	mov	r0, r3
    2a14:	e3a0e001 	mov	lr, #1
    2a18:	e3500013 	cmp	r0, #19
    2a1c:	8a000018 	bhi	2a84 <_ZN2AI9MaxHeightEPK10QuadSquare+0x98>
    2a20:	e08ec180 	add	ip, lr, r0, lsl #3
    2a24:	e7d4110c 	ldrb	r1, [r4, ip, lsl #2]
    2a28:	e084c10c 	add	ip, r4, ip, lsl #2
    2a2c:	e2111001 	ands	r1, r1, #1
    2a30:	0a000008 	beq	2a58 <_ZN2AI9MaxHeightEPK10QuadSquare+0x6c>
    2a34:	e2601014 	rsb	r1, r0, #20
    2a38:	e3a03000 	mov	r3, #0
    2a3c:	ea000002 	b	2a4c <_ZN2AI9MaxHeightEPK10QuadSquare+0x60>
    2a40:	e7dc2283 	ldrb	r2, [ip, r3, lsl #5]
    2a44:	e3120001 	tst	r2, #1
    2a48:	0a000007 	beq	2a6c <_ZN2AI9MaxHeightEPK10QuadSquare+0x80>
    2a4c:	e2833001 	add	r3, r3, #1
    2a50:	e1530001 	cmp	r3, r1
    2a54:	1afffff9 	bne	2a40 <_ZN2AI9MaxHeightEPK10QuadSquare+0x54>
    2a58:	e28ee001 	add	lr, lr, #1
    2a5c:	e0810000 	add	r0, r1, r0
    2a60:	e35e0008 	cmp	lr, #8
    2a64:	1affffeb 	bne	2a18 <_ZN2AI9MaxHeightEPK10QuadSquare+0x2c>
    2a68:	e8bd8010 	pop	{r4, pc}
    2a6c:	e28ee001 	add	lr, lr, #1
    2a70:	e1a01003 	mov	r1, r3
    2a74:	e35e0008 	cmp	lr, #8
    2a78:	e0810000 	add	r0, r1, r0
    2a7c:	1affffe5 	bne	2a18 <_ZN2AI9MaxHeightEPK10QuadSquare+0x2c>
    2a80:	eafffff8 	b	2a68 <_ZN2AI9MaxHeightEPK10QuadSquare+0x7c>
    2a84:	e28ee001 	add	lr, lr, #1
    2a88:	e3a01000 	mov	r1, #0
    2a8c:	e35e0008 	cmp	lr, #8
    2a90:	e0810000 	add	r0, r1, r0
    2a94:	1affffdf 	bne	2a18 <_ZN2AI9MaxHeightEPK10QuadSquare+0x2c>
    2a98:	eafffff2 	b	2a68 <_ZN2AI9MaxHeightEPK10QuadSquare+0x7c>

00002a9c <_ZN2AI12ColumnHeightEPK10QuadSquarejj>:
    2a9c:	e3510013 	cmp	r1, #19
    2aa0:	8a000013 	bhi	2af4 <_ZN2AI12ColumnHeightEPK10QuadSquarejj+0x58>
    2aa4:	e0822181 	add	r2, r2, r1, lsl #3
    2aa8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    2aac:	e7d0e102 	ldrb	lr, [r0, r2, lsl #2]
    2ab0:	e0802102 	add	r2, r0, r2, lsl #2
    2ab4:	e21ee001 	ands	lr, lr, #1
    2ab8:	0a000010 	beq	2b00 <_ZN2AI12ColumnHeightEPK10QuadSquarejj+0x64>
    2abc:	e2610014 	rsb	r0, r1, #20
    2ac0:	e3a03000 	mov	r3, #0
    2ac4:	ea000002 	b	2ad4 <_ZN2AI12ColumnHeightEPK10QuadSquarejj+0x38>
    2ac8:	e7d2c283 	ldrb	ip, [r2, r3, lsl #5]
    2acc:	e31c0001 	tst	ip, #1
    2ad0:	0a000004 	beq	2ae8 <_ZN2AI12ColumnHeightEPK10QuadSquarejj+0x4c>
    2ad4:	e2833001 	add	r3, r3, #1
    2ad8:	e1530000 	cmp	r3, r0
    2adc:	1afffff9 	bne	2ac8 <_ZN2AI12ColumnHeightEPK10QuadSquarejj+0x2c>
    2ae0:	e0800001 	add	r0, r0, r1
    2ae4:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    2ae8:	e1a00003 	mov	r0, r3
    2aec:	e0800001 	add	r0, r0, r1
    2af0:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    2af4:	e3a00000 	mov	r0, #0
    2af8:	e0800001 	add	r0, r0, r1
    2afc:	e12fff1e 	bx	lr
    2b00:	e1a0000e 	mov	r0, lr
    2b04:	eafffff5 	b	2ae0 <_ZN2AI12ColumnHeightEPK10QuadSquarejj+0x44>

00002b08 <_ZN2AI13CheckForLinesEPK10QuadSquare>:
    2b08:	e3a01000 	mov	r1, #0
    2b0c:	e1a03000 	mov	r3, r0
    2b10:	e5d3c004 	ldrb	ip, [r3, #4]
    2b14:	e7d02281 	ldrb	r2, [r0, r1, lsl #5]
    2b18:	e31c0001 	tst	ip, #1
    2b1c:	e5d3c008 	ldrb	ip, [r3, #8]
    2b20:	e2022001 	and	r2, r2, #1
    2b24:	12822001 	addne	r2, r2, #1
    2b28:	e31c0001 	tst	ip, #1
    2b2c:	e5d3c00c 	ldrb	ip, [r3, #12]
    2b30:	12822001 	addne	r2, r2, #1
    2b34:	e31c0001 	tst	ip, #1
    2b38:	e5d3c010 	ldrb	ip, [r3, #16]
    2b3c:	12822001 	addne	r2, r2, #1
    2b40:	e31c0001 	tst	ip, #1
    2b44:	e5d3c014 	ldrb	ip, [r3, #20]
    2b48:	12822001 	addne	r2, r2, #1
    2b4c:	e31c0001 	tst	ip, #1
    2b50:	e5d3c018 	ldrb	ip, [r3, #24]
    2b54:	12822001 	addne	r2, r2, #1
    2b58:	e31c0001 	tst	ip, #1
    2b5c:	0a000004 	beq	2b74 <_ZN2AI13CheckForLinesEPK10QuadSquare+0x6c>
    2b60:	e5d3c01c 	ldrb	ip, [r3, #28]
    2b64:	e31c0001 	tst	ip, #1
    2b68:	0a000001 	beq	2b74 <_ZN2AI13CheckForLinesEPK10QuadSquare+0x6c>
    2b6c:	e3520006 	cmp	r2, #6
    2b70:	0a000005 	beq	2b8c <_ZN2AI13CheckForLinesEPK10QuadSquare+0x84>
    2b74:	e2811001 	add	r1, r1, #1
    2b78:	e2833020 	add	r3, r3, #32
    2b7c:	e3510014 	cmp	r1, #20
    2b80:	1affffe2 	bne	2b10 <_ZN2AI13CheckForLinesEPK10QuadSquare+0x8>
    2b84:	e3e00000 	mvn	r0, #0
    2b88:	e12fff1e 	bx	lr
    2b8c:	e1a00001 	mov	r0, r1
    2b90:	e12fff1e 	bx	lr

00002b94 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb>:
    2b94:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
    2b98:	e1a02000 	mov	r2, r0
    2b9c:	e3a03000 	mov	r3, #0
    2ba0:	ea000003 	b	2bb4 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0x20>
    2ba4:	e2833001 	add	r3, r3, #1
    2ba8:	e2822020 	add	r2, r2, #32
    2bac:	e3530014 	cmp	r3, #20
    2bb0:	08bd80f8 	popeq	{r3, r4, r5, r6, r7, pc}
    2bb4:	e5d2c004 	ldrb	ip, [r2, #4]
    2bb8:	e7d01283 	ldrb	r1, [r0, r3, lsl #5]
    2bbc:	e31c0001 	tst	ip, #1
    2bc0:	e5d2c008 	ldrb	ip, [r2, #8]
    2bc4:	e2011001 	and	r1, r1, #1
    2bc8:	12811001 	addne	r1, r1, #1
    2bcc:	e31c0001 	tst	ip, #1
    2bd0:	e5d2c00c 	ldrb	ip, [r2, #12]
    2bd4:	12811001 	addne	r1, r1, #1
    2bd8:	e31c0001 	tst	ip, #1
    2bdc:	e5d2c010 	ldrb	ip, [r2, #16]
    2be0:	12811001 	addne	r1, r1, #1
    2be4:	e31c0001 	tst	ip, #1
    2be8:	e5d2c014 	ldrb	ip, [r2, #20]
    2bec:	12811001 	addne	r1, r1, #1
    2bf0:	e31c0001 	tst	ip, #1
    2bf4:	e5d2c018 	ldrb	ip, [r2, #24]
    2bf8:	12811001 	addne	r1, r1, #1
    2bfc:	e31c0001 	tst	ip, #1
    2c00:	0affffe7 	beq	2ba4 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0x10>
    2c04:	e5d2c01c 	ldrb	ip, [r2, #28]
    2c08:	e31c0001 	tst	ip, #1
    2c0c:	0affffe4 	beq	2ba4 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0x10>
    2c10:	e3510006 	cmp	r1, #6
    2c14:	1affffe2 	bne	2ba4 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0x10>
    2c18:	e1a04000 	mov	r4, r0
    2c1c:	e1a01003 	mov	r1, r3
    2c20:	e3510013 	cmp	r1, #19
    2c24:	0a000030 	beq	2cec <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0x158>
    2c28:	e2815002 	add	r5, r1, #2
    2c2c:	e2816001 	add	r6, r1, #1
    2c30:	e0843281 	add	r3, r4, r1, lsl #5
    2c34:	e1a05185 	lsl	r5, r5, #3
    2c38:	e2837020 	add	r7, r3, #32
    2c3c:	e3550007 	cmp	r5, #7
    2c40:	e1a00003 	mov	r0, r3
    2c44:	e3a02020 	mov	r2, #32
    2c48:	e1a01007 	mov	r1, r7
    2c4c:	e2866001 	add	r6, r6, #1
    2c50:	9a000000 	bls	2c58 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0xc4>
    2c54:	ebfffffe 	bl	0 <memmove>
    2c58:	e3560014 	cmp	r6, #20
    2c5c:	e2855008 	add	r5, r5, #8
    2c60:	e1a03007 	mov	r3, r7
    2c64:	1afffff3 	bne	2c38 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0xa4>
    2c68:	e1a03004 	mov	r3, r4
    2c6c:	e3a01000 	mov	r1, #0
    2c70:	ea000003 	b	2c84 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0xf0>
    2c74:	e2811001 	add	r1, r1, #1
    2c78:	e2833020 	add	r3, r3, #32
    2c7c:	e3510014 	cmp	r1, #20
    2c80:	08bd80f8 	popeq	{r3, r4, r5, r6, r7, pc}
    2c84:	e5d30004 	ldrb	r0, [r3, #4]
    2c88:	e7d42281 	ldrb	r2, [r4, r1, lsl #5]
    2c8c:	e3100001 	tst	r0, #1
    2c90:	e5d30008 	ldrb	r0, [r3, #8]
    2c94:	e2022001 	and	r2, r2, #1
    2c98:	12822001 	addne	r2, r2, #1
    2c9c:	e3100001 	tst	r0, #1
    2ca0:	e5d3000c 	ldrb	r0, [r3, #12]
    2ca4:	12822001 	addne	r2, r2, #1
    2ca8:	e3100001 	tst	r0, #1
    2cac:	e5d30010 	ldrb	r0, [r3, #16]
    2cb0:	12822001 	addne	r2, r2, #1
    2cb4:	e3100001 	tst	r0, #1
    2cb8:	e5d30014 	ldrb	r0, [r3, #20]
    2cbc:	12822001 	addne	r2, r2, #1
    2cc0:	e3100001 	tst	r0, #1
    2cc4:	e5d30018 	ldrb	r0, [r3, #24]
    2cc8:	12822001 	addne	r2, r2, #1
    2ccc:	e3100001 	tst	r0, #1
    2cd0:	0affffe7 	beq	2c74 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0xe0>
    2cd4:	e5d3001c 	ldrb	r0, [r3, #28]
    2cd8:	e3100001 	tst	r0, #1
    2cdc:	0affffe4 	beq	2c74 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0xe0>
    2ce0:	e3520006 	cmp	r2, #6
    2ce4:	1affffe2 	bne	2c74 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0xe0>
    2ce8:	eaffffcc 	b	2c20 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0x8c>
    2cec:	e5d46260 	ldrb	r6, [r4, #608]	; 0x260
    2cf0:	e5d45264 	ldrb	r5, [r4, #612]	; 0x264
    2cf4:	e5d4e268 	ldrb	lr, [r4, #616]	; 0x268
    2cf8:	e3c66001 	bic	r6, r6, #1
    2cfc:	e5d4c26c 	ldrb	ip, [r4, #620]	; 0x26c
    2d00:	e3c55001 	bic	r5, r5, #1
    2d04:	e5d40270 	ldrb	r0, [r4, #624]	; 0x270
    2d08:	e3cee001 	bic	lr, lr, #1
    2d0c:	e5d41274 	ldrb	r1, [r4, #628]	; 0x274
    2d10:	e3ccc001 	bic	ip, ip, #1
    2d14:	e5d42278 	ldrb	r2, [r4, #632]	; 0x278
    2d18:	e3c00001 	bic	r0, r0, #1
    2d1c:	e5d4327c 	ldrb	r3, [r4, #636]	; 0x27c
    2d20:	e3c11001 	bic	r1, r1, #1
    2d24:	e3c22001 	bic	r2, r2, #1
    2d28:	e5c46260 	strb	r6, [r4, #608]	; 0x260
    2d2c:	e3c33001 	bic	r3, r3, #1
    2d30:	e5c45264 	strb	r5, [r4, #612]	; 0x264
    2d34:	e5c4e268 	strb	lr, [r4, #616]	; 0x268
    2d38:	e5c4c26c 	strb	ip, [r4, #620]	; 0x26c
    2d3c:	e5c40270 	strb	r0, [r4, #624]	; 0x270
    2d40:	e5c41274 	strb	r1, [r4, #628]	; 0x274
    2d44:	e5c42278 	strb	r2, [r4, #632]	; 0x278
    2d48:	e5c4327c 	strb	r3, [r4, #636]	; 0x27c
    2d4c:	eaffffc5 	b	2c68 <_ZN2AI17UpdateMatrixLinesEP10QuadSquareb+0xd4>

00002d50 <_ZN2AI14WaitForReqDataEv>:
    2d50:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2d54:	e29030a4 	adds	r3, r0, #164	; 0xa4
    2d58:	e24dd01c 	sub	sp, sp, #28
    2d5c:	e1a08000 	mov	r8, r0
    2d60:	e58d3000 	str	r3, [sp]
    2d64:	0a000046 	beq	2e84 <_ZN2AI14WaitForReqDataEv+0x134>
    2d68:	e1a00003 	mov	r0, r3
    2d6c:	ebfffffe 	bl	0 <pthread_mutex_lock>
    2d70:	e3500000 	cmp	r0, #0
    2d74:	1a000041 	bne	2e80 <_ZN2AI14WaitForReqDataEv+0x130>
    2d78:	e3a03cca 	mov	r3, #51712	; 0xca00
    2d7c:	e3433b9a 	movt	r3, #15258	; 0x3b9a
    2d80:	e58d3004 	str	r3, [sp, #4]
    2d84:	ea000005 	b	2da0 <_ZN2AI14WaitForReqDataEv+0x50>
    2d88:	e59f30fc 	ldr	r3, [pc, #252]	; 2e8c <_ZN2AI14WaitForReqDataEv+0x13c>
    2d8c:	e79f3003 	ldr	r3, [pc, r3]
    2d90:	e5933000 	ldr	r3, [r3]
    2d94:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    2d98:	e3530000 	cmp	r3, #0
    2d9c:	1a000030 	bne	2e64 <_ZN2AI14WaitForReqDataEv+0x114>
    2da0:	e5d830ac 	ldrb	r3, [r8, #172]	; 0xac
    2da4:	e3530000 	cmp	r3, #0
    2da8:	1a000027 	bne	2e4c <_ZN2AI14WaitForReqDataEv+0xfc>
    2dac:	e28d6008 	add	r6, sp, #8
    2db0:	e3a0ac2f 	mov	sl, #12032	; 0x2f00
    2db4:	e345a968 	movt	sl, #22888	; 0x5968
    2db8:	e3a0b000 	mov	fp, #0
    2dbc:	e1a00006 	mov	r0, r6
    2dc0:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    2dc4:	e1cd00d8 	ldrd	r0, [sp, #8]
    2dc8:	e5d830ac 	ldrb	r3, [r8, #172]	; 0xac
    2dcc:	e09aa000 	adds	sl, sl, r0
    2dd0:	e0abb001 	adc	fp, fp, r1
    2dd4:	e3530000 	cmp	r3, #0
    2dd8:	1affffea 	bne	2d88 <_ZN2AI14WaitForReqDataEv+0x38>
    2ddc:	e3a02cca 	mov	r2, #51712	; 0xca00
    2de0:	e3a03000 	mov	r3, #0
    2de4:	e3432b9a 	movt	r2, #15258	; 0x3b9a
    2de8:	e1a0000a 	mov	r0, sl
    2dec:	e1a0100b 	mov	r1, fp
    2df0:	e28890a8 	add	r9, r8, #168	; 0xa8
    2df4:	ebfffffe 	bl	0 <__aeabi_ldivmod>
    2df8:	e59d3004 	ldr	r3, [sp, #4]
    2dfc:	e28d7010 	add	r7, sp, #16
    2e00:	e0832390 	umull	r2, r3, r0, r3
    2e04:	e1a04000 	mov	r4, r0
    2e08:	e062500a 	rsb	r5, r2, sl
    2e0c:	e1a00009 	mov	r0, r9
    2e10:	e59d1000 	ldr	r1, [sp]
    2e14:	e1a02007 	mov	r2, r7
    2e18:	e58d4010 	str	r4, [sp, #16]
    2e1c:	e58d5014 	str	r5, [sp, #20]
    2e20:	ebfffffe 	bl	0 <pthread_cond_timedwait>
    2e24:	e1a00006 	mov	r0, r6
    2e28:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    2e2c:	e1cd20d8 	ldrd	r2, [sp, #8]
    2e30:	e152000a 	cmp	r2, sl
    2e34:	e0d3300b 	sbcs	r3, r3, fp
    2e38:	aaffffd2 	bge	2d88 <_ZN2AI14WaitForReqDataEv+0x38>
    2e3c:	e5d830ac 	ldrb	r3, [r8, #172]	; 0xac
    2e40:	e3530000 	cmp	r3, #0
    2e44:	0afffff0 	beq	2e0c <_ZN2AI14WaitForReqDataEv+0xbc>
    2e48:	eaffffce 	b	2d88 <_ZN2AI14WaitForReqDataEv+0x38>
    2e4c:	e3a03000 	mov	r3, #0
    2e50:	e59d0000 	ldr	r0, [sp]
    2e54:	e5c830ac 	strb	r3, [r8, #172]	; 0xac
    2e58:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    2e5c:	e28dd01c 	add	sp, sp, #28
    2e60:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2e64:	e59d0000 	ldr	r0, [sp]
    2e68:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    2e6c:	e28dd01c 	add	sp, sp, #28
    2e70:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2e74:	e59d0000 	ldr	r0, [sp]
    2e78:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    2e7c:	ebfffffe 	bl	0 <__cxa_end_cleanup>
    2e80:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>
    2e84:	e3a00001 	mov	r0, #1
    2e88:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>
    2e8c:	000000f8 	.word	0x000000f8

00002e90 <_ZN2AI10SetHasDataEv>:
    2e90:	e1a03000 	mov	r3, r0
    2e94:	e3a02001 	mov	r2, #1
    2e98:	e28000b4 	add	r0, r0, #180	; 0xb4
    2e9c:	e5c320b8 	strb	r2, [r3, #184]	; 0xb8
    2ea0:	e5c320b9 	strb	r2, [r3, #185]	; 0xb9
    2ea4:	eafffffe 	b	0 <_ZNSt18condition_variable10notify_oneEv>

00002ea8 <_ZN2AI21WaitConsumerDataFetchEv>:
    2ea8:	e92d4070 	push	{r4, r5, r6, lr}
    2eac:	e1a04000 	mov	r4, r0
    2eb0:	e2800088 	add	r0, r0, #136	; 0x88
    2eb4:	e24dd008 	sub	sp, sp, #8
    2eb8:	e3500000 	cmp	r0, #0
    2ebc:	e3a03000 	mov	r3, #0
    2ec0:	e58d0000 	str	r0, [sp]
    2ec4:	e5cd3004 	strb	r3, [sp, #4]
    2ec8:	0a000021 	beq	2f54 <_ZN2AI21WaitConsumerDataFetchEv+0xac>
    2ecc:	ebfffffe 	bl	0 <pthread_mutex_lock>
    2ed0:	e3500000 	cmp	r0, #0
    2ed4:	02846090 	addeq	r6, r4, #144	; 0x90
    2ed8:	03a03001 	moveq	r3, #1
    2edc:	01a0500d 	moveq	r5, sp
    2ee0:	05cd3004 	strbeq	r3, [sp, #4]
    2ee4:	0a000003 	beq	2ef8 <_ZN2AI21WaitConsumerDataFetchEv+0x50>
    2ee8:	ea000018 	b	2f50 <_ZN2AI21WaitConsumerDataFetchEv+0xa8>
    2eec:	e1a00006 	mov	r0, r6
    2ef0:	e1a01005 	mov	r1, r5
    2ef4:	ebfffffe 	bl	0 <_ZNSt18condition_variable4waitERSt11unique_lockISt5mutexE>
    2ef8:	e5d4308c 	ldrb	r3, [r4, #140]	; 0x8c
    2efc:	e3530000 	cmp	r3, #0
    2f00:	0afffff9 	beq	2eec <_ZN2AI21WaitConsumerDataFetchEv+0x44>
    2f04:	e5dd3004 	ldrb	r3, [sp, #4]
    2f08:	e3a02000 	mov	r2, #0
    2f0c:	e5c4208c 	strb	r2, [r4, #140]	; 0x8c
    2f10:	e1530002 	cmp	r3, r2
    2f14:	0a000003 	beq	2f28 <_ZN2AI21WaitConsumerDataFetchEv+0x80>
    2f18:	e59d0000 	ldr	r0, [sp]
    2f1c:	e1500002 	cmp	r0, r2
    2f20:	0a000000 	beq	2f28 <_ZN2AI21WaitConsumerDataFetchEv+0x80>
    2f24:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    2f28:	e28dd008 	add	sp, sp, #8
    2f2c:	e8bd8070 	pop	{r4, r5, r6, pc}
    2f30:	e5dd3004 	ldrb	r3, [sp, #4]
    2f34:	e3530000 	cmp	r3, #0
    2f38:	0a000003 	beq	2f4c <_ZN2AI21WaitConsumerDataFetchEv+0xa4>
    2f3c:	e59d0000 	ldr	r0, [sp]
    2f40:	e3500000 	cmp	r0, #0
    2f44:	0a000000 	beq	2f4c <_ZN2AI21WaitConsumerDataFetchEv+0xa4>
    2f48:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    2f4c:	ebfffffe 	bl	0 <__cxa_end_cleanup>
    2f50:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>
    2f54:	e3a00001 	mov	r0, #1
    2f58:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>

00002f5c <_ZN2AI13WaitPredStartEj>:
    2f5c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2f60:	e1a03101 	lsl	r3, r1, #2
    2f64:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    2f68:	e1a0a001 	mov	sl, r1
    2f6c:	e1a02003 	mov	r2, r3
    2f70:	e58d300c 	str	r3, [sp, #12]
    2f74:	e28030cc 	add	r3, r0, #204	; 0xcc
    2f78:	e0933002 	adds	r3, r3, r2
    2f7c:	e58d0008 	str	r0, [sp, #8]
    2f80:	e58d3014 	str	r3, [sp, #20]
    2f84:	0a000051 	beq	30d0 <_ZN2AI13WaitPredStartEj+0x174>
    2f88:	e1a00003 	mov	r0, r3
    2f8c:	e1a09003 	mov	r9, r3
    2f90:	ebfffffe 	bl	0 <pthread_mutex_lock>
    2f94:	e3500000 	cmp	r0, #0
    2f98:	1a00004b 	bne	30cc <_ZN2AI13WaitPredStartEj+0x170>
    2f9c:	e59d2008 	ldr	r2, [sp, #8]
    2fa0:	e3a03cca 	mov	r3, #51712	; 0xca00
    2fa4:	e3433b9a 	movt	r3, #15258	; 0x3b9a
    2fa8:	e58d3010 	str	r3, [sp, #16]
    2fac:	e082a00a 	add	sl, r2, sl
    2fb0:	e58da004 	str	sl, [sp, #4]
    2fb4:	ea000005 	b	2fd0 <_ZN2AI13WaitPredStartEj+0x74>
    2fb8:	e59f3118 	ldr	r3, [pc, #280]	; 30d8 <_ZN2AI13WaitPredStartEj+0x17c>
    2fbc:	e79f3003 	ldr	r3, [pc, r3]
    2fc0:	e5933000 	ldr	r3, [r3]
    2fc4:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    2fc8:	e3530000 	cmp	r3, #0
    2fcc:	1a000037 	bne	30b0 <_ZN2AI13WaitPredStartEj+0x154>
    2fd0:	e59d3004 	ldr	r3, [sp, #4]
    2fd4:	e5d330e6 	ldrb	r3, [r3, #230]	; 0xe6
    2fd8:	e3530000 	cmp	r3, #0
    2fdc:	1a00002c 	bne	3094 <_ZN2AI13WaitPredStartEj+0x138>
    2fe0:	e28d7018 	add	r7, sp, #24
    2fe4:	e3a0ac2f 	mov	sl, #12032	; 0x2f00
    2fe8:	e345a968 	movt	sl, #22888	; 0x5968
    2fec:	e3a0b000 	mov	fp, #0
    2ff0:	e1a00007 	mov	r0, r7
    2ff4:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    2ff8:	e59d3004 	ldr	r3, [sp, #4]
    2ffc:	e1cd01d8 	ldrd	r0, [sp, #24]
    3000:	e5d330e6 	ldrb	r3, [r3, #230]	; 0xe6
    3004:	e09aa000 	adds	sl, sl, r0
    3008:	e0abb001 	adc	fp, fp, r1
    300c:	e3530000 	cmp	r3, #0
    3010:	1affffe8 	bne	2fb8 <_ZN2AI13WaitPredStartEj+0x5c>
    3014:	e3a02cca 	mov	r2, #51712	; 0xca00
    3018:	e3a03000 	mov	r3, #0
    301c:	e3432b9a 	movt	r2, #15258	; 0x3b9a
    3020:	e1a0000a 	mov	r0, sl
    3024:	e1a0100b 	mov	r1, fp
    3028:	e28d8020 	add	r8, sp, #32
    302c:	ebfffffe 	bl	0 <__aeabi_ldivmod>
    3030:	e59d3010 	ldr	r3, [sp, #16]
    3034:	e59d1008 	ldr	r1, [sp, #8]
    3038:	e28160dc 	add	r6, r1, #220	; 0xdc
    303c:	e59d100c 	ldr	r1, [sp, #12]
    3040:	e0866001 	add	r6, r6, r1
    3044:	e0832390 	umull	r2, r3, r0, r3
    3048:	e1a04000 	mov	r4, r0
    304c:	e062500a 	rsb	r5, r2, sl
    3050:	e1a00006 	mov	r0, r6
    3054:	e1a01009 	mov	r1, r9
    3058:	e1a02008 	mov	r2, r8
    305c:	e58d4020 	str	r4, [sp, #32]
    3060:	e58d5024 	str	r5, [sp, #36]	; 0x24
    3064:	ebfffffe 	bl	0 <pthread_cond_timedwait>
    3068:	e1a00007 	mov	r0, r7
    306c:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    3070:	e1cd21d8 	ldrd	r2, [sp, #24]
    3074:	e152000a 	cmp	r2, sl
    3078:	e0d3300b 	sbcs	r3, r3, fp
    307c:	aaffffcd 	bge	2fb8 <_ZN2AI13WaitPredStartEj+0x5c>
    3080:	e59d3004 	ldr	r3, [sp, #4]
    3084:	e5d330e6 	ldrb	r3, [r3, #230]	; 0xe6
    3088:	e3530000 	cmp	r3, #0
    308c:	0affffef 	beq	3050 <_ZN2AI13WaitPredStartEj+0xf4>
    3090:	eaffffc8 	b	2fb8 <_ZN2AI13WaitPredStartEj+0x5c>
    3094:	e59da004 	ldr	sl, [sp, #4]
    3098:	e3a03000 	mov	r3, #0
    309c:	e59d0014 	ldr	r0, [sp, #20]
    30a0:	e5ca30e6 	strb	r3, [sl, #230]	; 0xe6
    30a4:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    30a8:	e28dd02c 	add	sp, sp, #44	; 0x2c
    30ac:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    30b0:	e59d0014 	ldr	r0, [sp, #20]
    30b4:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    30b8:	e28dd02c 	add	sp, sp, #44	; 0x2c
    30bc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    30c0:	e59d0014 	ldr	r0, [sp, #20]
    30c4:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    30c8:	ebfffffe 	bl	0 <__cxa_end_cleanup>
    30cc:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>
    30d0:	e3a00001 	mov	r0, #1
    30d4:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>
    30d8:	00000114 	.word	0x00000114

000030dc <_ZN2AI13StartAllPredsEv>:
    30dc:	e92d4070 	push	{r4, r5, r6, lr}
    30e0:	e1a04000 	mov	r4, r0
    30e4:	e28060dc 	add	r6, r0, #220	; 0xdc
    30e8:	e3a05001 	mov	r5, #1
    30ec:	e28000e0 	add	r0, r0, #224	; 0xe0
    30f0:	e5c450e7 	strb	r5, [r4, #231]	; 0xe7
    30f4:	ebfffffe 	bl	0 <_ZNSt18condition_variable10notify_oneEv>
    30f8:	e5c450e6 	strb	r5, [r4, #230]	; 0xe6
    30fc:	e1a00006 	mov	r0, r6
    3100:	e8bd4070 	pop	{r4, r5, r6, lr}
    3104:	eafffffe 	b	0 <_ZNSt18condition_variable10notify_oneEv>

00003108 <_ZN2AI17WaitForPredFinishEj>:
    3108:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    310c:	e1a03101 	lsl	r3, r1, #2
    3110:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    3114:	e1a0a001 	mov	sl, r1
    3118:	e1a02003 	mov	r2, r3
    311c:	e58d300c 	str	r3, [sp, #12]
    3120:	e28030c4 	add	r3, r0, #196	; 0xc4
    3124:	e0933002 	adds	r3, r3, r2
    3128:	e58d0008 	str	r0, [sp, #8]
    312c:	e58d3014 	str	r3, [sp, #20]
    3130:	0a000051 	beq	327c <_ZN2AI17WaitForPredFinishEj+0x174>
    3134:	e1a00003 	mov	r0, r3
    3138:	e1a09003 	mov	r9, r3
    313c:	ebfffffe 	bl	0 <pthread_mutex_lock>
    3140:	e3500000 	cmp	r0, #0
    3144:	1a00004b 	bne	3278 <_ZN2AI17WaitForPredFinishEj+0x170>
    3148:	e59d2008 	ldr	r2, [sp, #8]
    314c:	e3a03cca 	mov	r3, #51712	; 0xca00
    3150:	e3433b9a 	movt	r3, #15258	; 0x3b9a
    3154:	e58d3010 	str	r3, [sp, #16]
    3158:	e082a00a 	add	sl, r2, sl
    315c:	e58da004 	str	sl, [sp, #4]
    3160:	ea000005 	b	317c <_ZN2AI17WaitForPredFinishEj+0x74>
    3164:	e59f3118 	ldr	r3, [pc, #280]	; 3284 <_ZN2AI17WaitForPredFinishEj+0x17c>
    3168:	e79f3003 	ldr	r3, [pc, r3]
    316c:	e5933000 	ldr	r3, [r3]
    3170:	e5d33024 	ldrb	r3, [r3, #36]	; 0x24
    3174:	e3530000 	cmp	r3, #0
    3178:	1a000037 	bne	325c <_ZN2AI17WaitForPredFinishEj+0x154>
    317c:	e59d3004 	ldr	r3, [sp, #4]
    3180:	e5d330e4 	ldrb	r3, [r3, #228]	; 0xe4
    3184:	e3530000 	cmp	r3, #0
    3188:	1a00002c 	bne	3240 <_ZN2AI17WaitForPredFinishEj+0x138>
    318c:	e28d7018 	add	r7, sp, #24
    3190:	e3a0ac2f 	mov	sl, #12032	; 0x2f00
    3194:	e345a968 	movt	sl, #22888	; 0x5968
    3198:	e3a0b000 	mov	fp, #0
    319c:	e1a00007 	mov	r0, r7
    31a0:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    31a4:	e59d3004 	ldr	r3, [sp, #4]
    31a8:	e1cd01d8 	ldrd	r0, [sp, #24]
    31ac:	e5d330e4 	ldrb	r3, [r3, #228]	; 0xe4
    31b0:	e09aa000 	adds	sl, sl, r0
    31b4:	e0abb001 	adc	fp, fp, r1
    31b8:	e3530000 	cmp	r3, #0
    31bc:	1affffe8 	bne	3164 <_ZN2AI17WaitForPredFinishEj+0x5c>
    31c0:	e3a02cca 	mov	r2, #51712	; 0xca00
    31c4:	e3a03000 	mov	r3, #0
    31c8:	e3432b9a 	movt	r2, #15258	; 0x3b9a
    31cc:	e1a0000a 	mov	r0, sl
    31d0:	e1a0100b 	mov	r1, fp
    31d4:	e28d8020 	add	r8, sp, #32
    31d8:	ebfffffe 	bl	0 <__aeabi_ldivmod>
    31dc:	e59d3010 	ldr	r3, [sp, #16]
    31e0:	e59d1008 	ldr	r1, [sp, #8]
    31e4:	e28160dc 	add	r6, r1, #220	; 0xdc
    31e8:	e59d100c 	ldr	r1, [sp, #12]
    31ec:	e0866001 	add	r6, r6, r1
    31f0:	e0832390 	umull	r2, r3, r0, r3
    31f4:	e1a04000 	mov	r4, r0
    31f8:	e062500a 	rsb	r5, r2, sl
    31fc:	e1a00006 	mov	r0, r6
    3200:	e1a01009 	mov	r1, r9
    3204:	e1a02008 	mov	r2, r8
    3208:	e58d4020 	str	r4, [sp, #32]
    320c:	e58d5024 	str	r5, [sp, #36]	; 0x24
    3210:	ebfffffe 	bl	0 <pthread_cond_timedwait>
    3214:	e1a00007 	mov	r0, r7
    3218:	ebfffffe 	bl	0 <_ZNSt6chrono3_V212system_clock3nowEv>
    321c:	e1cd21d8 	ldrd	r2, [sp, #24]
    3220:	e152000a 	cmp	r2, sl
    3224:	e0d3300b 	sbcs	r3, r3, fp
    3228:	aaffffcd 	bge	3164 <_ZN2AI17WaitForPredFinishEj+0x5c>
    322c:	e59d3004 	ldr	r3, [sp, #4]
    3230:	e5d330e4 	ldrb	r3, [r3, #228]	; 0xe4
    3234:	e3530000 	cmp	r3, #0
    3238:	0affffef 	beq	31fc <_ZN2AI17WaitForPredFinishEj+0xf4>
    323c:	eaffffc8 	b	3164 <_ZN2AI17WaitForPredFinishEj+0x5c>
    3240:	e59da004 	ldr	sl, [sp, #4]
    3244:	e3a03000 	mov	r3, #0
    3248:	e59d0014 	ldr	r0, [sp, #20]
    324c:	e5ca30e4 	strb	r3, [sl, #228]	; 0xe4
    3250:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    3254:	e28dd02c 	add	sp, sp, #44	; 0x2c
    3258:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    325c:	e59d0014 	ldr	r0, [sp, #20]
    3260:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    3264:	e28dd02c 	add	sp, sp, #44	; 0x2c
    3268:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    326c:	e59d0014 	ldr	r0, [sp, #20]
    3270:	ebfffffe 	bl	0 <pthread_mutex_unlock>
    3274:	ebfffffe 	bl	0 <__cxa_end_cleanup>
    3278:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>
    327c:	e3a00001 	mov	r0, #1
    3280:	ebfffffe 	bl	0 <_ZSt20__throw_system_errori>
    3284:	00000114 	.word	0x00000114

00003288 <_ZN2AI14StopAllUneededEv>:
    3288:	e12fff1e 	bx	lr

0000328c <_ZN2AI5StartEPK10QuadSquare>:
    328c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3290:	e2514000 	subs	r4, r1, #0
    3294:	e59f73ec 	ldr	r7, [pc, #1004]	; 3688 <_ZN2AI5StartEPK10QuadSquare+0x3fc>
    3298:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    329c:	e1a05000 	mov	r5, r0
    32a0:	e08f7007 	add	r7, pc, r7
    32a4:	0a0000e6 	beq	3644 <_ZN2AI5StartEPK10QuadSquare+0x3b8>
    32a8:	e3a00d0a 	mov	r0, #640	; 0x280
    32ac:	ebfffffe 	bl	0 <_Znaj>
    32b0:	e3a02000 	mov	r2, #0
    32b4:	e3e0c000 	mvn	ip, #0
    32b8:	e2803004 	add	r3, r0, #4
    32bc:	e280efa1 	add	lr, r0, #644	; 0x284
    32c0:	e5432004 	strb	r2, [r3, #-4]
    32c4:	e2833004 	add	r3, r3, #4
    32c8:	e5432007 	strb	r2, [r3, #-7]
    32cc:	e5432006 	strb	r2, [r3, #-6]
    32d0:	e543c005 	strb	ip, [r3, #-5]
    32d4:	e153000e 	cmp	r3, lr
    32d8:	1afffff8 	bne	32c0 <_ZN2AI5StartEPK10QuadSquare+0x34>
    32dc:	e1a01004 	mov	r1, r4
    32e0:	e5850000 	str	r0, [r5]
    32e4:	e3a02d0a 	mov	r2, #640	; 0x280
    32e8:	e2858008 	add	r8, r5, #8
    32ec:	ebfffffe 	bl	0 <memcpy>
    32f0:	e1a09005 	mov	r9, r5
    32f4:	e3a04000 	mov	r4, #0
    32f8:	e3a00d0a 	mov	r0, #640	; 0x280
    32fc:	ebfffffe 	bl	0 <_Znaj>
    3300:	e3e02000 	mvn	r2, #0
    3304:	e2803004 	add	r3, r0, #4
    3308:	e2801fa1 	add	r1, r0, #644	; 0x284
    330c:	e5434004 	strb	r4, [r3, #-4]
    3310:	e2833004 	add	r3, r3, #4
    3314:	e5434007 	strb	r4, [r3, #-7]
    3318:	e3a06000 	mov	r6, #0
    331c:	e5434006 	strb	r4, [r3, #-6]
    3320:	e5432005 	strb	r2, [r3, #-5]
    3324:	e1530001 	cmp	r3, r1
    3328:	1afffff7 	bne	330c <_ZN2AI5StartEPK10QuadSquare+0x80>
    332c:	e5a90004 	str	r0, [r9, #4]!
    3330:	e1590008 	cmp	r9, r8
    3334:	1affffef 	bne	32f8 <_ZN2AI5StartEPK10QuadSquare+0x6c>
    3338:	e3a00024 	mov	r0, #36	; 0x24
    333c:	e58d6018 	str	r6, [sp, #24]
    3340:	ebfffffe 	bl	0 <_Znwj>
    3344:	e59f3340 	ldr	r3, [pc, #832]	; 368c <_ZN2AI5StartEPK10QuadSquare+0x400>
    3348:	e59f1340 	ldr	r1, [pc, #832]	; 3690 <_ZN2AI5StartEPK10QuadSquare+0x404>
    334c:	e3a02001 	mov	r2, #1
    3350:	e28d9020 	add	r9, sp, #32
    3354:	e5802004 	str	r2, [r0, #4]
    3358:	e1a04000 	mov	r4, r0
    335c:	e5802008 	str	r2, [r0, #8]
    3360:	e797c003 	ldr	ip, [r7, r3]
    3364:	e59f3328 	ldr	r3, [pc, #808]	; 3694 <_ZN2AI5StartEPK10QuadSquare+0x408>
    3368:	e5806010 	str	r6, [r0, #16]
    336c:	e28cc008 	add	ip, ip, #8
    3370:	e5806014 	str	r6, [r0, #20]
    3374:	e580c000 	str	ip, [r0]
    3378:	e59f2318 	ldr	r2, [pc, #792]	; 3698 <_ZN2AI5StartEPK10QuadSquare+0x40c>
    337c:	e7971001 	ldr	r1, [r7, r1]
    3380:	e08f2002 	add	r2, pc, r2
    3384:	e580601c 	str	r6, [r0, #28]
    3388:	e2811008 	add	r1, r1, #8
    338c:	e5805020 	str	r5, [r0, #32]
    3390:	e580100c 	str	r1, [r0, #12]
    3394:	e5802018 	str	r2, [r0, #24]
    3398:	e7973003 	ldr	r3, [r7, r3]
    339c:	e1a01003 	mov	r1, r3
    33a0:	e58d3008 	str	r3, [sp, #8]
    33a4:	ebfffffe 	bl	0 <_ZN2AIC1Ev>
    33a8:	e1a01009 	mov	r1, r9
    33ac:	e58d4024 	str	r4, [sp, #36]	; 0x24
    33b0:	e58d0020 	str	r0, [sp, #32]
    33b4:	e28d0018 	add	r0, sp, #24
    33b8:	ebfffffe 	bl	0 <_ZNSt6thread15_M_start_threadESt10shared_ptrINS_10_Impl_baseEE>
    33bc:	e59d4024 	ldr	r4, [sp, #36]	; 0x24
    33c0:	e1540006 	cmp	r4, r6
    33c4:	0a000009 	beq	33f0 <_ZN2AI5StartEPK10QuadSquare+0x164>
    33c8:	e2843004 	add	r3, r4, #4
    33cc:	f57ff05f 	dmb	sy
    33d0:	e1932f9f 	ldrex	r2, [r3]
    33d4:	e2421001 	sub	r1, r2, #1
    33d8:	e1830f91 	strex	r0, r1, [r3]
    33dc:	e3500000 	cmp	r0, #0
    33e0:	1afffffa 	bne	33d0 <_ZN2AI5StartEPK10QuadSquare+0x144>
    33e4:	e3520001 	cmp	r2, #1
    33e8:	f57ff05f 	dmb	sy
    33ec:	0a000081 	beq	35f8 <_ZN2AI5StartEPK10QuadSquare+0x36c>
    33f0:	e59500a0 	ldr	r0, [r5, #160]	; 0xa0
    33f4:	e3a01000 	mov	r1, #0
    33f8:	ebfffffe 	bl	0 <pthread_equal>
    33fc:	e3500000 	cmp	r0, #0
    3400:	0a00009f 	beq	3684 <_ZN2AI5StartEPK10QuadSquare+0x3f8>
    3404:	e59530a0 	ldr	r3, [r5, #160]	; 0xa0
    3408:	e3a01000 	mov	r1, #0
    340c:	e59d2018 	ldr	r2, [sp, #24]
    3410:	e1a00003 	mov	r0, r3
    3414:	e58d3018 	str	r3, [sp, #24]
    3418:	e58520a0 	str	r2, [r5, #160]	; 0xa0
    341c:	ebfffffe 	bl	0 <pthread_equal>
    3420:	e3500000 	cmp	r0, #0
    3424:	0a000096 	beq	3684 <_ZN2AI5StartEPK10QuadSquare+0x3f8>
    3428:	e59f326c 	ldr	r3, [pc, #620]	; 369c <_ZN2AI5StartEPK10QuadSquare+0x410>
    342c:	e3a02000 	mov	r2, #0
    3430:	e1a08002 	mov	r8, r2
    3434:	e58d2010 	str	r2, [sp, #16]
    3438:	e28d201c 	add	r2, sp, #28
    343c:	e58d200c 	str	r2, [sp, #12]
    3440:	e797a003 	ldr	sl, [r7, r3]
    3444:	e3a0000c 	mov	r0, #12
    3448:	e59f3250 	ldr	r3, [pc, #592]	; 36a0 <_ZN2AI5StartEPK10QuadSquare+0x414>
    344c:	e28560bc 	add	r6, r5, #188	; 0xbc
    3450:	e1a04008 	mov	r4, r8
    3454:	e59a1000 	ldr	r1, [sl]
    3458:	e08f3003 	add	r3, pc, r3
    345c:	e58d3014 	str	r3, [sp, #20]
    3460:	e2811028 	add	r1, r1, #40	; 0x28
    3464:	e58d1004 	str	r1, [sp, #4]
    3468:	ebfffffe 	bl	0 <_Znwj>
    346c:	e59d2010 	ldr	r2, [sp, #16]
    3470:	e285c0a0 	add	ip, r5, #160	; 0xa0
    3474:	e59d1004 	ldr	r1, [sp, #4]
    3478:	e5802000 	str	r2, [r0]
    347c:	e9801004 	stmib	r0, {r2, ip}
    3480:	ebfffffe 	bl	0 <_ZNSt8__detail15_List_node_base7_M_hookEPS0_>
    3484:	e59f2218 	ldr	r2, [pc, #536]	; 36a4 <_ZN2AI5StartEPK10QuadSquare+0x418>
    3488:	e59f3218 	ldr	r3, [pc, #536]	; 36a8 <_ZN2AI5StartEPK10QuadSquare+0x41c>
    348c:	e7972002 	ldr	r2, [r7, r2]
    3490:	e58d2010 	str	r2, [sp, #16]
    3494:	e7973003 	ldr	r3, [r7, r3]
    3498:	e58d3004 	str	r3, [sp, #4]
    349c:	e3a00028 	mov	r0, #40	; 0x28
    34a0:	e58d401c 	str	r4, [sp, #28]
    34a4:	ebfffffe 	bl	0 <_Znwj>
    34a8:	e59d3010 	ldr	r3, [sp, #16]
    34ac:	e3a0c001 	mov	ip, #1
    34b0:	e1a07006 	mov	r7, r6
    34b4:	e2831008 	add	r1, r3, #8
    34b8:	e59d3004 	ldr	r3, [sp, #4]
    34bc:	e2832008 	add	r2, r3, #8
    34c0:	e59d3014 	ldr	r3, [sp, #20]
    34c4:	e5801000 	str	r1, [r0]
    34c8:	e1a0b000 	mov	fp, r0
    34cc:	e59d1008 	ldr	r1, [sp, #8]
    34d0:	e5804010 	str	r4, [r0, #16]
    34d4:	e5804014 	str	r4, [r0, #20]
    34d8:	e5803018 	str	r3, [r0, #24]
    34dc:	e580401c 	str	r4, [r0, #28]
    34e0:	e5808020 	str	r8, [r0, #32]
    34e4:	e5805024 	str	r5, [r0, #36]	; 0x24
    34e8:	e580200c 	str	r2, [r0, #12]
    34ec:	e580c004 	str	ip, [r0, #4]
    34f0:	e580c008 	str	ip, [r0, #8]
    34f4:	ebfffffe 	bl	0 <_ZN2AIC1Ev>
    34f8:	e1a01009 	mov	r1, r9
    34fc:	e58db024 	str	fp, [sp, #36]	; 0x24
    3500:	e58d0020 	str	r0, [sp, #32]
    3504:	e59d000c 	ldr	r0, [sp, #12]
    3508:	ebfffffe 	bl	0 <_ZNSt6thread15_M_start_threadESt10shared_ptrINS_10_Impl_baseEE>
    350c:	e59db024 	ldr	fp, [sp, #36]	; 0x24
    3510:	e35b0000 	cmp	fp, #0
    3514:	0a000009 	beq	3540 <_ZN2AI5StartEPK10QuadSquare+0x2b4>
    3518:	e28b2004 	add	r2, fp, #4
    351c:	f57ff05f 	dmb	sy
    3520:	e1921f9f 	ldrex	r1, [r2]
    3524:	e2413001 	sub	r3, r1, #1
    3528:	e1820f93 	strex	r0, r3, [r2]
    352c:	e3500000 	cmp	r0, #0
    3530:	1afffffa 	bne	3520 <_ZN2AI5StartEPK10QuadSquare+0x294>
    3534:	e3510001 	cmp	r1, #1
    3538:	f57ff05f 	dmb	sy
    353c:	0a00001a 	beq	35ac <_ZN2AI5StartEPK10QuadSquare+0x320>
    3540:	e5960000 	ldr	r0, [r6]
    3544:	e3a01000 	mov	r1, #0
    3548:	ebfffffe 	bl	0 <pthread_equal>
    354c:	e3500000 	cmp	r0, #0
    3550:	0a00004b 	beq	3684 <_ZN2AI5StartEPK10QuadSquare+0x3f8>
    3554:	e5963000 	ldr	r3, [r6]
    3558:	e3a01000 	mov	r1, #0
    355c:	e59d201c 	ldr	r2, [sp, #28]
    3560:	e1a00003 	mov	r0, r3
    3564:	e58d301c 	str	r3, [sp, #28]
    3568:	e4862004 	str	r2, [r6], #4
    356c:	ebfffffe 	bl	0 <pthread_equal>
    3570:	e3500000 	cmp	r0, #0
    3574:	0a000042 	beq	3684 <_ZN2AI5StartEPK10QuadSquare+0x3f8>
    3578:	e59a1000 	ldr	r1, [sl]
    357c:	e3a0000c 	mov	r0, #12
    3580:	e281b028 	add	fp, r1, #40	; 0x28
    3584:	ebfffffe 	bl	0 <_Znwj>
    3588:	e1a0100b 	mov	r1, fp
    358c:	e5804000 	str	r4, [r0]
    3590:	e9800090 	stmib	r0, {r4, r7}
    3594:	ebfffffe 	bl	0 <_ZNSt8__detail15_List_node_base7_M_hookEPS0_>
    3598:	e3580001 	cmp	r8, #1
    359c:	13a08001 	movne	r8, #1
    35a0:	1affffbd 	bne	349c <_ZN2AI5StartEPK10QuadSquare+0x210>
    35a4:	e28dd02c 	add	sp, sp, #44	; 0x2c
    35a8:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    35ac:	e59b2000 	ldr	r2, [fp]
    35b0:	e1a0000b 	mov	r0, fp
    35b4:	e5922008 	ldr	r2, [r2, #8]
    35b8:	e12fff32 	blx	r2
    35bc:	e28b2008 	add	r2, fp, #8
    35c0:	f57ff05f 	dmb	sy
    35c4:	e1921f9f 	ldrex	r1, [r2]
    35c8:	e2413001 	sub	r3, r1, #1
    35cc:	e1820f93 	strex	r0, r3, [r2]
    35d0:	e3500000 	cmp	r0, #0
    35d4:	1afffffa 	bne	35c4 <_ZN2AI5StartEPK10QuadSquare+0x338>
    35d8:	e3510001 	cmp	r1, #1
    35dc:	f57ff05f 	dmb	sy
    35e0:	1affffd6 	bne	3540 <_ZN2AI5StartEPK10QuadSquare+0x2b4>
    35e4:	e59b2000 	ldr	r2, [fp]
    35e8:	e1a0000b 	mov	r0, fp
    35ec:	e592300c 	ldr	r3, [r2, #12]
    35f0:	e12fff33 	blx	r3
    35f4:	eaffffd1 	b	3540 <_ZN2AI5StartEPK10QuadSquare+0x2b4>
    35f8:	e5943000 	ldr	r3, [r4]
    35fc:	e1a00004 	mov	r0, r4
    3600:	e5933008 	ldr	r3, [r3, #8]
    3604:	e12fff33 	blx	r3
    3608:	e2843008 	add	r3, r4, #8
    360c:	f57ff05f 	dmb	sy
    3610:	e1932f9f 	ldrex	r2, [r3]
    3614:	e2421001 	sub	r1, r2, #1
    3618:	e1830f91 	strex	r0, r1, [r3]
    361c:	e3500000 	cmp	r0, #0
    3620:	1afffffa 	bne	3610 <_ZN2AI5StartEPK10QuadSquare+0x384>
    3624:	e3520001 	cmp	r2, #1
    3628:	f57ff05f 	dmb	sy
    362c:	1affff6f 	bne	33f0 <_ZN2AI5StartEPK10QuadSquare+0x164>
    3630:	e5943000 	ldr	r3, [r4]
    3634:	e1a00004 	mov	r0, r4
    3638:	e593300c 	ldr	r3, [r3, #12]
    363c:	e12fff33 	blx	r3
    3640:	eaffff6a 	b	33f0 <_ZN2AI5StartEPK10QuadSquare+0x164>
    3644:	e59f2060 	ldr	r2, [pc, #96]	; 36ac <_ZN2AI5StartEPK10QuadSquare+0x420>
    3648:	e3a01023 	mov	r1, #35	; 0x23
    364c:	e59f005c 	ldr	r0, [pc, #92]	; 36b0 <_ZN2AI5StartEPK10QuadSquare+0x424>
    3650:	e59f305c 	ldr	r3, [pc, #92]	; 36b4 <_ZN2AI5StartEPK10QuadSquare+0x428>
    3654:	e08f2002 	add	r2, pc, r2
    3658:	e08f0000 	add	r0, pc, r0
    365c:	e2822060 	add	r2, r2, #96	; 0x60
    3660:	e08f3003 	add	r3, pc, r3
    3664:	ebfffffe 	bl	0 <__assert2>
    3668:	eaffff0e 	b	32a8 <_ZN2AI5StartEPK10QuadSquare+0x1c>
    366c:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    3670:	e3500000 	cmp	r0, #0
    3674:	0a000000 	beq	367c <_ZN2AI5StartEPK10QuadSquare+0x3f0>
    3678:	ebfffffe 	bl	0 <_ZN2AIC1Ev>
    367c:	ebfffffe 	bl	0 <__cxa_end_cleanup>
    3680:	eafffff9 	b	366c <_ZN2AI5StartEPK10QuadSquare+0x3e0>
    3684:	ebfffffe 	bl	0 <_ZSt9terminatev>
    3688:	000003e0 	.word	0x000003e0
	...
    3698:	ffffe398 	.word	0xffffe398
    369c:	00000000 	.word	0x00000000
    36a0:	ffffe0d4 	.word	0xffffe0d4
	...
    36ac:	00000050 	.word	0x00000050
    36b0:	00000050 	.word	0x00000050
    36b4:	0000004c 	.word	0x0000004c

Disassembly of section .text._ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv:

00000000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv>:
   0:	e2503000 	subs	r3, r0, #0
   4:	012fff1e 	bxeq	lr
   8:	e5933000 	ldr	r3, [r3]
   c:	e5933004 	ldr	r3, [r3, #4]
  10:	e12fff13 	bx	r3

Disassembly of section .text._ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EED2Ev:

00000000 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EED1Ev>:
   0:	e12fff1e 	bx	lr

Disassembly of section .text._ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv:

00000000 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv>:
   0:	e1a03000 	mov	r3, r0
   4:	e280000c 	add	r0, r0, #12
   8:	e593300c 	ldr	r3, [r3, #12]
   c:	e5933000 	ldr	r3, [r3]
  10:	e12fff13 	bx	r3

Disassembly of section .text._ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EED2Ev:

00000000 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EED1Ev>:
   0:	e12fff1e 	bx	lr

Disassembly of section .text._ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv:

00000000 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv>:
   0:	e1a03000 	mov	r3, r0
   4:	e280000c 	add	r0, r0, #12
   8:	e593300c 	ldr	r3, [r3, #12]
   c:	e5933000 	ldr	r3, [r3]
  10:	e12fff13 	bx	r3

Disassembly of section .text._ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEE6_M_runEv:

00000000 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEE6_M_runEv>:
   0:	e5903010 	ldr	r3, [r0, #16]
   4:	e5902014 	ldr	r2, [r0, #20]
   8:	e3130001 	tst	r3, #1
   c:	e590100c 	ldr	r1, [r0, #12]
  10:	e08200c3 	add	r0, r2, r3, asr #1
  14:	179230c3 	ldrne	r3, [r2, r3, asr #1]
  18:	17931001 	ldrne	r1, [r3, r1]
  1c:	e12fff11 	bx	r1

Disassembly of section .text._ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info:

00000000 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info>:
   0:	e59f301c 	ldr	r3, [pc, #28]	; 24 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info+0x24>
   4:	e92d4010 	push	{r4, lr}
   8:	e1a04000 	mov	r4, r0
   c:	e1a00001 	mov	r0, r1
  10:	e79f1003 	ldr	r1, [pc, r3]
  14:	ebfffffe 	bl	0 <_ZNKSt9type_infoeqERKS_>
  18:	e3500000 	cmp	r0, #0
  1c:	1284000c 	addne	r0, r4, #12
  20:	e8bd8010 	pop	{r4, pc}
  24:	0000000c 	.word	0x0000000c

Disassembly of section .text._ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info:

00000000 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info>:
   0:	e59f301c 	ldr	r3, [pc, #28]	; 24 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info+0x24>
   4:	e92d4010 	push	{r4, lr}
   8:	e1a04000 	mov	r4, r0
   c:	e1a00001 	mov	r0, r1
  10:	e79f1003 	ldr	r1, [pc, r3]
  14:	ebfffffe 	bl	0 <_ZNKSt9type_infoeqERKS_>
  18:	e3500000 	cmp	r0, #0
  1c:	1284000c 	addne	r0, r4, #12
  20:	e8bd8010 	pop	{r4, pc}
  24:	0000000c 	.word	0x0000000c

Disassembly of section .text._ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EED0Ev:

00000000 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EED0Ev>:
   0:	e92d4010 	push	{r4, lr}
   4:	e1a04000 	mov	r4, r0
   8:	ebfffffe 	bl	0 <_ZdlPv>
   c:	e1a00004 	mov	r0, r4
  10:	e8bd8010 	pop	{r4, pc}

Disassembly of section .text._ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EED0Ev:

00000000 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EED0Ev>:
   0:	e92d4010 	push	{r4, lr}
   4:	e1a04000 	mov	r4, r0
   8:	ebfffffe 	bl	0 <_ZdlPv>
   c:	e1a00004 	mov	r0, r4
  10:	e8bd8010 	pop	{r4, pc}

Disassembly of section .text._ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv:

00000000 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS5_jEEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv>:
   0:	eafffffe 	b	0 <_ZdlPv>

Disassembly of section .text._ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv:

00000000 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS5_EEvEEEESaISE_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv>:
   0:	eafffffe 	b	0 <_ZdlPv>

Disassembly of section .text._ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEE6_M_runEv:

00000000 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEE6_M_runEv>:
   0:	e5903010 	ldr	r3, [r0, #16]
   4:	e5902018 	ldr	r2, [r0, #24]
   8:	e3130001 	tst	r3, #1
   c:	e590c00c 	ldr	ip, [r0, #12]
  10:	e5901014 	ldr	r1, [r0, #20]
  14:	e08200c3 	add	r0, r2, r3, asr #1
  18:	179230c3 	ldrne	r3, [r2, r3, asr #1]
  1c:	1793c00c 	ldrne	ip, [r3, ip]
  20:	e12fff1c 	bx	ip

Disassembly of section .text._ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED2Ev:

00000000 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED1Ev>:
   0:	e92d4038 	push	{r3, r4, r5, lr}
   4:	e1a04000 	mov	r4, r0
   8:	e59f3090 	ldr	r3, [pc, #144]	; a0 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED1Ev+0xa0>
   c:	e5905008 	ldr	r5, [r0, #8]
  10:	e79f3003 	ldr	r3, [pc, r3]
  14:	e3550000 	cmp	r5, #0
  18:	e2833008 	add	r3, r3, #8
  1c:	e5803000 	str	r3, [r0]
  20:	0a000009 	beq	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED1Ev+0x4c>
  24:	e2853004 	add	r3, r5, #4
  28:	f57ff05f 	dmb	sy
  2c:	e1932f9f 	ldrex	r2, [r3]
  30:	e2421001 	sub	r1, r2, #1
  34:	e1830f91 	strex	r0, r1, [r3]
  38:	e3500000 	cmp	r0, #0
  3c:	1afffffa 	bne	2c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED1Ev+0x2c>
  40:	e3520001 	cmp	r2, #1
  44:	f57ff05f 	dmb	sy
  48:	0a000001 	beq	54 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED1Ev+0x54>
  4c:	e1a00004 	mov	r0, r4
  50:	e8bd8038 	pop	{r3, r4, r5, pc}
  54:	e5953000 	ldr	r3, [r5]
  58:	e1a00005 	mov	r0, r5
  5c:	e5933008 	ldr	r3, [r3, #8]
  60:	e12fff33 	blx	r3
  64:	e2853008 	add	r3, r5, #8
  68:	f57ff05f 	dmb	sy
  6c:	e1932f9f 	ldrex	r2, [r3]
  70:	e2421001 	sub	r1, r2, #1
  74:	e1830f91 	strex	r0, r1, [r3]
  78:	e3500000 	cmp	r0, #0
  7c:	1afffffa 	bne	6c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED1Ev+0x6c>
  80:	e3520001 	cmp	r2, #1
  84:	f57ff05f 	dmb	sy
  88:	1affffef 	bne	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED1Ev+0x4c>
  8c:	e5953000 	ldr	r3, [r5]
  90:	e1a00005 	mov	r0, r5
  94:	e593300c 	ldr	r3, [r3, #12]
  98:	e12fff33 	blx	r3
  9c:	eaffffea 	b	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED1Ev+0x4c>
  a0:	00000088 	.word	0x00000088

Disassembly of section .text._ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED2Ev:

00000000 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED1Ev>:
   0:	e92d4038 	push	{r3, r4, r5, lr}
   4:	e1a04000 	mov	r4, r0
   8:	e59f3090 	ldr	r3, [pc, #144]	; a0 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED1Ev+0xa0>
   c:	e5905008 	ldr	r5, [r0, #8]
  10:	e79f3003 	ldr	r3, [pc, r3]
  14:	e3550000 	cmp	r5, #0
  18:	e2833008 	add	r3, r3, #8
  1c:	e5803000 	str	r3, [r0]
  20:	0a000009 	beq	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED1Ev+0x4c>
  24:	e2853004 	add	r3, r5, #4
  28:	f57ff05f 	dmb	sy
  2c:	e1932f9f 	ldrex	r2, [r3]
  30:	e2421001 	sub	r1, r2, #1
  34:	e1830f91 	strex	r0, r1, [r3]
  38:	e3500000 	cmp	r0, #0
  3c:	1afffffa 	bne	2c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED1Ev+0x2c>
  40:	e3520001 	cmp	r2, #1
  44:	f57ff05f 	dmb	sy
  48:	0a000001 	beq	54 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED1Ev+0x54>
  4c:	e1a00004 	mov	r0, r4
  50:	e8bd8038 	pop	{r3, r4, r5, pc}
  54:	e5953000 	ldr	r3, [r5]
  58:	e1a00005 	mov	r0, r5
  5c:	e5933008 	ldr	r3, [r3, #8]
  60:	e12fff33 	blx	r3
  64:	e2853008 	add	r3, r5, #8
  68:	f57ff05f 	dmb	sy
  6c:	e1932f9f 	ldrex	r2, [r3]
  70:	e2421001 	sub	r1, r2, #1
  74:	e1830f91 	strex	r0, r1, [r3]
  78:	e3500000 	cmp	r0, #0
  7c:	1afffffa 	bne	6c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED1Ev+0x6c>
  80:	e3520001 	cmp	r2, #1
  84:	f57ff05f 	dmb	sy
  88:	1affffef 	bne	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED1Ev+0x4c>
  8c:	e5953000 	ldr	r3, [r5]
  90:	e1a00005 	mov	r0, r5
  94:	e593300c 	ldr	r3, [r3, #12]
  98:	e12fff33 	blx	r3
  9c:	eaffffea 	b	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED1Ev+0x4c>
  a0:	00000088 	.word	0x00000088

Disassembly of section .text._ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED0Ev:

00000000 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED0Ev>:
   0:	e92d4038 	push	{r3, r4, r5, lr}
   4:	e1a04000 	mov	r4, r0
   8:	e59f3098 	ldr	r3, [pc, #152]	; a8 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED0Ev+0xa8>
   c:	e5905008 	ldr	r5, [r0, #8]
  10:	e79f3003 	ldr	r3, [pc, r3]
  14:	e3550000 	cmp	r5, #0
  18:	e2833008 	add	r3, r3, #8
  1c:	e5803000 	str	r3, [r0]
  20:	0a000009 	beq	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED0Ev+0x4c>
  24:	e2853004 	add	r3, r5, #4
  28:	f57ff05f 	dmb	sy
  2c:	e1932f9f 	ldrex	r2, [r3]
  30:	e2421001 	sub	r1, r2, #1
  34:	e1830f91 	strex	r0, r1, [r3]
  38:	e3500000 	cmp	r0, #0
  3c:	1afffffa 	bne	2c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED0Ev+0x2c>
  40:	e3520001 	cmp	r2, #1
  44:	f57ff05f 	dmb	sy
  48:	0a000003 	beq	5c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED0Ev+0x5c>
  4c:	e1a00004 	mov	r0, r4
  50:	ebfffffe 	bl	0 <_ZdlPv>
  54:	e1a00004 	mov	r0, r4
  58:	e8bd8038 	pop	{r3, r4, r5, pc}
  5c:	e5953000 	ldr	r3, [r5]
  60:	e1a00005 	mov	r0, r5
  64:	e5933008 	ldr	r3, [r3, #8]
  68:	e12fff33 	blx	r3
  6c:	e2853008 	add	r3, r5, #8
  70:	f57ff05f 	dmb	sy
  74:	e1932f9f 	ldrex	r2, [r3]
  78:	e2421001 	sub	r1, r2, #1
  7c:	e1830f91 	strex	r0, r1, [r3]
  80:	e3500000 	cmp	r0, #0
  84:	1afffffa 	bne	74 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED0Ev+0x74>
  88:	e3520001 	cmp	r2, #1
  8c:	f57ff05f 	dmb	sy
  90:	1affffed 	bne	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED0Ev+0x4c>
  94:	e5953000 	ldr	r3, [r5]
  98:	e1a00005 	mov	r0, r5
  9c:	e593300c 	ldr	r3, [r3, #12]
  a0:	e12fff33 	blx	r3
  a4:	eaffffe8 	b	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvjEEPS4_jEEvEEED0Ev+0x4c>
  a8:	00000090 	.word	0x00000090

Disassembly of section .text._ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED0Ev:

00000000 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED0Ev>:
   0:	e92d4038 	push	{r3, r4, r5, lr}
   4:	e1a04000 	mov	r4, r0
   8:	e59f3098 	ldr	r3, [pc, #152]	; a8 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED0Ev+0xa8>
   c:	e5905008 	ldr	r5, [r0, #8]
  10:	e79f3003 	ldr	r3, [pc, r3]
  14:	e3550000 	cmp	r5, #0
  18:	e2833008 	add	r3, r3, #8
  1c:	e5803000 	str	r3, [r0]
  20:	0a000009 	beq	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED0Ev+0x4c>
  24:	e2853004 	add	r3, r5, #4
  28:	f57ff05f 	dmb	sy
  2c:	e1932f9f 	ldrex	r2, [r3]
  30:	e2421001 	sub	r1, r2, #1
  34:	e1830f91 	strex	r0, r1, [r3]
  38:	e3500000 	cmp	r0, #0
  3c:	1afffffa 	bne	2c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED0Ev+0x2c>
  40:	e3520001 	cmp	r2, #1
  44:	f57ff05f 	dmb	sy
  48:	0a000003 	beq	5c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED0Ev+0x5c>
  4c:	e1a00004 	mov	r0, r4
  50:	ebfffffe 	bl	0 <_ZdlPv>
  54:	e1a00004 	mov	r0, r4
  58:	e8bd8038 	pop	{r3, r4, r5, pc}
  5c:	e5953000 	ldr	r3, [r5]
  60:	e1a00005 	mov	r0, r5
  64:	e5933008 	ldr	r3, [r3, #8]
  68:	e12fff33 	blx	r3
  6c:	e2853008 	add	r3, r5, #8
  70:	f57ff05f 	dmb	sy
  74:	e1932f9f 	ldrex	r2, [r3]
  78:	e2421001 	sub	r1, r2, #1
  7c:	e1830f91 	strex	r0, r1, [r3]
  80:	e3500000 	cmp	r0, #0
  84:	1afffffa 	bne	74 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED0Ev+0x74>
  88:	e3520001 	cmp	r2, #1
  8c:	f57ff05f 	dmb	sy
  90:	1affffed 	bne	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED0Ev+0x4c>
  94:	e5953000 	ldr	r3, [r5]
  98:	e1a00005 	mov	r0, r5
  9c:	e593300c 	ldr	r3, [r3, #12]
  a0:	e12fff33 	blx	r3
  a4:	eaffffe8 	b	4c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt5_BindIFSt7_Mem_fnIM2AIFvvEEPS4_EEvEEED0Ev+0x4c>
  a8:	00000090 	.word	0x00000090

Disassembly of section .text._ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv:

00000000 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>:
   0:	e2803004 	add	r3, r0, #4
   4:	e1a02000 	mov	r2, r0
   8:	e92d4070 	push	{r4, r5, r6, lr}
   c:	f57ff05f 	dmb	sy
  10:	e1931f9f 	ldrex	r1, [r3]
  14:	e241c001 	sub	ip, r1, #1
  18:	e183ef9c 	strex	lr, ip, [r3]
  1c:	e35e0000 	cmp	lr, #0
  20:	1afffffa 	bne	10 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv+0x10>
  24:	e3510001 	cmp	r1, #1
  28:	f57ff05f 	dmb	sy
  2c:	18bd8070 	popne	{r4, r5, r6, pc}
  30:	e1a05002 	mov	r5, r2
  34:	e1a04002 	mov	r4, r2
  38:	e4953008 	ldr	r3, [r5], #8
  3c:	e5933008 	ldr	r3, [r3, #8]
  40:	e12fff33 	blx	r3
  44:	f57ff05f 	dmb	sy
  48:	e1953f9f 	ldrex	r3, [r5]
  4c:	e2432001 	sub	r2, r3, #1
  50:	e1851f92 	strex	r1, r2, [r5]
  54:	e3510000 	cmp	r1, #0
  58:	1afffffa 	bne	48 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv+0x48>
  5c:	e3530001 	cmp	r3, #1
  60:	f57ff05f 	dmb	sy
  64:	18bd8070 	popne	{r4, r5, r6, pc}
  68:	e5943000 	ldr	r3, [r4]
  6c:	e1a00004 	mov	r0, r4
  70:	e8bd4070 	pop	{r4, r5, r6, lr}
  74:	e593300c 	ldr	r3, [r3, #12]
  78:	e12fff13 	bx	r3

Disassembly of section .text.startup:

00000000 <_GLOBAL__sub_I_AI.cpp>:
   0:	e92d4070 	push	{r4, r5, r6, lr}
   4:	e3a00000 	mov	r0, #0
   8:	ebfffffe 	bl	0 <time>
   c:	e59f2070 	ldr	r2, [pc, #112]	; 84 <_GLOBAL__sub_I_AI.cpp+0x84>
  10:	e3086965 	movw	r6, #35173	; 0x8965
  14:	e30ae41b 	movw	lr, #42011	; 0xa41b
  18:	e08f2002 	add	r2, pc, r2
  1c:	e3466c07 	movt	r6, #27655	; 0x6c07
  20:	e341ea41 	movt	lr, #6721	; 0x1a41
  24:	e3a01001 	mov	r1, #1
  28:	e1a0c002 	mov	ip, r2
  2c:	e1a03000 	mov	r3, r0
  30:	e58209cc 	str	r0, [r2, #2508]	; 0x9cc
  34:	e5ac0008 	str	r0, [ip, #8]!
  38:	e1a04221 	lsr	r4, r1, #4
  3c:	e0233f23 	eor	r3, r3, r3, lsr #30
  40:	e0854e94 	umull	r4, r5, r4, lr
  44:	e1a02125 	lsr	r2, r5, #2
  48:	e0820102 	add	r0, r2, r2, lsl #2
  4c:	e0622180 	rsb	r2, r2, r0, lsl #3
  50:	e0412202 	sub	r2, r1, r2, lsl #4
  54:	e2811001 	add	r1, r1, #1
  58:	e3510e27 	cmp	r1, #624	; 0x270
  5c:	e0232396 	mla	r3, r6, r3, r2
  60:	e5ac3004 	str	r3, [ip, #4]!
  64:	1afffff3 	bne	38 <_GLOBAL__sub_I_AI.cpp+0x38>
  68:	e59f3018 	ldr	r3, [pc, #24]	; 88 <_GLOBAL__sub_I_AI.cpp+0x88>
  6c:	e3a00000 	mov	r0, #0
  70:	e3e02000 	mvn	r2, #0
  74:	e08f3003 	add	r3, pc, r3
  78:	e58319c8 	str	r1, [r3, #2504]	; 0x9c8
  7c:	e8830005 	stm	r3, {r0, r2}
  80:	e8bd8070 	pop	{r4, r5, r6, pc}
  84:	00000064 	.word	0x00000064
  88:	0000000c 	.word	0x0000000c
