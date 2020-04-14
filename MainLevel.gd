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
	$"Player/Camera2D/Game UI/Score".text = "0 / " + str(total)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Egg_Count():
	print("count")
	eggsCollected += 1
	$"Player/Camera2D/Game UI/Score".text = str(eggsCollected) + " / " + str(total)
	pass # Replace with function body.
