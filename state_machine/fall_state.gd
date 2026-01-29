extends state

func _process(delta: float) -> void:
	player.velocity.y += delta *10
	if player.is_on_floor():
		parent.change_state(parent.ground_state) 
