extends Area2D

@onready var parent:GeoMain = get_parent().get_parent()

func _on_body_entered(body: Node2D) -> void:
	if body is GeoCube:
		parent.cube_collided.emit()
