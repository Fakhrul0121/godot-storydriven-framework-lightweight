class_name PlayerInputComponent extends Node

@export var moving_component: MovingComponent
@export var walking_speed: float
@export var running_speed: float
@export var is_allow_run: bool = true

func _physics_process(delta: float) -> void:
	if !EventManager.is_event_running:
		move_player_by_input()

func move_player_by_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction == Vector2.ZERO:
		moving_component.move_entity(input_direction,0,"idle")
	else:
		if Input.is_action_pressed("run") && is_allow_run:
			moving_component.move_entity(input_direction,running_speed,"run")
		else:
			moving_component.move_entity(input_direction,walking_speed,"walk")
