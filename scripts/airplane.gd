extends Node3D


func _on_area_3d_body_entered(_body):
	if _body.is_in_group("player"):
		$Camera3D2.show()
		$Airplane/AudioStreamPlayer3D.play()
		$Camera3D2.current = true
		$Camera3D2/AnimationPlayer.play("canscene")
		await get_tree().create_timer(15, false).timeout
		$Camera3D.current = true
		$Camera3D2.hide()
		await get_tree().create_timer(4.5, false).timeout
		$Camera3D3.current = true

		
