@abstract class_name BaseItemTrigger extends Resource

@export var triggered_event: GameEvent

func check_trigger_conditions() -> bool:
    return false