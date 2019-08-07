
with obj_battle{
	rectH = min(rectH+4,769);
	topRectH = max(topRectH-4,-1);
	if rectH >= 769{	
		instance_destroy(self);
		if instance_exists(obj_dummy)
			obj_dummy.tutorialProgress = 476432;
	}
}

