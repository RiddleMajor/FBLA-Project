extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	global.rightclicked = 1
	$"../..".visible = false
	$"../../../LeftCard".visible = false
	global.decisionmode = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	global.signalname = " "
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	await get_tree().create_timer(0.01).timeout
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	global.econTotal += global.ReChange
	global.foreignTotal += global.RfChange
	global.publicTotal += global.RpChange
	print(global.publicTotal)
	print(global.foreignTotal)
	print(global.econTotal)

