/// @desc get_input()
//This script defines all the keys that will be used as short variables instead of messy functions.
rKey = max(keyboard_check(vk_right), keyboard_check(ord("D")), 0);
lKey = max(keyboard_check(vk_left), keyboard_check(ord("A")), 0);
dKey = max(keyboard_check(vk_down), keyboard_check(ord("S")), 0);
uKey = max(keyboard_check(vk_up), keyboard_check(ord("W")), 0);
pauseKey = (keyboard_check(vk_escape));
action = max(keyboard_check_pressed(ord("Z")), (keyboard_check_pressed(vk_enter)));
menuKey = (keyboard_check_pressed(ord("C")));
skipKey = max(keyboard_check_pressed(ord("X")), (keyboard_check_pressed(vk_rshift)));
//These variables are for controlling menus, like in the title screen.
dGUI = (keyboard_check_pressed(vk_down));
uGUI = (keyboard_check_pressed(vk_up));
/*These 2 variables are used in the movement script. Because '1' means 'true' here, 
  each of the above variables will either return 1 or 0 (false). */
//Left = -1, Right = 1, None = 0.
xaxis = (rKey - lKey);
//Up = -1, Down = 1, None = 0.
yaxis = (dKey - uKey);


//Gamepad Input
if (gamepad_is_connected(0)){
	rKey = gamepad_button_check(0, gp_padr);
	lKey = gamepad_button_check(0, gp_padl);
	dKey = gamepad_button_check(0, gp_padd);
	uKey = gamepad_button_check(0, gp_padu);
	
	xaxis = max(gamepad_axis_value(0, gp_axislh),
gamepad_axis_value(0, gp_axisrh), rKey - lKey, 0);
	yaxis = max(gamepad_axis_value(0, gp_axislv),
gamepad_axis_value(0, gp_axisrv), dKey - uKey, 0);
}