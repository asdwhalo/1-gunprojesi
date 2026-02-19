extends Control

@export var player:CharacterBody2D
@export var main:GeoMain 


func _ready() -> void:
	main.cube_collided.connect(on_cube_collide)

func on_cube_collide():
	visible = true
func _on_restast_pressed() -> void:
	if not visible:
		return
	visible = false
	get_tree().reload_current_scene()
	
