extends Node

const TILE_SIZE = 48

var current_game_map: BaseGameMap
var preload_game_map_array: Array[BaseGameMap]

func get_pixel_position_from_tile_position(tile_position: Vector2):
	return (tile_position * TILE_SIZE) + (Vector2(TILE_SIZE, TILE_SIZE)/2)

func get_node_from_current_map(node_path: NodePath):
	return current_game_map.get_node_or_null(node_path)

func map_transition(next_map_name: StringName, transfer_position: Vector2):
	
	## find game map
	var next_game_map = null
	for preload_game_map in preload_game_map_array:
		if preload_game_map.name == next_map_name:
			next_game_map = preload_game_map
			break
	
	if next_game_map == null:
		push_error("Map ", next_game_map, " does not exist in prepreload game maps.")
	
	##change map
	if current_game_map in preload_game_map_array:
		get_tree().root.remove_child(current_game_map)
	else:
		current_game_map.queue_free()
	get_tree().root.add_child(next_game_map)

func set_preload_game_map(packed_map_array: Array[PackedScene]):
	##delete preload map from memory
	for preload_game_map in preload_game_map_array:
		preload_game_map_array.erase(preload_game_map)
		if preload_game_map != current_game_map:
			preload_game_map.queue_free()
	
	##add map to memory
	for packed_map in packed_map_array:
		var game_map = packed_map.instantiate()
		get_tree().root.add_child(game_map)
		get_tree().root.remove_child(game_map)
		preload_game_map_array.append(game_map)
