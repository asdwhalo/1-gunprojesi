@tool
extends Node
class_name generator

 
var noise:FastNoiseLite = FastNoiseLite.new()

@export var tilelayer:TileMapLayer 
@export var map_dimensions:Vector2 = Vector2i(40,40)
@export var total_steps:int = 600
@onready var camera_2d: Camera2D = $"../Camera2D"

@export_tool_button("generate")  var button = generate_map
@export_tool_button("clear") var clear_button = clear
#FIXME
func _ready() -> void:
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	clear()
	generate_map()
func clear():
	tilelayer.clear()
func generate():
	#for x in range(30):
		#for y in range(30):
			#if noise.get_noise_2d(x,y) > 0.5:
				#print(str(noise.get_noise_2d(x,y)))
				#tilelayer.set_cell(Vector2(x,y),0,Vector2(0,0))
	pass
func generate_tile(cords:Vector2):
	tilelayer.set_cell(cords,0,Vector2(0,0))
func generate_map():
	draw_tile(map_dimensions,0,Vector2(0,0))
func draw_tile(dimensions:Vector2,source_id:int,atlas_cords:Vector2i):
	for x in range(dimensions.x):
		for y in range(dimensions.y):
			if noise.get_noise_2d(x,y) <= 0.1:
				tilelayer.set_cell(Vector2(x,y),source_id,atlas_cords)
			
			
