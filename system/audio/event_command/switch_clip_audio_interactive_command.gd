@tool
class_name SwitchClipAudioInteractiveCommand
extends BaseEventCommand

@export var audio_type: AudioManager.AUDIO_TYPE = AudioManager.AUDIO_TYPE.BGM

@export var clip_name: String

@export var next_id: String

func emit_command() -> String:
	AudioManager.switch_clip_audio_interactive(audio_type,clip_name)
	return next_id
