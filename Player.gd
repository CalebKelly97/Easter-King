extends KinematicBody2D

const TARGET_FPS = 60
const ACCELERATION = 25
const MAX_SPEED = 200
const FRICTION = 10
const AIR_RESISTANCE = 15
const GRAVITY = 20
const JUMP_FORCE = 400

var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var animationPlayer = $AnimatedSprite

func _ready():
	animationPlayer.play("Stand")

func _physics_process(delta):
	if animationPlayer.animation == "Teleport":
		pass
	else:
		var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		
		if x_input != 0:
			animationPlayer.play("Run")
			motion.x += x_input * ACCELERATION * delta * TARGET_FPS
			motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
			animationPlayer.flip_h = x_input < 0
		else:
			if animationPlayer.animation != "Teleport":
				animationPlayer.play("Stand")
		
		motion.y += GRAVITY * delta * TARGET_FPS
		
		if is_on_floor():
			if x_input == 0:
				motion.x = lerp(motion.x, 0, FRICTION * delta)
				
			if Input.is_action_just_pressed("Jump"):
				motion.y = -JUMP_FORCE
		else:
			animationPlayer.play("Jump")
			
			if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/2:
				motion.y = -JUMP_FORCE/2
			
			if x_input == 0:
				motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
		
		motion = move_and_slide(motion, Vector2.UP)
