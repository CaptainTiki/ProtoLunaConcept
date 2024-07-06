class_name Level extends Node

@export var NumberOfAreasInLevel : int = 4

@onready var areasContainer: Node = $LevelGenerator/Areas

const LUNAR_SURFACE_AREAS : PackedScene = preload("res://Levels/Areas/LunarSurfaceAreas.tscn")

func _ready() -> void:
	generate_level()

	pass

func generate_level() -> void:
	#variable to hold all our connectors
	#TODO make this a dictionary of doors - with their rooms as keys??
	var doors : Array[AreaConnector]= []
	#variable to hold our list of rooms
	var roomList = []
	
	#fill out our list of rooms
	var temp = LUNAR_SURFACE_AREAS.instantiate() 
	for room in temp.get_children():
		if room is LevelArea:
			roomList.append(room)

	#TODO: add in support for multiple root nodes 
	#randomly choose between root nodes
	
	for room in roomList:
		if room is LevelArea:
			if room.DesignateAsRoot:
				var roomToAdd = room.duplicate()
				areasContainer.add_child(roomToAdd)
				#add the root node's doors to our doorList
				for child in roomToAdd.get_children():
					if child is AreaConnector:
						doors.append(child)
	
	#now that we have a root node, and its doors: lets start filling out our room structure:
	
	for door in doors:
		
		#get a random room
		#check that it has the same type of door
		#check that if we add this new room - it doesn't collide with existing rooms
			#add that room and line the doors up
			#add this new room's unused doors to the list
			
		#until we reach the NumberOfAreasInLevel - continue placing areas
		pass
