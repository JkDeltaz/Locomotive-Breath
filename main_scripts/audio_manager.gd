extends Node

func play_audio(audio_name, volume):
	get_node(audio_name).play()
