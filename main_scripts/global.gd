extends Node

signal hour_passed
signal start_trading

var reputation = 0
var unlocked_characters: Array = ["flavina"]

@onready var file = "res://data/characters.json"
@onready var json_as_text = FileAccess.get_file_as_string(file)
@onready var character_dict = JSON.parse_string(json_as_text)

func get_random_character() -> Sprite2D:
	var character_name = unlocked_characters[randi() % len(unlocked_characters)]
	var character_path = character_dict.get(character_name).get("path")
	return load(character_path).instantiate()
