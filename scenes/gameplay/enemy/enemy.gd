extends Spatial


var rotating = 0

func _ready():
	yield(get_tree().create_timer(rand_range(1, 3)), "timeout")
	$Timer.start()


func _process(delta):
	rotate_y(rotating * 0.04)


func _on_Timer_timeout():
	rotating = rand_range(-1, 1)
