/// @description Menu controls
get_input();

if keyboard_check_pressed(vk_f4){
	var full = window_get_fullscreen();
	switch (full){
		case 1: window_set_fullscreen(0); break;
		case 0: window_set_fullscreen(1); break;
	}
}


//If on the menu screen
if room == rm_menu{
	//If the down key is pressed and the bottom option is not selected, select the next option.
	if (dGUI && gy < 3) {
	    gy++;
		//If a save file does not exist, skip past the "Continue" option
		if !file_exists("save_0.dat") gy++;
	}
	//Opposite of the above function
	if (uGUI && gy > 1){
		gy--;
		if !file_exists("save_0.dat") gy--;
	}
	
	if action && !instance_exists(obj_fademenu) && !instance_exists(obj_fade){
		switch gy{
			case 1:
				fademenu(rm_1,c_black,0.02);
				audio_sound_gain(mus_menu,0,2000);
			break;
	
			case 2:
				game_load("save_0.dat");
			break;
	
			case 3:
				fademenu(rm_ctrl,c_black,0.1);
			break;
		}
		if !audio_is_playing(mus_menu) {
			audio_play_sound(mus_menu,1,1);
			audio_sound_gain(mus_menu,1,500);
		}
	}
}