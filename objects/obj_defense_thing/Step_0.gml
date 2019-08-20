/// @description Insert description here
// You can write your code in this editor
var alpha = obj_battle.defenseFade;
get_input();

if global.defendTimer > 0{
	image_alpha = min(image_alpha+0.02,1);
}
if barAlpha < 0.5 && global.defendTimer <= 0{
	image_alpha -= 0.03;
}



	
