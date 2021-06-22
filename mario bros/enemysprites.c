
/* used for turtle, crab, fly and ice */
struct Enemy
{
	uint8_t x;
	uint8_t y;
};

struct Enemy turtle[3]; /* turtle object */

void enemySetup()
{
	turtle[0].x = 0, turtle[0].y = 24;
	turtle[1].x = 100, turtle[1].y = 100;
	turtle[2].x = 100, turtle[2].y = 24;
	
	set_sprite_tile(9, 9);
	set_sprite_tile(10, 9);
	set_sprite_tile(11, 9);
	
	move_sprite(9, turtle[0].x, turtle[0].y);
	move_sprite(10, turtle[1].x, turtle[1].y);
	move_sprite(11, turtle[2].x, turtle[2].y);
}

/* enemy movement pattern */
void enemyMovement()
{
	for(uint8_t i=0; i<3; i++)
	{	
		/* collision */
		if(canEntityMove(turtle[i].x, turtle[i].y-8, 0x26))
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
		if(canEntityMove(turtle[i].x, turtle[i].y-16, 0x29))
		{
			turtle[i].x = 0;
			turtle[i].y = 24;
		}
	
		turtle[i].x++;
		move_sprite(9+i, turtle[i].x, turtle[i].y);
	}
}