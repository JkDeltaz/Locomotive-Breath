extends Sprite2D


var mouse_inside = false
var picked_up = false
@onready var origin_pos = position

func _process(_delta):
	if (Input.is_action_just_pressed("left_mouse") or Input.is_action_just_released("left_mouse")) and mouse_inside:
		picked_up = !picked_up
	
	if mouse_inside:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
	if picked_up:
		position = get_global_mouse_position()
	else:
		position = origin_pos

func _on_pick_up_mouse_entered() -> void:
	mouse_inside = true

func _on_pick_up_mouse_exited() -> void:
	mouse_inside = false
