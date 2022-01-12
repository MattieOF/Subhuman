function json_stringify_to_file(filename, val)
{
	if (file_exists(filename)) file_delete(filename);
	
	var file = file_text_open_write(filename);
	file_text_write_string(file, json_stringify(val));
	file_text_close(file);
}

function json_parse_from_file(filename)
{
	if (!file_exists(filename)) return undefined;
	
	var file = file_text_open_read(filename);
	var val = file_text_read_string(file);
	file_text_close(file);
	return json_parse(val);
}
