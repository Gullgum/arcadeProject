target.attackDelay++;
pSpeed = 5;
projSpawn = 0;

var x1 = 380;
var x2 = 512;
var x3 = 644;
var spawnX = x1;

var proj = obj_projectile;
switch target.attackDelay{
	case 1:
		projSpawn = 1;
		spawnX = x2;
	break;
	
	case 40:
		projSpawn = 1;
		spawnX = x3;
	break;
	
	case 70:
		projSpawn = 1;
		spawnX = x1;
	break;
	
}

if (projSpawn != 0)
	instance_create_depth(spawnX,-50,0,obj_projectile);

projSpawn = 0;


if !instance_exists(obj_projectile){
	atkFinished = 1;
}