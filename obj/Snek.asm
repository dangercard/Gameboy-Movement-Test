;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
	.module Snek
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _joypad
	.globl _delay
	.globl _rxpos
	.globl _lxpos
	.globl _lypos
	.globl _face
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_face::
	.ds 64
_lypos::
	.ds 2
_lxpos::
	.ds 2
_rxpos::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;face.c:26: unsigned char face[] =
	ld	hl,#_face
	ld	(hl),#0x7f
	ld	hl,#(_face + 0x0001)
	ld	(hl),#0x7f
	ld	hl,#(_face + 0x0002)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x0003)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x0004)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x0005)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x0006)
	ld	(hl),#0x98
	ld	hl,#(_face + 0x0007)
	ld	(hl),#0x98
	ld	hl,#(_face + 0x0008)
	ld	(hl),#0x98
	ld	hl,#(_face + 0x0009)
	ld	(hl),#0x98
	ld	hl,#(_face + 0x000a)
	ld	(hl),#0x98
	ld	hl,#(_face + 0x000b)
	ld	(hl),#0x98
	ld	hl,#(_face + 0x000c)
	ld	(hl),#0x98
	ld	hl,#(_face + 0x000d)
	ld	(hl),#0x98
	ld	hl,#(_face + 0x000e)
	ld	(hl),#0x98
	ld	hl,#(_face + 0x000f)
	ld	(hl),#0x98
	ld	hl,#(_face + 0x0010)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x0011)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x0012)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x0013)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x0014)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x0015)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x0016)
	ld	(hl),#0x9f
	ld	hl,#(_face + 0x0017)
	ld	(hl),#0x9f
	ld	hl,#(_face + 0x0018)
	ld	(hl),#0x9f
	ld	hl,#(_face + 0x0019)
	ld	(hl),#0x9f
	ld	hl,#(_face + 0x001a)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x001b)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x001c)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x001d)
	ld	(hl),#0x80
	ld	hl,#(_face + 0x001e)
	ld	(hl),#0x7f
	ld	hl,#(_face + 0x001f)
	ld	(hl),#0x7f
	ld	hl,#(_face + 0x0020)
	ld	(hl),#0xfe
	ld	hl,#(_face + 0x0021)
	ld	(hl),#0xfe
	ld	hl,#(_face + 0x0022)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x0023)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x0024)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x0025)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x0026)
	ld	(hl),#0x19
	ld	hl,#(_face + 0x0027)
	ld	(hl),#0x19
	ld	hl,#(_face + 0x0028)
	ld	(hl),#0x19
	ld	hl,#(_face + 0x0029)
	ld	(hl),#0x19
	ld	hl,#(_face + 0x002a)
	ld	(hl),#0x19
	ld	hl,#(_face + 0x002b)
	ld	(hl),#0x19
	ld	hl,#(_face + 0x002c)
	ld	(hl),#0x19
	ld	hl,#(_face + 0x002d)
	ld	(hl),#0x19
	ld	hl,#(_face + 0x002e)
	ld	(hl),#0x19
	ld	hl,#(_face + 0x002f)
	ld	(hl),#0x19
	ld	hl,#(_face + 0x0030)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x0031)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x0032)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x0033)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x0034)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x0035)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x0036)
	ld	(hl),#0xf9
	ld	hl,#(_face + 0x0037)
	ld	(hl),#0xf9
	ld	hl,#(_face + 0x0038)
	ld	(hl),#0xf9
	ld	hl,#(_face + 0x0039)
	ld	(hl),#0xf9
	ld	hl,#(_face + 0x003a)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x003b)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x003c)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x003d)
	ld	(hl),#0x01
	ld	hl,#(_face + 0x003e)
	ld	(hl),#0xfe
	ld	hl,#(_face + 0x003f)
	ld	(hl),#0xfe
;Snek.c:4: int lypos = 75 ;
	ld	hl,#_lypos
	ld	(hl),#0x4b
	inc	hl
	ld	(hl),#0x00
;Snek.c:5: int lxpos = 75;
	ld	hl,#_lxpos
	ld	(hl),#0x4b
	inc	hl
	ld	(hl),#0x00
