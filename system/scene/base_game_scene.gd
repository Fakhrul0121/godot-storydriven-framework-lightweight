class_name BaseGameScene extends Node2D

func _ready() -> void:
	SceneManager.current_game_scene = self
