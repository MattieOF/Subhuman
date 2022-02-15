function item_used()
{
	open = true;
	interactable = false;
	sprite.image_speed = 1;
	instance_destroy(spawnTrigger_openingTutorial);
}
