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

void playerSetup()
{
	plyr.x = 140, plyr.y = 115; /* player coordinates */
	set_sprite_data(0, 3, player);
	set_sprite_tile(0, 0);
	move_sprite(0, plyr.x, plyr.y);
}

void playerMovement()
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