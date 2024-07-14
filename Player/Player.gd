extends CharacterBody2D

@export var speed : int = 600

func _input(event):
	if event.is_action_pressed("jump"):
		pass


func _process(_delta: float) -> void:
	var input_dir = Input.get_vector("move_left", "move_right","move_up","move_down")
	velocity = input_dir * speed

func _physics_process(_delta):
	move_and_slide()
	#prints(velocity)
	pass
