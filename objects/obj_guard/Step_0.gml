/// @description Insert description here
// You can write your code in this editor
depth = -y;

if obj_player.timeline_index == tml_park{
	if y >= 1100 && y != 1101 && obj_player.timeline_position < 1390{
		if !place_meeting(x+speed,y,obj_guard) && direction == 270
			speed = 5;
		else
			speed = 0;
		Park_Guard_1.direction = 0;
		Park_Guard_2.direction = 180;

		y = 1101;
	}
	if (x >= 5744 && x <= 6350) && y > 1100 && obj_player.timeline_position < 1390{
		speed = 0;
		direction = 270;
	}
	if y >= 1538{
		speed = 0;
	}
}

if place_meeting(x,y,obj_wall){
	x = xprevious;
	y = yprevious;
}