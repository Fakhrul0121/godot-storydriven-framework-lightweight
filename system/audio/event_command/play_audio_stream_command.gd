@tool
class_name PlayAudioStreamCommand
extends BaseEventCommand

@export var fade_in_time: float = 0

@export var audio_type: AudioManager.AUDIO_TYPE = AudioManager.AUDIO_TYPE.BGM

@export var next_id: String

func emit_command() -> String:
	return next_id
