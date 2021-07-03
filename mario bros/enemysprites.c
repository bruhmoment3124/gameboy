
/* used for turtle, crab, fly and ice */
struct Enemy
{
	uint8_t x;
	uint8_t y;
};

struct Enemy turtle[3]; /* turtle object */

void enemySetup()
{
	initarand(46);
	for(uint8_t i=0; i<3; i++)
	{
		int pipe = rand() % 2;
		
		/* which pipe the turtle spawns in */
		if(pipe == 0)
		{
			turtle[i].x = 0, turtle[i].y = 24;
			set_sprite_prop(9+i, S_PRIORITY);
		} else if(pipe == 1)
		{
			turtle[i].x = 100, turtle[i].y = 24;
			set_sprite_prop(9+i, S_FLIPX);
		}
		
		set_sprite_tile(9+i, 9); /* set all turtle tiles*/
		move_sprite(9+i, turtle[i].x, turtle[i].y);
	}
}

/* enemy movement pattern */
void enemyMovement()
{
	for(uint8_t i=0; i<3; i++)
	{	
		/* collision */
		if(canEntityMove(turtle[i].x, turtle[i].y-8, 0x24))
		{
			turtle[i].y++; /* gravity */
			move_sprite(9+i, turtle[i].x, turtle[i].y);
		}
	
		/* screen wrap */
		if(turtle[i].x <= 0)
		{
			turtle[i].x = 160;
		} else if(turtle[i].x >= 160)
		{
			turtle[i].x = 0;
		}
	
		/* pipes */
		if(canEntityMove(turtle[i].x, turtle[i].y-16, 0x27))
		{
			turtle[i].x = 0;
			turtle[i].y = 24;
		}
	
		if(get_sprite_prop(9+i) == S_PRIORITY)
		{	
			turtle[i].x++;
		} else if(get_sprite_prop(9+i) == S_FLIPX)
		{
			turtle[i].x--;
		}
		move_sprite(9+i, turtle[i].x, turtle[i].y);
	}
}