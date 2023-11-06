extends CharacterBody3D


const SPEED = 1
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _ready():
	$AnimationPlayer.play("walk")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle 

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if G.DIED == false:
		velocity.z += 0.09
	else:
		velocity.z = 0

	move_and_slide()


func _on_sound_body_entered(_body):
	if _body.is_in_group("player"):
		$AudioStreamPlayer3D.play()


func _on_area_3d_body_entered(_body):
	if _body.is_in_group("player"):
		G.DIED = true
		$Camera3D2.current = true
		$AnimationPlayer.play("kill_animation")
		$AudioStreamPlayer3D2.play()
		await get_tree().create_timer(2, false).timeout
		$AudioStreamPlayer3D3.play()
