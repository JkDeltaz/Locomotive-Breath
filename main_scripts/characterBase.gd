extends Node
class_name characterBase


# Chave: Oferta, Valor: Raridade
var main_offers: Dictionary
var main_preferences: Dictionary
var prefered_position = Vector2()

@onready var main_scene = get_tree().current_scene

func get_prefered_position():
	return prefered_position
