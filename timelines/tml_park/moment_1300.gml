///@desc Pause timeline, execute script
scr_park();
obj_player.timeline_running = 0;

//view_camera[0] = camera_create_view(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]), view_wport[0], view_hport[0], 0, obj_player, 4, 4, 512, 384);