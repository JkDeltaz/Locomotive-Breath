extends Node

var current_music: AudioStreamPlayer
var current_volume = 0.7

var tween: Tween

func play_music(music_name: String):
	music_name = music_name.to_lower()
	if has_node(music_name):
		var old_music = current_music
		current_music = get_node(music_name)
		await fade_out(old_music)
		fade_in(get_node(music_name))
	else:
		print("Música não encontrada: " + music_name)

func brute_stop(music_name):
	music_name = music_name.to_lower()
	if has_node(music_name):
		get_node(music_name).stop()
	else:
		print("Música não encontrada: " + music_name)

func fade_in(music: AudioStreamPlayer):
	music.volume_db = -60
	music.play()
	
	tween = create_tween()
	tween.tween_property(music, "volume_db", current_volume, 3.0)


func fade_out(music: AudioStreamPlayer):
	
	if not music:
		return
	
	
	music.volume_db = current_volume
	
	tween = create_tween()
	tween.tween_property(music, "volume_db", -80, 2.0)
	await tween.finished
	music.stop()
