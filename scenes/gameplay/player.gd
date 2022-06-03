extends KinematicBody


export var speed = 3


func _ready():
	pass # Replace with function body.


func _process(delta):
	var movement = Vector3()
	
	movement.z = Input.get_axis("ui_up", "ui_down")
	movement.x = Input.get_axis("ui_left", "ui_right")
	movement = movement.normalized()
	
#	translation += delta * movement * speed
	move_and_collide(movement * speed * delta)
		
