extends CharacterBody3D

var hp = 99
const SPEED = 1
const JUMP_VELOCITY = 4.5
var died_zom = false
var hitting = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _ready():
	$AnimationPlayer.play("walk")
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	if G.DIED == false:
		if died_zom == false:
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
	
	

func _on_sound_body_entered(_body):
	if _body.is_in_group("player"):
		$AudioStreamPlayer3D.play()


func _on_area_3d_body_entered(_body):
	if _body.is_in_group("player"):
		if died_zom == false:
			G.DIED = true
			$Camera3D2.current = true
			$AnimationPlayer.stop()
			$AnimationPlayer.play("kill_animation")
			$AudioStreamPlayer3D2.play()
			await get_tree().create_timer(2, false).timeout
			$AudioStreamPlayer3D3.play()


func _on_hp_timer_timeout():
	if hp <= 0:
		if died_zom == false:
			died()
