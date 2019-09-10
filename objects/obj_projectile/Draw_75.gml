
draw_set_alpha(1);
draw_self();
draw_set_halign(fa_left);

if (y > 530) && blocked == 0{
	draw_set_colour(c_red);
	draw_text(x-30,yFloat+440,"Miss");
	yFloat -= 1;
	if dmgDealt == 0 && obj_player.invincible == 0{
		obj_player.hp = max(obj_player.hp-obj_battle.target.atk,0);
		dmgDealt = 1;
		obj_player.invincible = 10;
	}
}

if blocked == 1{
	draw_set_color(c_green);
	draw_text(x-30,yFloat+440,"Nice!");
	yFloat -= 1;
	spd = 0;
	image_alpha = max(0,image_alpha-0.1);
	image_xscale += 0.2;
	image_yscale += 0.2;
}