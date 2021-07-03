;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12439 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _enemyMovement
	.globl _enemySetup
	.globl _marioMovement
	.globl _canEntityMove
	.globl _marioSetup
	.globl _moveMario
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _joypad
	.globl _delay
	.globl _initarand
	.globl _rand
	.globl _enemy
	.globl _tile
	.globl _player
	.globl _scoreboard
	.globl _map
	.globl _turtle
	.globl _mario
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_mario::
	.ds 13
_turtle::
	.ds 6
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_map::
	.ds 360
_scoreboard::
	.ds 6
_player::
	.ds 160
_tile::
	.ds 80
_enemy::
	.ds 16
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;sprites.c:13: void moveMario(struct Character *character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveMario
; ---------------------------------
_moveMario::
	add	sp, #-5
;sprites.c:15: move_sprite(character->spritids[0], x, y);
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	inc	de
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
;sprites.c:16: move_sprite(character->spritids[1], x + 8, y);
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ld	a, (hl-)
	add	a, #0x08
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	inc	de
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;sprites.c:17: move_sprite(character->spritids[2], x + 16, y);
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0x10
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	inc	de
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;sprites.c:18: move_sprite(character->spritids[3], x, y + 8);
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0x08
	ldhl	sp,	#0
	ld	(hl), a
	ld	e, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	d, (hl)
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
;sprites.c:19: move_sprite(character->spritids[4], x + 8, y + 8);
	ld	hl, #0x0004
	add	hl, bc
	ld	e, (hl)
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;sprites.c:20: move_sprite(character->spritids[5], x + 16, y + 8);
	ld	hl, #0x0005
	add	hl, bc
	ld	e, (hl)
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ldhl	sp,	#3
;sprites.c:21: move_sprite(character->spritids[6], x, y + 16);
	ld	a, (hl+)
	ld	(de), a
	ld	a, (hl)
	add	a, #0x10
	ld	(hl), a
	ld	e, (hl)
	ld	hl, #0x0006
	add	hl, bc
	ld	d, (hl)
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
;sprites.c:22: move_sprite(character->spritids[7], x + 8, y + 16);
	ld	hl, #0x0007
	add	hl, bc
	ld	e, (hl)
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;sprites.c:23: move_sprite(character->spritids[8], x + 16, y + 16);
	ld	hl, #0x0008
	add	hl, bc
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sprites.c:23: move_sprite(character->spritids[8], x + 16, y + 16);
;sprites.c:24: }
	add	sp, #5
	ret
;sprites.c:26: void marioSetup()
;	---------------------------------
; Function marioSetup
; ---------------------------------
_marioSetup::
;sprites.c:28: mario.x = 35;
	ld	bc, #_mario+0
	ld	hl, #(_mario + 9)
	ld	(hl), #0x23
;sprites.c:29: mario.y = 128;
	ld	hl, #(_mario + 10)
	ld	(hl), #0x80
;sprites.c:30: mario.width = 24;
	ld	hl, #(_mario + 11)
	ld	(hl), #0x18
;sprites.c:31: mario.height = 24;
	ld	hl, #(_mario + 12)
	ld	(hl), #0x18
;c:/gbdk-2020/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;sprites.c:34: mario.spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:/gbdk-2020/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;sprites.c:36: mario.spritids[1] = 1;
	ld	hl, #(_mario + 1)
	ld	(hl), #0x01
;c:/gbdk-2020/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
;sprites.c:38: mario.spritids[2] = 2;
	ld	hl, #(_mario + 2)
	ld	(hl), #0x02
;c:/gbdk-2020/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;sprites.c:40: mario.spritids[3] = 3;
	ld	hl, #(_mario + 3)
	ld	(hl), #0x03
;c:/gbdk-2020/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x04
;sprites.c:42: mario.spritids[4] = 4;
	ld	hl, #(_mario + 4)
	ld	(hl), #0x04
;c:/gbdk-2020/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x05
;sprites.c:44: mario.spritids[5] = 5;
	ld	hl, #(_mario + 5)
	ld	(hl), #0x05
