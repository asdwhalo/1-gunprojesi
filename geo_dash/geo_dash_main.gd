extends Node2D
class_name GeoMain

signal cube_collided

func _init() -> void:
	cube_collided.connect(on_cube_collided)

func on_cube_collided():
	pass
