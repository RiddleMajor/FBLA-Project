extends Area3D

@onready var interact := 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("e") and interact == 1:
		$"../AnimationPlayer".play("door open")


func _on_area_entered(area):
	interact = 1
	global.promptvisible = 1


func _on_area_exited(area):
	interact = 0
	global.promptvisible = 0
