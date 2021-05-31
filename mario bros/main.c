#include <stdio.h>
#include <gb/gb.h>
#include "sprites.c"
#include "graphics/mario.c"
#include "graphics/tile.c"
#include "graphics/map.c"

void main() 
{
	set_sprite_data(0, 9, player);
	marioSetup(); /* load mario */
	
	set_bkg_data(0, 1, tile); /* load tiles for map */
	set_bkg_tiles(0, 0, 20, 18, map); /* load map */
	
	SHOW_SPRITES;
	SHOW_BKG;
	DISPLAY_ON;
	
	while(1)
	{
		/* move left */
		if(joypad() & J_LEFT)
		{
			mario.x -= 1;
			moveCharacter(&mario, mario.x, mario.y);
		}
		
		/* move right */
		if(joypad() & J_RIGHT)
		{
			mario.x += 1;
			moveCharacter(&mario, mario.x, mario.y);
		}
		
		/* screen wrap */
		if(mario.x <= 0)
		{
			mario.x = 160;
		} else if(mario.x >= 160)
		{
			mario.x = 0;
		}
	}
}
