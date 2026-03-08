@icon("res://sidescrol/basic2dsidescroltemplate/placeholdercharacter.png")
extends CharacterBody2D
class_name Basic2DSideController

@export var normal_speed:float = 2500
@export var jump_vel:float = 100.0
@export var max_vel:float = 100
@export var dash_cooldown:float = 2.0
@export var jump_amount:float = 10
@export var dash_to_normal_timer:float = 0.75
@export var speed_state:CurrentSpeedState = CurrentSpeedState.NORMAL
@export var dash_speed:float= 3000
@export var current_gravity_state:GravityState = GravityState.NORMAL

enum MovementState{
	DASH,
	GROUND,
	AIR
}

enum CurrentSpeedState{
	DASH,
	NORMAL
}
enum GravityState{
	DASH = 0 ,
	NORMAL = 100
}
var max_air_time := 10.0
var accel_time := 1.0
var max_accel := 3000
var accel_timer := 0.0
var jump_timer:float = 0.0
var direction:float
var current_speed:float
var can_dash:bool = true

@onready var spr: Sprite2D = $Sprite2D
@onready var interaction_area: Area2D = $interactionArea
@onready var dash_timer: Timer = $dashTimer
@onready var dash_cooldown_timer:Timer = $dashCooldown

func jump(jump_velocity:float,delta:float = 1.0)->void:
	velocity.y -= jump_velocity * delta


func dash()->void:
	if can_dash == false:
		return
	if speed_state == CurrentSpeedState.DASH:
		print("you already dashin brö")
		return
	dash_timer.wait_time= dash_to_normal_timer
	dash_timer.start()
	speed_state = CurrentSpeedState.DASH
	current_gravity_state = GravityState.DASH
	await dash_timer.timeout
	can_dash = false
	dash_cooldown_timer.start()
	
	speed_state = CurrentSpeedState.NORMAL
	current_gravity_state = GravityState.NORMAL

	await dash_cooldown_timer.timeout
	can_dash = true

	
	


func interac()->void:# etkileşim konseptini yaz

	for area in interaction_area.get_overlapping_areas():
		 # TEST yap AMK
		if  not area is InteracableArea:
			return
		area.selected = true

		if Input.is_action_just_pressed("enter"):
			area.get_interac.emit()
			await area.get_interac
			print("interaction on ${area}")
			area.selected = false
			continue

func _physics_process(delta: float) -> void:

	# tenaryler <true değeri> if <şart> else <false değeri>
	match speed_state:
		CurrentSpeedState.DASH:
			current_speed= dash_speed
		CurrentSpeedState.NORMAL:
			current_speed = normal_speed
	direction = Input.get_axis("left","right")
	velocity.x = direction * current_speed * delta
	
	if Input.is_action_just_pressed("shift"):
		dash()
		

	if Input.is_action_just_pressed("enter"):
		interac()
	if Input.is_action_just_pressed("right"):
		spr.flip_h = true
		interaction_area.position.x = 7.0

	elif Input.is_action_just_pressed("left"):
		spr.flip_h = false
		interaction_area.position.x = -7.0

	if not is_on_floor():
		velocity.y += current_gravity_state * delta
		jump_timer += delta +0.93

	else:
		jump_timer = 0.0

	if Input.is_action_pressed("accept"):
		
		if is_on_floor() or not jump_timer >= max_air_time :
			jump(jump_amount)

		elif is_on_wall():
			jump(jump_amount/3)

		else:
			velocity.y += current_gravity_state * delta

	if Input.is_action_just_released("accept") or velocity.y <= -max_vel:
		velocity.y += current_gravity_state * delta

	move_and_slide()
