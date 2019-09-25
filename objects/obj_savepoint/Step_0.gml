
get_input();

/* If the player is close to the object, the 'Z' key is pressed and the textbox object
does not exist... */
if action && (distance_to_object(obj_player) < 80) && !instance_exists(obj_textbox){
	//Save the game under the filename "save_0.dat"
	game_save("save_0.dat");
	//Notify the player that the game has been saved.
	var box = instance_create_depth(0,0,0,obj_textbox);
	box.message[0] = "Game saved!";	
}

//The same "Floating" animation as obj_exc_mark
if (y == yy) moveState = 0;
if (y == yy - 15) moveState = 1;

if moveState == 0{
	y -= 0.5;
}else{
	y += 0.5;
}