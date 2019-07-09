//@desc check_counterStrafe(xmoveDir,ymoveDir)
//@arg xmoveDir
//@arg ymoveDir

var xmoveDir = argument0;
var ymoveDir = argument1;


switch xmoveDir{
	case 1:
		if (keyboard_check_pressed(lKey)) obj_player.len = 0;
	break;
	
	case -1:
		if (keyboard_check_pressed(rKey)) obj_player.len = 0;
	break;
}

switch ymoveDir{
	case 1:
		if (keyboard_check_pressed(uKey)) obj_player.len = 0;
	break;
	
	case -1:
		if (keyboard_check_pressed(dKey)) obj_player.len = 0;
	break;
}


