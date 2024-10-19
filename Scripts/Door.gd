extends Area3D
var doorclosed = 0
@onready var interact := 0

func _ready():
	doorclosed = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("e") and interact == 1 and doorclosed == 0:
		$"../AnimationPlayer".play("door open")
		await get_tree().create_timer(1.5).timeout
		doorclosed = 1
	if Input.is_action_pressed("e") and interact == 1 and doorclosed == 1:
		$"../AnimationPlayer".play("door close")
		await get_tree().create_timer(1.5).timeout
		doorclosed = 0



func _on_area_entered(area):
	interact = 1
	global.promptvisible = 1


func _on_area_exited(area):
	interact = 0
	global.promptvisible = 0
