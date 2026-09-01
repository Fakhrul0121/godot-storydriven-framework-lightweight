class_name EntityList extends Node

var _entity_list: Dictionary[String, PhysicsBody2D]

func _ready() -> void:
	set_entity_list()

func set_entity_list() -> void:
	for entity in get_children():
		_entity_list[entity.name] = entity
