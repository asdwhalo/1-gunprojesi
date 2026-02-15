class_name AttackManager
extends Node


@export_subgroup("states")
@export var current_state:WeaponStates
enum WeaponStates{
	FIRE = 1,
	LOAD = 2,
	IDLE = 0
}
#var hitbox:Hitbox
@onready var parent:SMPLayer = get_parent()
@export_subgroup("weapon")
@export var weapon:WeaponResource = null
@export var hitbox_holder:Marker2D
@export var hitbox: Hitbox
var normal_hitbox_x_position = -10
func _process(_delta: float) -> void:
	if parent.spr.flip_h:
		hitbox_holder.position.x = -normal_hitbox_x_position
	else:
		hitbox_holder.position.x = normal_hitbox_x_position
func state_control():
	if Input.is_action_just_pressed("left_click") and hitbox.is_on == false:
		change_state(WeaponStates.FIRE)


func change_state(new_state:WeaponStates)->void:
	var old_state:WeaponStates = current_state
	current_state = new_state
	match new_state:
		WeaponStates.IDLE:
			hitbox.monitoring = false
		WeaponStates.FIRE:
			hitbox.attack.emit()
			await hitbox.attack_ended
			current_state = WeaponStates.IDLE
		WeaponStates.LOAD:
			pass
	match old_state:
		WeaponStates.IDLE:
			pass
		WeaponStates.FIRE:
			pass
		WeaponStates.LOAD:
			pass
func _physics_process(_delta: float) -> void:
	state_control()
