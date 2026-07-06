extends Node2D
var stomata_open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stomata_open == true:
		if Global.water > 0:
			Global.carbondioxide += 0.001
			Global.water -= (0.001 * float(Global.temp_bonus))


func _on_stomata_pressed() -> void:
	if stomata_open == true:
		stomata_open = false
		$Node2D/stomaimage.play("closed")
	elif stomata_open == false:
		stomata_open = true
		$Node2D/stomaimage.play("open")
