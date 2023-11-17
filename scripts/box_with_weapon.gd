extends CharacterBody3D
var target_rotation = Vector3(0, 0, 0)
var rotation_speed = 15
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var grav = -35
var parachute = true



func _on_area_3d_body_entered(_body):
	if _body.is_in_group("player"):
		G.gun_a_hand = true
		
func _physics_process(delta):
# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta * 3
	else:
		parachute_anim()

func _process(_delta):
	move_and_slide()
	

func parachute_anim():
	if parachute:
		$Empty/AnimationPlayer.play("parachute")
		parachute = false
	
