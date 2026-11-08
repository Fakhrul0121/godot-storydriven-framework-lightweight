extends Node

var current_event: GameEvent = null

var is_event_running: bool = false
var is_event_autorun: bool = false

signal event_running
signal event_finished

func _ready() -> void:
	SaveLoadManager.loaded.connect(loaded)

func loaded():
	if is_event_running && current_event != null:
		start_event(current_event, true)

#there's gonna be another way to write a more cleaner and dynamic code
func send_manager_data():
	return {
		"current_event": current_event,
		"is_event_autorun": is_event_autorun,
		"is_event_running": is_event_running
	}

func retrive_manager_data(data: Dictionary):
	is_event_running = data["is_event_running"]
	current_event = data["current_event"]
	is_event_autorun = data["is_event_autorun"]

func start_event(event: GameEvent, bypass_event_check: bool = false):
	# Check if there's an event that's already run
	# (ex. load a game that's mid event running)
	# if current_event != null and is_event_running:
	# 	push_error("Event cannot be run simultaneously")
	event_running.emit()
	if !bypass_event_check && is_event_running:
		push_error("Event cannot be run simultaneously.")
		return
	is_event_running = true
	current_event = event
	await current_event.run_event()
	is_event_running = false
	current_event = null
	event_finished.emit()

func get_command_event(id: String) -> BaseEventCommand:
	return current_event.event.get(id)
