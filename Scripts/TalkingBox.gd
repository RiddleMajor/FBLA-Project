extends Area3D

@onready var interact = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("e") and interact == 1:
		$"../../../../Control/InteractPrompt".visible = false
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/dialogue test.dialogue"), "test")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		reset()

func reset():
	interact = 0
	await get_tree().create_timer(0.1).timeout
	interact = 1
	$"../../../../Control/InteractPrompt".visible = true

func _on_area_entered(area):
	interact = 1
	$"../../../../Control/InteractPrompt".visible = true


func _on_area_exited(area):
	interact = 0
	$"../../../../Control/InteractPrompt".visible = false
