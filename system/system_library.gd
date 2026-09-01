extends Node

var system_list: Dictionary[String, Node]

func _ready():
	set_system_list()

func set_system_list():
	for system in get_tree().root.get_children():
		system_list[system.name] = system

func parse_expression(code: String):
	var expression = Expression.new()
	var error = expression.parse(expression, system_list.keys())
	
	assert(error == OK,"Parse error: %s" % expression.get_error_text())
	
	var result = expression.execute(system_list.values(), self)
	
	assert(!expression.has_execute_failed(), "Parse error: %s" % expression.get_error_text())
	return result
