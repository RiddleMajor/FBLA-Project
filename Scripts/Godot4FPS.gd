extends CharacterBody3D

const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $Neck
@onready var camera := $Neck/Camera3d
@export var speed := 5.0


var target_camera_y: float
var original_camera_y: float  # To store the initial position

func _ready():
	original_camera_y = camera.position.y  # Save the initial Y position
	target_camera_y = camera.position.y  # Initialize target Y position
	
func _process(delta):
	if global.decisionmode == 1:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("esc"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= (gravity * delta) + 0.1
		
	if Input.is_action_just_pressed("space") and is_on_floor():
		target_camera_y -= 0.3
		await get_tree().create_timer(0.1).timeout
		target_camera_y = original_camera_y
		velocity.y = JUMP_VELOCITY
		
	camera.position.y = lerp(camera.position.y, target_camera_y, 6.0 * delta)
	
	if Input.is_action_pressed("shift"):
		speed = 6.5
	if Input.is_action_just_released("shift"):
		speed = 5
	if global.decisionmode == 0:
		var input_dir := Input.get_vector("a", "d", "w", "s")
		var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.z = move_toward(velocity.z, 0, speed)

		move_and_slide()

