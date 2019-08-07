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

if distance_to_point(camW-100,obj_player.targetPosY) < speed{
	speed = 0;
	xx = x;
}