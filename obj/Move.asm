;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
	.module Move
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
;Move.c:11: int lypos = 75 ;
	ld	hl,#_lypos
	ld	(hl),#0x4b
	inc	hl
	ld	(hl),#0x00
;Move.c:12: int lxpos = 75;
	ld	hl,#_lxpos
	ld	(hl),#0x4b
	inc	hl
	ld	(hl),#0x00
;Move.c:13: int rxpos = 82;
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
;Move.c:16: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;Move.c:18: SPRITES_8x16;  // Load 8x8 sprites two at a time (left half of face):
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;Move.c:19: set_sprite_data(0,4,face); // Push 4 8x8 sprites from face array into our sprite array.
	ld	hl,#_face
	push	hl
	ld	hl,#0x0400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;Move.c:20: set_sprite_tile(0,0); // Set the left half in the first position.
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;Move.c:21: move_sprite(0,75,75); // Set screen position of the left half.
	ld	hl,#0x4b4b
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Move.c:22: set_sprite_tile(1, 2); // Set second right half in the secon position.
	ld	hl,#0x0201
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;Move.c:23: move_sprite(1, 75 + 8, 75); // Set screen position of the right half.
	ld	hl,#0x4b53
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Move.c:24: SHOW_SPRITES; // Display Sprites.
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;Move.c:27: while(1){
00108$:
;Move.c:29: switch (joypad()) {
	call	_joypad
;Move.c:46: move_sprite(0,lxpos - 8,lypos); // Change left half position.
	ld	hl,#_lypos
	ld	b,(hl)
	ld	hl,#_lxpos
	ld	c,(hl)
;Move.c:29: switch (joypad()) {
	ld	a,e
	dec	a
	jp	Z,00104$
	ld	a,e
	sub	a, #0x02
	jp	Z,00103$
;Move.c:32: move_sprite(0,lxpos,lypos - 8); // Change left half position.
	ld	hl,#_lypos
	ld	c,(hl)
	ld	hl,#_lxpos
	ld	b,(hl)
;Move.c:29: switch (joypad()) {
	ld	a,e
	cp	a,#0x04
	jr	Z,00101$
	sub	a, #0x08
	jp	Z,00102$
	jr	00108$
;Move.c:31: case J_UP: // If Up is pressed:
00101$:
;Move.c:32: move_sprite(0,lxpos,lypos - 8); // Change left half position.
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
;Move.c:33: move_sprite(1,rxpos,lypos - 8); // Change right half position.
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
;Move.c:34: lypos -= 8; // Update global vertical position variable.
	ld	hl,#_lypos
	ld	a,(hl)
	add	a,#0xf8
	ld	(hl+),a
	ld	a,(hl)
	adc	a,#0xff
	ld	(hl),a
;Move.c:35: delay(300); // Wait before checking on the joypad.
	ld	hl,#0x012c
	push	hl
	call	_delay
	add	sp, #2
;Move.c:36: break;
	jp	00108$
;Move.c:38: case J_DOWN:
00102$:
;Move.c:39: move_sprite(0,lxpos,lypos + 8); // Change left half position.
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
;Move.c:40: move_sprite(1,rxpos,lypos + 8); // Change right half position.
	ld	hl,#_lypos
	ld	a,(hl)
	add	a, #0x08
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
;Move.c:41: lypos += 8; // Update global vertical position variable.
	ld	hl,#_lypos
	ld	a,(hl)
	add	a, #0x08
	ld	(hl+),a
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;Move.c:42: delay(300); // Wait before checking on the joypad.
	ld	hl,#0x012c
	push	hl
	call	_delay
	add	sp, #2
;Move.c:43: break;
	jp	00108$
;Move.c:45: case J_LEFT:
00103$:
;Move.c:46: move_sprite(0,lxpos - 8,lypos); // Change left half position.
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
;Move.c:47: move_sprite(1,rxpos - 8,lypos); // Change right half position.
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
;Move.c:48: lxpos -= 8;  // Update global horizontal position variables.
	ld	hl,#_lxpos
	ld	a,(hl)
	add	a,#0xf8
	ld	(hl+),a
	ld	a,(hl)
	adc	a,#0xff
	ld	(hl),a
;Move.c:49: rxpos -= 8;
	ld	hl,#_rxpos
	ld	a,(hl)
	add	a,#0xf8
	ld	(hl+),a
	ld	a,(hl)
	adc	a,#0xff
	ld	(hl),a
;Move.c:50: delay(300); // Wait before checking on the joypad.
	ld	hl,#0x012c
	push	hl
	call	_delay
	add	sp, #2
;Move.c:51: break;
	jp	00108$
;Move.c:53: case J_RIGHT:
00104$:
;Move.c:54: move_sprite(0,lxpos + 8,lypos); // Change left half position.
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
;Move.c:55: move_sprite(1,rxpos + 8,lypos); // Change right half position.
	ld	hl,#_lypos
	ld	b,(hl)
	ld	hl,#_rxpos
	ld	a,(hl)
	add	a, #0x08
	ld	d,a
	push	bc
	inc	sp
	push	de
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Move.c:56: lxpos += 8; // Update global horizontal position variables.
	ld	hl,#_lxpos
	ld	a,(hl)
	add	a, #0x08
	ld	(hl+),a
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;Move.c:57: rxpos += 8;
	ld	hl,#_rxpos
	ld	a,(hl)
	add	a, #0x08
	ld	(hl+),a
	ld	a,(hl)
	adc	a, #0x00
	ld	(hl),a
;Move.c:58: delay(300); // Wait before checking on the joypad.
	ld	hl,#0x012c
	push	hl
	call	_delay
	add	sp, #2
;Move.c:59: break;
	jp	00108$
;Move.c:63: }
	ret
	.area _CODE
	.area _CABS (ABS)
