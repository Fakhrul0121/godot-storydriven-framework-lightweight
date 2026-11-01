class_name EventTriggerComponent extends Area2D

@export var game_event: GameEvent
@export var trigger_from_touch: bool = false

signal event_executed

func execute_event():
	event_executed.emit()
	await EventManager.start_event(game_event)
