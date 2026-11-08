class_name MoveByCommandComponent extends Node

@export var moving_component: MovingComponent

var is_moving: bool = false

signal moving_finished

func move_towards(target_position: Vector2, speed: EntityManager.MOVEMENT_SPEED,animation: String, distance_limit: float, is_wait_until_finished: bool):
	physics_process_move_entity_body_towards(target_position, speed, animation, distance_limit)
	is_moving = true
	if is_wait_until_finished:
		await moving_finished

func physics_process_move_entity_body_towards(target_position: Vector2, speed: EntityManager.MOVEMENT_SPEED,animation: String, distance_limit: float):
	var direction = moving_component.movable_entity.position.direction_to(target_position)
	while moving_component.movable_entity.position.distance_to(target_position) >= distance_limit:
		moving_component.move_entity(direction, speed, animation)
		await get_tree().physics_frame
	moving_finished.emit()
	is_moving = false
