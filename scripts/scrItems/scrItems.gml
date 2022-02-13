enum itemUse
{
	none,
	healing
}

function Item(_name, _sprite, _desc) constructor
{
	name = _name;
	sprite = _sprite;
	desc = _desc;
	use = itemUse.none;
}

function HealingItem(_name, _sprite, _desc, _healing) constructor
{
	name = _name;
	sprite = _sprite;
	desc = _desc;
	use = itemUse.healing;
	healAmount = _healing;
}

function items_equal(a, b)
{
	return a.name == b.name && a.sprite == b.sprite && a.desc == b.desc;
}

global.itemSandwich = new HealingItem("Sandwich", sTestItem, "Cheese and mushy peas.\nHeals 25 HP.", 25);
global.itemKeycardLvl1 = new Item("Level 1 Keycard", sTestItem, "Obtained from a dead guy");
global.itemKeycardLvl2 = new Item("Level 2 Keycard", sTestItem, "Obtained from another dead guy");
global.itemKeycardLvl5 = new Item("Level 5 Keycard", sTestItem, "Obtained from a dead monster");
global.itemFuse = new Item("Fuse", sTestItem, "Can be used to activate key card readers");
