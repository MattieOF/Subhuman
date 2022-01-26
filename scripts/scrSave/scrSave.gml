function save_exists(file = "savegame.json")
{
	return file_exists(file);
}

function delete_save(file = "savegame.json")
{
	if (!file_exists(file)) return;
	file_copy(file, file + ".old");
	file_delete(file);
}
