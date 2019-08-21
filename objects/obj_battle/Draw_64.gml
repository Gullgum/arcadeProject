/// @description Battle Graphics, Scripting & GUI

//Set the draw opacity to full
draw_set_alpha(1);
draw_set_halign(fa_left);
//Store the camera's height
var camH = camera_get_view_height(view_camera[0]);
var camW = camera_get_view_width(view_camera[0]);
//Empty lists for text script
var snds = ds_list_create();
var doFaces = ds_list_create();
var speakers = ds_list_create();

//Define words to display
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

//Check which menu the player is currently on and draw as appropriate
switch menu{
case "Menu":
	if defenseFade > 0{
		draw_set_alpha(defenseFade);
		draw_sprite(spr_zButton,0,336,570);
		draw_sprite(spr_xButton,0,468,570);
		draw_sprite(spr_cButton,0,600,570);
		defenseFade -= 0.05
	}
	draw_set_alpha(1);
	//Bring in the top and bottom borders
	draw_set_color(c_black);
	draw_rectangle(0,rectH,1024,768,0);
	draw_set_color(c_white);
	draw_rectangle(-1,rectH,1024,768,1)
	var maxHeight = 5*camH/6;
	rectH = max(rectH - 2.5,maxHeight);
	
	draw_set_color(c_black);
	draw_rectangle(0,0,1024,topRectH,0);
	var topMaxHeight = camH/6;
	topRectH = min(topRectH+2.5,topMaxHeight);
	
	//If the borders are at full height, draw text
	if rectH = (maxHeight){
		draw_set_color(c_white);
		draw_set_font(fnt_battle);
	
		var textColour;
		if instance_exists(obj_battletext) textColour = c_white;
		else textColour = c_yellow;
		//Set text to yellow if the player has that option selected
		if (gx == 1) draw_set_color(textColour) else draw_set_color(c_white);
			draw_text_scrolling(70,685,txtAtk,10,100,0.2,1,0,0,doFaces,speakers,snds,0);
		if (gx == 2) draw_set_color(textColour) else draw_set_color($b6b7ba);
			draw_text_scrolling(270,685,txtMagic,10,100,0.2,1,0,0,doFaces,speakers,snds,0);
		if (gx == 3) draw_set_color(textColour) else draw_set_color(c_white);
			draw_text_scrolling(470,685,txtDefend,10,100,0.2,1,0,0,doFaces,speakers,snds,0);
		if (gx == 4) draw_set_color(textColour) else draw_set_color(c_white);
			draw_text_scrolling(670,685,txtItem,10,100,0.2,1,0,0,doFaces,speakers,snds,0);
		if (gx == 5) draw_set_color(textColour) else draw_set_color(c_white);
			draw_text_scrolling(870,685,txtFlee,10,100,0.2,1,0,0,doFaces,speakers,snds,0);
	//Switch menus when Z is pressed
	if !instance_exists(obj_battletext){
		//If "Attack" is selected
		if (gx == 1 && action) menu = "Attack";
		//If "Flee" is selected
		if (gx == 5 && action){
			escaped = 0;
			fleeCheckFinished = 0;
			//Check if player successfully escaped
			if random(1) <= target.escapeChance{
				escaped = 1;
			}
			menu = "Flee";
		}
		//If "Defend" is selected
		if (gx == 3 && action){
			defenseFade = 0;
			global.defendTimer = 120;
			atkFinished = 0;
			menu = "Defend";
			prevHp = obj_player.hp;
			perfect = 0;
			//Fade the background to darkness
			instance_destroy(obj_backdrop);
			instance_create_layer(0,0,"Backdrop",obj_backdrop);
		}	
	}
	
}
break;

case "Attack":
	//Shrink the top and bottom borders
	draw_set_color(c_black);
	draw_rectangle(0,rectH,1024,768,0);
	draw_set_color(c_white);
	draw_rectangle(-1,rectH,1024,768,1)
	var maxHeight = 5*camH/6;
	rectH = min(rectH + 5,769);

	draw_set_color(c_black);
	draw_rectangle(0,0,1024,topRectH,0);
	var topMaxHeight = camH/6;
	topRectH = max(topRectH-5,-1);
	//Create the attack slider
	if !instance_exists(obj_attackslide){
		instance_create_depth(obj_player.x + 100, obj_player.y - 270, -10, obj_slider);
		instance_create_depth(obj_player.x + 85,obj_player.y - 267,-120,obj_attackslide);
		obj_attackslide.spd = sliderSpeed;

	}
	//Change slider direction when it reaches the end of the bar
	if (obj_attackslide.y >= obj_slider.y + 359) dir = -1;
	else if (obj_attackslide.y <= obj_slider.y) dir = 1;
	//Attack
	if action && slideTimer <= 0{
		slideTimer = 130;
		obj_attackslide.spd = 0;
		//Reset the yFloat variable
		yFloat = 0;
		with obj_attackslide{
			//Define the target of the attack
			var target0 = obj_battle.target;
			//If the slider is in line with the target on the y axis...
			if !place_empty(obj_battle.target.x,y,obj_enemy){
				hit = true;
				//Define variables for the shake animation
				obj_battle.shake = 15;
				obj_battle.shakeSlow = 0.5;
				//Calculate damage dealt 
				obj_battle.dmg = random_range((obj_player.atk - target0.def)*0.8,(obj_player.atk - target0.def)*1.1);
				obj_battle.target.hp -= obj_battle.dmg;
			}else{
				hit = false;
			}
		}
	}
	
	if obj_attackslide.hit = true{
		if shakeSpeed == 0{
			//Alternate between moving to and from the original position
			if shakeState == 0{
				//Move on the x axis
				target.x += floor(shake)*shakeAxis;
				//Change direction
				shakeAxis = -shakeAxis;
				//Reduce distance to move
				shake = max(0,shake-shakeSlow);
				shakeState = 1;
			}else{
				//Move back to original position
				target.x = target.xx;
				shakeState = 0;
			}
			//Define how many frames should pass between each movement
			shakeSpeed = 1;
		}
		//Return to original position when shaking animation is finished
		if (shake == 0) target.x = target.xx;
		//Define position for Damage Indicators
		var indicatorX = target.xx;
		var indicatorY = target.y - target.sprite_height;
		draw_set_font(fnt_med);
		draw_set_color(c_red);
		//Draw Damage Indicators
		draw_text(indicatorX,indicatorY-yFloat,string(round(dmg*10)));
		//Reduce indicator Y position
		yFloat += 0.3;
		shakeSpeed--;
	}else if obj_attackslide.hit = false{
		//Define position for Damage Indicators
		var indicatorX = target.xx;
		var indicatorY = target.y - target.sprite_height;
		draw_set_font(fnt_med);
		draw_set_color(c_gray);
		//Draw "Miss" text
		draw_text(indicatorX,indicatorY-yFloat,"Miss");
		yFloat += 0.3;
	}
		
	slideTimer--;
	//Destroy damage slider and return to menu
	if slideTimer == 1{
		instance_destroy(obj_attackslide);
		instance_destroy(obj_slider);
		//If in tutorial at a certain step..
		if target == inst_7892FE32 && (obj_dummy.tutorialProgress == 1  || obj_dummy.tutorialProgress == 2 || obj_dummy.tutorialProgress == 3){
			//Trigger the next tutorial stage
			target.waiting = 0;
		}
		if (target == inst_7892FE32) && (obj_dummy.tutorialProgress == 1)
			menu = "Menu";
		else{
			defenseFade = 0;
			global.defendTimer = 120;
			atkFinished = 0;
			menu = "Defend";
			prevHp = obj_player.hp;
			perfect = 0;
			//Fade the background to darkness
			instance_destroy(obj_backdrop);
			instance_create_layer(0,0,"Backdrop",obj_backdrop);
		}
	}
	
break;

case "Defend":
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(0,rectH,1024,768,0);
	draw_set_color(c_white);
	draw_rectangle(-1,rectH,1024,768,1)
	var maxHeight = 5*camH/6;
	if global.defendTimer > 0{
		rectH = min(rectH + 5,769);
	}else{
		rectH = max(rectH - 2.5,maxHeight);
	}
	draw_set_color(c_black);
	draw_rectangle(0,0,1024,topRectH,0);
	var topMaxHeight = camH/6;
	if global.defendTimer > 0{
		topRectH = max(topRectH - 5, -1)
	}else{
		topRectH = min(topRectH + 2.5,topMaxHeight);
	}
	//Draw the defense GUI
	draw_set_alpha(defenseFade);
	
	if keyboard_check(ord("Z")) var zState = 1;
	else var zState = 0;
	
	if keyboard_check(ord("X")) var xState = 1;
	else var xState = 0;
	
	if keyboard_check(ord("C")) var cState = 1;
	else var cState = 0;
	
	draw_sprite(spr_zButton,zState,336,570);
	draw_sprite(spr_xButton,xState,468,570);
	draw_sprite(spr_cButton,cState,600,570);
	if !instance_exists(obj_defense_thing){
		var def1 = instance_create_depth(380,500,0,obj_defense_thing);
		var def2 = instance_create_depth(512,500,0,obj_defense_thing);
		var def3 = instance_create_depth(644,500,0,obj_defense_thing);
		obj_defense_thing.x1 = def1.x;
		obj_defense_thing.x2 = def2.x;
		obj_defense_thing.x3 = def3.x;
	}
	
	draw_set_color(c_red);
	draw_rectangle(camW/2 - 75,camH-65,camW/2 + 75,camH-90,0);
	draw_set_color(c_green);
	var bar = max((((camW/2)-75) + (150*(obj_player.hp/obj_player.maxHp))),camW/2 - 75)
	draw_rectangle(camW/2 - 75,camH-65,bar,camH-90,0);
	
//	obj_defense_thing.image_alpha = defenseFade;
	defenseFade = min(defenseFade+0.02,1)
	
	draw_set_alpha(1);
	if obj_defense_thing.barAlpha >= 1{
		var script = target.attack;
		//Put this somewhere else prevHp = obj_player.hp;
		script_execute(script);

	}
	if global.defendTimer > 0 && atkFinished == 1{
		if (prevHp == obj_player.hp  && perfect == 0){
			if prevHp != obj_player.maxHp
				obj_player.hp = min(obj_player.maxHp,obj_player.hp+1);
			perfect = 1;
			yFloat = 0;
		}
		
		if perfect == 1{
			draw_set_color(c_yellow);
			draw_set_alpha(1);
			draw_set_halign(fa_center);
			var xPos = 512;
			var yPos = camH-170+yFloat;
			//The outline
			draw_text_outline(xPos,yPos,"Perfect!",c_black,c_yellow,1);
			yFloat -= 0.5;
		}
		global.defendTimer--;
	}
	if global.defendTimer <= 0{
		if (instance_exists(obj_backdrop))
			obj_backdrop.imgAlpha -= 0.02;
		defenseFade -= 0.05;
		if target == inst_7892FE32 && (obj_dummy.tutorialProgress == 2){
			target.waiting = 0;
		}
		if (obj_defense_thing.image_alpha <= 0) && (atkFinished == 1){
			menu = "Menu";
			target.attackDelay = 0;
		}
	}
break;

case "Flee":
	draw_set_color(c_black);
	draw_rectangle(0,rectH,1024,768,0);
	draw_set_color(c_white);
	draw_rectangle(-1,rectH,1024,768,1)
	
	draw_set_color(c_black);
	draw_rectangle(0,0,1024,topRectH,0);
	var topMaxHeight = camH/6;
	topRectH = min(topRectH+2.5,topMaxHeight);
	
	var fleeTxt =  ds_list_create();
	ds_list_add(fleeTxt,"Attempting to flee...");
	if escaped == 1{
		ds_list_add(fleeTxt,"You got away!");
	}else if escaped == 0{
		ds_list_add(fleeTxt,"Couldn't escape!");
	}
	draw_set_color(c_white);
	if (fleeCheckFinished == 0)
		draw_text_scrolling(70,685,fleeTxt,30,500,0.5,12,action,0,doFaces,speakers,snds,set_fleeCheck);
	if fleeCheckFinished == 1{
		if escaped == 0{
			menu = "Menu";
		}else if escaped == 1{
			obj_player.exitBattle = 1;
		}
	}
	break;
}