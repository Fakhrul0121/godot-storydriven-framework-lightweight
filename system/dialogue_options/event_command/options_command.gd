class_name OptionsCommand extends BaseEventCommand

@export var options: Dictionary[String, String]

func emit_command():
	return await DialogueOptionsManager.options_command(options)
