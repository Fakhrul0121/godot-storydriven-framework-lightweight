class_name MoveByCommandComponent extends Node

@export var moving_component: MovingComponent

var is_moving: bool = false
var _target_position: Vector2
var _speed: EntityManager.MOVEMENT_SPEED
var _animation: String
var _distance_limit: float

signal moving_finished

func move_towards(target_position: Vector2, speed: EntityManager.MOVEMENT_SPEED,animation: String, distance_limit: float, is_wait_until_finished: bool):
	_target_position = target_position
	_speed = speed
	_animation = animation
	_distance_limit = distance_limit
	is_moving = true
	if is_wait_until_finished:
		await moving_finished

func _physics_process(delta: float) -> void:
	if is_moving:
		var direction = moving_component.movable_entity.position.direction_to(_target_position)
		if moving_component.movable_entity.position.distance_to(_target_position) >= _distance_limit:
			moving_component.move_entity(direction, _speed, _animation)
		else:
			is_moving = false
			moving_finished.emit()
