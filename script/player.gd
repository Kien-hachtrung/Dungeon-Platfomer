extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -300
var double_jump = 2
var died = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var jump_particle: CPUParticles2D = $JumpParticle
@onready var camera_2d: Camera2D = $Camera2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		double_jump = 2
	
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		double_jump = 1
	# handling coyote time
	elif Input.is_action_just_pressed("jump") and !coyote_timer.is_stopped():
		velocity.y = JUMP_VELOCITY
		double_jump = 1
	# handling double_jump
	if Input.is_action_just_pressed("jump") and double_jump == 1 and !is_on_floor() and coyote_timer.is_stopped():
		velocity.y = JUMP_VELOCITY
		jump_particle.restart()
		double_jump = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	#input direction(1 or -1)
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	#play anim
	if not died:
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("default")
			else:
				animated_sprite.play("run")
		else:
			animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var was_on_floor = is_on_floor()
	
	if not died:
		move_and_slide()
	
	if was_on_floor and !is_on_floor():
		coyote_timer.start()
#handle dying animation
func play_animation():
	died = true
	animated_sprite.play("died")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Zoom_out"):
		camera_2d.zoom = Vector2(2.0,2.0)
	elif Input.is_action_just_released("Zoom_out"):
		camera_2d.zoom = Vector2(4.0,4.0)
