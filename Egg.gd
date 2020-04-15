extends Node2D
signal Count

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Level
var rand

# Called when the node enters the scene tree for the first time.
func _ready():
	rand = rand_range(1, 4)
	$Sprite.frame = floor(rand)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
	emit_signal("Count")
	queue_free()
