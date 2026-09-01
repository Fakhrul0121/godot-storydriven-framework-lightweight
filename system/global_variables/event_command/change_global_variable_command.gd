class_name change_global_variable_command extends BaseEventCommand

@export var global_variable_id: String
@export_custom(PROPERTY_HINT_EXPRESSION, "") var expression_input: String


@export var next_id: String

func emit_command() -> String:
	var result = SystemLibrary.parse_expression(expression_input)
	
	GlobalVariables.global_variables[global_variable_id] = result
	
	return next_id
