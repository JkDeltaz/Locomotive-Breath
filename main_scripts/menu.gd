extends Node2D

func _ready():
	MusicManager.play_music("menu")

func _process(_delta):
	$camera.global_position = get_global_mouse_position()

func change_scene(scene) -> void:
	if scene == "play":
		get_tree().change_scene_to_file("res://main_scenes/main.tscn")
	else:
		print("Finge que tem tela de " + scene)
