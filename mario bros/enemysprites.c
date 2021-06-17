
/* used for turtle, crab, fly and ice */
struct Enemy
{
	UINT8 x;
	UINT8 y;
}

struct Enemy turtle[3]; /* turtle object */

void moveEnemy(UINT8 x, UINT8 y)
{
	move_sprite(9, x, y);
}

void enemySetup()
{
	turtle[1].x = 0, turtle[1].y = 24;
	turtle[2].x = 100, turtle[2].y = 100;
	turtle[3].x = 20, turtle[3].y = 24;
	
	set_sprite_tile(9, 9);
	set_sprite_tile(10, 9);
	set_sprite_tile(11, 9);
	
	moveEnemy(turtle[1].x, turtle[1].y);
	move_sprite(10, turtle[2].x, turtle[2].y);
	move_sprite(11, turtle[3].x, turtle[3].y);
}

/* enemy movement pattern */
void enemyMovement()
{
	/* collision */
	if(canEntityMove(turtle[1].x, turtle[1].y-8, 0x26))
	{
		turtle[1].y++; /* gravity */
		moveEnemy(turtle[1].x, turtle[1].y);
	}
	
	/* screen wrap */
	if(turtle[1].x <= 0)
	{
		turtle[1].x = 160;
	} else if(turtle[1].x >= 160)
	{
		turtle[1].x = 0;
	}
	
	/* pipes */
	if(canEntityMove(turtle[1].x, turtle[1].y-16, 0x29))
	{
		turtle[1].x = 0;
		turtle[1].y = 24;
	}
	
	turtle[1].x++;
	moveEnemy(turtle[1].x, turtle[1].y);
}