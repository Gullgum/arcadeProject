/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
get_input();



if room == room0{
	var faces = ds_list_create();
	ds_list_add(faces,0);
	var speakers = ds_list_create();
	ds_list_add(speakers,0);
	var sounds = ds_list_create();
	ds_list_add(sounds,0);
	var text = ds_list_create();	
	ds_list_add(text,"I still believe that in the ashes of the \nold days, we will create a brighter world.")
	if ((keyboard_check_pressed(ord("X"))) || action)  fademenu(rm_ctrl,c_black,0.02);
	var key_advance = 0;
	var key_skip = 0;
	draw_set_halign(fa_center);
	draw_set_font(font0);
	draw_set_color(c_white);
	draw_text_scrolling(512,250,text,40,1024,0.3,8,key_advance,key_skip,faces,speakers,sounds,false);
	if can_alarm_0 == 1{
		alarm[0] = 270;
		can_alarm_0 = 0;
	}
	if can_start_text == 1{
		var starttext = ds_list_create();
		var key_skip2 = undefined;
		ds_list_add(starttext,"Press 'Z' to start");
		draw_set_font(fnt_startsmall);
		draw_text_scrolling(512,600,starttext,20,1024,0.3,5,key_advance,key_skip2,faces,speakers,sounds,false);
	    can_start_text = 1;
		//draw_text(512,600,"Press 'Z' to start");
	}
}

if room == rm_menu{
	
	draw_set_color(c_black);
	draw_set_alpha(0.6);
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
	draw_text(120,50,"Controls \n------------------------------------ \nUse arrow keys to move\nZ - Action key \n      \nX - Cancel, Skip, Run(hold) \n\nC - Open/close menu\nPress F4 to toggle fullscreen mode\n------------------------------------\n\nPress Z to go to menu");
	if skipKey || action {
		fademenu(rm_menu,c_black,0.1);	
	}
}

if room == rm_gameover{
	draw_set_alpha(drawAlpha);
	drawAlpha = min(drawAlpha+0.008,1);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_font(fnt_title);
	draw_text(512,200,"Game Over");
	draw_set_font(fnt_startsmall);
	draw_text(512,500,"Press Z to restart");
	if (action)
		game_restart();
}