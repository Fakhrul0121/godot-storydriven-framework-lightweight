extends Node

@export var camera: Camera2D

var binded_node: Node2D
var is_camera_binded: bool = false

var lock_x_position: bool = false
var lock_y_position: bool = false

signal camera_transition_finished

func update_limit():
	pass

func move_camera(target_node: Node2D, is_instant: bool = true, speed: EntityManager.MOVEMENT_SPEED = EntityManager.MOVEMENT_SPEED.SLOW, is_wait: bool = false):
	if is_instant:
		camera.position = target_node.position
	else:
		actually_move_camera(target_node, speed)
	if is_wait:
		await camera_transition_finished

func actually_move_camera(target_node: Node2D, speed: EntityManager.MOVEMENT_SPEED):
	var direction = camera.position.direction_to(target_node.position)
	while camera.distance_to(target_node.position) >= 0.1:
		var delta = get_physics_process_delta_time()
		var velocity = direction * speed
		camera.position += velocity * delta
		await get_tree().physics_frame
	camera_transition_finished.emit()

func bind_camera_to_node(nodepath: NodePath, lock_x: bool, lock_y: bool, is_transition_instant: bool, transition_speed: EntityManager.MOVEMENT_SPEED):
	is_camera_binded = false
	binded_node = MapManager.get_node_from_node_path(nodepath)
	await move_camera(binded_node, is_transition_instant, transition_speed, true)
	lock_x_position = lock_x
	lock_y_position = lock_y
	is_camera_binded = true

func remove_binded_node():
	binded_node = null

func _physics_process(delta: float) -> void:
	if binded_node != null and is_camera_binded:
		if !lock_x_position: camera.position.x = binded_node.position.x
		if !lock_y_position: camera.position.y = binded_node.position.y
