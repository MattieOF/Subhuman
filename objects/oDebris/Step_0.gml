life--;
if (life <= 0) instance_destroy(id);

for (var i = 0; i < array_length(objects); i++)
	objects[i].update();
