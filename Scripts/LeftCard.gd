extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Title.text = global.lefttitle
	$Line1.text = global.left1
	$Line2.text = global.left2
	$Line3.text = global.left3
	$Line4.text = global.left4
	$Line5.text = global.left5
