/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(barAlpha);
draw_set_color(c_black);
draw_rectangle(x-15,y,x+15,0,0);
draw_set_color(c_white);	
draw_rectangle(x-10,y,x+10,0,0);
draw_set_alpha(1);

if image_alpha > 0.60 && global.defendTimer > 0{
	barAlpha = min(barAlpha+0.025,1);
}

if global.defendTimer <= 0{
	barAlpha = max(barAlpha-0.02,0);
}





//16
//26