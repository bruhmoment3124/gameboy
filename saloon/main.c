#include <gb/gb.h>
#include "graphics/map/tiles.c"
#include "graphics/map/map.c"
#include "graphics/sprites/player.c"

struct player
{
	UINT8 x;
	UINT8 y;
} plyr;

UBYTE canEntityMove(UINT8 newx, UINT8 newy, const char blankmap)
{
	UINT16 indexTlx, indexTly, tileindexTL;
	UBYTE result;
	
	indexTlx = (newx) / 8;
	indexTly = (newy) / 8;
	tileindexTL = 20 * indexTly + indexTlx;
	
	result = map[tileindexTL] == blankmap;
	return result;
}

void main()
{
	set_bkg_data(0, 21, tiles); /* load tileset */
	set_bkg_tiles(0, 0, 20, 18, map); /* load map */
	
	plyr.x = 45, plyr.y = 45;
	set_sprite_data(0, 3, player);
	set_sprite_tile(0, 0);
	move_sprite(0, plyr.x, plyr.y);
	
	SHOW_BKG;
	SHOW_SPRITES;
	
	while(1)
	{
		if(joypad() & J_UP)
		{
			if(canEntityMove(plyr.x, plyr.y-16, 0x00))
			{
				plyr.y--; 
				move_sprite(0, plyr.x, plyr.y);
			}
		}
		
		if(joypad() & J_DOWN)
		{
			if(canEntityMove(plyr.x, plyr.y-8, 0x00))
			{
				plyr.y++;
				move_sprite(0, plyr.x, plyr.y);
			}
		}
		
		if(joypad() & J_LEFT)
		{
			if(canEntityMove(plyr.x-8, plyr.y-8, 0x00))
			{
				plyr.x--;
				move_sprite(0, plyr.x, plyr.y);
				set_sprite_prop(0, S_PRIORITY);
			}
		}
		
		if(joypad() & J_RIGHT)
		{
			if(canEntityMove(plyr.x, plyr.y-8, 0x00))
			{
				plyr.x++;
				move_sprite(0, plyr.x, plyr.y);
				set_sprite_prop(0, S_FLIPX);
			}
		}
		delay(20);
	}
}