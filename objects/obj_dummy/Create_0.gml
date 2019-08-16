/// @description Dummy-specific variables

var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var camW = camera_get_view_width(view_camera[0]);
var camH = camera_get_view_height(view_camera[0]);

escapeChance = 1;
tutorialProgress = 0;
waiting = 0;

atk = 1;
def = 0;
maxHp = 15;
hp = 15;
xx = 0;
ranAway = 0;
xPrev = x;
yPrev = y;

pTargetY = camY + (3*camH/4);
attackDelay = 0;
attack = dummy_attack1;