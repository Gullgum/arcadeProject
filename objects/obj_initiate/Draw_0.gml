/// @description Insert description here
// You can write your code in this editor
get_input();

if room == room0{
	if ((keyboard_check_pressed(ord("X"))) || action) fademenu(rm_ctrl,c_black,0.02);
	
	var text = ds_list_create();	
	ds_list_add(text,"I still believe that in the ashes of the \nold days, we will create a brighter world.")
	draw_set_halign(fa_center);
	draw_set_font(font0);
	draw_set_color(c_white);
	if can_alarm_0 == 1{
		alarm[0] = 250;
		can_alarm_0 = 0;
	}
	if can_start_text == 1{
		var starttext = ds_list_create();
		ds_list_add(starttext,"Press 'Z' to start");
		draw_set_font(fnt_startsmall);
	    can_start_text = 1;
		draw_text(512,600,"Press 'Z' to start");
	}
}

if room == rm_menu{
	draw_set_color(c_black);
	draw_set_alpha(0.3);
	draw_rectangle(300,90,730,580,0);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_font(fnt_title);
	draw_text(512,110,"Seven")
	draw_set_font(fnt_med);
	if gy == 1 draw_set_colour(c_yellow) else draw_set_colour(c_white);
	draw_text(512, 290, "New Game");
	if gy == 2{
		draw_set_colour(c_yellow)
	}else{
		if !file_exists("save_0.dat"){
			draw_set_colour($b6b7ba);
		}else{
			draw_set_colour(c_white);
		}
	}
	draw_text(512, 360, "Continue");
	if gy == 3 draw_set_colour(c_yellow) else draw_set_colour(c_white);
	draw_text(512, 430, "Controls");
}

if room == rm_ctrl{
	
	draw_set_color(c_white);
	draw_set_font(fnt_med);
	draw_set_halign(fa_left);
	//draw_text(120,50,"Controls \n------------------------------------ \nUse arrow keys to move\nZ - Interact with objects, Select, \n      Progress dialogue\nX - Cancel, Go back, Skip dialogue text, \n		       Run (hold)\nC - Open/close menu\nPress F4 to toggle fullscreen mode\n------------------------------------\n\nPress X to return to menu");
	if skipKey {
		fademenu(rm_menu,c_black,0.1);	
	}
}