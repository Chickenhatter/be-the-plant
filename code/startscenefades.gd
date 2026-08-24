extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.end == false:
		$Sprite2D.self_modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.start == true:
		$Sprite2D.self_modulate.a += delta * 1.1
	elif $Sprite2D.self_modulate.a > 0:
		$Sprite2D.self_modulate.a -= delta * 1.1
