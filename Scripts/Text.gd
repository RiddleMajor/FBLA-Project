extends Label

@export var LabelText := " "
# Called when the node enters the scene tree for the first time.
func _ready():
	display()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".text=LabelText

func display():
	$".".text=LabelText
