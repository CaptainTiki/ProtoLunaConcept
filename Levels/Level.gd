class_name Level extends Node

@export var NumberOfAreasInLevel : int = 4

@onready var lvl_gen: Level_Generator = $LevelGenerator
const LUNAR_SURFACE_AREAS : PackedScene = preload("res://Levels/Areas/LunarSurfaceAreas.tscn")

func _ready() -> void:
	generate_level()

	pass

func generate_level() -> void:
	#variable to hold all our connectors
	var doors = []
	
	#place the root node
	var roomList = LUNAR_SURFACE_AREAS.instantiate()
	var i = roomList.get_child_count()
	for count < stuff.get_child_count():
	
	
	#until we reach the NumberOfAreasInLevel - continue placing areas
	
	pass