;Snek.c:6: int rxpos = 82;
	ld	hl,#_rxpos
	ld	(hl),#0x52
	inc	hl
	ld	(hl),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;Snek.c:8: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;Snek.c:9: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;Snek.c:10: set_sprite_data(0,8,face);
	ld	hl,#_face
	push	hl
	ld	hl,#0x0800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;Snek.c:11: set_sprite_tile(0,0);
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;Snek.c:12: move_sprite(0,75,75);
	ld	hl,#0x4b4b
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:13: set_sprite_tile(1, 2);
	ld	hl,#0x0201
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;Snek.c:14: move_sprite(1, 75 + 8, 75);
	ld	hl,#0x4b53
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:15: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;Snek.c:17: while(1){
00109$:
;Snek.c:18: switch (joypad()) {
	call	_joypad
;Snek.c:34: move_sprite(0,lxpos - 8,lypos);
	ld	hl,#_lypos
	ld	b,(hl)
	ld	hl,#_lxpos
	ld	c,(hl)
;Snek.c:18: switch (joypad()) {
	ld	a,e
	dec	a
	jp	Z,00104$
	ld	a,e
	sub	a, #0x02
	jp	Z,00103$
;Snek.c:20: move_sprite(0,lxpos,lypos - 8);
	ld	hl,#_lypos
	ld	c,(hl)
	ld	hl,#_lxpos
	ld	b,(hl)
;Snek.c:18: switch (joypad()) {
	ld	a,e
	cp	a,#0x04
	jr	Z,00101$
	cp	a,##0x08
	jp	Z,00102$
	sub	a, #0x10
	jp	Z,00105$
	jr	00109$
;Snek.c:19: case J_UP:
00101$:
;Snek.c:20: move_sprite(0,lxpos,lypos - 8);
	ld	a,c
	add	a,#0xf8
	push	af
	inc	sp
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:21: move_sprite(1,rxpos,lypos - 8);
	ld	hl,#_lypos
	ld	a,(hl)
	add	a,#0xf8
	ld	b,a
	ld	hl,#_rxpos
	ld	d,(hl)
	push	bc
	inc	sp
	push	de
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:22: lypos -= 8;
	ld	hl,#_lypos
	ld	a,(hl)
	add	a,#0xf8
	ld	(hl+),a
	ld	a,(hl)
	adc	a,#0xff
	ld	(hl),a
;Snek.c:23: delay(300);
	ld	hl,#0x012c
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:24: break;
	jp	00109$
;Snek.c:26: case J_DOWN:
00102$:
;Snek.c:27: move_sprite(0,lxpos,lypos + 8);
	ld	a,c
	add	a, #0x08
	ld	d,a
	push	de
	inc	sp
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:28: move_sprite(1,rxpos,lypos + 8);
	ld	hl,#_lypos
	ld	a,(hl)
	add	a, #0x08
	ld	d,a
	ld	hl,#_rxpos
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:29: lypos += 8;
	ld	hl,#_lypos
	ld	a,(hl)
	add	a, #0x08
	ld	(hl+),a
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;Snek.c:30: delay(300);
	ld	hl,#0x012c
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:31: break;
	jp	00109$
;Snek.c:33: case J_LEFT:
00103$:
;Snek.c:34: move_sprite(0,lxpos - 8,lypos);
	ld	a,c
	add	a,#0xf8
	push	bc
	inc	sp
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:35: move_sprite(1,rxpos - 8,lypos);
	ld	hl,#_lypos
	ld	b,(hl)
	ld	hl,#_rxpos
	ld	a,(hl)
	add	a,#0xf8
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:36: lxpos -= 8;
	ld	hl,#_lxpos
	ld	a,(hl)
	add	a,#0xf8
	ld	(hl+),a
	ld	a,(hl)
	adc	a,#0xff
	ld	(hl),a
;Snek.c:37: rxpos -= 8;
	ld	hl,#_rxpos
	ld	a,(hl)
	add	a,#0xf8
	ld	(hl+),a
	ld	a,(hl)
	adc	a,#0xff
	ld	(hl),a
;Snek.c:38: delay(300);
	ld	hl,#0x012c
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:39: break;
	jp	00109$
;Snek.c:41: case J_RIGHT:
00104$:
;Snek.c:42: move_sprite(0,lxpos + 8,lypos);
	ld	a,c
	add	a, #0x08
	ld	d,a
	push	bc
	inc	sp
	push	de
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:43: move_sprite(1,rxpos + 8,lypos);
	ld	hl,#_lypos
	ld	d,(hl)
	ld	hl,#_rxpos
	ld	a,(hl)
	add	a, #0x08
	ld	b,a
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:44: lxpos += 8;
	ld	hl,#_lxpos
	ld	a,(hl)
	add	a, #0x08
	ld	(hl+),a
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;Snek.c:45: rxpos += 8;
	ld	hl,#_rxpos
	ld	a,(hl)
	add	a, #0x08
	ld	(hl+),a
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;Snek.c:46: delay(300);
	ld	hl,#0x012c
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:47: break;
	jp	00109$
;Snek.c:49: case J_A:
00105$:
;Snek.c:50: set_sprite_tile(1,6);
	ld	hl,#0x0601
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;Snek.c:51: delay(300);
	ld	hl,#0x012c
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:52: set_sprite_tile(1,2);
	ld	hl,#0x0201
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;Snek.c:53: break;
	jp	00109$
;Snek.c:57: }
	ret
	.area _CODE
	.area _CABS (ABS)
