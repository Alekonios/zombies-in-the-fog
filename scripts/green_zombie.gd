extends CharacterBody3D
var hp = 99
const SPEED = 1
const JUMP_VELOCITY = 4.5
var died_zom = false
var hitting = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _ready():
	$AnimationPlayer.play("new_animation")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle 

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if G.DIED == false:
		velocity.z += 0.05
	else:
		velocity.z = 0
		
		


	move_and_slide()
	
		

func hit():
	if hitting == false:
		if hp < 100:
			hp -= 50
			$AnimationPlayer.play("hit_anim")
			$AudioStreamPlayer3D4.play()

func died():
	hitting = true
	$AnimationPlayer.stop()
	$AnimationPlayer.play("died_anim")
	died_zom = true

#sound
func _on_sound_body_entered(_body):
	if _body.is_in_group("player"):
		$AudioStreamPlayer3D.play()



func _on_died_body_entered(_body):
	if _body.is_in_group("player"):
		if died_zom == false:
			_body.hide()
			G.DIED = true
			$Camera3D2.current = true
			$AnimationPlayer.stop()
			$AnimationPlayer.play("kill_animation")



func _on_hp_timer_timeout():
	if hp <= 0:
		if died_zom == false:
			died()
