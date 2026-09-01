class_name EventTriggerComponent extends Area2D

@export var game_event: JSON
@export var trigger_from_touch: bool = false

signal event_executed

func execute_event():
	event_executed.emit()
	var event_data = game_event.data
	EventManager.start_event(event_data)
