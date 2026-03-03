extends CharacterBody2D
class_name GeoCube

@onready var ray: RayCast2D = $obstakableRay
@onready var spr: Sprite2D = $"8Pix"
@onready var main :Node2D = get_parent()
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var particel: GPUParticles2D = $GPUParticles2D

@export var speed:float = 100
@export var jump_velocity:float = 50
@export var gravity:float = 40



var direction_axis:float = 1.0
var can_move:bool = true

func _physics_process(delta: float) -> void:
	#animasyonlar
	if is_on_floor():
		anim.play("idle")
	else:
		anim.play("jump")
	
	#yer çekimi
	if not is_on_floor():
		velocity.y += gravity * delta
		anim.play("jump")
		
	#zıplama
	# zıplamayı düzelt
	elif Input.is_action_just_pressed("accept") and can_move:
		velocity.y -= jump_velocity
		
		
	else:
		velocity.y = 0
	# Nesneye çarpana kadar ilerleme
	if  can_move:
		velocity.x = speed 
	if ray.is_colliding():
		can_move = false
		main.cube_collided.emit()
	if can_move:
		move_and_slide()
	else:
		particel.emitting = true


func _onmain_cube_collided() -> void:
	can_move = false
