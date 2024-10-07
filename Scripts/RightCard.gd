extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Title.text = global.righttitle
	$Line1.text = global.right1
	$Line2.text = global.right2
	$Line3.text = global.right3
	$Line4.text = global.right4
	$Line5.text = global.right5
