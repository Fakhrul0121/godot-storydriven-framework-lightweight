class_name DialogueCommand extends BaseEventCommand

@export var character_name: String
@export_multiline() var dialogue: String

@export var next_id: String
@export var bypass_next_command_check: bool = false

func emit_command() -> String:
	await DialogueOptionsManager.check_dialogue_box_visibility()
	await DialogueOptionsManager.dialogue_command(character_name, dialogue)
	if !bypass_next_command_check:
		await DialogueOptionsManager.check_next_command(next_id)
	return next_id
