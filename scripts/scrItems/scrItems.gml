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

global.item_test = new HealingItem("Sandwich", sTestItem, "Cheese and mushy peas.", 25);
