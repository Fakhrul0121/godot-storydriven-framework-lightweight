extends Node

signal saving
signal saved

signal loading
signal loaded

func save_game(save_file_id: int):
	var system_data = get_all_save_data()
	var save_data = SaveData.new(system_data)
	# PASS SAVE DATA TO THE FILE HERE
	var save_file_path = "user://saves/save_file_%d.res" % save_file_id
	ResourceSaver.save(save_data, save_file_path)

func get_all_save_data():
	var system_data: Dictionary
	for system_name in SystemLibrary.system_list:
		var system = SystemLibrary.system_list[system_name]
		if system.has_method("send_system_data"):
			system_data[system_name] = system.send_system_data()
	return system_data

func load_game():
	loading.emit()
