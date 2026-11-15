class_name ChangeMapCommand
extends BaseEventCommand

@export var next_map_name: StringName
@export var transfer_position: Vector2

@export var next_id: String

func emit_command() -> String:
	MapManager.map_transition(next_map_name,transfer_position)
	return next_id
