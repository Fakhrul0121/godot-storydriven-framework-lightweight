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
	pass

func emit_command() -> String:
	await AudioManager.add_audio_stream(audio_stream, audio_type, is_autoplay, is_wait_until_sfx_finished, tail_wait_time)
	return next_id
