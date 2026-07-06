extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.nitrogen > 0:
		Global.nitrogen -= (0.001*float(Global.leaf_scale))
	else:
		Global.leaf_scale = 0.1
	
