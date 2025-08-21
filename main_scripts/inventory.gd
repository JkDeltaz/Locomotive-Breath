extends Node2D

var is_open = false
var player_inventory: Dictionary = {"canned_cow": 3,
								 "can_of_motivation": 1,
								 "catwo": 1,
								 "officer_mask": 1,
								"whip_whop": 1,
								"can_of_air": 1,
								"bufos": 1}

@onready var inventory_slots: Array = $GridContainer.get_children()

var item_selected: String

func _ready():
	add_item("can_of_motivation")

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		add_item("bufos")
	if Input.is_action_just_pressed("open_inv"):
		$openBtn.button_pressed = !$openBtn.button_pressed

func is_item_selected():
	if item_selected:
		return true
	return false

func get_selected_item():
	return item_selected

func set_selected_item(item: String):
	item_selected = item

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
				slot.add_item_to_slot(Items.get_item(item), player_inventory.get(item))
				break

func add_item(item: String):
	if player_inventory.has(item):
		player_inventory[item] += 1
	else:
		player_inventory[item] = 1
	sort_inventory()


func _on_open_btn_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$anim.play("slide_in")
	else:
		$anim.play("slide_out")
