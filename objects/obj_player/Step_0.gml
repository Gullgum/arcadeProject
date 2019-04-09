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
if cutscene == 0 && !instance_exists(obj_fade) && !instance_exists(obj_fademenu) && !instance_exists(obj_textbox){
	script_execute(state);
}else if cutscene == 0{
	if view_camera[0] != default_cam{
		view_camera[0] = default_cam;
	}
	image_index = 0;
}

if (rKey||lKey||uKey||dKey) && stepcooldown = 0{
	audio_sound_pitch(stepsound, random_range(0.8,1.5));
	audio_play_sound(stepsound,5,false);
	stepcooldown = 1;
	if spd = 20{
		alarm[0] = 7.5;
	}else{
		alarm[0] = 15;
	}
}