;c:/gbdk-2020/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
;sprites.c:46: mario.spritids[6] = 6;
	ld	hl, #(_mario + 6)
	ld	(hl), #0x06
;c:/gbdk-2020/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
;sprites.c:48: mario.spritids[7] = 7;
	ld	hl, #(_mario + 7)
	ld	(hl), #0x07
;c:/gbdk-2020/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x08
;sprites.c:50: mario.spritids[8] = 8;
	ld	hl, #(_mario + 8)
	ld	(hl), #0x08
;sprites.c:52: moveMario(&mario, mario.x, mario.y); /* move mario */
	ld	a, (#(_mario + 10) + 0)
	ld	hl, #(_mario + 9)
	ld	h, (hl)
;	spillPairReg hl
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_moveMario
	add	sp, #4
;sprites.c:53: }
	ret
;sprites.c:56: UBYTE canEntityMove(uint8_t newx, uint8_t newy, const char blankmap)
;	---------------------------------
; Function canEntityMove
; ---------------------------------
_canEntityMove::
	dec	sp
	dec	sp
;sprites.c:61: indexTlx = (newx) / 8;
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00103$
	ld	hl, #0x0007
	add	hl, bc
00103$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	inc	sp
	inc	sp
	push	bc
;sprites.c:62: indexTly = (newy) / 8;
	ldhl	sp,	#5
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00104$
	ld	hl, #0x0007
	add	hl, bc
00104$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
;sprites.c:63: tileindexTL = 20 * indexTly + indexTlx;
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	add	hl, bc
;sprites.c:65: result = map[tileindexTL] == blankmap;
	ld	bc,#_map
	add	hl,bc
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#6
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	a, e
	sub	a, c
	jr	NZ, 00115$
	ld	a, d
	sub	a, b
	ld	a, #0x01
	jr	Z, 00116$
00115$:
	xor	a, a
00116$:
;sprites.c:66: return result;
	ld	e, a
;sprites.c:67: }
	inc	sp
	inc	sp
	ret
;sprites.c:70: void marioMovement()
;	---------------------------------
; Function marioMovement
; ---------------------------------
_marioMovement::
;sprites.c:73: if(joypad() & J_LEFT)
	call	_joypad
	bit	1, e
	jr	Z, 00104$
;sprites.c:75: if(canEntityMove(mario.x-8, mario.y, 0x24))
	ld	hl, #(_mario + 10)
	ld	h, (hl)
;	spillPairReg hl
	ld	bc, #_mario + 9
	ld	a, (bc)
	add	a, #0xf8
	ld	d, a
	push	bc
	ld	a, #0x24
	push	af
	inc	sp
	ld	l, d
	push	hl
	call	_canEntityMove
	add	sp, #3
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00104$
;sprites.c:77: mario.x -= 1;
	ld	a, (bc)
	dec	a
	ld	(bc), a
;sprites.c:78: moveMario(&mario, mario.x, mario.y);
	ld	hl, #(_mario + 10)
	ld	h, (hl)
;	spillPairReg hl
	ld	a, (bc)
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	de, #_mario
	push	de
	call	_moveMario
	add	sp, #4
00104$:
;sprites.c:83: if(joypad() & J_RIGHT)
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00108$
;sprites.c:85: if(canEntityMove(mario.x+8, mario.y, 0x24))
	ld	hl, #(_mario + 10)
	ld	h, (hl)
;	spillPairReg hl
	ld	bc, #_mario + 9
	ld	a, (bc)
	add	a, #0x08
	ld	d, a
	push	bc
	ld	a, #0x24
	push	af
	inc	sp
	ld	l, d
	push	hl
	call	_canEntityMove
	add	sp, #3
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00108$
;sprites.c:87: mario.x += 1;
	ld	a, (bc)
	inc	a
	ld	(bc), a
;sprites.c:88: moveMario(&mario, mario.x, mario.y);
	ld	hl, #(_mario + 10)
	ld	h, (hl)
;	spillPairReg hl
	ld	a, (bc)
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	de, #_mario
	push	de
	call	_moveMario
	add	sp, #4
00108$:
;sprites.c:93: if(joypad() & J_B)
	call	_joypad
	bit	5, e
	jr	Z, 00112$
