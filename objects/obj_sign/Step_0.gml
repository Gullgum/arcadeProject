/// @description Insert description here
// You can write your code in this editor
get_input();
if action && (distance_to_object(obj_player) < 40) && !instance_exists(obj_textbox) {
	var box = instance_create_depth(x,y,0,obj_textbox);
			box.script = script;
			box.doFace = doFace;
			box.sound = sound;
			box.speaker = speaker;
		
		//box.key_advance = max(keyboard_check_pressed(ord("Z")),keyboard_check_pressed(vk_enter));
		//box.key_skip = keyboard_check_pressed(ord("X"));
		box.signY = y;
		
		for (var i = 0; i < array_length_1d(message); i++){
			
			box.message[i] = message[i];
		}
}