extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.leftclicked == 1:
		$".".text = "You Chose Hamburger"
	if global.rightclicked == 1:
		$".".text = "You Chose Pizza"
