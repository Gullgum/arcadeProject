// @desc fadeout(room, fade-colour, fade-speed, x, y)
// This is for fading out to a new room in a transition
// @arg room
// @arg fade-color
// @arg fade-speed
// @arg x
// @arg y

//Create in instance of the 'fade' object, then assign variables for it based on the arguments above.
var fade = instance_create_depth(x,y, 0, obj_fade);
fade.target = argument0;
fade.image_alpha = 0
fade.fade_color = argument1;
fade.fade_speed = argument2;
fade.xx = argument3;
fade.yy = argument4;