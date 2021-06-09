#include "graphics/map.c"

struct Character
{
	UBYTE spritids[9];
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
} mario;

/* move mario */
void moveMario(struct Character *character, UINT8 x, UINT8 y)
{
	move_sprite(character->spritids[0], x, y);
	move_sprite(character->spritids[1], x + 8, y);
	move_sprite(character->spritids[2], x + 16, y);
	move_sprite(character->spritids[3], x, y + 8);
	move_sprite(character->spritids[4], x + 8, y + 8);
	move_sprite(character->spritids[5], x + 16, y + 8);
	move_sprite(character->spritids[6], x, y + 16);
	move_sprite(character->spritids[7], x + 8, y + 16);
	move_sprite(character->spritids[8], x + 16, y + 16);
}

void marioSetup()
{
	mario.x = 35;
	mario.y = 128;
	mario.width = 24;
	mario.height = 24;
	
	set_sprite_tile(0, 0);
	mario.spritids[0] = 0;
	set_sprite_tile(1, 1);
	mario.spritids[1] = 1;
	set_sprite_tile(2, 2);
	mario.spritids[2] = 2;
	set_sprite_tile(3, 3);
	mario.spritids[3] = 3;
	set_sprite_tile(4, 4);
	mario.spritids[4] = 4;
	set_sprite_tile(5, 5);
	mario.spritids[5] = 5;
	set_sprite_tile(6, 6);
	mario.spritids[6] = 6;
	set_sprite_tile(7, 7);
	mario.spritids[7] = 7;
	set_sprite_tile(8, 8);
	mario.spritids[8] = 8;
	
	moveMario(&mario, mario.x, mario.y); /* move mario */
}

/* collision */
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

/* mario controls */
void marioMovement()
{
	/* move left */
	if(joypad() & J_LEFT)
	{
		if(canEntityMove(mario.x-8, mario.y, 0x20))
		{
			mario.x -= 1;
			moveMario(&mario, mario.x, mario.y);
		}
	}
		
	/* move right */
	if(joypad() & J_RIGHT)
	{
		if(canEntityMove(mario.x+8, mario.y, 0x20))
		{
			mario.x += 1;
			moveMario(&mario, mario.x, mario.y);
		}
	}
		
	/* jump */
	if(joypad() & J_B)
	{
		if(canEntityMove(mario.x, mario.y-8, 0x20))
		{
			mario.y -= 5;
			moveMario(&mario, mario.x, mario.y);
		}
	}
		
	/* screen wrap */
	if(mario.x <= 0)
	{
		mario.x = 160;
	} else if(mario.x >= 160)
	{
		mario.x = 0;
	}
		
	/* gravity */
	if(canEntityMove(mario.x, mario.y+8, 0x20))
	{
		mario.y += 2;
		moveMario(&mario, mario.x, mario.y);
	}
	delay(10);
}