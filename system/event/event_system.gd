extends Node

var _current_event = {}
var _current_event_command_id: String

var _event_command_operation_list: Dictionary[String, Callable] = {
	"if_command" : if_command,
	
}

func _ready() -> void:
	_get_all_command_list()
	
func _get_all_command_list() -> void:
	for system in get_tree().root.get_children():
		if system.has_method("get_event_command_operation_list"):
			_event_command_operation_list.merge(system.get_event_command_operation_list())
			

func start_event(event: Dictionary):
	_current_event = event
	_current_event_command_id = "1"
	while _current_event_command_id != "0":
		var current_event_command = _current_event[_current_event_command_id]
		var current_event_command_operation: Callable = _event_command_operation_list[current_event_command["command_name"]]
		_current_event_command_id = await current_event_command_operation.call(current_event_command["data"])
	

## Flow control
## If else
func if_command(data: Dictionary):
	
	pass
