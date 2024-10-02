extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		if $"../../../../StaticBody3D2".Interact==0:
			$"../../../../StaticBody3D2".Interact=1
			$"../../../../../Control/Label".LabelText="Press E to talk"
		else:
			pass
		print("hit")
	else:
		print("not")
		$"../../../../../Control/Label".LabelText=" "
		$"../../../../StaticBody3D2".Interact=0
