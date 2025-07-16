extends Node2D


var current_character: Sprite2D
var currently_trading = false

var character_in_screen = false
var character = characterBase

func _ready():
	Global.connect("hour_passed", Callable(self, "spawn_character"))
	spawn_character()

func _process(_delta):
	pass

func play_character_animation(animation):
	current_character.play_animation(animation)

func spawn_character():
	if character_in_screen:
		return
	current_character = Characters.get_random_character()
	Characters.set_current_character(current_character)
	character_in_screen = true
	
	add_child(current_character)
	current_character.global_position = current_character.get_prefered_position()
	move_child(current_character, 2)
	Global.emit_signal("start_trading", current_character)
