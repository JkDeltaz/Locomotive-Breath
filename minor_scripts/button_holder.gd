extends Sprite2D

@onready var playBtn = $playBtn
@onready var optionsBtn = $optionsBtn
@onready var achievementsBtn = $achievementsBtn
@onready var exitBtn = $exitBtn

@onready var menu = get_tree().current_scene

func _ready():
	playBtn.position = Vector2(113.3, -540)
	optionsBtn.position = Vector2(103.3, -323.3)
	achievementsBtn.position = Vector2(93.333, -96.6)
	exitBtn.position = Vector2(90, 210)
	
	for button in get_children():
		button.mouse_entered.connect(hover_button.bind(button))
		button.pressed.connect(button_pressed.bind(button))
		button.mouse_exited.connect(exited_button.bind(button))

func _process(_delta):
	for button in get_children():
		pass

func hover_button(button):
	button.scale = Vector2(1.05, 1.05)

func exited_button(button):
	button.scale = Vector2(1, 1)

func button_pressed(button):
	
	AudioManager.play_audio("menu_btn", 2)
	
	var x_position = button.position.x
	var y_position = button.position.y
	var push = Vector2(x_position - 30, y_position)
	var pull = Vector2(x_position + 100, y_position)
	
	var push_tween = create_tween()
	push_tween.tween_property(button, "position", push, 0.15)
	await push_tween.finished
	var pull_tween = create_tween()
	pull_tween.tween_property(button, "position", pull, 0.08)
	await pull_tween.finished
	menu.change_scene()
