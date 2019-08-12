/// @desc Intialise variables

//Movement and other
spd = 10;
hspd = 0;
vspd = 0;
len = 0;
dir = 0;
state = move_state;
stepcooldown = 0;
cutscene = 0;
exitBattle = 0;
//Camera setup
default_cam = camera_create_view(x - 512,y - 384, view_wport[0], view_hport[0], 0, obj_player, -1, -1, 512, 384);
view_camera[0] = default_cam;

// Sprite Variables
targetPosX = 0;
targetPosY = 0;
face = 0;

//Player stats
atk = 5;
maxHp = 20;
hp = 20;
def = 2;

xPrev = x;
yPrev = x;

inventory = [0,0,0,0,0,0,0,0];

#macro RIGHT spr_player_white;

#macro DOWN spr_player_down;

#macro LEFT spr_player_left;

#macro UP spr_player_up;

