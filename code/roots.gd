extends Node2D
var roots_in = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if roots_in == true:
		print((Global.soil))
		Global.water += (0.00005 * Global.soil)
