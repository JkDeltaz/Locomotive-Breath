extends Node2D

func _ready():
	MusicManager.play_music("menu")

func _process(_delta):
	$camera.global_position = get_global_mouse_position()

func change_scene() -> void:
	get_tree().change_scene_to_file("res://main_scenes/main.tscn")
