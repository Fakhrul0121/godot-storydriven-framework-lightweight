class_name WaitCommand extends BaseEventCommand

@export_range(0, 1000, 0.01, "or_greater", "hide_control") var wait_in_seconds: float
@export var next_id: String

func emit_command() -> String:
	await Engine.get_main_loop().create_timer(wait_in_seconds).timeout
	return next_id
