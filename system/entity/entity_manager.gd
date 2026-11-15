extends Node

enum MOVEMENT_SPEED
{
	VERY_SLOW,
	SLOW,
	NORMAL,
	FAST,
	VERY_FAST
}

func move_entity_towards(component_path: NodePath, target_position: Vector2, speed: MOVEMENT_SPEED, position_type: MapManager.POSITION_TYPE, distance_limit: float, animation: String, is_wait_until_finished: bool):
	var move_by_command_component: MoveByCommandComponent = MapManager.get_node_from_node_path(component_path)
	if move_by_command_component is MoveByCommandComponent:
		target_position = MapManager.get_accurate_position[position_type].call(target_position)
		await move_by_command_component.move_towards(target_position,speed,animation,distance_limit, is_wait_until_finished)
	else:
		push_error("Node is not MoveByCommandComponent type.")

func ease_out_velocity(x: float) -> float:
	return sin((x * PI) / 2)