;sprites.c:95: if(canEntityMove(mario.x, mario.y-8, 0x24))
	ld	hl, #_mario + 10
	ld	a, (hl)
	add	a, #0xf8
	ld	b, a
	ld	de, #_mario + 9
	ld	a, (de)
	ld	c, a
	push	hl
	push	de
	ld	a, #0x24
	push	af
	inc	sp
	push	bc
	call	_canEntityMove
	add	sp, #3
	ld	a, e
	pop	de
	pop	hl
	or	a, a
	jr	Z, 00112$
;sprites.c:97: mario.y -= 5;
	ld	a, (hl)
	add	a, #0xfb
	ld	(hl), a
;sprites.c:98: moveMario(&mario, mario.x, mario.y);
	ld	b, (hl)
	ld	a, (de)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_mario
	push	de
	call	_moveMario
	add	sp, #4
00112$:
;sprites.c:103: if(mario.x <= 0)
	ld	bc, #_mario + 9
	ld	a, (bc)
	or	a, a
	jr	NZ, 00116$
;sprites.c:105: mario.x = 160;
	ld	a, #0xa0
	ld	(bc), a
	jr	00117$
00116$:
;sprites.c:106: } else if(mario.x >= 160)
	sub	a, #0xa0
	jr	C, 00117$
;sprites.c:108: mario.x = 0;
	xor	a, a
	ld	(bc), a
00117$:
;sprites.c:112: if(canEntityMove(mario.x, mario.y+8, 0x24))
	ld	hl, #_mario + 10
	ld	a, (hl)
	add	a, #0x08
	ld	d, a
	ld	a, (bc)
	ld	e, a
	push	hl
	push	bc
	ld	a, #0x24
	push	af
	inc	sp
	push	de
	call	_canEntityMove
	add	sp, #3
	ld	a, e
	pop	bc
	pop	hl
	or	a, a
	jr	Z, 00119$
;sprites.c:114: mario.y += 2;
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;sprites.c:115: moveMario(&mario, mario.x, mario.y);
	ld	e, (hl)
	ld	a, (bc)
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	de, #_mario
	push	de
	call	_moveMario
	add	sp, #4
00119$:
;sprites.c:117: delay(10);
	ld	de, #0x000a
	push	de
	call	_delay
	pop	hl
;sprites.c:118: }
	ret
;enemysprites.c:11: void enemySetup()
;	---------------------------------
; Function enemySetup
; ---------------------------------
_enemySetup::
	add	sp, #-4
;enemysprites.c:13: initarand(46);
	ld	de, #0x002e
	push	de
	call	_initarand
	pop	hl
;enemysprites.c:14: for(uint8_t i=0; i<3; i++)
	ldhl	sp,	#3
	ld	(hl), #0x00
00112$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x03
	jp	NC, 00114$
;enemysprites.c:16: int pipe = rand() % 2;
	call	_rand
	ld	a, e
	rlca
	sbc	a, a
	ld	bc, #0x0002
	push	bc
	ld	d, a
	push	de
	call	__modsint
	add	sp, #6
	push	de
;enemysprites.c:21: turtle[i].x = 0, turtle[i].y = 24;
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
;enemysprites.c:22: set_sprite_prop(9+i, S_PRIORITY);
;enemysprites.c:21: turtle[i].x = 0, turtle[i].y = 24;
;enemysprites.c:22: set_sprite_prop(9+i, S_PRIORITY);
	ld	a, (hl-)
	sla	c
	rl	b
	add	a, #0x09
	ld	(hl), a
;enemysprites.c:19: if(pipe == 0)
	ld	a, d
	or	a, e
	jr	NZ, 00104$
;enemysprites.c:21: turtle[i].x = 0, turtle[i].y = 24;
	ld	hl, #_turtle
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x18
;enemysprites.c:22: set_sprite_prop(9+i, S_PRIORITY);
	ldhl	sp,	#2
;c:/gbdk-2020/include/gb/gb.h:1220: shadow_OAM[nb].prop=prop;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x80
;enemysprites.c:22: set_sprite_prop(9+i, S_PRIORITY);
	jr	00105$
