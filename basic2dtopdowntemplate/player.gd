extends CharacterBody2D



@onready var dash_tagret: RayCast2D = $dash_tagret
# TODO add pikup system


var speed:float = 10.0
var can_dash:bool = false
var dash_time:float = 0.0
var time_to_dash:float = 0.0
var on_dash:bool = false

var dir : Vector2 = Vector2.ZERO
#signal dash_ended


var tagret_position 
func dash(_delta):
	can_dash = time_to_dash <= dash_time
	dash_tagret.target_position = dir * speed

	global_position += tagret_position


func _physics_process(delta: float) -> void:
	dir = Input.get_vector("left","right","up","down")
	tagret_position =  dash_tagret.get_collision_point() if dash_tagret.is_colliding() else dash_tagret.target_position
	velocity = dir * speed 
	if Input.is_action_just_pressed("accept"):
		dash(delta)
	move_and_slide()
