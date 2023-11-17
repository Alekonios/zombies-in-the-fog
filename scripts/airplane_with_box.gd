extends CharacterBody3D
var vel = Vector2()
var box_load = load("res://3_models_tscn/box_with_weapon.tscn")
var box = box_load.instantiate()
func _ready():
	await get_tree().create_timer(8, false).timeout
	$".".queue_free()


func _physics_process(_delta):
	if G.DIED == false:
		velocity.z += 2
	move_and_slide()
	
	


