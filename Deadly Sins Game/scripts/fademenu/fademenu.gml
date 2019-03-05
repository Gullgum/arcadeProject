// @desc fadeout(room, fade-colour, fade-speed)
// @arg room
// @arg fade-color
// @arg fade-speed

var fade = instance_create_depth(0,0, 0, obj_fademenu);
fade.target = argument0;
fade.image_alpha = 0
fade.fade_color = argument1;
fade.fade_speed = argument2;
