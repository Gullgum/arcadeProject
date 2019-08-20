/// @description Insert description here
// You can write your code in this editor
if action{
	if place_meeting(x1,y,obj_projectile){
		instance_destroy(other);
	}
}

if skipKey{
	if place_meeting(x2,y,obj_projectile){
		instance_destroy(other);
	}
}

if menuKey{
	if place_meeting(x3,y,obj_projectile){
		instance_destroy(other);
	}
}