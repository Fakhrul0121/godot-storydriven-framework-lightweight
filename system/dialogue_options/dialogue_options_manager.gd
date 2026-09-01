extends Node

@onready var dialogue_manager: DialogueManager = $DialogueOptionsUI/BackgroundContainer/DialogueContainer
@onready var options_manager: OptionsManager = $DialogueOptionsUI/BackgroundContainer/OptionsContainer
@onready var character_bust_manager: CharacterBustManager = $DialogueOptionsUI/CharacterBust

var is_typewriting: bool = false
var is_text_displayed: bool = false

signal is_moving_to_next

func options_command(options: Dictionary[String, String]):
	return await options_manager.run_options(options)

func dialogue_command(character_name: String, dialogue: String):
	#fade in dialogue box
	await dialogue_manager.run_dialogue(character_name, dialogue)

func bust_command():
	pass
