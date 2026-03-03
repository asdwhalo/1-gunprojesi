@icon("res://sidescrol/basic2dsidescroltemplate/placeholdercharacter.png")
extends CharacterBody2D
class_name Basic2DSideController

@export var speed:float = 2500
@export var jump_vel:float = 100.0
@export var max_vel:float = 100
@export var jump_amount:float = 10

var max_air_time := 10.0
var accel_time := 1.0
var max_accel := 3000
var normal_speed := 1000
var accel_timer := 0.0
var jump_timer:float = 0.0
var direction:float

@onready var spr: Sprite2D = $Sprite2D
@onready var interaction_area: Area2D = $interactionArea


func jump(jump_velocity:float,delta:float = 1.0)->void:
	velocity.y -= jump_velocity * delta

func interac()->void:# etkileşim konseptini yaz
	for area in interaction_area.get_overlapping_areas(): # TEST yap AMK
		if  not area is InteracableArea:
			return
		area.selected = true
		if Input.is_action_just_pressed("enter"):
			area.get_interac.emit()
			await area.get_interac
			area.selected = false
			continue

func _physics_process(delta: float) -> void:
	# tenaryler <true değeri> if <şart> else <false değeri>
	direction = Input.get_axis("left","right")
	velocity.x = direction *speed * delta
	if Input.is_action_just_pressed("right"):
		spr.flip_h = true
		interaction_area.position.x = 7.0
	elif Input.is_action_just_pressed("left"):
		spr.flip_h = false
		interaction_area.position.x = -7.0
	if not is_on_floor():
		velocity.y += 100 * delta
		jump_timer += delta +0.93
	else:
		jump_timer = 0.0
	if Input.is_action_pressed("accept"):
		if is_on_floor() or not jump_timer >= max_air_time :
			jump(jump_amount)
		elif is_on_wall():
			jump(jump_amount)

		else:
			velocity.y += 100 * delta
	if Input.is_action_just_released("accept") or velocity.y <= -max_vel:
		velocity.y += 100 * delta
	move_and_slide()
