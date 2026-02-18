extends Hitbox
class_name MeleeHitbox

@export var cooldown_time: float = 1.0
@export var collison_shape_array:Array[CollisionShape2D]
@export var shape_array:Array[Shape2D]
var cooldown = Timer.new()
var attacking : bool = false
signal attack
signal attack_ended
func _init() -> void:
	attack.connect(on_attack)
	add_child(cooldown)
	cooldown.wait_time = cooldown_time
func _ready() -> void:
	monitorable = false
	is_on = false
func on_attack():
	print("im on attack")
	is_on = true
	attacking = true
	cooldown.start()
	await cooldown.timeout
	is_on = false
	attacking = false
	attack_ended.emit()
	print("im not on attack")
	


func _process(_delta: float) -> void:
	monitorable = false if is_on == false else true
	coll.disabled = true if is_on == false else false
