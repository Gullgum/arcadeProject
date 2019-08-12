/// @description Menu selection

get_input();

if !instance_exists(obj_battletext){
	if keyboard_check_pressed(vk_right) && gx < 5{
		gx++;
	}
	if keyboard_check_pressed(vk_left) && gx > 1{
		gx--;

	}
}