
/// Draw
get_input();
//Create a textbox under the variable "box"
var box = instance_create_depth(x,y,0,obj_textbox);
box.speaker = obj_jim;
box.doFace = spr_jimface;

box.message = ["Text1", "Text2", "Text3","Text4","...","...","Listen, kid, you better keep your nose out of MY business or you'll be in big trouble.","."];  

box.doFace[0] = spr_jimface;
box.doFace[1] = false;
box.doFace[2] = spr_jimface;
box.doFace[3] = false;
box.doFace[4] = spr_jimface;

box.tSound[0] = stepsound;
box.tSound[1] = stepsound;
box.tSound[2] = stepsound;

var scr = scr_pantoplayer;
box.script = scr;
