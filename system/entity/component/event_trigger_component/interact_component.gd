class_name InteractComponent extends RayCast2D

var collider

func _physics_process(delta: float) -> void:
	if EventManager.is_event_running: return
	
	if !check_interactable(): return
	
	if collider.trigger_from_touch:
		collider.execute_event()
	else:
		if Input.is_action_just_pressed("ui_accept"): collider.execute_event()

func check_interactable() -> bool:
	if is_colliding():
		collider = get_collider()
		if collider is EventTriggerComponent:
			return true
	collider = null
	return false
