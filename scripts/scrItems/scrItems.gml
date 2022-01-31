function Item(_name, _sprite, _desc) constructor
{
	name = _name;
	sprite = _sprite;
	desc = _desc;
}

function items_equal(a, b)
{
	return a.name == b.name && a.sprite == b.sprite && a.desc == b.desc;
}

global.item_test = new Item("Test Sandwich", sTestItem, "Cheese and mushy peas.");
