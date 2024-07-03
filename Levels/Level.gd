class_name Level extends Node

var LunarSurfaceAreaString: String = "res://Levels/Areas/LunarSurfaceAreas.tscn"


@export_enum("LUNARSURFACE") var level_type: String = "LUNARSURFACE"
@export var NumberOfAreasInLevel : int = 4

@onready var lvl_gen: Level_Generator = $LevelGenerator


func _ready() -> void:
	match(level_type):
		"LUNARSURFACE":
			level_type = LunarSurfaceAreaString
		
	
	lvl_gen.load_areas(level_type)
	lvl_gen.generate()
	pass


