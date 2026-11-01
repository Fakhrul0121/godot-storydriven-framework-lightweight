class_name BaseGameMap extends Node2D

func _ready() -> void:
	MapManager.current_game_scene = self
