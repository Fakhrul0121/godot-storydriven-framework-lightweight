extends Node

@onready var dialogue_manager: DialogueManager = $DialogueOptionsUI/BackgroundContainer/DialogueContainer
@onready var options_manager: OptionsManager = $DialogueOptionsUI/BackgroundContainer/OptionsContainer
@onready var character_potrait_manager: CharacterPotraitManager = $DialogueOptionsUI/CharacterPotrait
@onready var background_box = $DialogueOptionsUI/BackgroundContainer

const FADE_TIME = 1.0

var is_typewriting: bool = false
var is_text_displayed: bool = false

signal is_moving_to_next

func options_command(options: Dictionary[String, String]):
	dialogue_manager.visible = false
	options_manager.visible = true
	return await options_manager.run_options(options)

func dialogue_command(character_name: String, dialogue: String):
	if background_box.modulate.a < 1.0:
		await fade_dialogue_box(true)
	dialogue_manager.visible = true
	options_manager.visible = false
	await dialogue_manager.run_dialogue(character_name, dialogue)

func fade_dialogue_box(fade_in: bool):
	var tween = create_tween()
	tween.tween_property(background_box, "modulate:a", float(fade_in), FADE_TIME)
	await tween.finished

func potrait_command():
	pass
