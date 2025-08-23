extends characterBase

var flavina_dialogue = preload("res://dialogues/flavina.dialogue") as Resource
var despawn = false

func _ready():
	super()
	main_offers = {"canned_cow": 100} # nome: raridade
	main_preferences = {"officer_mask": 100, "bufos": 90}
	disliked_items = {"catwo": 2} # nome: lealdade perdida
	prefered_position = Vector2(486, 271)
	info = Characters.get_info("flavina")
	money = info.get("money")
	patience = 3

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "walk_in" and not despawn:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/flavina.dialogue"), "start")
	elif anim_name == "walk_in" and despawn:
		queue_free()

func walk_out(_dialogue):
	$anim.play_backwards("walk_in")
	despawn = true
	Characters.set_current_character(null)
