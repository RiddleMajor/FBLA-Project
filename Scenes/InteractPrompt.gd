extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.promptvisible == 1:
		$".".visible = true
	if global.promptvisible == 0:
		$".".visible = false
