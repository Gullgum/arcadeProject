/// @description
get_input();

if (distance_to_object(obj_player) < 60) && action{
	instance_destroy();
}

 
// "Floating" Animation. 
// Switch between move states when a specific point is reached
if (y == yy) moveState = 0;
if (y == yy - 15) moveState = 1;


// Move up or down according to moveState
if moveState == 0{
	y -= 0.5;
}else{
	y += 0.5;
}