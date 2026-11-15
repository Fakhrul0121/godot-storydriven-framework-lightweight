class_name LocationItemTrigger extends BaseItemTrigger

@export_category("Location Trigger Conditions")
@export var target_map: PackedScene:
    set(value):
        target_map = value
        target_map_name = str(value.get_state().get_node_name(0)) if target_map != null else ""
var target_map_name: String
@export var target_area: NodePath
@export_group("Player facing direction")
@export var is_check_facing_up: bool = false
@export var is_check_facing_down: bool = false
@export var is_check_facing_left: bool = false
@export var is_check_facing_right: bool = false

func check_trigger_conditions() -> bool:
    if check_map_trigger_conditions():
        return true
    return false

func check_map_trigger_conditions() -> bool:
    var current_map_name = MapManager.current_game_map.name
    return target_map_name == current_map_name

func check_area_trigger_conditions() -> bool:
    ## Check if the player is in the target area
    return true

func check_facing_trigger_conditions() -> bool:
    ## Check if the player is facing the correct direction
    return true