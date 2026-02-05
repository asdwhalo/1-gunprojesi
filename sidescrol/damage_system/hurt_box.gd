extends Node2D
class_name Hurtbox

@export var parent:Entity
@export var imframe_timer:float = 10.0

signal take_damage(amount:float)


func _init() -> void:
	connect("area_entered",on_hit)
	connect("take_damage",parent.take_damage)
func on_hit(area:Area2D):
	if area is not Hitbox:
		return
	take_damage.emit(area.damage)
