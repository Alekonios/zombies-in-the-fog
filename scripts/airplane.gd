extends Node3D
var sound = false

func _on_area_3d_body_entered(_body):
	if _body.is_in_group("player"):
		_body.hide()
		_rev_zombi()
		sound = true
		$Camera3D2.show()
		$Airplane/AudioStreamPlayer3D.play()
		$Camera3D2.current = true
		$Camera3D2/AnimationPlayer.play("canscene")
		await get_tree().create_timer(15, false).timeout
		$Camera3D.current = true
		$Camera3D2.hide()
		await get_tree().create_timer(4.5, false).timeout
		$Camera3D3.current = true

func _on_timer_timeout():
	if sound == true:
		$Camera3D2/AudioStreamPlayer3D.play()

func _rev_zombi():
	await get_tree().create_timer(5.2, false).timeout
	$AudioStreamPlayer3D.play()
	await get_tree().create_timer(19.9, false).timeout
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
