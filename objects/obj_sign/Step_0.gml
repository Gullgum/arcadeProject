/// @description Configure textbox

get_input();
//If the player is within range of the sign, there is no pre-existing textbox and the action key is pressed, run this code.
if action && (distance_to_object(obj_player) < 40) && !instance_exists(obj_textbox) {
//Find any instance of the "Exclamation Mark" object and destroy it if nearby.
/*This means if a player interacts with an object/character with an 
exclamation mark, it will be removed. */
	if instance_exists(obj_exc_mark){
		var nearExc = instance_nearest(x,y,obj_exc_mark);
		if (distance_to_object(nearExc) < 50)
			instance_destroy(nearExc);
	}
	//Create an instance of obj_textbox under the variable name "box"
		var box = instance_create_depth(x,y,0,obj_textbox);
			//Copy the variables from the sign object to the new textbox object
			box.script = script;
			box.signY = y;
		//Add all the messages and other arrays to the textbox's arrays.
		for (var i = 0; i < array_length_1d(message); i++){
			box.message[i] = message[i];
		}
		for (var i = 0; i < array_length_1d(tSound); i++){
			box.tSound[i] = tSound[i];
		}
		for (var i = 0; i < array_length_1d(speaker); i++){
			box.speaker[i] = speaker[i];
		}
		for (var i = 0; i < array_length_1d(doFace); i++){
			box.doFace[i] = doFace[i];
		}
}