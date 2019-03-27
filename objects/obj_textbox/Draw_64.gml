/// @description Insert description here
// You can write your code in this editor
get_input();

var text = ds_list_create();
for (var i = 0; i < array_length_1d(message); i++){
	ds_list_add(text, message[i]);
}

if obj_player.y > signY {
	textboxY = 30;
}else textboxY = 575;
draw_set_color($bdc6c6);
draw_roundrect(95,textboxY,930,textboxY + 160,0); 
draw_set_color(c_black);
draw_roundrect(95,textboxY,930,textboxY+160,1);
draw_roundrect(99,textboxY + 4,926,textboxY + 156,1) 
draw_set_color($4f336b);
draw_roundrect(100,textboxY + 5,925,textboxY + 155,0);
draw_set_color(c_white);
draw_set_font(fnt_text);
draw_set_halign(fa_left);
var key_advance = action;
var key_skip = skipKey;
draw_text_scrolling(130, textboxY + 20,text,40,770,1,6,key_advance,key_skip,script);