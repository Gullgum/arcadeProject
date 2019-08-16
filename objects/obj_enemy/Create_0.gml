/// @description Initialise variables
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var camW = camera_get_view_width(view_camera[0]);
var camH = camera_get_view_height(view_camera[0]);

escapeChance = 0.5;

hp = 20;
atk = 3;
def = 0;
maxHp = 20;
xx = x;
ranAway = 0;

pTargetY = camY + (3*camH/4);

attackDelay = 0;
