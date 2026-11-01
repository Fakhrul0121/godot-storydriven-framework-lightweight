extends Node

enum AUDIO_TYPE{
	BGM,
	BGS,
	SFX
}

var audio_types: Dictionary[AUDIO_TYPE, AudioStreamPlayer] = {
	AUDIO_TYPE.BGM: $AudioStreamBGM,
	AUDIO_TYPE.BGS: $AudioStreamBGS,
	AUDIO_TYPE.SFX: $AudioStreamSFX
}

func add_audio_stream(audio_stream: AudioStream, audio_type: AUDIO_TYPE, is_autoplay: bool, is_wait_until_finished: bool, tail_wait_time: float):
	#check if audio stream player is playing
	
	audio_types[audio_type].autoplay = is_autoplay
	
	#insert audio stream to the player
	audio_types[audio_type].stream = audio_stream
	if audio_type == AUDIO_TYPE.SFX && is_wait_until_finished:
		await audio_types[audio_type].finished
		await Engine.get_main_loop().create_timer(tail_wait_time).timeout
