extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		if $"../../../../../Enviroment/StaticBody3D2".Interact==0:
			$"../../../../../Enviroment/StaticBody3D2".Interact=1

		else:
			pass
		print("hit")
	else:
		print("not")
		$"../../../../../Enviroment/StaticBody3D2".Interact=0
