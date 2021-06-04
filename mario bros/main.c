#include <stdio.h>
#include <gb/gb.h>
#include "sprites.c"
#include "enemysprites.c"
#include "graphics/mario.c"
#include "graphics/tile.c"
#include "graphics/enemy.c"

void main() 
{
	
	set_sprite_data(0, 9, player);
	marioSetup(); /* load mario */
	set_sprite_data(9, 1, enemy); /* load enemy */
	enemySetup();
	
	set_bkg_data(0, 2, tile); /* load tiles for map */
	set_bkg_tiles(0, 0, 20, 18, map); /* load map */

	SHOW_SPRITES;
	SHOW_BKG;
	DISPLAY_ON;
	
	while(1)
	{
		marioMovement();
		enemyMovement();
	}
}
