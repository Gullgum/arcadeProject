///@description Draws text scrolling across the screen.

//Created by Kupoapo#6969 (Aka. Xenodev)
//^ Thanks Xenodev
/*I have modified parts of this script to include things like sounds and faces, so I do have
  some understanding of how it works.*/

///@param x
//The x position where the text is displayed.

///@param y
//The y position where the text is displayed.

///@param text
//The text that is being displayed. Using (DS_LIST FORMAT)

///@param space
//The space between lines of text.

///@param width
//The maximum width in pixels of text per line.

///@param speed
//The speed the text scrolls across screen.

///@param wait
//The wait time between commas and periods.

///@param advance?
//A booldean variable to tell the text to advance. (ex. keyboard_check_pressed(vk_space))

///@param skip?
//A boolean variable to tell the text to speed up and not scroll. (ex. keyboard_check(vk_space))

///@param doFace
//Which face to draw

///@param speaker
//Which object/character is speaking for animations etc.

///@param sound
//Which sounds to play, if any.

///@param script?
//A script to execute after the text if over. (Script without brackets for execute or FALSE for no script.)

//Gets the variables through arguments.
var xpos = argument[0];
var ypos = argument[1];
var text = argument[2];
var space = argument[3];
var width = argument[4];
var spd = argument[5];
var wait = argument[6];
var advance = argument[7];
var skip = argument[8];
var faces = argument[9];
var speaker = argument[10];
var sounds = argument[11];
var script = argument[12];

//Checks if script is false or is a script.

/*if (speaker==false){
	speaker = undefined;
}*/

if (script==false){
	script = undefined;
}


//Defines a temporary character variables to keep track on text position.
//Checks if character variable has not been defined.
if !variable_instance_exists(id,"textChar"){
	textChar = 0; //The current character of the text to add to the string.
	textPos = 0; //The position in the text list.
	textCut = ""; //The text to cut out of the width factor of the string.
	textWait = 0; //The wait timer when the text reaches a comma or period.
	facePos = 0; //The positon in the faces list
	soundPos = 0; //The position in the sounds list.
	sprIndex = 0; //The index of the talking sprite
	speakerPos = 0;
}

//Defines the text being drawn.
var drawText = "";

//Gets the index of the text list.
currentText = ds_list_find_value(text,textPos);
currentFace = ds_list_find_value(faces,facePos);
currentSound = ds_list_find_value(sounds,soundPos);
currentSpeaker = ds_list_find_value(speaker,speakerPos);

if (currentFace==false){
	currentFace = undefined;
}

if (currentSound==false){
	currentSound = undefined;
}

if (currentSpeaker==false){
	currentSpeaker = undefined;
}

//Adds the character position of the current text to the displayed text.
if (currentText!=undefined){
	//Checks if the wait timer is up.
	if (textWait==0){
		//Sets the wait timer if a comma is detected.
		if ((string_char_at(currentText,textChar)==",") || (string_char_at(currentText,textChar)==".") || (string_char_at(currentText,textChar)=="!") || (string_char_at(currentText,textChar)=="?")){
			textWait = wait;
		}
		if (textChar<string_length(currentText)){
			textChar += spd;
		}
	}else{
		textWait--;
	}
}else{
	//Executes a script if a script exists.
	if (script!=undefined){
		script_execute(script);
	}
	//Undefines all the used variables.
	textPos = undefined;
	textChar = undefined;
	textWait = undefined;
	textCut = undefined;
	sprIndex = undefined;
	facePos = undefined;
	soundPos = undefined;
	speakerPos = undefined;
	instance_destroy();
}

//Draws the text showing on screen one character at a time.
if (currentText!=undefined){
	drawText = string_copy(currentText,1,floor(textChar));
	var txpos = xpos;
	if currentFace != undefined{
		txpos = xpos + 120;
		width -= 100;
	}
	draw_text_ext(txpos,ypos,drawText,space,width);

}

//Draws the face
//Note to self: Be careful when using while loops or the game will get stuck.
if currentText!=undefined{
	if (currentSound != undefined){
		if !audio_is_playing(currentSound) && !(textChar>=string_length(currentText)) {
			audio_sound_gain(currentSound,1,0);
			audio_play_sound(currentSound,1,0);
			draw_text(0,0,"I don't know man");
		}
	}
	//If a face has been defined and the text is still moving, draw an animated sprite.
	if currentFace != undefined{
			if !(textChar>=string_length(currentText)){
				/*The floor function rounds a value down to the nearest integer, so until sprIndex
				reaches the next whole number, the sprite's image index will remain the same.*/
				draw_sprite(currentFace,floor(sprIndex), xpos - 10, ypos);
				//Every frame, increase the value of sprIndex by 0.3, meaning the sprite will change 9 times a second.
				sprIndex += 0.3;
			}else{ //Otherwise draw a non-animated sprite with the first frame of the sprite.
				draw_sprite(currentFace,0,xpos - 10,ypos);
			}
			
		}
	if currentSpeaker != undefined{
		if !(textChar>=string_length(currentText)){
			currentSpeaker.sprite_index = currentSpeaker.sprTalk;
			currentSpeaker.image_speed = 1.5
		}else{ 
			currentSpeaker.image_speed = 0;
			currentSpeaker.image_index = 0;
		}
	}
}

//Checks if the current text is not undefined.
if (currentText!=undefined){
	//Advances the text, face and sound to the next index in the list.
	if (advance) && (textChar>=string_length(currentText)){
		textPos++;
		facePos++;
		soundPos++;
		speakerPos++;
		textChar = 0;
		textCut = "";
		textWait = 0;
	}
	//Skips the text scrolling.
	if (skip){
		textChar = string_length(currentText);
		textWait = 0;
	}
}