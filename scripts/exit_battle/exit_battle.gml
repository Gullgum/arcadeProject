
with obj_battle{

	rectH = min(rectH+4,769);
	topRectH = max(topRectH-4,-1);
	if rectH >= 769{
		if (menu == "Flee")
			target.ranAway = 1;
		instance_destroy(obj_battle);
		if instance_exists(obj_dummy)
			obj_dummy.tutorialProgress = 476432;
	}
	
}

with (obj_player){
	var xPrev0 = xPrev;
	var yPrev0 = yPrev;
	if speed == 0 && x != xPrev0 && y != yPrev0{
		direction = point_direction(x,y,xPrev0,yPrev0);
		speed = point_distance(x,y,xPrev0,yPrev0)/25;
	}
	if point_distance(x,y,xPrev0,yPrev0) < speed{
		speed = 0;
		x = xPrev0;
		y = yPrev0
		obj_player.alarm[2] = 30;
	}
}

with (obj_dummy){
	var xPrev1 = xPrev;
	var yPrev1 = yPrev;
	if speed == 0 && x != xPrev1 && y != yPrev1{
		direction = point_direction(x,y,xPrev1,yPrev1);
		speed = point_distance(x,y,xPrev1,yPrev1)/25;
	}
	if point_distance(x,y,xPrev1,yPrev1) < speed{
		speed = 0;
		x = xPrev1;
		y = yPrev1;
	}
}