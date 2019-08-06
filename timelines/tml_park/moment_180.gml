with obj_player {
	direction = 90;
	speed = 4;
	image_speed = 1;
	var camera_x = camera_get_view_x(view_camera[0]);
	var camera_y = camera_get_view_y(view_camera[0]); 
	view_camera[0] = camera_create_view(camera_x, camera_y, view_wport[0], view_hport[0], 0, obj_dozer, 0, 4.5, 512, 384);
}

timeline_running = 0;