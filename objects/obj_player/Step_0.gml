/// @description Every frame
// You can write your code in this editor
get_input();
depth = -y;
//Return to menu
if keyboard_check_pressed(ord("L")) {
	game_restart();
}
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
if !instance_exists(obj_battle) && cutscene == 0 && !instance_exists(obj_fade) && !instance_exists(obj_fademenu) && !instance_exists(obj_textbox){
	script_execute(state);
}

if instance_exists(obj_textbox){
	image_index = 0;
}

if (room = rm_4) && !timeline_running && (rKey||lKey||uKey||dKey) && stepcooldown = 0{
	audio_sound_pitch(stepsound, random_range(0.8,1.5));
	audio_play_sound(stepsound,5,false);
	stepcooldown = 1;
	if spd = 10{
		alarm[0] = 15;
	}else{
		alarm[0] = 30;
	}
}

if (y < 1120 && timeline_index == tml_park && timeline_running == 0) {
	y = 1121;
	speed = 0;
	timeline_position = 690;
	timeline_running = 1;
}

if instance_exists(obj_battle){
	if (x == targetPosX && y == targetPosY) || (distance_to_point(targetPosX,targetPosY) < speed){
		speed = 0;
		image_speed = 0;
		image_index = 0;
	}
}