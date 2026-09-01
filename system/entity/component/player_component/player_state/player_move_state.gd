class_name PlayerMoveState extends BasePlayerState
@export var idle_state: PlayerIdleState

@export var walking_velocity: float
@export_range(1.0, 5.0, 0.1) var running_multiplier: float

var is_running: bool = false

func enter():
	animation_tree["parameters/conditions/is_walking"] = true

func move_player():
	player.velocity = input_direction * (walking_velocity + (walking_velocity * float(is_running) * running_multiplier))
	player.move_and_slide()

func update_is_running():
	is_running = Input.is_action_pressed("run")
	animation_tree["parameters/conditions/is_walking"] = !is_running
	animation_tree["parameters/conditions/is_running"] = is_running

func physics_process(delta: float) -> BaseState:
	if EventManager.is_event_running: return idle_state
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_direction == Vector2.ZERO:
		return idle_state
	update_is_running()
	update_animation()
	move_player()
	return null

func exit():
	animation_tree["parameters/conditions/is_walking"] = false
	animation_tree["parameters/conditions/is_running"] = false
