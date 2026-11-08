extends Node

var manager_list: Dictionary[String, Node]

func _ready():
	set_manager_list()

func set_manager_list():
	for manager in get_tree().root.get_children():
		manager_list[manager.name] = manager

func parse_expression(code: String):
	var expression = Expression.new()
	var error = expression.parse(expression, manager_list.keys())
	
	assert(error == OK,"Parse error: %s" % expression.get_error_text())
	
	var result = expression.execute(manager_list.values(), self)
	
	assert(!expression.has_execute_failed(), "Parse error: %s" % expression.get_error_text())
	return result
