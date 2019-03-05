/// move_state
// Get Direction
dir = point_direction(0, 0, xaxis, yaxis);
// Get Length
if (xaxis == 0) && (yaxis == 0) {
	len = 0
}else{
	len = spd;
	get_face();
}

// Get the speed variable
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Horizontal Collisions
if (place_meeting(x+hspd, y, obj_wall)){
	while(!place_meeting(x+sign(hspd), y, obj_wall)) {
		x += sign(hspd);
	}
	hspd = 0;
	image_speed = 0;
	image_index = 0;
}

x += hspd;

// V Collisions

if (place_meeting(x, y+vspd, obj_wall)){
	while(!place_meeting(x, y+sign(vspd), obj_wall)) {
		y += sign(vspd);
	}
	vspd = 0;
	image_speed = 0;
	image_index = 0;
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
image_speed = 1.5;
if (len == 0) {
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