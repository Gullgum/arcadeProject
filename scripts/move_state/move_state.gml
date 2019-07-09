/// move_stat;
/*This script is not mine, but is not copyrighted. I still don't entirely understand what it all means
  but I have a pret ty goodidea of how it works.*/
// Get Direction
//Max speed will be determined by whether the player is holding X (run) or not. 
//Player will accelerate if not already at top speed. 
if keyboard_check(ord("X")) {
	spd = min(len+1.5,20);
}else{
	spd = min(len + 1.5,10);
}
//Hold the direction value (dir) from the previous frame in a local variable.
var dirPrev = dir;
//Get the direction, in degrees, of the player by using their keyboard inputs.
dir = point_direction(0, 0, xaxis, yaxis);
// Get Length (will be used to determine final speed)
//If no input is available, decelerate the player until they stop.
if (xaxis == 0) && (yaxis == 0) {
	//Set the current dir value to the previous frame's. This keeps them going in the right direction while they slow.
	dir = dirPrev;
	//Reduce player's speed.
	len = (max(len-3,0));

}else{
	//If input is detected, length == speed.
	len = spd;
	//Gets the appropriate sprite index from a script.
	get_face();

}


// Get the speed variables for each axis
/*This is done by using the player's movement direction and distance to move (as set prior with the len variable)
to work out how far to move on each axis.*/
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Horizontal Collisions
//If the player is going to meet a wall object in the next frame...
if (place_meeting(x+hspd, y, obj_wall)){
	/*...Use a while loop to determine how much the player should move instead of the normal value, 
	using increments of 1 or -1 according to their directon.*/
	while(!place_meeting(x+sign(hspd), y, obj_wall)) {
		x += sign(hspd);
	}
	//Set the horizontal speed to 0
	hspd = 0;
	//If the player is not moving on the y axis, stop the movement animations.
	if vspd = 0{
		image_speed = 0;
		image_index = 0;
	}
}

//Move on the x axis
x += hspd;

// V Collisions
//This is the same as the horizontal collisons, but vertical.
if (place_meeting(x, y+vspd, obj_wall)){
	while(!place_meeting(x, y+sign(vspd), obj_wall)) {
		y += sign(vspd);
	}
	vspd = 0;
	if hspd = 0 {
		image_speed = 0;
		image_index = 0;
	}
}

y += vspd;

/// Check for battle encounter
/*
if (len == spd) {
	var rng = irandom(steps);
	if (rng == steps) && (steps <= 5) {
		fadeout(rm_battle, c_white, 0.025,x,y);
		steps = 2000;
	} else {
		steps -= 1;
	}
}*/

/// Sprites
image_speed = (spd / 5);
//If the player is not moving and there is no cutscene playing, return to the first frame of animation.
if (len == 0) && cutscene == 0 {
	image_index = 0;
}

// Get Direction
switch(face) {
	case 0:
		sprite_index = RIGHT;
		break;
	case 1:
		sprite_index = UP;
		break;
	case 2:
		sprite_index = LEFT;
		break;
	case 3:
		sprite_index = DOWN;
		break;
}