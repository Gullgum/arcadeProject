view_camera[0] = camera_create_view(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]), view_wport[0], view_hport[0], 0, obj_player, 2, 2, 512, 384);
obj_player.alarm[1] = 240;

if obj_player.timeline_index == tml_park{
	obj_guard.direction = 270;
	obj_guard.speed = 4;
}