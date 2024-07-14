class_name Level extends Node

@export var NumberOfAreasInLevel : int = 4

@onready var areasContainer: Node = $LevelGenerator/Areas

const LUNAR_SURFACE_AREAS : PackedScene = preload("res://Levels/Areas/LunarSurfaceAreas.tscn")

var numAreasAdded = 0
#TODO make this a dictionary of doors - with their rooms as keys??
var doors : Array[AreaConnector]= []
#variable to hold our list of rooms
var roomList = []

func _ready() -> void:
	generate_level()

	pass

func generate_level() -> void:
	build_room_list()
	build_root_node()
	add_room()
	
	print(numAreasAdded)
	print(doors.size())
	pass

func build_room_list() -> void:
	#fill out our list of rooms
	var temp = LUNAR_SURFACE_AREAS.instantiate() 
	for room in temp.get_children():
		if room is LevelArea:
			roomList.append(room)

func build_root_node() -> void:
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


func add_room() -> void:
	#now that we have a root node, and its doors: lets start filling out our room structure:
	var door : AreaConnector = doors.pick_random()
	if numAreasAdded >= NumberOfAreasInLevel:
		return
	if door != null and door is AreaConnector:
		#get a random room
		var roomToCheck = roomList.pick_random()
		if roomToCheck == null:  #sanity check - make sure we're not null
			return
		#check that it has the same type of door
		for connector in roomToCheck.get_children():
			if connector is AreaConnector:
				if connector.connector_type == door.opposite_type:
					#TODO: check for collision with other areas
					var roomToAdd = roomToCheck.duplicate()
					numAreasAdded += 1
					areasContainer.add_child(roomToAdd)
					doors.remove_at(doors.find(connector))
					doors.remove_at(doors.find(door))
					#add the root node's doors to our doorList
					for child in roomToAdd.get_children():
						if child is AreaConnector:
							if child.connector_name != door.connector_name:
								doors.append(child)
					#now align the new room with the old room - using our selected doors
					var positionOffset = door.GlobalPosition
					
					
					return #we added the room, so return to see if we need more
