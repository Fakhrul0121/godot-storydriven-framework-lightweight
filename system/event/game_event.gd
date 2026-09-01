@tool
class_name GameEvent extends Resource

@export var event: Dictionary[String,BaseEventCommand]

@export var id_starting_point: String:
	set(value):
		id_starting_point = value
		current_id = value

var current_id

func run_event():
	while current_id != "0":
		var current_event_command = event[current_id]
		current_id = await current_event_command.emit_command()
	pass
