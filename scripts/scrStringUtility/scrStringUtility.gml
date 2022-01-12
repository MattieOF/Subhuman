function get_file_formatted_datetime()
{
	return (string(current_day) + "_" + string(current_month) + "_" + string(current_year) + "-" + 
		string(current_hour) + "_" + string(current_minute) + "_" + string(current_second));
}

/// @param {string} str - String to be formatted
function format_string()
{
	var _str = argument[0];
	
	for (var i = 1; i < argument_count; i++)
	{
		var identifier = "{" + string(i - 1) + "}";
		_str = string_replace(_str, identifier, string(argument[i]));
	}
	
	return _str;
}

/// @param {string} str - String to be formatted
function log_format_string()
{
	var _str = argument[0];
	
	for (var i = 1; i < argument_count; i++)
	{
		var identifier = "{" + string(i - 1) + "}";
		_str = string_replace(_str, identifier, string(argument[i]));
	}
	
	show_debug_message(_str);
}
