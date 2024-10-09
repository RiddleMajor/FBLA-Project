extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".scale.x = global.publicTotal*0.01
	$"../../PublicOpinion".text = str(global.publicTotal)
