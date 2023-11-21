extends Area3D


func _on_body_entered(_body):
	if _body.is_in_group("player"):
		$"..".global_position = $left_node.global_position
