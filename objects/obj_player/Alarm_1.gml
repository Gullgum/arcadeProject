/// @description Resume timelines

//Reset the camera to default
view_camera[0] = default_cam;

//If currently executing the timeline for the park timeline, unpause it and set it to step 1330
if timeline_index == tml_park {
	timeline_running = 1;
	timeline_position = 1330;

}


	