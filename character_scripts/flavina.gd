extends characterBase

var flavina_dialogue = preload("res://dialogues/flavina.dialogue") as Resource

func _ready():
	super()
	main_offers = {"canned_cow": 100} # nome: raridade
	main_preferences = {"officer_mask": 100}
	disliked_items = {"catwo": 2} # nome: lealdade perdida
	prefered_position = Vector2(486, 271)
	info = Characters.get_info("flavina")
	money = info.get("money")
	patience = 3

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "walk_in":
		DialogueManager.show_dialogue_balloon(load("res://dialogues/flavina.dialogue"), "start")
