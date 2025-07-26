extends Node2D

var starting_item: String
var player_offer: String

@onready var item_sprite = $item/item_sprite
@onready var offer_sprite = $offer/offer_sprite

var item_info
var offer_info

func _ready():
	Global.connect("start_trading", Callable(self, "start"))
	$description.visible = false
	
	$trade_btn.visible = false

func start(character):
	starting_item = character.main_offers.keys()[0] # Depois deixar aleatório com peso baseado na preferência
	update_item(starting_item)

# PLAYER OFFER

func set_player_offer(item):
	player_offer = Items.item_dict.find_key(item)
	Characters.current_trade_item_dialogue(starting_item, player_offer)
	update_offer(player_offer)
	
	if Characters.check_player_offer(player_offer) == "accept":
		$trade_btn.visible = true
	else:
		$trade_btn.visible = false

func update_offer(item_name):
	if item_name == null:
		offer_sprite.texture = null
		return
	offer_info = Items.get_item(item_name)
	var texture_path = offer_info.get("path")
	
	
	offer_sprite.texture = load(texture_path)
	offer_sprite.scale = Vector2(offer_info.scale[0], offer_info.scale[1])


# CLIENT ITEM
var mouse_in_item: bool = false
func _on_item_mouse_area_mouse_entered() -> void:
	show_item_description()

func _on_item_mouse_area_mouse_exited() -> void:
	$description.visible = false

func _on_offer_mouse_area_mouse_entered() -> void:
	show_offer_description()

func _on_offer_mouse_area_mouse_exited() -> void:
	$description.visible = false

func show_item_description():
	if item_info:
		$description.visible = true
		Utils.growing_text($description/description_text, item_info.get("description"), 0.0001)
		$description/name_text.text = item_info.get("name")

func show_offer_description():
	if offer_info:
		$description.visible = true
		Utils.growing_text($description/description_text, offer_info.get("description"), 0.0001)
		$description/name_text.text = offer_info.get("name")

func update_item(item_name):
	if item_name == null:
		item_sprite.texture = null
		return
	
	item_info = Items.get_item(item_name)
	var texture_path = item_info.get("path")
	
		
	item_sprite.texture = load(texture_path)
	item_sprite.scale = Vector2(item_info.scale[0], item_info.scale[1])
	

# MISC

func clear_trading():
	player_offer = ""
	starting_item = ""
	item_info = {}
	offer_info = {}
	update_item(null)
	update_offer(null)
	$inventory._on_open_btn_toggled(false)
	$trade_btn.visible = false

func _on_trade_btn_pressed() -> void:
	Characters.completed_trade(player_offer)
	clear_trading()
