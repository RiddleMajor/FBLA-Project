extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".scale.x = global.foreignTotal*0.01
	$"../../ForeignOpinion".text = str(global.foreignTotal)
