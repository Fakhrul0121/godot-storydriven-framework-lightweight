extends Node

enum MOVEMENT_SPEED
{
	VERY_SLOW,
	SLOW,
	NORMAL,
	FAST,
	VERY_FAST
}

func move_entity_towards(component_path: NodePath, target_position: Vector2, target_node_path: NodePath, speed: MOVEMENT_SPEED, position_type: MoveEntityCommand.TARGET_POSITION_TYPE, distance_limit: float, animation: String, is_wait_until_finished: bool):
	var move_by_command_component: MoveByCommandComponent = get_node(component_path)
	if typeof(move_by_command_component) == typeof(MoveByCommandComponent):
		match position_type:
			MoveEntityCommand.TARGET_POSITION_TYPE.TILE_POSITION:
				target_position = MapManager.get_pixel_position_from_tile_position(target_position)
			MoveEntityCommand.TARGET_POSITION_TYPE.PIXEL_POSITION:
				target_position = target_position
			MoveEntityCommand.TARGET_POSITION_TYPE.NODE_POSITION:
				target_position = get_node(target_node_path).position
		await move_by_command_component.move_towards(target_position,speed,animation,distance_limit, is_wait_until_finished)
	else:
		assert(typeof(move_by_command_component) == typeof(MoveByCommandComponent), "Node is not MoveByCommandComponent type.")
