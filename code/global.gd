extends Node

var temperature = 20
var soil = 0.5
var day = true
var leaf_scale = 0.5

var sunlight = 0.5
var temp_bonus = 0.5
var weather = 0

var glucose = 0.5

var carbondioxide = 0.5
var water = 0.5
var nitrogen = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	glucose -= 0.0001
