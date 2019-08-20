/// @description Initialise Variables
//Randomise the random number generators
randomise();
//Initialise menu variables
menu = "Menu";
rectH = 768;
gx = 1;
slideTimer = 0;
target = 0;
escaped = 0;
sliderSpeed = 5;
topRectH = 0;

//Finished the flee text
fleeCheckFinished = 0;

//Timer before returning to menu
global.defendTimer = 0;
//Shake animations
shake = 0;
shakeSlow = 0;
shakeSpeed = 0;
shakeState = 0;
shakeAxis = 1;
//Init. damage 
dmg = 0;

yFloat = 0;


//Fade in the defense GUI
defenseFade = 0;
//Whether enemy has finished attack or not
atkFinished = 0;

//Projectile speed for the enemy attack
pSpeed = 5;
//Determine if can spawn a projectile attack
projSpawn = 0;