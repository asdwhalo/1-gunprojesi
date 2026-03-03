extends Area2D
class_name InteracableArea

signal get_interac

var parent = get_parent()
var selected:bool = false

func _init() -> void:
	get_interac.connect(on_interac)
	area_entered.connect(on_interaction)


func on_interaction():
	print("interaced")


func on_interac():
	pass
