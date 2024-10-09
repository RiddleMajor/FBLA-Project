extends Area3D

@onready var interact = 0
@export var path := "res://Dialogue/dialogue test.dialogue"
@export var title := "test"

func _ready():
	pass


func _process(delta):
	if Input.is_action_pressed("e") and interact == 1:
		global.promptvisible = 0
		DialogueManager.show_dialogue_balloon(load(path), title)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		reset()


func reset():
	interact = 0
	await get_tree().create_timer(0.1).timeout
	interact = 1
	global.promptvisible = 1


func _on_area_entered(area):
	interact = 1
	global.promptvisible = 1


func _on_area_exited(area):
	interact = 0
	global.promptvisible = 0
