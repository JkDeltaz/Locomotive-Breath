extends Node

var unlocked_characters: Array = ["flavina"]

var current_character

@onready var file = "res://data/characters.json"
@onready var json_as_text = FileAccess.get_file_as_string(file)
@onready var character_dict = JSON.parse_string(json_as_text)

func get_random_character() -> Sprite2D:
	var character_name = unlocked_characters[randi() % len(unlocked_characters)]
	var character_path = character_dict.get(character_name).get("path")
	return load(character_path).instantiate()

func get_info(character_name):
	return character_dict.get(character_name)

func set_current_character(character):
	current_character = character

func current_trade_item_dialogue(item):
	
	var character_name = current_character.get_name()
	
	var item_rating = current_character.get_main_preferences().get(item)
	if item_rating == 100:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/"+character_name+".dialogue"), "offered_prefered_item")
	else:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/"+character_name+".dialogue"), "offered_disliked_item")
		
