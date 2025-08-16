extends Node2D

signal transition_finished

func _ready():
	connect("transition_finished", Callable(Global, "transition_finished"))

func play(type, speed_scale):
	$anim.speed_scale = speed_scale
	if type == "fade_in" or type == "fade_out":
		$anim.play(type)
	else:
		print("Tipo de transição não encontrada: " + str(type))

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		emit_signal("transition_finished")
	queue_free()
