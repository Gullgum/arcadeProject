/// @description Insert description here
// You can write your code in this editor
get_input();

if (distance_to_object(obj_player) < 60) && action{
	instance_destroy();
}

if (y == yy) moveState = 0;
if (y == yy - 15) moveState = 1;

if moveState == 0{
	y -= 0.5;
}else{
	y += 0.5;
}