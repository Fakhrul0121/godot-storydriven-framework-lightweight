class_name DialogueManager extends MarginContainer

@onready var character_name_textbox = $VBoxContainer/CharacterName
@onready var dialogue_textbox = $VBoxContainer/Dialogue

@export var typewriter_timer: float = .5

var is_typewriting: bool = false
var is_text_displayed: bool = false

signal is_moving_to_next

func run_dialogue(character_name: String, dialogue: String):
	character_name_textbox.text = character_name
	await show_dialogue(dialogue)
	await is_moving_to_next
	
	#if next isn't dialogue then fade out dialogue box

func _input(event: InputEvent) -> void:
	if is_typewriting:
		if event.is_action_just_pressed("ui_accept"):
			dialogue_textbox.visible_characters = -1
	if is_text_displayed:
		if event.is_action_just_pressed("ui_accept"):
			move_to_next()

func move_to_next():
	is_moving_to_next.emit()
	is_text_displayed = false

func show_dialogue(raw_dialogue: String):
	dialogue_textbox.text = parse_variables_in_dialogue(raw_dialogue)
	dialogue_textbox.visible_characters = 0
	var dialogue_character_count = dialogue_textbox.text.length()
	is_typewriting = true
	# typewriter effect happening here
	while dialogue_textbox.visible_characters < (dialogue_character_count+1) or dialogue_textbox.visible_characters != -1:
		await get_tree().create_timer(typewriter_timer).timeout
		dialogue_textbox.visible_characters += 1
	is_typewriting = false
	is_text_displayed = true

func parse_variables_in_dialogue(raw_dialogue: String) -> String:
	var regex = RegEx.new()
	regex.compile("\\{([^\\}]+)\\}")
	
	var regex_matches = regex.search_all(raw_dialogue)
	var parse_text = raw_dialogue
	
	for regex_match: RegExMatch in regex_matches:
		var result = SystemLibrary.parse_expression(regex_match.get_strings()[1])
		parse_text = parse_text.replace(regex_match.get_strings()[0],str(result))
	return parse_text
