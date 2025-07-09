extends Panel

var item_dict: Dictionary = {}
var current_item: String = ""
var item_scale: Array
var texture = Texture.new()

var item_counter = 0

func _ready():
	pass
	#$sprite.scale = Vector2(item_scale[0], item_scale[1])

func add_item_to_slot(item: Dictionary, amount):
	item_counter += amount
	
	item_dict = item
	current_item = item_dict.name
	item_scale = item_dict.scale
	
	$sprite.texture = load(item_dict.path)
	update_counter()

func clear_item():
	item_dict = {}
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
