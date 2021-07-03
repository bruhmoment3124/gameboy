#include <stdio.h>
#include <stdlib.h>
#include <rand.h>
#include <gb/gb.h>
#include <gb/font.h>
#include "sprites.c"
#include "enemysprites.c"
#include "graphics/score.c"
#include "graphics/mario.c"
#include "graphics/tile.c"
#include "graphics/enemy.c"

void main()
{
	font_t min_font; /* load font */
	
	font_init();
	min_font = font_load(font_min);
	font_set(min_font);

	set_win_tiles(0, 0, 6, 1, scoreboard); /* create score board */
	move_win(120, 136); /* move score board */
	
	set_sprite_data(0, 9, player);
	marioSetup(); /* load mario */
	set_sprite_data(9, 1, enemy); /* load enemy */
	enemySetup();
	
	set_bkg_data(36, 4, tile); /* load tiles for map */
	set_bkg_tiles(0, 0, 20, 18, map); /* load map */

	SHOW_SPRITES;
	SHOW_BKG;
	SHOW_WIN;
	DISPLAY_ON;
	
	while(1)
	{
		marioMovement();
		enemyMovement();
	}
}
