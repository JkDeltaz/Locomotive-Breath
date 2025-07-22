extends Node

var button_audio_list

func _ready():
	var button_dir = DirAccess.open("res://assets/audio/button_sounds/")
	button_audio_list = []
	if button_dir:
		button_dir.list_dir_begin()
		var file_name = button_dir.get_next()
		while file_name != "":
			if "import" not in file_name:
				var full_path = "res://assets/audio/button_sounds/" + file_name
				button_audio_list.append(full_path)
			file_name = button_dir.get_next()

func play_audio(audio_name, volume):
	if has_node(audio_name):
		get_node(audio_name).play()
		get_node(audio_name).volume_db = volume
	else:
		print("Audio não encontrado: ", audio_name)

func stop_audio(audio_name):
	if has_node(audio_name):
		get_node(audio_name).stop()
	else:
		print("Audio não encontrado: ", audio_name)


func play_button_sound():
	var audio_index = randi_range(0, len(button_audio_list)-1)
	var button_audio = button_audio_list[audio_index]
	get_node("button_sounds").stream = load(button_audio)
	get_node("button_sounds").play()
