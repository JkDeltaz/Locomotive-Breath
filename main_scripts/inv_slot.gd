extends Panel

var item_info: Dictionary = {}
var current_item: String = ""
var item_scale: Array
var texture = Texture.new()

@onready var trading = get_parent().get_parent().get_parent()
@onready var inventory = get_parent().get_parent()


var item_counter: int = 0

var selected: bool = false

func _ready():
	$description.visible = false
	$selectBtn.button_group = load("res://resources/inventory_slot_button.tres")

func _process(_delta):
	$description/tradeBtn.global_position = $description/Marker2D.global_position
	
	var show_trade = get_tree().current_scene.get("character_in_screen")
	$description/tradeBtn.visible = show_trade

func add_item_to_slot(item: Dictionary, amount):
	item_counter += amount
	
	item_info = item
	current_item = item_info.name
	item_scale = item_info.scale
	
	$sprite.texture = load(item_info.path)
	if current_item == "Bufos":
		$sprite.scale = Vector2(item_scale[0], item_scale[1])
	update_counter()

func clear_item():
	item_info = {}
	current_item = ""
	item_scale = [1, 1]
	$sprite.texture = null
	item_counter = 0
	$counter.visible = false
	

func add_more(amount):
	item_counter += amount

func update_counter():
	if item_counter > 1:
		$counter.visible = true
		$counter.text = str(item_counter)

func get_current_item():
	return current_item


func is_empty() -> bool:
	if item_counter > 0:
		return false
	return true

var mouse_inside = false

var invert_description = [3, 4, 7, 8, 11, 12, 15, 16]
var right_margin = [2, 6, 10, 14]
var applied_margin = false

func show_item_description():
	if not item_info:
		return
	
	$description.visible = true
	Utils.growing_text($description/description_text, item_info.get("description"), 0.01)
	$description/name_text.text = item_info.get("name")
	$sprite.scale *= 1.4
	
	#$description/item_name_background.size.x = len(item_info.get("name"))*12.1
	
	var self_index = get_parent().get_children().find(self)+1
	if self_index in invert_description and $description.position.x > 0:
		$description.position.x *= -1
		$description.position.x += 10
	
	if self_index in right_margin and !applied_margin:
		$description.position.x -= 10
		applied_margin = true

func hide_item_description():
	$description.visible = false
	$sprite.scale *= (1/1.4)

func _on_select_btn_toggled(toggled_on: bool) -> void:
	selected = toggled_on
	
	if toggled_on:
		show_item_description()
	else:
		hide_item_description()
	
	inventory.set_selected_item(current_item)

func _on_trade_btn_pressed() -> void:
	trading.set_player_offer(item_info)
	AudioManager.play_audio("new_offer", 1)
