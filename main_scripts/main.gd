extends Node2D


var current_character: Sprite2D
var currently_trading = false

var character_in_screen = false
var character = characterBase

var characters_spawned_today = 0

func _ready():
	#Global.connect("hour_passed", Callable(self, "spawn_character"))
	spawn_character()
	MusicManager.play_music("winds")

func _process(_delta):
	pass

func play_character_animation(animation):
	if current_character == null:
		print("Não dá pra botar a animação porque o personagem é null!")
		return
	current_character.play_animation(animation)


func hour_passed():
	pass

func spawn_character():
	if character_in_screen:
		return
	current_character = Characters.get_random_character()
	Characters.set_current_character(current_character)
	character_in_screen = true
	
	add_child(current_character)
	current_character.global_position = current_character.get_prefered_position()
	move_child(current_character, 3)
	Global.emit_signal("start_trading", current_character)
	characters_spawned_today += 1

func despawn_character():
	current_character = null
	character_in_screen = false
	currently_trading = false
