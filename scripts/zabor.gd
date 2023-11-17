extends Node3D


func _on_area_3d_body_entered(_body):
	if _body.is_in_group("player"):
		_body.hide()
		$Camera3D2/left_arm.show()
		$Camera3D2/right_arm.show()
		$Camera3D2.global_position = _body.global_position
		$Camera3D2.current = true
		$AnimationPlayer.play("zabor")
		$AudioStreamPlayer3D.play()
		G.DIED = true
		G.zabor_died = true
