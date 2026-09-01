class_name PotraitCommand extends BaseEventCommand

@export var next_id: String

func emit_command() -> String:
	return next_id
