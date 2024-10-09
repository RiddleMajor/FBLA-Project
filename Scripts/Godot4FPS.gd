extends CharacterBody3D

const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $Neck
@onready var camera := $Neck/Camera3d
@export var speed := 5.0

#HeadBobbing Variables
const head_bob_sprinting_speed = 22.0
const head_bob_walking_speed = 14.0
const head_bob_crouching_speed = 10.0

const head_bob_crouching_intensity = 0.05
const head_bob_sprinting_intensity = 0.2
const head_bob_walking_intensity = 0.1

var head_bob_vector = Vector2.ZERO
var head_bob_index = 0.0
var head_bob_current_intensity = 0.0




var lerp_speed = 10.0

#States Machine
var walking := false
var sprinting := false

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
	
	#Get direction
	var input_dir = Input.get_vector("a", "d", "w", "s")
	
	if not is_on_floor():
		velocity.y -= (gravity * delta) + 0.1
		
	if Input.is_action_just_pressed("space") and is_on_floor():
		target_camera_y -= 0.3
		await get_tree().create_timer(0.1).timeout
		target_camera_y = original_camera_y
		velocity.y = JUMP_VELOCITY
		
	camera.position.y = lerp(camera.position.y, target_camera_y, 6.0 * delta)
	
	
	
	# Handle Headbob
	if sprinting:
		head_bob_current_intensity = head_bob_sprinting_intensity
		head_bob_index += head_bob_sprinting_speed * delta
	elif walking:
		head_bob_current_intensity = head_bob_walking_intensity
		head_bob_index += head_bob_walking_speed * delta
	
	
	if is_on_floor() && input_dir != Vector2.ZERO:
		head_bob_vector.y = sin(head_bob_index)
		head_bob_vector.x = sin(head_bob_index / 2) + 0.5
		
		neck.position.y = lerp(neck.position.y, head_bob_vector.y * (head_bob_current_intensity / 2.0), lerp_speed * delta)
		neck.position.x = lerp(neck.position.x, head_bob_vector.x * head_bob_current_intensity, lerp_speed * delta)
	else:
		neck.position.y = lerp(neck.position.y, 0.0, lerp_speed * delta)
		neck.position.x = lerp(neck.position.x, 0.0, lerp_speed * delta)
		
		
		
		
		
		
	if Input.is_action_pressed("shift"):
		speed = 6.5
		walking = false
		sprinting = true
	else:
		speed = 5
		walking = true
		sprinting = false
		
		
	if global.decisionmode == 0:
		walking = true
		sprinting = false
		var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.z = move_toward(velocity.z, 0, speed)
	
	
	
	
	
	
	
		move_and_slide()

