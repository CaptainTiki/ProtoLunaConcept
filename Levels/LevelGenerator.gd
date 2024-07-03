class_name Level_Generator extends Node

@onready var areas: Node = $Areas

var LevelAreas  = []

const LUNAR_SURFACE_AREAS = preload("res://Levels/Areas/LunarSurfaceAreas.tscn")

#on Level instantiation, the Level Generator needs to:
#check the level to see how many areas it needs to build
#select areas from a list of areas - based on the type in the Level Parent
#place 1 area at a time, starting with the root, and matching the exits of the root with an entrance on a randomly selected area

#when the number of areas is reached - all extra exits should be closed off with "end caps"

#loads the areas from the FileStructure - given the string for type
func load_areas(_areaString: String) -> void:
	#load the areas to use in the generation function
	pass

func generate() -> void:

	pass
