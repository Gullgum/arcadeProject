/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_alpha(imgAlpha);
draw_rectangle(0,0,1024,768,0);

if (obj_battle.menu = "Defend")
	imgAlpha = min(imgAlpha+0.02,0.6);
else 
    imgAlpha = max(imgAlpha-0.02,-0.2);
	
draw_set_alpha(1);
 
