/// @description Insert description here
// You can write your code in this editor
if room == room0{
	if (keyboard_check(ord("Z")) || keyboard_check(ord("X"))) gotomenu();
	var key_advance = keyboard_check_pressed(ord("Z"));
	var key_skip = undefined;

	var text = ds_list_create();	
	ds_list_add(text,"I still believe that in the ashes of the \nold days, we will create a brighter world.")
	draw_set_halign(fa_center);
	draw_set_font(font0);
	draw_set_color(c_white);
	draw_text_scroll_no_del(512,250,text,40,1024,0.5,8,key_advance,key_skip,drawself);
	if can_alarm_0 == 1{
		alarm[0] = 270;
		can_alarm_0 = 0;
	}
	if can_start_text == 1{
		var starttext = ds_list_create();
		var key_skip2 = undefined;
		ds_list_add(starttext,"Press 'Z' to start");
		draw_set_font(fnt_startsmall);
		draw_text_scroll_no_del(512,600,starttext,20,1024,0.3,5,key_advance,key_skip2,gotomenu);
	    can_start_text = 1;
		draw_text(512,600,"Press 'Z' to start");
	}
}

if room == rm_menu{
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_font(fnt_title);
	draw_text(512,110,"Seven")
	draw_set_font(fnt_med);
	draw_text(512, 290, "New Game")
}