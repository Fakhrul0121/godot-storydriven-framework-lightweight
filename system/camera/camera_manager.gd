extends Node

@export var camera: Camera2D

signal move_camera_finished

func update_limit():
	pass

func move_camera(target_position: Vector2, is_instant: bool = true, speed: EntityManager.MOVEMENT_SPEED = EntityManager.MOVEMENT_SPEED.SLOW, is_wait: bool = false):
	var tween = get_tree().create_tween()
	if is_instant:
		camera.position = target_position
	else:
		slowly_move_camera(target_position, speed)
	if is_wait:
		await move_camera_finished

func slowly_move_camera(target_position: Vector2, speed: EntityManager.MOVEMENT_SPEED):
	var direction = camera.position.direction_to(target_position)
	while camera.distance_to(target_position) >= 0.1:
		var delta = get_physics_process_delta_time()
		var velocity = direction * speed
		camera.position += velocity * delta
		await get_tree().physics_frame
	move_camera_finished.emit()

func bind_camera_to_follow_node(node: Node2D):
	pass
