/// @description Insert description here
// You can write your code in this editor
if room == room0{

	var key_advance = keyboard_check_pressed(ord("Z"));
	var key_skip = undefined;

	var text = ds_list_create();	
	ds_list_add(text,"I still believe that in the ashes of the \nold days, we will create a brighter world.")
	draw_set_halign(fa_center);
	draw_set_font(font0);
	draw_set_color(c_white);
	draw_text_scrolling(512,250,text,40,1024,0.4,8,key_advance,key_skip,false);
	if can_alarm_0 == 1{
		alarm[0] = 240;
		can_alarm_0 = 0;
	}
	if can_start_text == 1{
		var starttext = ds_list_create();
		ds_list_add(starttext,"Press 'Z' to start");
		draw_set_font(fnt_startsmall);
		draw_text_scrolling(512,600,starttext,20,1024,0.3,5,key_advance,key_skip,gotomenu);
	    can_start_text = 0;
	}
}