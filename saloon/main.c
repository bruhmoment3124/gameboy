#include <stdio.h>
#include <gb/gb.h>
#include "graphics/map/tiles.c"
#include "graphics/map/map.c"
#include "playerdata.c"

void main()
{
	set_bkg_data(0, 22, tiles); /* load tileset */
	set_bkg_tiles(0, 0, 20, 18, map); /* load map */
	playerSetup();
	
	SHOW_BKG;
	SHOW_SPRITES;
	
	while(1)
	{
		playerMovement();
	}
}