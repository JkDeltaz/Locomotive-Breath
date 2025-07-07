extends Sprite2D


var mouse_inside = false
var picked_up = false
@onready var origin_pos = global_position

var locked_position = false

func _ready():
	$pick_up.connect("area_entered", Callable(self, "entered"))

func _process(_delta):
	
	if (Input.is_action_just_pressed("left_mouse") or Input.is_action_just_released("left_mouse")) and mouse_inside:
		picked_up = !picked_up
	
	
	if Input.is_action_just_released("left_mouse"):
		var area = $pick_up.get_overlapping_areas()
		if area and not picked_up: 
			locked_position = true
			global_position = area[0].get_node("player_offer_pos").global_position
		elif area:
			locked_position = false
			area[0].get_node("collision").set_deferred("disabled", false)
		else:
			locked_position = false
	
	if mouse_inside:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
	if picked_up:
		global_position = get_global_mouse_position()
	elif not locked_position:
		global_position = origin_pos

func _on_pick_up_mouse_entered() -> void:
	mouse_inside = true
	DialogueManager.show_dialogue_balloon(load("res://dialogues/purple.dialogue"), get_parent().current_offer)

func _on_pick_up_mouse_exited() -> void:
	mouse_inside = false
