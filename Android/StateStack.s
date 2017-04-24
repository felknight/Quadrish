
obj/StateStack.tmp.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_ZN10StateStackC1Ev>:
   0:	e1a03000 	mov	r3, r0
   4:	e5830000 	str	r0, [r3]
   8:	e5830004 	str	r0, [r3, #4]
   c:	e12fff1e 	bx	lr

00000010 <_ZN10StateStackD1Ev>:
  10:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
  14:	e5904000 	ldr	r4, [r0]
  18:	e1a07000 	mov	r7, r0
  1c:	e1540000 	cmp	r4, r0
  20:	0a000018 	beq	88 <_ZN10StateStackD1Ev+0x78>
  24:	e5945008 	ldr	r5, [r4, #8]
  28:	e5946000 	ldr	r6, [r4]
  2c:	e3550000 	cmp	r5, #0
  30:	0a00000f 	beq	74 <_ZN10StateStackD1Ev+0x64>
  34:	e5953018 	ldr	r3, [r5, #24]
  38:	e3530000 	cmp	r3, #0
  3c:	0a000003 	beq	50 <_ZN10StateStackD1Ev+0x40>
  40:	e2850010 	add	r0, r5, #16
  44:	e1a01000 	mov	r1, r0
  48:	e3a02003 	mov	r2, #3
  4c:	e12fff33 	blx	r3
  50:	e5953008 	ldr	r3, [r5, #8]
  54:	e3530000 	cmp	r3, #0
  58:	0a000003 	beq	6c <_ZN10StateStackD1Ev+0x5c>
  5c:	e1a00005 	mov	r0, r5
  60:	e1a01005 	mov	r1, r5
  64:	e3a02003 	mov	r2, #3
  68:	e12fff33 	blx	r3
  6c:	e1a00005 	mov	r0, r5
  70:	ebfffffe 	bl	0 <_ZdlPv>
  74:	e1a00004 	mov	r0, r4
  78:	ebfffffe 	bl	0 <_ZdlPv>
  7c:	e1560007 	cmp	r6, r7
  80:	e1a04006 	mov	r4, r6
  84:	1affffe6 	bne	24 <_ZN10StateStackD1Ev+0x14>
  88:	e1a00007 	mov	r0, r7
  8c:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}

00000090 <_ZN10StateStack9PushStateESt8functionIFbvEEb>:
  90:	e92d40f0 	push	{r4, r5, r6, r7, lr}
  94:	e5913008 	ldr	r3, [r1, #8]
  98:	e3a0e000 	mov	lr, #0
  9c:	e24dd014 	sub	sp, sp, #20
  a0:	e153000e 	cmp	r3, lr
  a4:	e1a06000 	mov	r6, r0
  a8:	e1a07002 	mov	r7, r2
  ac:	e58de008 	str	lr, [sp, #8]
  b0:	0a000006 	beq	d0 <_ZN10StateStack9PushStateESt8functionIFbvEEb+0x40>
  b4:	e591200c 	ldr	r2, [r1, #12]
  b8:	e58d200c 	str	r2, [sp, #12]
  bc:	e58d3008 	str	r3, [sp, #8]
  c0:	e1a0000d 	mov	r0, sp
  c4:	e3a02002 	mov	r2, #2
  c8:	e1a0500d 	mov	r5, sp
  cc:	e12fff33 	blx	r3
  d0:	e3a00024 	mov	r0, #36	; 0x24
  d4:	ebfffffe 	bl	0 <_Znwj>
  d8:	e3a03000 	mov	r3, #0
  dc:	e5803008 	str	r3, [r0, #8]
  e0:	e59d3008 	ldr	r3, [sp, #8]
  e4:	e1a04000 	mov	r4, r0
  e8:	e3530000 	cmp	r3, #0
  ec:	0a00001d 	beq	168 <_ZN10StateStack9PushStateESt8functionIFbvEEb+0xd8>
  f0:	e59d200c 	ldr	r2, [sp, #12]
  f4:	e5803008 	str	r3, [r0, #8]
  f8:	e580200c 	str	r2, [r0, #12]
  fc:	e59d3008 	ldr	r3, [sp, #8]
 100:	e1a0100d 	mov	r1, sp
 104:	e3a02002 	mov	r2, #2
 108:	e1a0500d 	mov	r5, sp
 10c:	e12fff33 	blx	r3
 110:	e59dc008 	ldr	ip, [sp, #8]
 114:	e3a03000 	mov	r3, #0
 118:	e15c0003 	cmp	ip, r3
 11c:	e5c47020 	strb	r7, [r4, #32]
 120:	e5843018 	str	r3, [r4, #24]
 124:	e5c43021 	strb	r3, [r4, #33]	; 0x21
 128:	0a000003 	beq	13c <_ZN10StateStack9PushStateESt8functionIFbvEEb+0xac>
 12c:	e1a0000d 	mov	r0, sp
 130:	e1a01005 	mov	r1, r5
 134:	e3a02003 	mov	r2, #3
 138:	e12fff3c 	blx	ip
 13c:	e3a0000c 	mov	r0, #12
 140:	ebfffffe 	bl	0 <_Znwj>
 144:	e3a02000 	mov	r2, #0
 148:	e5804008 	str	r4, [r0, #8]
 14c:	e5802000 	str	r2, [r0]
 150:	e5802004 	str	r2, [r0, #4]
 154:	e1a01006 	mov	r1, r6
 158:	ebfffffe 	bl	0 <_ZNSt8__detail15_List_node_base7_M_hookEPS0_>
 15c:	e1a00004 	mov	r0, r4
 160:	e28dd014 	add	sp, sp, #20
 164:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
 168:	e5803018 	str	r3, [r0, #24]
 16c:	e5c07020 	strb	r7, [r0, #32]
 170:	e5c03021 	strb	r3, [r0, #33]	; 0x21
 174:	eafffff0 	b	13c <_ZN10StateStack9PushStateESt8functionIFbvEEb+0xac>
 178:	e59d3008 	ldr	r3, [sp, #8]
 17c:	e3530000 	cmp	r3, #0
 180:	0a000003 	beq	194 <_ZN10StateStack9PushStateESt8functionIFbvEEb+0x104>
 184:	e1a0000d 	mov	r0, sp
 188:	e1a0100d 	mov	r1, sp
 18c:	e3a02003 	mov	r2, #3
 190:	e12fff33 	blx	r3
 194:	ebfffffe 	bl	0 <__cxa_end_cleanup>
 198:	e59d3008 	ldr	r3, [sp, #8]
 19c:	e3530000 	cmp	r3, #0
 1a0:	0afffffb 	beq	194 <_ZN10StateStack9PushStateESt8functionIFbvEEb+0x104>
 1a4:	e1a00005 	mov	r0, r5
 1a8:	e1a01005 	mov	r1, r5
 1ac:	e3a02003 	mov	r2, #3
 1b0:	e12fff33 	blx	r3
 1b4:	eafffff6 	b	194 <_ZN10StateStack9PushStateESt8functionIFbvEEb+0x104>
 1b8:	e5943018 	ldr	r3, [r4, #24]
 1bc:	e3530000 	cmp	r3, #0
 1c0:	0a000003 	beq	1d4 <_ZN10StateStack9PushStateESt8functionIFbvEEb+0x144>
 1c4:	e2840010 	add	r0, r4, #16
 1c8:	e1a01000 	mov	r1, r0
 1cc:	e3a02003 	mov	r2, #3
 1d0:	e12fff33 	blx	r3
 1d4:	e5943008 	ldr	r3, [r4, #8]
 1d8:	e3530000 	cmp	r3, #0
 1dc:	0a000003 	beq	1f0 <_ZN10StateStack9PushStateESt8functionIFbvEEb+0x160>
 1e0:	e1a00004 	mov	r0, r4
 1e4:	e1a01004 	mov	r1, r4
 1e8:	e3a02003 	mov	r2, #3
 1ec:	e12fff33 	blx	r3
 1f0:	e1a00004 	mov	r0, r4
 1f4:	ebfffffe 	bl	0 <_ZdlPv>
 1f8:	eaffffe5 	b	194 <_ZN10StateStack9PushStateESt8functionIFbvEEb+0x104>
 1fc:	e5943008 	ldr	r3, [r4, #8]
 200:	e3530000 	cmp	r3, #0
 204:	0a000003 	beq	218 <_ZN10StateStack9PushStateESt8functionIFbvEEb+0x188>
 208:	e1a00004 	mov	r0, r4
 20c:	e1a01004 	mov	r1, r4
 210:	e3a02003 	mov	r2, #3
 214:	e12fff33 	blx	r3
 218:	e1a00004 	mov	r0, r4
 21c:	ebfffffe 	bl	0 <_ZdlPv>
 220:	eaffffd4 	b	178 <_ZN10StateStack9PushStateESt8functionIFbvEEb+0xe8>

00000224 <_ZN10StateStack10CallStatesEv>:
 224:	e5903000 	ldr	r3, [r0]
 228:	e1500003 	cmp	r0, r3
 22c:	0a000025 	beq	2c8 <_ZN10StateStack10CallStatesEv+0xa4>
 230:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
 234:	e1a05000 	mov	r5, r0
 238:	e1a06000 	mov	r6, r0
 23c:	e3a07001 	mov	r7, #1
 240:	ea000008 	b	268 <_ZN10StateStack10CallStatesEv+0x44>
 244:	e3530000 	cmp	r3, #0
 248:	0a000020 	beq	2d0 <_ZN10StateStack10CallStatesEv+0xac>
 24c:	e594300c 	ldr	r3, [r4, #12]
 250:	e1a00004 	mov	r0, r4
 254:	e12fff33 	blx	r3
 258:	e5955004 	ldr	r5, [r5, #4]
 25c:	e5963000 	ldr	r3, [r6]
 260:	e1530005 	cmp	r3, r5
 264:	0a000015 	beq	2c0 <_ZN10StateStack10CallStatesEv+0x9c>
 268:	e5953004 	ldr	r3, [r5, #4]
 26c:	e5934008 	ldr	r4, [r3, #8]
 270:	e5943018 	ldr	r3, [r4, #24]
 274:	e3530000 	cmp	r3, #0
 278:	0a000006 	beq	298 <_ZN10StateStack10CallStatesEv+0x74>
 27c:	e5d43021 	ldrb	r3, [r4, #33]	; 0x21
 280:	e3530000 	cmp	r3, #0
 284:	1a000003 	bne	298 <_ZN10StateStack10CallStatesEv+0x74>
 288:	e5c47021 	strb	r7, [r4, #33]	; 0x21
 28c:	e594301c 	ldr	r3, [r4, #28]
 290:	e2840010 	add	r0, r4, #16
 294:	e12fff33 	blx	r3
 298:	e5d43020 	ldrb	r3, [r4, #32]
 29c:	e3530000 	cmp	r3, #0
 2a0:	e5943008 	ldr	r3, [r4, #8]
 2a4:	0affffe6 	beq	244 <_ZN10StateStack10CallStatesEv+0x20>
 2a8:	e3530000 	cmp	r3, #0
 2ac:	0a000007 	beq	2d0 <_ZN10StateStack10CallStatesEv+0xac>
 2b0:	e594300c 	ldr	r3, [r4, #12]
 2b4:	e1a00004 	mov	r0, r4
 2b8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
 2bc:	e12fff13 	bx	r3
 2c0:	e3a00000 	mov	r0, #0
 2c4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
 2c8:	e3a00000 	mov	r0, #0
 2cc:	e12fff1e 	bx	lr
 2d0:	ebfffffe 	bl	0 <_ZSt25__throw_bad_function_callv>

Disassembly of section .ARM.extab:

00000000 <.ARM.extab>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00b108ab 	adcseq	r0, r1, fp, lsr #17
   8:	0001ffff 	strdeq	pc, [r1], -pc	; <UNPREDICTABLE>
   c:	00000000 	andeq	r0, r0, r0
  10:	0004abb0 			; <UNDEFINED> instruction: 0x0004abb0
  14:	1a01ffff 	bne	80018 <_ZN10StateStack10CallStatesEv+0x7fdf4>
  18:	0288043c 	addeq	r0, r8, #60, 8	; 0x3c000000
  1c:	e8044400 	stmda	r4, {sl, lr}
  20:	047c0001 	ldrbteq	r0, [ip], #-1
  24:	b00002ec 	andlt	r0, r0, ip, ror #5
  28:	02a80401 	adceq	r0, r8, #16777216	; 0x1000000
  2c:	04028400 	streq	r8, [r2], #-1024	; 0x400
  30:	00000000 	andeq	r0, r0, r0

Disassembly of section .ARM.exidx:

00000000 <.ARM.exidx>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000001 	andeq	r0, r0, r1
   8:	00000010 	andeq	r0, r0, r0, lsl r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00000090 	muleq	r0, r0, r0
  14:	0000000c 	andeq	r0, r0, ip
  18:	00000224 	andeq	r0, r0, r4, lsr #4
  1c:	80acb0b0 	strhthi	fp, [ip], r0

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
   0:	00002a41 	andeq	r2, r0, r1, asr #20
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000020 	andeq	r0, r0, r0, lsr #32
  10:	45543505 	ldrbmi	r3, [r4, #-1285]	; 0x505
  14:	08040600 	stmdaeq	r4, {r9, sl}
  18:	12010901 	andne	r0, r1, #16384	; 0x4000
  1c:	15011404 	strne	r1, [r1, #-1028]	; 0x404
  20:	18031701 	stmdane	r3, {r0, r8, r9, sl, ip}
  24:	1a011901 	bne	46430 <_ZN10StateStack10CallStatesEv+0x4620c>
  28:	Address 0x0000000000000028 is out of bounds.

