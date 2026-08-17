extends Node

@export var dialogue_textbox: RichTextLabel
@export var character_name_textbox: Label
@export var typewriter_timer: float = .5

var is_typewriting: bool = false
var is_text_displayed: bool = false

signal is_moving_to_next

var event_command_list : Dictionary[String, Callable] = {
	"dialogue_command": dialogue_command,
}

func get_event_command_operation_list():
	return event_command_list

func dialogue_command(event_command_data: Dictionary):
	# fade in dialogue box
	await show_dialogue(event_command_data["dialogue"])
	await is_moving_to_next
	# if next isn't dialogue then fade out dialogue box
	return event_command_data["next"]

func _unhandled_input(event: InputEvent) -> void:
	if is_typewriting:
		if event is InputEventMouseButton:
			if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
				dialogue_textbox.visible_characters = -1
	if is_text_displayed:
		if event is InputEventMouseButton:
			if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
					move_to_next()
		elif event.is_action_pressed("ui_accept"):
			move_to_next()

func move_to_next():
	is_moving_to_next.emit()
	is_text_displayed = false

func show_dialogue(dialogue: String):
	dialogue_textbox.visible_characters = 0
	var dialogue_character_count = dialogue.length()
	is_typewriting = true
	# typewriter effect happening here
	while dialogue_textbox.visible_characters < (dialogue_character_count+1) or dialogue_textbox.visible_characters != -1:
		await get_tree().create_timer(typewriter_timer).timeout
		dialogue_textbox.visible_characters += 1
	is_typewriting = false
	is_text_displayed = true
