extends Node

signal saving
signal saved

signal loading
signal loaded

func save_game(save_file_id: int):
	saving.emit()
	var manager_data = get_all_save_data()
	var save_data = SaveData.new(manager_data)
	# PASS SAVE DATA TO THE FILE HERE
	var save_file_path = "user://saves/save_file_%d.res" % save_file_id
	ResourceSaver.save(save_data, save_file_path)
	saved.emit()

func get_all_save_data():
	var manager_data_list: Dictionary
	for manager_name in ManagerLibrary.manager_list:
		var manager = ManagerLibrary.manager_list[manager_name]
		if manager.has_method("send_manager_data"):
			manager_data_list[manager_name] = manager.send_manager_data()
	return manager_data_list

func load_game(save_file_id: int):
	var save_data: SaveData
	loading.emit()
	var save_file_path = "user://saves/save_file_%d.res" % save_file_id
	if ResourceLoader.exists(save_file_path):
		save_data = ResourceLoader.load(save_file_path, "", ResourceLoader.CACHE_MODE_IGNORE)
	else:
		push_error("Save data does not exist in path " + save_file_path)
	load_all_data(save_data.data_saved_list)
	loaded.emit()

func load_all_data(manager_data_list: Dictionary[String,Dictionary]):
	for manager_name in ManagerLibrary.manager_list:
		var manager = ManagerLibrary.manager_list[manager_name]
		if manager.has_method("retrive_manager_data"):
			manager.retrive_manager_data(manager_data_list[manager_name])
