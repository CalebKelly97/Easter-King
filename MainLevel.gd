extends Node2D

var total
var eggsCollected
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	total = get_tree().get_nodes_in_group("Eggs").size();
	eggsCollected = 0
	$CanvasLayer/Score.text = "0 / " + str(total)
	
# I AM THE COOLOEST
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Timer.text = str(floor($GameTimer.time_left))
	if eggsCollected == total:
		get_tree().change_scene("res://MainMenu.tscn")


func _on_Egg_Count():
	print("count")
	eggsCollected += 1
	$CanvasLayer/Score.text = str(eggsCollected) + " / " + str(total)
	pass # Replace with function body.


func _on_GameTimer_timeout():
#	$Player/AnimatedSprite.play("Teleport")
	$TeleportTimer.start()
	


func _on_TeleportTimer_timeout():
	get_tree().change_scene("res://MainMenu.tscn")
