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
			
//Draw the textbox.
	/*If the player is above the sign object when they interact with it, change the position of the
	textbox. This stops the object from being covered by the textbox, but this will have to be done 
	another way when in a cutscene or the textbox is being created by a script.*/
	if obj_player.y > signY {
		textboxY = 30;
	}else textboxY = 575;
	//The grey border
	draw_set_color($bdc6c6);
	draw_roundrect(95,textboxY,930,textboxY + 160,0); 
	//The little black line inside the border
	draw_set_color(c_black);
	draw_roundrect(95,textboxY,930,textboxY+160,1);
	draw_roundrect(99,textboxY + 4,926,textboxY + 156,1) 
	//The fill colour of the textbox
	draw_set_color($0F0F0F);
	draw_roundrect(100,textboxY + 5,925,textboxY + 155,0);
	//Settings for the text
	draw_set_color(c_white);
	draw_set_font(fnt_text);
	draw_set_halign(fa_left);
	//Define the keys to be pressed to perform these actions
	var key_advance = action;
	var key_skip = skipKey;
	//The maximum width before the text starts a new line.
	var twidth = 770;
	//Run the 'draw_text_scrolling' script using all the variables defined in this object.
	draw_text_scrolling(130, textboxY + 20,text,40,twidth,1,6,key_advance,key_skip,faces,speaker,sounds,script);