extends Node3D
func _ready():
	G.P_SCORE = 0
	$ColorRect/AnimationPlayer.play("whiting")
#ZOMBIEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
var load_zombie = preload("res://mobs/red_zombie.tscn")
var load_zombie_green = preload ("res://mobs/green_zombie.tscn")
var load_zombie1 = preload("res://mobs/red_zombie.tscn")
var load_zombie_green1 = preload ("res://mobs/green_zombie.tscn")
var load_zombie2 = preload("res://mobs/red_zombie.tscn")
var load_zombie_green2 = preload ("res://mobs/green_zombie.tscn")
func _on_timer_timeout():
	#____________________________________________________________________________________________________________________________
	var _loca = [$player/Node3D, $player/Node3D2, $player/Node3D7, $player/Node3D8, $player/Node3D9, $player/Node3D10, $player/Node3D3, $player/Node3D4, $player/Node3D5, $player/Node3D6, $player/Node3D11, $player/Node3D12, $player/Node3D13, $player/Node3D14, $player/Node3D15, $player/Node3D16, $player/Node3D17, $player/Node3D18, $player/Node3D21, $player/Node3D22, $player/Node3D19, $player/Node3D20, $player/Node3D23, $player/Node3D24, $player/Node3D25, $player/Node3D26, $player/Node3D27, $player/Node3D28, $player/Node3D29, $player/Node3D30, $player/Node3D31, $player/Node3D32, $player/Node3D33, $player/Node3D34, $player/Node3D35, $player/Node3D36, $player/Node3D37, $player/Node3D38, $player/Node3D39, $player/Node3D40]
	#____________________________________________________________________________________________________________________________________
	#ГЕНЕРАТОР РАНДОМНЫХ ЧИСЕЛ
	var random_index = randi_range(0, 40) % _loca.size() # Генерация случайного индекса
	var random_index2 = randi_range(0, 40) % _loca.size() # Генерация случайного индекса
	var random_index3 = randi_range(0, 40) % _loca.size() # Генерация случайного индекса
	var random_index4 = randi_range(0, 40) % _loca.size() # Генерация случайного индекса
	var random_index5 = randi_range(0, 40) % _loca.size() # Генерация случайного индекса
	var random_index6 = randi_range(0, 40) % _loca.size() # Генерация случайного индекса
	#ПОЛУЧЕНИЕ СЛУЧАЙНЫХ НОД ИХ СПИКА
	var random_node = _loca[random_index] # Получение случайной ноды из списка
	var random_node2 = _loca[random_index2] # Получение случайной ноды из списка
	var random_node3 = _loca[random_index3] # Получение случайной ноды из списка
	var random_node4 = _loca[random_index4] # Получение случайной ноды из списка
	var random_node5 = _loca[random_index5] # Получение случайной ноды из списка
	var random_node6 = _loca[random_index6] # Получение случайной ноды из списка
	#переменные зомбаков для подгрузки в сецну
	var zombie = load_zombie.instantiate()
	var _green_zombie = load_zombie_green.instantiate()
	var zombie1 = load_zombie1.instantiate()
	var _green_zombie1 = load_zombie_green1.instantiate()
	var zombie2 = load_zombie2.instantiate()
	var _green_zombie2 = load_zombie_green2.instantiate()
	#добавление зосбаков в сцену
	if G.spawn_zombie == false:
		if G.canscene == false:
			if G.DIED == false:
				add_child(zombie)
				zombie.global_position = random_node.global_position
				add_child(_green_zombie)
				_green_zombie.global_position = random_node2.global_position
				#______________________________________________________________
				add_child(zombie1)
				zombie1.global_position = random_node3.global_position
				add_child(_green_zombie1)
				_green_zombie1.global_position = random_node4.global_position
				#________________________________________________________________
				add_child(zombie2)
				zombie2.global_position = random_node5.global_position
				add_child(_green_zombie2)
				_green_zombie2.global_position = random_node6.global_position
#ZABOOOOR
var load_zabor = preload("res://3_models_tscn/zabor.tscn")
var load_zabor2 = preload("res://3_models_tscn/zabor.tscn")
var load_zabor3 = preload("res://3_models_tscn/zabor.tscn")
var load_zabor4 = preload("res://3_models_tscn/zabor.tscn")
var load_zabor5 = preload("res://3_models_tscn/zabor.tscn")
var load_zabor6 = preload("res://3_models_tscn/zabor.tscn")




func _on_timer_3_timeout():
	#spiok node
	var zab_loca = [$"player/zabor-node8", $"player/zabor-node9", $"player/zabor-node10", $"player/zabor-node11", $"player/zabor-node12", $"player/zabor-node13", $"player/zabor-node14", $"player/zabor-node15", $"player/zabor-node16", $"player/zabor-node17", $"player/zabor-node18", $"player/zabor-node19"]
	#ranndom_node
	var random_node_zabor = randi_range(0, 12) % zab_loca.size() # Генерация случайного индекса
	var random_node_zabor2 = randi_range(0, 12) % zab_loca.size() # Генерация случайного индекса
	var random_node_zabor3 = randi_range(0, 12) % zab_loca.size() # Генерация случайного индекса
	var random_node_zabor4 = randi_range(0, 12) % zab_loca.size() # Генерация случайного индекса
	var random_node_zabor5 = randi_range(0, 12) % zab_loca.size() # Генерация случайного индекса
	var random_node_zabor6 = randi_range(0, 12) % zab_loca.size() # Генерация случайного индекса
	#randomnode for spisok
	var random_zabor_coord = zab_loca[random_node_zabor]
	var random_zabor_coord2 = zab_loca[random_node_zabor2]
	var random_zabor_coord3 = zab_loca[random_node_zabor3]
	var random_zabor_coord4 = zab_loca[random_node_zabor4]
	var random_zabor_coord5 = zab_loca[random_node_zabor5]
	var random_zabor_coord6 = zab_loca[random_node_zabor6]
	#add zabor
	var zabor = load_zabor.instantiate()
	var zabor2 = load_zabor2.instantiate()
	var zabor3 = load_zabor3.instantiate()
	var zabor4 = load_zabor4.instantiate()
	var zabor5 = load_zabor5.instantiate()
	var zabor6 = load_zabor6.instantiate()
	#zombie in scene
	if G.spawn_zombie == false:
		if G.DIED == false:
			if G.canscene == false:
				add_child(zabor)
				zabor.global_position = random_zabor_coord.global_position
				add_child(zabor2)
				zabor2.global_position = random_zabor_coord2.global_position
				add_child(zabor3)
				zabor3.global_position = random_zabor_coord3.global_position
				add_child(zabor4)
				zabor4.global_position = random_zabor_coord4.global_position
				add_child(zabor5)
				zabor5.global_position = random_zabor_coord5.global_position
				add_child(zabor6)
				zabor6.global_position = random_zabor_coord6.global_position

var loadairplane = preload("res://airplane.tscn")

func _on_area_3d_body_entered(_body):
	if _body.is_in_group("player"):
		var airplane = loadairplane.instantiate()
		G.canscene = true
		add_child(airplane)
		airplane.global_position = $player/air_plane_node.global_position


func _on_area_3d_2_body_entered(_body):
	if _body.is_in_group("player"):
		G.spawn_zombie = true