class_name OptionsCommand extends BaseEventCommand

@export var options: Dictionary[String, String]

@export var bypass_next_command_check: bool = false

func emit_command():
	await DialogueOptionsManager.check_dialogue_box_visibility()
	var next_id = await DialogueOptionsManager.options_command(options)
	if !bypass_next_command_check:
		await DialogueOptionsManager.check_next_command(next_id)
	return next_id
