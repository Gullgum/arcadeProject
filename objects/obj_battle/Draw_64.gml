/// @description Insert description here
// You can write your code in this editor

var camH = camera_get_view_height(view_camera[0]);
//Empty lists
var snds = ds_list_create();
var doFaces = ds_list_create();
var speakers = ds_list_create();

var txtAtk = ds_list_create();
ds_list_add(txtAtk,"Attack");
var txtDefend = ds_list_create();
ds_list_add(txtDefend,"Defend");
var txtItem = ds_list_create();
ds_list_add(txtItem, "Item");
var txtFlee = ds_list_create();
ds_list_add(txtFlee, "Flee");
var txtMagic = ds_list_create();
ds_list_add(txtMagic, "Special");

switch menu{
case "Menu":
draw_set_color(c_black);
draw_rectangle(0,rectH,1024,768,0);
draw_set_color(c_white);
draw_rectangle(-1,rectH,1024,768,1)
var maxHeight = 5*camH/6;
rectH = max(rectH - 2.5,maxHeight);



if rectH = (maxHeight){
	draw_set_color(c_white);
	draw_set_font(fnt_battle);

	
	if (gx == 1) draw_set_color(c_yellow) else draw_set_color(c_white);
	draw_text_scrolling(70,685,txtAtk,10,100,0.2,1,0,0,doFaces,speakers,snds,0);
	if (gx == 2) draw_set_color(c_yellow) else draw_set_color($b6b7ba);
	draw_text_scrolling(270,685,txtMagic,10,100,0.2,1,0,0,doFaces,speakers,snds,0);
	if (gx == 3) draw_set_color(c_yellow) else draw_set_color(c_white);
	draw_text_scrolling(470,685,txtDefend,10,100,0.2,1,0,0,doFaces,speakers,snds,0);
	if (gx == 4) draw_set_color(c_yellow) else draw_set_color(c_white);
	draw_text_scrolling(670,685,txtItem,10,100,0.2,1,0,0,doFaces,speakers,snds,0);
	if (gx == 5) draw_set_color(c_yellow) else draw_set_color(c_white);
	draw_text_scrolling(870,685,txtFlee,10,100,0.2,1,0,0,doFaces,speakers,snds,0);

	if (gx == 1 && action) menu = "Attack";
	if (gx == 5 && action){
		escaped = 0;
		fleeCheck = 0;
		if random(1) <= target.escapeChance{
			escaped = 1;
		}
		menu = "Flee";
	}
	
}
break;

case "Attack":
	rectH = 769;
	if !instance_exists(obj_attackslide){
		instance_create_depth(obj_player.x + 100, obj_player.y - 270, -10, obj_slider);
		instance_create_depth(obj_player.x + 85,obj_player.y - 267,-120,obj_attackslide);
		obj_attackslide.spd = sliderSpeed;

	}
	
	if (obj_attackslide.y >= obj_slider.y + 359) dir = -1;
	else if (obj_attackslide.y <= obj_slider.y) dir = 1;
	if action && slideTimer <= 0{
		slideTimer = 90;
		obj_attackslide.spd = 0;
	}
	slideTimer--;
	if slideTimer == 1{
		instance_destroy(obj_attackslide);
		instance_destroy(obj_slider);
		menu = "Menu";
	}
		

break;
case "Flee":
	draw_set_color(c_black);
	draw_rectangle(0,rectH,1024,768,0);
	draw_set_color(c_white);
	draw_rectangle(-1,rectH,1024,768,1)
	
	var fleeTxt =  ds_list_create();
	ds_list_add(fleeTxt,"Attempting to flee...");
	if escaped == 1{
		ds_list_add(fleeTxt,"You got away!");
	}else if escaped == 0{
		ds_list_add(fleeTxt,"Couldn't escape!");
	}
	draw_set_color(c_white);
	if (fleeCheck == 0)
		draw_text_scrolling(70,685,fleeTxt,30,500,0.5,12,action,0,doFaces,speakers,snds,set_fleeCheck);
	if fleeCheck == 1{
		if escaped == 0{
			menu = "Menu";
		}else if escaped == 1{
			rectH = min(rectH+4,769);
			if rectH >= 769{
				instance_destroy(self);
			}
		}
	}

	break;
}