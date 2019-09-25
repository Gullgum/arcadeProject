/// @description Insert description here
// You can write your code in this editor
get_input();

if action && (distance_to_object(obj_player) < 80) && !instance_exists(obj_textbox){
	global.Save = true;
	game_save("save_0.dat");
	var box = instance_create_depth(0,0,0,obj_textbox);
	box.message[0] = "Game saved!";	
}

if (y == yy) moveState = 0;
if (y == yy - 15) moveState = 1;

if moveState == 0{
	y -= 0.5;
}else{
	y += 0.5;
}