/// @description Insert description here
// You can write your code in this editor

get_input();
//Add message array values to a list, which will be used in the draw_text_scrolling script
var text = ds_list_create(); //Create a list under the name of 'text'
for (var i = 0; i < array_length_1d(message); i++){ 
	//This code sequentially adds the 'message' array values to the list.
	ds_list_add(text, message[i]);
}
//Add doFace array values to a list, similar to the block above
var faces = ds_list_create();
var arrayLen = array_length_1d(doFace);
for (var i = 0; i < array_length_1d(message); i++){
	/*If the length of the 'messages' array exceeds that of the 'doFace' array (i.e. there are
	more lines of dialogue than faces defined), then the remaining spaces will be filled with whatever 
	face was defined last.*/
	if i >= (arrayLen){
		doFace[i] = doFace[arrayLen-1];
	}
//Add the array values to a list
	ds_list_add(faces, doFace[i]);
}
/*Add the dialogue "voice" sounds to a list. This follows the same logic as the code for the 'doFace'
variable above, except it's for sounds. */
var sounds = ds_list_create();
var sArrayLen = array_length_1d(tSound);
for (var j = 0; j < array_length_1d(message); j++){
	if j >= (sArrayLen){
		tSound[j] = tSound[sArrayLen-1];
	}
	ds_list_add(sounds, tSound[j]);
}

var speak = ds_list_create();
var xArrayLen = array_length_1d(speaker);
for (var j = 0; j < array_length_1d(message); j++){
	if j >= (xArrayLen){
		speaker[j] = speaker[xArrayLen-1];
	}
	ds_list_add(speak, speaker[j]);
}


if instance_exists(obj_battle){
	if obj_battle.topRectH >= 128{
		draw_set_font(fnt_text);
		draw_set_color(c_white);
		draw_text_scrolling(90, 34,text,40,850,0.5,6,action,skipKey,faces,speak,sounds,script);
		
	}
	
}


