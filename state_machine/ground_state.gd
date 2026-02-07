extends state

#TODO AMK buraya birşeyler ekle AMK
var coyote_timer:float = 0.0
@export var time_to_end_coyote:float = 0.5

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("accept") and player.is_on_floor():
		parent.change_state(parent.jump_state)
	else:
		coyote_timer += 1 * delta
		parent.on_coyote = true
		if coyote_timer >= time_to_end_coyote:
			parent.on_coyote = false
			coyote_timer = 0.0
			parent.change_state(parent.jump_state)
