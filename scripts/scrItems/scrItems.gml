enum itemUse
{
	none,
	healing,
	note
}

function Item(_name, _sprite, _desc) constructor
{
	name = _name;
	sprite = _sprite;
	desc = _desc;
	use = itemUse.none;
}

function NoteItem(_name, _sprite, _desc, _text) constructor
{
	name = _name;
	sprite = _sprite;
	desc = _desc;
	use = itemUse.note;
	text = _text;
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
global.itemKeycardLvl1 = new Item("Level 1 Keycard", sKeycardLvl1, "Obtained from a dead guy");
global.itemKeycardLvl2 = new Item("Level 2 Keycard", sKeycardLvl2, "Obtained from another dead guy");
global.itemKeycardLvl5 = new Item("Level 5 Keycard", sKeycardLvl5, "Obtained from a dead monster");
global.itemFuse = new Item("Fuse", sFuse, "Can be used to activate key card readers");
global.itemBloodyNote = new NoteItem("Bloody Note", sNote, "The handwriting gets progressively worse", 
	"If anyone reads this, you can use the fissurator bullets in the lab of the rightmost of the sub to " + 
	"kill it. You're gonna need a level 2 keycard to get in there." + 
	"\nTake the gun I left. I don't think you can kill it, but whatever it spawns doesn't have the " + 
	"same regenerative capabilities.\n\nGood luck.");
