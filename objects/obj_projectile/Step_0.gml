get_input();
y += obj_battle.pSpeed * spd;

//May be used, may not be
var x1 = 380;
var x2 = 512;
var x3 = 644;
var nearX = 380;

//Hide/destroy projectile
if (y >= 550)
	image_alpha = max(image_alpha-0.16,0);
if (y >= 700)
	instance_destroy(self);
	
if blocked == 1 && image_alpha == 0 && animation == 0{
	alarm[0] = 30;
	animation = 1;
}


