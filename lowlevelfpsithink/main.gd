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
    view[0] = player_position - 1 # sağ
    view[1] = player_position + 4 # karşı
    view[2] = player_position + 1 # sol
    view[3] = player_position - 4 # arka


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
    if destination != 1:
        player_position = destination
    else:
        pass # error


func _draw() -> void:
    var front_rect:Rect2 
    front_rect.size = Vector2(1,1)
    front_rect.position = Vector2(1,1)
    if view[1] == 1:
        draw_rect(front_rect,Color.RED)
    pass # 3b çizim

func _process(_delta: float) -> void: #input
    queue_redraw()
