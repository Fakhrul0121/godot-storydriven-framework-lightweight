extends Node

enum AUDIO_TYPE{
	BGM,
	BGS,
	SFX,
	UI
}

var audio_stream_types: Dictionary[AUDIO_TYPE, AudioStreamPlayer] = {
	AUDIO_TYPE.BGM: $AudioStreamBGM,
	AUDIO_TYPE.BGS: $AudioStreamBGS,
	AUDIO_TYPE.SFX: $AudioStreamSFX,
	AUDIO_TYPE.UI: $AudioStreamUI
}

func add_audio_stream(audio_stream: AudioStream, audio_type: AUDIO_TYPE, is_autoplay: bool, is_wait_until_finished: bool = false, tail_wait_time: float = 0):
	#check if audio stream player is playing
	audio_stream_types[audio_type].autoplay = is_autoplay
	#insert audio stream to the player
	audio_stream_types[audio_type].stream = audio_stream
	if is_wait_until_finished:
		await audio_stream_types[audio_type].finished
		await Engine.get_main_loop().create_timer(tail_wait_time).timeout

func play_audio_stream(audio_type: AUDIO_TYPE, fade_in_time: float):
	audio_stream_types[audio_type].play()
	audio_stream_types[audio_type].volume_db = -80.0
	var tween = create_tween()
	tween.tween_property(audio_stream_types[audio_type], "volume_db", 0.0, fade_in_time)

func stop_audio_stream(audio_type: AUDIO_TYPE, fade_out_time: float):
	audio_stream_types[audio_type].volume_db = 0
	var tween = create_tween()
	tween.tween_property(audio_stream_types[audio_type], "volume_db", -80.0, fade_out_time)
	await tween.finished
	audio_stream_types[audio_type].stop()

func switch_clip_audio_interactive(audio_type: AUDIO_TYPE, clip_name: String):
	var playback: AudioStreamPlaybackInteractive = audio_stream_types[audio_type].get_stream_playback()
	playback.switch_to_clip_by_name(clip_name)
