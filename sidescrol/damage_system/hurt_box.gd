extends Node2D
class_name Hurtbox

@export var parent:Entity
@export var max_imframe_time:float = 10.0
@export var max_on_iframe:float = 1.0
var current_iframe_time:float = 0.0
var on_iframe : bool = false
var delta_time:float
signal take_damage(amount:float)
func _process(delta: float) -> void:
	delta_time = delta
static func add_second(delta:float,second_amount:int = 1)->float:
	return second_amount * delta
func _init() -> void:
	connect("area_entered",on_hit)
	connect("take_damage",parent.take_damage)
func on_hit(area:Area2D):
	if area is not Hitbox or parent.has_method("take_damage") == false or on_iframe:
		return
	parent.take_damage(area.damage)
	if current_iframe_time == 0.0 :
		current_iframe_time += add_second(delta_time)
		on_iframe = false
	if current_iframe_time >= max_imframe_time:
		on_iframe = true
	
