/// @description Insert description here
// You can write your code in this editor
get_input();
depth = -y;
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var camW = camera_get_view_width(view_camera[0]);
var camH = camera_get_view_height(view_camera[0]);

if action && distance_to_object(obj_player) < 40 && !instance_exists(obj_battle){
	var battle = instance_create_depth(0,0,0,obj_battle);
	battle.target = self;
	
	with obj_player{
		targetPosY = camY + (3*camH/4);
		targetPosX = camX + 100; 
		image_speed = 0;
		image_index = 0;
		sprite_index = RIGHT;
		spd = 0;
		direction = point_direction(x,y,targetPosX,targetPosY);
		speed = distance_to_point(targetPosX,targetPosY) / 30;
	}
	direction = point_direction(x,y,camW - 100,obj_player.targetPosY);
	speed = distance_to_point(camW - 100, obj_player.targetPosY) / 30;

}

if instance_exists(obj_battle){
	if obj_battle.topRectH >= 128 && !instance_exists(obj_battletext) && waiting == 0 && tutorialProgress <= 3{
		var txt = instance_create_depth(0,0,-100,obj_battletext);
		switch tutorialProgress{
			case 0:
				txt.message = ["Alright!\nNow, let's start with a basic attack.","Select the 'Attack' button and press 'Z'","Try to align your attack with the dummy's body and press 'Z' again to hit it."];
				txt.script = tutorial_increment;
			break;	
			
			case 1:
				if hp < 15{
					txt.message[0] = "Very good! Remember, your damage will change depending on where your hit lands.";
				}else{
					txt.message[0] = "Oh, you missed.\nDon't worry, you'll get the hang of it soon!";
				}
				txt.message = [string(txt.message[0]),"Now let's try defending!\nDefending reduces the amount of damage you will take.","It's quite useful if you need to buy time.","Use the arrow keys to select 'Defend' and press 'Z'.\nDon't worry, it shouldn't hurt!","(Shouldn't? ?)","Just press the Z, X and C keys at the right time to block the attacks."];
				txt.script = tutorial_increment;
			break;
			
			case 2:
				txt.message = ["How does a dummy do THAT?!","I have no idea! Isn't it wonderful?","The item menu allows you to use any items you have.\nYou'll pick those up as you go...","...But since you don't have any, we won't bother with that.","Now, see if you can beat the dummy!"];
				txt.script = tutorial_increment;
			break;
			case 3:
				if hp <= 0{
					txt.message = ["Alright, you can stop now."];
					txt.script = tutorial_increment();
				}else{
					instance_destroy(obj_battletext);
				}
			break;
		}

	}
}
if distance_to_point(camW-100,obj_player.targetPosY) < speed{
	speed = 0;
	xx = x;
}

if hp <= 0{
	image_alpha -= 0.01;
}

if !instance_exists(obj_battle) && hp > 0 && ranAway == 1{
	var box = instance_create_depth(0,0,0,obj_textbox);
	box.message = ["Oh, you just ran away.","A valid strategy, but it won't always work.","Feel free to come back here if you ever want to practice."];
	ranAway = 0;
}

if !instance_exists(obj_battletext) && tutorialProgress == 4{
	exit_battle();
}

