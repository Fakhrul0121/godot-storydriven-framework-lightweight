class_name PlayerIdleState extends BasePlayerState

@export var walking_state: PlayerMoveState

func enter():
	animation_tree["parameters/conditions/is_idling"] = true

func physics_process(delta: float) -> BaseState:
	if EventManager.is_event_running: return null
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_direction != Vector2.ZERO:
		return walking_state
	return null

func exit():
	animation_tree["parameters/conditions/is_idling"] = false
