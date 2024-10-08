extends Area3D

@onready var interact = 0
@export var path := "res://Dialogue/dialogue test.dialogue"
@export var title := "test"

@export var left_line1 := " "
@export var left_line2 := " "
@export var left_line3 := " "
@export var left_line4 := " "
@export var left_line5 := " "
@export var left_title := " "
@export var right_line1 := " "
@export var right_line2 := " "
@export var right_line3 := " "
@export var right_line4 := " "
@export var right_line5 := " "
@export var right_title := " "
@export var signalname := ""

func _ready():
	pass
func _process(delta):
	if Input.is_action_pressed("e") and interact == 1:
		global.promptvisible = 0
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/reset.dialogue"), "reset")
		DialogueManager.show_dialogue_balloon(load(path), title)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		reset()
	if global.signalname == signalname:
		$"../../Control/LeftCard".visible = true
		$"../../Control/RightCard".visible = true
		global.left1 = left_line1
		global.left2 = left_line2
		global.left3 = left_line3
		global.left4 = left_line4
		global.left5 = left_line5
		global.lefttitle = left_title
		global.right1 = right_line1
		global.right2 = right_line2
		global.right3 = right_line3
		global.right4 = right_line4
		global.right5 = right_line5
		global.righttitle = right_title
		global.decisionmode = 1


func reset():
	interact = 0
	await get_tree().create_timer(0.1).timeout
	interact = 1
	global.promptvisible = 1


func _on_area_entered(area):
	interact = 1
	global.promptvisible = 1


func _on_area_exited(area):
	interact = 0
	global.promptvisible = 0
