extends Node2D
var producing_glucose = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if producing_glucose == true:
		if Global.water > 0:
			if Global.carbondioxide > 0:
				if Global.day == true:
					Global.water -= (0.001 * Global.sunlight * Global.temp_bonus * Global.leaf_scale)
					Global.carbondioxide -= (0.001 * Global.sunlight * Global.temp_bonus * Global.leaf_scale)
					Global.glucose += 5*(0.001 * Global.sunlight * Global.temp_bonus * Global.leaf_scale)


func _on_button_pressed() -> void:
	if producing_glucose == true:
		producing_glucose = false
		$enzymeanimated.play("add_block")
		await get_tree()
	elif producing_glucose == false:
		producing_glucose = true
