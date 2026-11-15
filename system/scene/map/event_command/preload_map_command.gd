class_name PreloadGameMapCommand
extends BaseEventCommand

@export var preload_game_map_array: Array[PackedScene]

@export var next_id: String

func emit_command() -> String:
	MapManager.set_preload_game_map(preload_game_map_array)
	return next_id
