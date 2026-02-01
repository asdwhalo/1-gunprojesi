extends state

#TODO AMK buraya birşeyler ekle AMK


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("accept"):
		parent.change_state(parent.jump_state)
	elif not player.is_on_floor():
		parent.change_state(parent.fall_state)
