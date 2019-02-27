/// @description Insert description here
// You can write your code in this editor
var key_advance = keyboard_check_pressed(vk_space);
var key_skip = undefined;

var text = ds_list_create();	
ds_list_add(text,"I still believe that in the ashes of the old days, \nwe will create a brighter world.")


draw_set_color(c_white);
draw_text_scrolling(0,0,text,32,1024,0.4,8,key_advance,key_skip,false);