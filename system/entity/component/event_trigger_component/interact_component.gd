class_name InteractComponent extends RayCast2D

var collider: Area2D

## There's gonna be a better and cleaner implementation of this
func _physics_process(delta: float) -> void:
	if EventManager.is_event_running: return
	
	if !check_interactable():
		collider = null
		InventoryManager.set_interactable(collider)
		return
	
	if collider.trigger_from_touch:
		collider.execute_event_from_interact()
	else:
		if Input.is_action_just_pressed("ui_accept"): collider.execute_event()

func check_interactable() -> bool:
	if is_colliding():
		collider = get_collider()
		if collider is EventTriggerComponent:
			InventoryManager.set_interactable(collider)
			return true
	collider = null
	return false
