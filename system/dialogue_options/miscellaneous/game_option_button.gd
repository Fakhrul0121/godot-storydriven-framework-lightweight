class_name GameOptionButton extends Button

var next_id: String

func _init(option_text: String, next_id: String):
	text = option_text
	self.next_id = next_id
	alignment = HORIZONTAL_ALIGNMENT_LEFT
	flat = true
	pass
