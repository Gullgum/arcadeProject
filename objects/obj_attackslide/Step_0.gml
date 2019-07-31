/// @description Insert description here
// You can write your code in this editor
y += spd*dir;
if (obj_attackslide.y >= obj_slider.y + 359) dir = -1;
else if (obj_attackslide.y <= obj_slider.y) dir = 1;