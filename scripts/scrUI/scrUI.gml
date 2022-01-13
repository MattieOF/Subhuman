enum layoutType 
{
	stack
}

enum stackDir
{
	vertical,
	horizontal
}

global.ui_currentLayout = undefined;
global.ui_currentPadding = undefined;
global.ui_currentX = undefined;
global.ui_currentY = undefined;
global.ui_currentStackDir = undefined;
global.ui_currentLayerName = undefined;

global.ui_objButton = oButton;

function create_button(_x, _y, _width, _height, _text, _onPress, _callAs = undefined, _layer = undefined, _normalColor = $FFE6E6E6, 
	_hoverColor = $FF999999, _clickedColor = $FF676767, _alpha = 1, _scale = 1)
{
	if (_layer == undefined)
	{
		if (global.ui_currentLayerName == undefined) global.ui_currentLayerName = "UI";
		if (layer_exists(global.ui_currentLayerName)) _layer = layer_get_id(global.ui_currentLayerName);
		else _layer = layer_create(-100, global.ui_currentLayerName);
	}
	
	var btn = instance_create_layer(_x, _y, _layer, global.ui_objButton);
	btn.width = _width;
	btn.height = _height;
	if (_callAs != undefined) btn.callAs = _callAs;
	btn.text = _text;
	btn.onPress = _onPress;
	btn.normalColor = _normalColor;
	btn.hoverColor = _hoverColor;
	btn.clickedColor = _clickedColor;
	btn.alpha = _alpha;
	btn.textScale = _scale;
	
	return btn;
}

function start_stack(name, x, y, padding = 5, dir = stackDir.vertical)
{
	if (global.ui_currentLayout != undefined)
	{
		show_debug_message("Tried to start a stack, but another layout is in progress.");
		return;
	}
	
	global.ui_currentLayerName = name;
	global.ui_currentLayout = layoutType.stack;
	global.ui_currentStackDir = dir;
	global.ui_currentPadding = padding;
	global.ui_currentX = x;
	global.ui_currentY = y;
}

function end_stack()
{
	if (global.ui_currentLayout != layoutType.stack)
	{
		show_debug_message("Tried to end stack, but current layout is not a stack.");
		return;
	}
	
	global.ui_currentLayerName = undefined;
	global.ui_currentLayout = undefined;
	global.ui_currentStackDir = undefined;
	global.ui_currentPadding = undefined;
	global.ui_currentX = undefined;
	global.ui_currentY = undefined;
}

function add_to_stack(objId)
{
	if (global.ui_currentLayout != layoutType.stack)
	{
		show_debug_message("Tried to add to stack, but current layout is not a stack.");
		return;
	}
	
	objId.x = global.ui_currentX;
	objId.y = global.ui_currentY;
	
	switch(global.ui_currentStackDir)
	{
		case stackDir.horizontal:
			global.ui_currentX += (objId.width + global.ui_currentPadding);
			break;
		case stackDir.vertical:
			global.ui_currentY += (objId.height + global.ui_currentPadding);
			break;
	}
}

function set_layer_interactable(layerId, interactable)
{
	var lId = layer_get_id(layerId);
	
	var elements = layer_get_all_elements(lId);
	for (var i = 0; i < array_length(elements); i++)
    {
		if (layer_get_element_type(elements[i]) == layerelementtype_instance)
        {
	        var layerelement = elements[i];
	        var inst = layer_instance_get_instance(layerelement);
			if (variable_instance_exists(inst, "interactable"))
				inst.interactable = interactable;
        }
    }
}


function set_layer_alpha(layerId, alpha)
{
	var lId = layer_get_id(layerId);
	
	var elements = layer_get_all_elements(lId);
	for (var i = 0; i < array_length(elements); i++)
    {
		if (layer_get_element_type(elements[i]) == layerelementtype_instance)
        {
	        var layerelement = elements[i];
	        var inst = layer_instance_get_instance(layerelement);
			if (variable_instance_exists(inst, "alpha"))
				inst.alpha = alpha;
        }
    }
}
