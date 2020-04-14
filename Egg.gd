extends Node2D
signal Count

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Level


# Called when the node enters the scene tree for the first time.
func _ready():
	Level = get_node("res://MainLevel.tscn")
	self.connect("Count", Level, "on_Egg_Count")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
	emit_signal("Count")
	queue_free()
