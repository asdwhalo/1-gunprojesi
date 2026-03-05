extends Node2D


var map:PackedInt32Array = [
    1,0,0,
    1,0,1,
    1,1,1
]


var starting_position:int = 1
var player_position:int 
var view:PackedInt32Array = []


func _init():
    clamp(player_position,0,map.size())


func calculate_view()->void:
    view[0] = player_position - 1 #sağ
    view[1] = player_position + 4 # karşı
    view[2] = player_position + 1 # sol


# FIXME burasını düzelt :-)

func rotate_to(is_left:bool)->void:
    calculate_view()
    if is_left:
        view[0] = view[1]
        view[1] = view[2]
        view[2] = view[2]
    else:
        view[0] = view[1]
        view[1] = view[2]
        view[2] = view[2]


func move_to(destination:int)->void:
    player_position = destination


func _draw() -> void:
    pass # 3b çizim

func _process(_delta: float) -> void:
    queue_redraw()
