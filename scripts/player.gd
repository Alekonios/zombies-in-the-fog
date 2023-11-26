extends CharacterBody3D
var speed = 30
var ac = 10
var grav = -35
var max_grav = -40
var jump = 8
var can_move = true
var dir = Vector2()
var vel = Vector3()
var del
var target_rotation = Vector3(0, 0, 0)
var rotation_speed = 15
const SPEED = 50.0
const JUMP_VELOCITY = 4.5
var camera_shake = true
var zabor = false
var shooting = false
var pricel = false
var amount = 0
var set_start_amount = false
var dostal = false
var light_dostal = false
var ubral_dostal = false


func _ready():
	_on_timer_timeout()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$right_arm2.hide()
	$left_arm2/AnimationPlayer.play("hand_up")
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
	if G.gun_a_hand == true and G.DIED == false:
		if dostal == false:
			start_pistol()
		if set_start_amount == false:
			set_amount_func()
		if not $Camera3D/RayCast3D.get_collider():
			pricel = false
		if $Camera3D/RayCast3D.get_collider():
			pricel = true
		$right_arm.hide()
		$right_arm2.show()
		if pricel == false:
			$TextureRect2.hide()
			$TextureRect.show()
		if pricel == true:
			$TextureRect.hide()
			$TextureRect2.show()
			$TextureRect2/AnimationPlayer.play("pricel")
	if G.gun_a_hand == false:
		$right_arm2.hide()
		$right_arm.show()
	if G.DIED:
		$TextureRect.hide() 
		$TextureRect2.hide()
		G.gun_a_hand = false
	if G.gun_a_hand == true:
		if amount < 0:
			amount = 0
	if G.night == true:
		if light_dostal == false:
			$left_arm2.hide()
			$left_arm.hide()
			start_lighting()
	if G.night == false:
		$left_arm2.hide()
		$left_arm.show()
		light_dostal = false
		if light_dostal == false:
			if ubral_dostal == false:
				off_lighting()
	if amount == 0:
		$TextureRect.hide()
		$TextureRect2.hide()
				
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
		if Input.is_action_just_pressed("shoot") or Input.is_action_just_pressed("shoot_space"):
			if G.gun_a_hand == true:
				if shooting == false:
					if amount > 0:
						$right_arm2/AnimationPlayer.play("shoot_animation")
					shoot()
	if G.DIED == true:
		$TextureRect.hide()
		$TextureRect2.hide()
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
	
func shoot():
	shooting = true
	if amount > 0:
		$BOOOM.play()
		if $Camera3D/RayCast3D.get_collider():
			var zombie = $Camera3D/RayCast3D.get_collider()
			if zombie.is_in_group("red_zombie") or zombie.is_in_group("green_zombie"):
				zombie.hit()
		amount -= 1
	if amount == 0:
		$nohaveamount.play()
	await get_tree().create_timer(0.15, false).timeout
	shooting = false

func set_amount_func():
	amount = 8
	$right_arm2/AudioStreamPlayer3D.play()
	set_start_amount = true
		
func start_pistol():
	$AnimationPlayer.play("dostal")
	dostal = true

func start_lighting():
	$left_arm2/AnimationPlayer.play("hand_up")
	await get_tree().create_timer(0.15, false).timeout
	$left_arm2.show()
	$TAKELIGHT.play()
	light_dostal = true

func off_lighting():
	$left_arm2/AnimationPlayer.play("hand_down")
	await get_tree().create_timer(0.2, false).timeout
	$left_arm2.hide()
	ubral_dostal = true