00104$:
;enemysprites.c:23: } else if(pipe == 1)
	ldhl	sp,	#0
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	jr	NZ, 00105$
;enemysprites.c:25: turtle[i].x = 100, turtle[i].y = 24;
	ld	hl, #_turtle
	add	hl, bc
	ld	a, #0x64
	ld	(hl+), a
	ld	(hl), #0x18
;enemysprites.c:26: set_sprite_prop(9+i, S_FLIPX);
	ldhl	sp,	#2
;c:/gbdk-2020/include/gb/gb.h:1220: shadow_OAM[nb].prop=prop;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x20
;enemysprites.c:26: set_sprite_prop(9+i, S_FLIPX);
00105$:
;enemysprites.c:29: set_sprite_tile(9+i, 9); /* set all turtle tiles*/
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0x09
	ld	c, a
;c:/gbdk-2020/include/gb/gb.h:1174: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x09
;enemysprites.c:30: move_sprite(9+i, turtle[i].x, turtle[i].y);
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_turtle
	add	hl, de
	ld	e, l
	ld	d, h
	inc	de
	ld	a, (de)
	ld	e, a
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	c, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	b, a
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, e
	ld	(bc), a
	inc	bc
	ldhl	sp,	#2
;enemysprites.c:14: for(uint8_t i=0; i<3; i++)
	ld	a, (hl+)
	ld	(bc), a
	inc	(hl)
	jp	00112$
00114$:
;enemysprites.c:32: }
	add	sp, #4
	ret
;enemysprites.c:35: void enemyMovement()
;	---------------------------------
; Function enemyMovement
; ---------------------------------
_enemyMovement::
	add	sp, #-4
;enemysprites.c:37: for(uint8_t i=0; i<3; i++)
	ld	c, #0x00
00121$:
	ld	a, c
	sub	a, #0x03
	jp	NC, 00123$
;enemysprites.c:40: if(canEntityMove(turtle[i].x, turtle[i].y-8, 0x24))
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #_turtle
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	add	a, #0xf8
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	ld	h, #0x24
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_canEntityMove
	add	sp, #3
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00102$
;enemysprites.c:42: turtle[i].y++; /* gravity */
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
	inc	b
	pop	hl
	push	hl
	ld	(hl), b
;enemysprites.c:43: move_sprite(9+i, turtle[i].x, turtle[i].y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	a, c
	add	a, #0x09
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, b
	ld	(de), a
	inc	de
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
;enemysprites.c:43: move_sprite(9+i, turtle[i].x, turtle[i].y);
00102$:
;enemysprites.c:40: if(canEntityMove(turtle[i].x, turtle[i].y-8, 0x24))
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
;enemysprites.c:47: if(turtle[i].x <= 0)
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #_turtle
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	or	a, a
	jr	NZ, 00106$
;enemysprites.c:49: turtle[i].x = 160;
	pop	hl
	push	hl
	ld	(hl), #0xa0
	jr	00107$
00106$:
;enemysprites.c:50: } else if(turtle[i].x >= 160)
	sub	a, #0xa0
	jr	C, 00107$
;enemysprites.c:52: turtle[i].x = 0;
	pop	hl
	push	hl
	ld	(hl), #0x00
00107$:
;enemysprites.c:56: if(canEntityMove(turtle[i].x, turtle[i].y-16, 0x27))
	pop	de
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xf0
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	ld	h, #0x27
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_canEntityMove
	add	sp, #3
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00109$
;enemysprites.c:58: turtle[i].x = 0;
	pop	hl
	push	hl
	ld	(hl), #0x00
;enemysprites.c:59: turtle[i].y = 24;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x18
00109$:
;enemysprites.c:62: if(get_sprite_prop(9+i) == S_PRIORITY)
	ld	a, c
	add	a, #0x09
	ld	e, a
	ld	b, e
;c:/gbdk-2020/include/gb/gb.h:1230: return shadow_OAM[nb].prop;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	pop	de
	ld	a, (hl)
