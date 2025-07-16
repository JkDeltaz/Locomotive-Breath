extends Node

@onready var file = "res://data/items.json"
@onready var json_as_text = FileAccess.get_file_as_string(file)
@onready var item_dict = JSON.parse_string(json_as_text)

func get_item(item: String):
	return item_dict.get(item)
