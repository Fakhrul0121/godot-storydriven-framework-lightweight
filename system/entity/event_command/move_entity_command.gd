@tool
class_name MoveEntityCommand
extends BaseEventCommand

enum TARGET_POSITION_TYPE{
	TILE_POSITION,
	PIXEL_POSITION,
	NODE_POSITION
}

@export var move_by_command_component_path: NodePath
@export var movement_speed: EntityManager.MOVEMENT_SPEED
@export var target_position_type: TARGET_POSITION_TYPE = TARGET_POSITION_TYPE.TILE_POSITION:
	set(value):
		target_position_type = value
		notify_property_list_changed()

@export var target_tile_position: Vector2
@export var target_pixel_position: Vector2
@export var target_node: NodePath

@export_range(0.1, 100) var distance_limit_by_pixel: float = 4
@export var animation: String


@export var next_state: String
@export var is_wait_until_completion: bool = true

func _validate_property(property: Dictionary) -> void:
	#there's gonna be a cleaner way to implement this
	match target_position_type:
		TARGET_POSITION_TYPE.TILE_POSITION:
			if property.name == "target_pixel_position": property.usage = PROPERTY_USAGE_NO_EDITOR
			if property.name == "target_node": property.usage = PROPERTY_USAGE_NO_EDITOR
		TARGET_POSITION_TYPE.PIXEL_POSITION:
			if property.name == "target_tile_position": property.usage = PROPERTY_USAGE_NO_EDITOR
			if property.name == "target_node": property.usage = PROPERTY_USAGE_NO_EDITOR
		TARGET_POSITION_TYPE.NODE_POSITION:
			if property.name == "target_pixel_position": property.usage = PROPERTY_USAGE_NO_EDITOR
			if property.name == "target_tile_position": property.usage = PROPERTY_USAGE_NO_EDITOR

func emit_command() -> String:
	await EntityManager.move_entity_towards(
		move_by_command_component_path,
		target_tile_position if target_position_type == TARGET_POSITION_TYPE.TILE_POSITION else target_pixel_position,
		target_node,
		movement_speed,
		target_position_type,
		distance_limit_by_pixel,
		animation,
		is_wait_until_completion
		)
	return next_state
