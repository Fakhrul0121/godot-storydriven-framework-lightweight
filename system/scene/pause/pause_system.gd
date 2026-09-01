extends Control

func pause_game():
	get_tree().current_scene.set_process(false)
	pass

func unpause_game():
	get_tree().current_scene.set_process(true)
