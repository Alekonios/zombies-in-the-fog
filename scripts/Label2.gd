extends Label


func _process(_delta):
	$".".text = "score: " + str(G.P_SCORE) + "m"
	if G.DIED == true:
		if G.P_SCORE > G.N_SCORE:
			G.N_SCORE = G.P_SCORE


func _on_timer_2_timeout():
	if G.canscene == false:
		if G.DIED == false:
			G.P_SCORE += 1
