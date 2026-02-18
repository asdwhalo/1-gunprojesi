extends CharacterBody2D

@onready var obstakable_ray: RayCast2D = $obstakableRay
@onready var spr: Sprite2D = $"8Pix"

@export var speed:float = 100
@export var jump_velocity:float = 50
@export var gravity:float = 40


var direction_axis:float = 1.0


func _physics_process(delta: float) -> void:
	#yer çekimi
	if not is_on_floor():
		velocity.y += gravity * delta
	#zıplama
	elif Input.is_action_just_pressed("accept"):
		velocity.y -= jump_velocity
	else:
		velocity.y = 0
	# Nesneye çarpana kadar ilerleme
	move_and_slide()
