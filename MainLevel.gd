extends Node2D

var total
var eggsCollected
var totalCollected = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	total = get_tree().get_nodes_in_group("Eggs").size();
	eggsCollected = 0
	Score.current_score = 0
	$CanvasLayer/Score.text = "0"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Timer.text = str(floor($GameTimer.time_left))
	if eggsCollected == total && totalCollected == false:
		totalCollected = true
		teleport()

func teleport():
	$Player/AnimatedSprite.play("Teleport")
	$TeleportTimer.start()

func _on_Egg_Count():
	eggsCollected += 1
	$CanvasLayer/Score.text = str(eggsCollected)
	Score.set_score(eggsCollected)

func _on_GameTimer_timeout():
	Score.set_total_score(eggsCollected)
	$Player/AnimatedSprite.play("Teleport")
	$TeleportTimer.start()

func _on_TeleportTimer_timeout():
	get_tree().change_scene("res://MainMenu.tscn")
