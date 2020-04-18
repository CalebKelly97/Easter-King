extends Node

signal score_changed(new_score)
signal highscore_changed(new_highscore)

var current_score = 0 setget set_score
var highscore = 0 setget set_highscore
var total_score = 0 setget set_total_score

func _ready():
	highscore = Global.read_saved_highscore()
	total_score = Global.read_saved_total_score()

func set_score(new_score):
	new_score = max(0, new_score)
	current_score = new_score
	emit_signal("score_changed", current_score)
	
	if current_score > highscore:
		highscore = current_score
		emit_signal("highscore_changed", highscore)
		Global.save(highscore, total_score)
	
func set_highscore(new_highscore):
	return
	
func set_total_score(new_total_score):
	total_score += new_total_score
	Global.save(highscore, total_score)
