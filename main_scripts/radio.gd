extends Node2D

var turned_on = false


var current_music: String = "Welcome to Locomotive Breath"
var unlocked_music: Array = ["Welcome to Locomotive Breath", "Outsider"]

func _ready() -> void:
	$radio_menu.visible = false

func _process(_delta):
	if turned_on:
		$anim.play("on")
		$canvas_layer/current_music_text.text = "Tocando agora: " + current_music
		$canvas_layer.visible = true
	else:
		$anim.play("off")
		$canvas_layer.visible = false

func _on_on_btn_pressed() -> void:
	if !turned_on: 
		turned_on = true
		MusicManager.play_music(current_music)
	else:
		$radio_menu.visible = !$radio_menu.visible
	AudioManager.play_button_sound()


func previous_music() -> void:
	var music_index = unlocked_music.find(current_music)
	if music_index != 0:
		MusicManager.play_music(unlocked_music[music_index-1])
		current_music = unlocked_music[music_index-1]
	else:
		MusicManager.play_music(unlocked_music[-1])
		current_music = unlocked_music[-1]
	AudioManager.play_button_sound()

func next_music() -> void:
	var music_index = unlocked_music.find(current_music)
	if music_index != len(unlocked_music)-1: # Verifica se não é a última música
		MusicManager.play_music(unlocked_music[music_index+1])
		current_music = unlocked_music[music_index+1]
	else:
		MusicManager.play_music(unlocked_music[0])
		current_music = unlocked_music[0]
	AudioManager.play_button_sound()


func _on_off_btn_pressed() -> void:
	turned_on = false
	$radio_menu.visible = false
	MusicManager.brute_stop(current_music)
	AudioManager.play_button_sound()
