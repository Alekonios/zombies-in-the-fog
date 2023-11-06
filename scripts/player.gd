extends CharacterBody3D
var speed = 32
var ac = 20
var grav = -35
var max_grav = -40
var jump = 8
var can_move = true
var dir = Vector2()
var vel = Vector3()
var del
var target_rotation = Vector3(0, 0, 0)
var rotation_speed = 15
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var camera_shake = true
var zabor = false
func _ready():
	_on_timer_timeout()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _process(delta):
	if G.DIED == false:
		del = delta
		control_move_and_grav()
		if camera_shake == true:
			$Camera3D.position.y += 0.02
			await get_tree().create_timer(0.2, false).timeout
			camera_shake = false
		if camera_shake == false:
			$Camera3D.position.y -= 0.01
			await get_tree().create_timer(0.2, false).timeout
			camera_shake = true
	if G.zabor_died == true:
		if zabor == false:
			zabor_anim()
		

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
func control_move_and_grav():
	dir = Vector2(0,0)
	if G.DIED == false:
		dir.y -= 2
		$right_arm/AnimationPlayer.play("arm animanion")
		$left_arm/AnimationPlayer.play("arm_anim")
		if Input.is_action_pressed("d"):
			if G.canscene == false:
				if $Camera3D.rotation_degrees.z > -15:
					$Camera3D.rotate_z(deg_to_rad(-5))
					$"..".position.x += 0.5
				dir.x += 0.5
		elif Input.is_action_pressed("a"):
			if G.canscene == false:
				if $Camera3D.rotation_degrees.z < 15:
						$Camera3D.rotate_z(deg_to_rad(5))
				$"..".position.x -= 0.5
				dir.x -= 0.5
		else:
			$Camera3D.rotation_degrees.z = 0
			$Camera3D.rotation_degrees.z = lerp($Camera3D.rotation_degrees.z, target_rotation.z, rotation_speed * get_process_delta_time())
		$Camera3D.rotation_degrees.z = lerp($Camera3D.rotation_degrees.z, target_rotation.z, rotation_speed * get_process_delta_time())
		dir = dir.normalized().rotated(-rotation.y)
		vel.x = lerp(vel.x, dir.x * speed, ac * del)
		vel.z = lerp(vel.z, dir.y * speed, ac * del)
		vel.y += grav * del
		if vel.y < max_grav:
			vel.y = max_grav
	if G.DIED == true:
		$".".hide()
		dir.y = 0
		
	
	
	set_velocity(vel)
	set_up_direction(Vector3.UP)
	move_and_slide()
	vel = velocity


func _on_timer_timeout():
	if G.DIED == false:
		$AudioStreamPlayer3D.play()
		$Timer.start()
		
func zabor_anim():
	zabor = true
