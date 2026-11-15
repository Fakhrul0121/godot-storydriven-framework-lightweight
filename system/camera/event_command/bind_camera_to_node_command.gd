class_name BindCameraToNodeCommand
extends BaseEventCommand

@export_category("Camera behavior")
@export var target_nodepath: NodePath
@export var lock_x_position: bool = false
@export var lock_y_position: bool = false
@export_category("Camera transition")
@export var transition_speed: EntityManager.MOVEMENT_SPEED = EntityManager.MOVEMENT_SPEED.NORMAL
@export var is_instant: bool = false
@export var is_wait_transition: bool = false

@export var next_id: String

func emit_command() -> String:
	CameraManager.bind_camera_to_node(target_nodepath, lock_x_position, lock_y_position, is_instant, transition_speed)
	if is_wait_transition:
		await CameraManager.camera_transition_finished
	return next_id
