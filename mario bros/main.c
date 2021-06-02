#include <stdio.h>
#include <gb/gb.h>
#include "sprites.c"
#include "graphics/mario.c"
#include "graphics/tile.c"

void main() 
{
	int state = 0;
	if(state == 0)
	{
		printf("     mario bros.\n\n\n\n\n");
		printf("     press start");
		state++;
	}	
	while(1) if(joypad() & J_START) break;
	
	set_sprite_data(0, 9, player);
	marioSetup(); /* load mario */
	
	set_bkg_data(0, 2, tile); /* load tiles for map */
	set_bkg_tiles(0, 0, 20, 18, map); /* load map */
		
	SHOW_SPRITES;
	SHOW_BKG;
	DISPLAY_ON;
	marioMovement();
}
