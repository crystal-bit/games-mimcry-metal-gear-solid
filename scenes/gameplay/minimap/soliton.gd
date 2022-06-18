extends TextureRect

onready var player_pin = $Player
onready var player := get_parent().get_parent().get_parent().get_node("Player")

export(float, 0.5, 15) var minimap_scale: = 6
var minimap_size: Vector2


func _ready():
	minimap_size = get_rect().size
	player_pin.position = minimap_size / 2
	update_minimap(true)
	

func update_minimap(create_pins = false):
	for enemy in get_tree().get_nodes_in_group("enemy"):
		var enemy_pin: Node2D
		if create_pins:
			enemy_pin = create_enemy_pin()
			enemy_pin.name = enemy.name + "Pin"
			add_child(enemy_pin)
		else:
			enemy_pin = get_node(enemy.name + "Pin")
		
		var offset_from_player = Vector2(
			enemy.translation.x - player.translation.x, 
			enemy.translation.z - player.translation.z
		)
		enemy_pin.position = minimap_size / 2 + offset_from_player * minimap_scale
		enemy_pin.rotation = -enemy.rotation.y
#		var minimap_rect = get_rect()
#		var margin = 10
#		minimap_rect.position = Vector2(margin, margin)
#		minimap_rect.size.x -= margin * 2
#		minimap_rect.size.y -= margin * 2
#		print(enemy_pin.get_rect())
#		enemy_pin.visible = minimap_rect.has_point(enemy_pin.position)
		


func create_enemy_pin() -> Sprite:
	var enemy_pin_scene = preload("res://scenes/gameplay/minimap/enemy-pin.tscn")
	return enemy_pin_scene.instance()
	
	
func _process(delta):
	update_minimap()
