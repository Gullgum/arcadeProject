
/// Draw
get_input();
//Create a textbox under the variable "box"
var box = instance_create_depth(x,y,0,obj_textbox);
box.speaker = [obj_jim];
box.doFace = spr_jimface;

box.message = [
"Sorry, kiddo, park's closed!",
"What? Why?", 
"Because I said so. Now move along before you're late for school.",
"Its Saturday...\nAnd why do you have a bulldozer?",
"Didn't you see the notice? I OWN this park now.",
"It's the perfect spot for the new Jim's Socks (TM) sock factory!",
"You can't do that! This is the only park we have left!",
"So?",
"Listen, kid, you better keep your nose out of MY business or you'll be in big trouble.",
"You'll regret this.",
"Whatever."];  

box.doFace = [spr_jimface,0,spr_jimface,0,spr_jimface,spr_jimface,0,spr_jimface,spr_jimface,0,spr_jimface];

box.tSound[0] = 0;

var scr = scr_pantoplayer;
box.script = scr;
