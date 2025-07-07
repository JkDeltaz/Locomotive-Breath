extends Node2D


@export var current_character: Sprite2D
var currently_trading = false

func _ready():
	var file = "res://data/items.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	
	Global.connect("hour_passed", Callable(self, "spawn_character"))
	
	if json_as_dict:
		print(json_as_dict)

func _process(_delta):
	pass

func play_character_animation(animation):
	current_character.get_node("anim").play(animation)
