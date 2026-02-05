extends state

#TODO zamanlayıcıların çalışmasını sağla

func jump(jump_velocity:float,delta:float = 1.0)->void:
	player.velocity.y -= jump_velocity * delta
func _process(delta: float) -> void:
	if not player.is_on_floor():
		player.velocity.y += 100 * delta
		player.jump_timer += delta +0.93
	else:
		player.jump_timer = 0.0
		parent.change_state(parent.ground_state)
	if Input.is_action_pressed("accept"):
		if (player.is_on_floor()) or not player.jump_timer >= player.max_air_time :
			jump(player.jump_amount)
			parent.on_coyote = false
		elif player.is_on_wall():
			parent.on_coyote = false
			jump(player.jump_amount)
		elif parent.on_coyote == true and player.is_on_floor() == false:
			jump(10)
			parent.on_coyote = false
	if Input.is_action_just_released("accept") or player.velocity.y <= -player.max_vel:
		player.velocity.y += 100 * delta
		
