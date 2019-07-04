/// @description Configure textbox

get_input();
//If the player is within range of the sign, there is no pre-existing textbox and the action key is pressed, run this code.
if action && (distance_to_object(obj_player) < 40) && !instance_exists(obj_textbox) {
	//Create an instance of obj_textbox under the variable name "box"
		var box = instance_create_depth(x,y,0,obj_textbox);
			//Copy the variables from the sign object to the new textbox object
			box.script = script;
			box.sound = sound;
			box.speaker = speaker;
			box.signY = y;
		//Add all the messages to the textbox's message array.
		for (var i = 0; i < array_length_1d(message); i++){
			
			box.message[i] = message[i];
		}
}