extends Node

var current_event: GameEvent

var is_event_running: bool = false
var is_event_autorun: bool = false

func send_system_data():
	return {
		"current_event": current_event,
		"is_event_autorun": is_event_autorun,
		"is_event_running": is_event_running
	}

func start_event(event: GameEvent):
	# Check if there's an event that's already run
	# (ex. load a game that's mid event running)
	# if current_event != null and is_event_running:
	# 	push_error("Event cannot be run simultaneously")
	
	if !is_event_running:
		is_event_running = true
		current_event = event
	else:
		push_error("Event cannot be run simultaneously.")
		return
	await current_event.run_event()
	is_event_running = false
	current_event = null
