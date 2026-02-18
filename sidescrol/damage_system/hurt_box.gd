extends Area2D
class_name Hurtbox

@export var parent:Entity
@export var max_imframe_time:float = 10.0
@export var max_on_iframe:float = 1.0
var current_iframe_time:float = 0.0
var on_iframe : bool = false
var delta_time:float
var hitbox_search_timer : Timer = Timer.new()
var timer : Timer = Timer.new()

func _init() -> void:
	connect("area_entered",on_hit)
	hitbox_search_timer.timeout.connect(search_hitbox)
	timer.wait_time = max_on_iframe
	
	
func _process(delta: float) -> void:
	delta_time = delta


static func add_second(delta:float,second_amount:int = 1)->float:
	return second_amount * delta



var is_in_hitbox : bool = false

func on_hit(area:Area2D):
	if area is not Hitbox or area.monitoring == false:
		return
	
	parent.take_damage(area.damage)
	hitbox_search_timer.start()
	
func search_hitbox():
	pass
