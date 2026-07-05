extends Node2D
var producing_glucose = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if producing_glucose == true:
		if Global.day == true:
			Global.water -= (0.001 * Global.sunlight * Global.temp_bonus)
			Global.carbondioxide -= (0.001 * Global.sunlight * Global.temp_bonus)
			Global.glucose += (0.001 * Global.sunlight * Global.temp_bonus)


func _on_button_pressed() -> void:
	if producing_glucose == true:
		producing_glucose = false
	elif producing_glucose == false:
		producing_glucose = true
