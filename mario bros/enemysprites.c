
/* used for turtle, crab, fly and ice */
struct Enemy
{
	UINT8 x;
	UINT8 y;
}

struct Enemy turtle; /* turtle object */

void moveEnemy(UINT8 x, UINT8 y)
{
	move_sprite(9, x, y);
}

void enemySetup()
{
	turtle.x = 25, turtle.y = 24;
	set_sprite_tile(9, 9);
	moveEnemy(turtle.x, turtle.y);
}

/* enemy movement pattern */
void enemyMovement()
{
	/* collision */
	if(canEntityMove(turtle.x, turtle.y-8))
	{
		turtle.y++; /* gravity */
		moveEnemy(turtle.x, turtle.y);
	}
	
	/* screen wrap */
	if(turtle.x <= 0)
	{
		turtle.x = 160;
	} else if(turtle.x >= 160)
	{
		turtle.x = 0;
	}
	
	turtle.x++;
	moveEnemy(turtle.x, turtle.y);
}