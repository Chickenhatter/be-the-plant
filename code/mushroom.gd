extends Node2D
var mushroom = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mushroom > 0:
		$Node2D/Sprites/mush1.play()
