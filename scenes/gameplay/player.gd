extends KinematicBody


export var speed = 3
var target_angle = 0

func _ready():
	$MeshInstance.rotate_y(PI / 2)
	

func _process(delta):
	var movement = Vector3()
	
	movement.z = Input.get_axis("ui_up", "ui_down")
	movement.x = Input.get_axis("ui_left", "ui_right")
	movement = movement.normalized()
	
	var vec = Vector2(0, 1)
	target_angle = vec.angle_to(Vector2(movement.x, -movement.z)) 
	$MeshInstance.rotation.y = lerp_angle($MeshInstance.rotation.y, target_angle, 0.2)
	move_and_collide(movement * speed * delta)
