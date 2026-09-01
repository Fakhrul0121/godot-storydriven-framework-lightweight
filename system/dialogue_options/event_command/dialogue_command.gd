class_name DialogueCommand extends BaseEventCommand

@export var character_name: String
@export_multiline() var dialogue: String

@export var next_id: String

func emit_command() -> String:
	await DialogueOptionsManager.dialogue_command(character_name, dialogue)
	return next_id
