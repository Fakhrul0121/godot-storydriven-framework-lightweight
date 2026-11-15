extends Node

var current_inventory: Dictionary[BaseItem, int]

var current_interactable: EventTriggerComponent

func set_interactable(event_trigger_component: EventTriggerComponent):
	current_interactable = event_trigger_component

func check_item_requirement(item: BaseItem, count: int) -> bool:
	if current_inventory.has(item):
		return current_inventory[item] >= count
	return false
