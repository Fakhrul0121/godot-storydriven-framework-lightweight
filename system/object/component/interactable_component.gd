class_name InteractableComponent extends BaseComponent

@export var _event: JSON

func interact():
	var data = _event.data
	EventSystem.start_event(data)