;enemysprites.c:62: if(get_sprite_prop(9+i) == S_PRIORITY)
	sub	a, #0x80
	jr	NZ, 00113$
;enemysprites.c:40: if(canEntityMove(turtle[i].x, turtle[i].y-8, 0x24))
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
;enemysprites.c:47: if(turtle[i].x <= 0)
	add	hl, hl
	ld	de, #_turtle
	add	hl, de
;enemysprites.c:64: turtle[i].x++;
	inc	(hl)
	ld	a, (hl)
	jr	00114$
00113$:
;enemysprites.c:65: } else if(get_sprite_prop(9+i) == S_FLIPX)
;c:/gbdk-2020/include/gb/gb.h:1230: return shadow_OAM[nb].prop;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
;enemysprites.c:40: if(canEntityMove(turtle[i].x, turtle[i].y-8, 0x24))
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
;enemysprites.c:47: if(turtle[i].x <= 0)
	add	hl, hl
	push	de
	ld	de, #_turtle
	add	hl, de
	pop	de
;enemysprites.c:65: } else if(get_sprite_prop(9+i) == S_FLIPX)
	ld	a, e
	sub	a, #0x20
	jr	NZ, 00114$
;enemysprites.c:67: turtle[i].x--;
	dec	(hl)
	ld	a, (hl)
00114$:
;enemysprites.c:69: move_sprite(9+i, turtle[i].x, turtle[i].y);
	ld	e, l
	ld	d, h
	inc	de
	ld	a, (de)
	ld	b, a
	ld	e, (hl)
	ld	a, c
	add	a, #0x09
	ld	d, a
;c:/gbdk-2020/include/gb/gb.h:1247: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	add	hl, hl
	add	hl, hl
	ld	a, #<(_shadow_OAM)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_shadow_OAM)
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;c:/gbdk-2020/include/gb/gb.h:1248: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;enemysprites.c:37: for(uint8_t i=0; i<3; i++)
	inc	c
	jp	00121$
00123$:
;enemysprites.c:71: }
	add	sp, #4
	ret
;main.c:13: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:17: font_init();
	call	_font_init
;main.c:18: min_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;main.c:19: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
;main.c:21: set_win_tiles(0, 0, 6, 1, scoreboard); /* create score board */
	ld	de, #_scoreboard
	push	de
	ld	hl, #0x106
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;c:/gbdk-2020/include/gb/gb.h:1044: WX_REG=x, WY_REG=y;
	ld	a, #0x78
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:24: set_sprite_data(0, 9, player);
	ld	de, #_player
	push	de
	ld	hl, #0x900
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:25: marioSetup(); /* load mario */
	call	_marioSetup
;main.c:26: set_sprite_data(9, 1, enemy); /* load enemy */
	ld	de, #_enemy
	push	de
	ld	hl, #0x109
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:27: enemySetup();
	call	_enemySetup
;main.c:29: set_bkg_data(36, 4, tile); /* load tiles for map */
	ld	de, #_tile
	push	de
	ld	hl, #0x424
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:30: set_bkg_tiles(0, 0, 20, 18, map); /* load map */
	ld	de, #_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:32: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:33: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:34: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:35: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:37: while(1)
00102$:
;main.c:39: marioMovement();
	call	_marioMovement
;main.c:40: enemyMovement();
	call	_enemyMovement
;main.c:42: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
__xinit__map:
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x27	; 39
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x27	; 39
	.db #0x27	; 39
	.db #0x27	; 39
	.db #0x27	; 39
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x27	; 39
	.db #0x27	; 39
	.db #0x27	; 39
	.db #0x27	; 39
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x27	; 39
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
__xinit__scoreboard:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
__xinit__player:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xf0	; 240
	.db #0xdb	; 219
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0xed	; 237
	.db #0x12	; 18
	.db #0x78	; 120	'x'
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x9c	; 156
	.db #0xfe	; 254
	.db #0x9e	; 158
	.db #0xff	; 255
	.db #0xce	; 206
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0xf2	; 242
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x70	; 112	'p'
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__tile:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__enemy:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x70	; 112	'p'
	.db #0x77	; 119	'w'
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.area _CABS (ABS)
