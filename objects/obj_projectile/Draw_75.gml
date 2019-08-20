/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(1);
draw_self();

if (y > 530){
	draw_set_colour(c_red);
	draw_text(x-30,yFloat+440,"Miss");
	yFloat -= 1;
	if dmgDealt == 0 && obj_player.invincible == 0{
		obj_player.hp = max(obj_player.hp-obj_battle.target.atk,0);
		dmgDealt = 1;
		obj_player.invincible = 10;
	}
}