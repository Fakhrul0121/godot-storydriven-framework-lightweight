class_name ObjectList extends Node

var _object_list: Dictionary[String, BaseGameObject]

func _ready() -> void:
	set_object_list()

func set_object_list() -> void:
	for object in get_children():
		_object_list[object.name] = object
