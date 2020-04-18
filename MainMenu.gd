extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Highscore.text = "Highscore: " + str(Score.highscore)
	$CanvasLayer/TotalEggs.text = "Total Eggs Collected: " + str(Score.total_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_StartButton_pressed():
	$AnimatedSprite.play("Teleport")
	$TeleportTimer.start()


func _on_TeleportTimer_timeout():
	get_tree().change_scene("res://MainLevel.tscn")
	
func _on_BackgroundMusic_finished():
	$BackgroundMusic.play()
