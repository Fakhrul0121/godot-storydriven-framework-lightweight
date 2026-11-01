class_name OptionsManager extends MarginContainer

signal option_choosen(next_id)

func run_options(options_list: Dictionary[String, String]):
	for option in options_list:
		append_option(option, options_list[option])
	show()
	return await option_choosen
	
func append_option(option_text: String, next_id: String):
	var option_button = GameOptionButton.new(option_text, next_id)
	option_button.pressed.connect(option_pressed.bind(option_button.next_id))
	$VBoxContainer.add_child(option_button)

func option_pressed(next_id: String):
	#to do: also erase all the option in the UI
	hide()
	for child in $VBoxContainer.get_children():
		child.queue_free()
	option_choosen.emit(next_id)
