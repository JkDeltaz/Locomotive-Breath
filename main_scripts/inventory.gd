extends Node2D

var is_open = false
var player_inventory: Dictionary = {"canned_cow": 3}

@onready var inventory_slots: Array = $GridContainer.get_children()

@onready var file = "res://data/items.json"
@onready var json_as_text = FileAccess.get_file_as_string(file)
@onready var item_dict = JSON.parse_string(json_as_text)

func _ready():
	add_item("can_of_motivation")

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		add_item("catwo")

func clear_slots():
	for slot in inventory_slots:
		slot.clear_item()

func sort_inventory():
	clear_slots()
	
	for item in player_inventory:
		for slot in inventory_slots:
			if slot.get_current_item() == item:
				slot.add_more(player_inventory.get(item))
				break
			if slot.is_empty():
				slot.add_item_to_slot(get_item(item), player_inventory.get(item))
				break

func add_item(item: String):
	if player_inventory.has(item):
		player_inventory[item] += 1
	else:
		player_inventory[item] = 1
	sort_inventory()

func get_item(item: String):
	return item_dict.get(item)

func _on_open_btn_pressed() -> void:
	if is_open:
		$anim.play("slide_out")
		is_open = false
	else:
		$anim.play("slide_in")
		is_open = true
