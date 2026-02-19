extends CharacterBody2D

@onready var ray: RayCast2D = $obstakableRay
@onready var spr: Sprite2D = $"8Pix"
@onready var main :Node2D = get_parent()

@export var speed:float = 100
@export var jump_velocity:float = 50
@export var gravity:float = 40



var direction_axis:float = 1.0
var can_move:bool = true

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
	if  can_move:
		velocity.x = speed 
	if ray.is_colliding():
		can_move = false
		main.cube_collided.emit()
	move_and_slide()
