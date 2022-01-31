function Item(_name, _sprite, _desc) constructor
{
	name = _name;
	sprite = _sprite;
	desc = _desc;
}

global.item_test = new Item("Test Sandwich", sTestItem, "Cheese and mushy peas.");
