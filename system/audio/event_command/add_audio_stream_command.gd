@tool
class_name AddAudioStreamCommand
extends BaseEventCommand

@export var audio_stream: AudioStream

@export var next_id: String

@export var audio_type: AudioManager.AUDIO_TYPE = AudioManager.AUDIO_TYPE.BGM:
	set(value):
		audio_type = value
		notify_property_list_changed()

@export var is_autoplay: bool

@export var is_wait_until_sfx_finished: bool = false

@export_range(0, 10) var tail_wait_time: float = 0

func _validate_property(property: Dictionary) -> void:
	#do something here
	if audio_type == AudioManager.AUDIO_TYPE.SFX:
		if !is_autoplay:
			if property.name == "is_wait_until_sfx_finished": property.usage = PROPERTY_USAGE_NO_EDITOR
	else:
		is_autoplay = false
		if property.name == "is_autoplay": property.usage = PROPERTY_USAGE_NO_EDITOR
		if property.name == "is_wait_until_sfx_finished": property.usage = PROPERTY_USAGE_NO_EDITOR
	pass

func emit_command() -> String:
	await AudioManager.add_audio_stream(audio_stream, audio_type, is_autoplay, is_wait_until_sfx_finished, tail_wait_time)
	return next_id
