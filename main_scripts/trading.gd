extends Node2D

var starting_item: String

var file = "res://data/items.json"
@onready var json_as_text = FileAccess.get_file_as_string(file)
@onready var item_dict = JSON.parse_string(json_as_text)

@onready var item_sprite = $item/item_sprite
@onready var offer_sprite = $offer/offer_sprite

func _ready():
	Global.connect("start_trading", Callable(self, "start"))

func start(character):
	starting_item = character.main_offers.keys()[0]
	update_item(starting_item)

func update_item(item_name):
	var item_info = get_item(item_name)
	var texture_path = item_info.get("path")
	
	item_sprite.texture = load(texture_path)
	item_sprite.scale = Vector2(item_info.scale[0], item_info.scale[1])

func get_item(item_name):
	return item_dict.get(item_name)

var mouse_in_item: bool = false
func _on_item_mouse_area_mouse_entered() -> void:
	mouse_in_item = true
	show_item_description()

func _on_item_mouse_area_mouse_exited() -> void:
	mouse_in_item = false

func show_item_description():
	pass
