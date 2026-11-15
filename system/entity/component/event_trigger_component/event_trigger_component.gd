class_name EventTriggerComponent extends Area2D

@export_category("Trigger From Interact")
@export var game_event: GameEvent
@export var trigger_from_touch: bool = false

@export_category("Trigger From Item Selection")
@export var trigger_from_item: Dictionary[BaseItem, GameEvent]

signal event_executed

func execute_event_from_interact():
	event_executed.emit()
	await EventManager.start_event(game_event)
