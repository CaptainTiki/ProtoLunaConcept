class_name LevelArea extends Node2D

#this area needs at least 1 connector - so that it can connect to the random dungeon generator

#sets this room as a root node - where the levels are built off of
@export var DesignateAsRoot : bool = false
#reminder - RootNodes need a PlayerSpawn Item. 

@export var player_spawn : Player_Spawn


#this sets the area as required for every level of this tileset
@export var MandatoryArea : bool = false
