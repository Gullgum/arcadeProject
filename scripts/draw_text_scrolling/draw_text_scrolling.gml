///@description Draws text scrolling across the screen.

//Created by Kupoapo#6969 (Aka. Xenodev)

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
var doFace = argument[9];
var speaker = argument[10];
var script = argument[11];

//Checks if script is false or is a script.
if (doFace==false){
	doFace = undefined;
}

/*if (sound==false){
	sound = undefined;
}*/

if (speaker==false){
	speaker = undefined;
}

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
	sprIndex = 0; //The index of the talking sprite
}

//Defines the text being drawn.
var drawText = "";

//Gets the index of the text list.
currentText = ds_list_find_value(text,textPos);


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
	instance_destroy(obj_textface);
	instance_destroy();
}

//Draws the text showing on screen one character at a time.
if (currentText!=undefined){
	drawText = string_copy(currentText,1,floor(textChar));
	var txpos = xpos;
	if doFace != undefined{
		txpos = xpos + 120;
	}
	
	draw_text_ext(txpos,ypos,drawText,space,width);

}

//Draws the face
//Be careful when using while loops
if currentText!=undefined{
	if doFace != undefined{
			if !(textChar>=string_length(currentText)){
				draw_sprite(doFace,floor(sprIndex), xpos - 10, ypos);
				sprIndex += 0.3;
			}else{
				draw_sprite(doFace,0,xpos - 10,ypos);
			}
		}
	if speaker != undefined{
		if !(textChar>=string_length(currentText)){
			speaker.sprite_index = speaker.sprTalk;
			speaker.image_speed = 1.5
		}else{ 
			speaker.image_speed = 0;
			speaker.image_index = 0;
		}
	}
}

//Checks if the current text is not undefined.
if (currentText!=undefined){
	//Advances the text to the next index in the list.
	if (advance) && (textChar>=string_length(currentText)){
		textPos++;
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