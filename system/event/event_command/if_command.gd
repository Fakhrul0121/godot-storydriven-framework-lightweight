class_name IfCommand extends BaseEventCommand

@export_custom(PROPERTY_HINT_EXPRESSION, "") var expression: String

@export_category("next id")
@export var if_true: String
@export var if_false: String

func emit_command() -> String:
	var result = SystemLibrary.parse_expression(expression)
	
	assert(result is bool, "Parse error: the expression does not return boolean.")
	
	return if_true if result else if_false
