/// @description Insert description here
// You can write your code in this editor
get_input();

if keyboard_check_pressed(vk_f4){
	var full = window_get_fullscreen();
	switch (full){
		case 1: window_set_fullscreen(0); break;
		case 0: window_set_fullscreen(1); break;
	}
}

if room == rm_menu{
	if action && !instance_exists(obj_fademenu) && !instance_exists(obj_fade) {
		fademenu(room0,c_black,0.02);
	}
}