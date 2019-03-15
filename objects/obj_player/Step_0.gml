/// @description Every frame
// You can write your code in this editor
get_input();
depth = -y;
//fullscreen
if room != rm_1{
	if keyboard_check_pressed(vk_f4){
		var full = window_get_fullscreen();
		switch (full){
			case 1: window_set_fullscreen(0); break;
			case 0: window_set_fullscreen(1); break;
		}
	}
}
//Movement
if !instance_exists(obj_fade) && !instance_exists(obj_fademenu) && !instance_exists(obj_textbox){
	script_execute(state);
}else{
	image_index = 0;
}

