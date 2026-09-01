extends Node

var current_game_scene: BaseGameScene

func get_node_from_current_scene(node_path: NodePath):
	return current_game_scene.get_node_or_null(node_path)

func scene_transition(next_scene: BaseGameScene, transition_position: Vector2):
	
	pass
