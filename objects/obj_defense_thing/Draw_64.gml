/// @description Insert description here
// You can write your code in this editor
var alpha = obj_battle.defenseFade;

if (image_alpha <= 0) instance_destroy();
draw_set_alpha(image_alpha);
draw_self();

