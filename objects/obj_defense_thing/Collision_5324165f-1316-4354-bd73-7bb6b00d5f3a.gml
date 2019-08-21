/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(1);
if action{
	if place_meeting(x1,y,obj_projectile){
		other.blocked = 1;
	}
}

if skipKey{
	if place_meeting(x2,y,obj_projectile){
		other.blocked = 1;
	}
}

if menuKey{
	if place_meeting(x3,y,obj_projectile){
		other.blocked = 1;
	}
}