/// Draw
get_input();
var box = instance_create_depth(x,y,0,obj_textbox);
box.speaker = obj_jim;
box.doFace = spr_jimface;
box.message[0] = "Heh heh heh!";
box.message[1] = "What do you think you're doing?!";
box.message[2] = "Oh! Don't you worry, boy...";
box.message[3] = "This land now belongs to me! Jim Capitalist!";
box.message[4] = "Heheheheheheheheheheheheheheheh!"
box.message[5] = "Toodles!";
box.message[6] = "(This is all we've done so far. To return to the menu, press \"L\".)";
var scr = scr_pantoplayer;
box.script = scr;
