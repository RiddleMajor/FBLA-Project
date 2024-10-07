extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	global.leftclicked = 1
	$"../..".visible = false
	$"../../../RightCard".visible = false
	$"../../../../World/Player".decisionmode = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
