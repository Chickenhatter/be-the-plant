extends Node2D
var prev_mushroom = 0.1
var mushroom = 0.1
var indrag = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mush_num_change()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mushroom = 1.1-(($drag/drag/drag/Icon.global_position.y)-($drag/drag/Node2D.global_position.y))/129
	if mushroom < 0.1:
		mushroom = 0.1
	if mushroom > 1:
		mushroom = 1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if indrag == true:
			var direction = $drag/drag/drag/Icon.global_position.direction_to((get_global_mouse_position()))
			$drag/drag/drag.velocity = direction * 300
			if $drag/drag/drag/Icon.global_position.distance_to((get_global_mouse_position())) < 0:
				$drag/drag/drag.velocity = Vector2.ZERO
		else:
			$drag/drag/drag.velocity = Vector2.ZERO
	else:
		$drag/drag/drag.velocity = Vector2.ZERO
	$drag/drag/drag.move_and_slide()
	$drag/box/Node2D.scale.y = mushroom
	Global.nitrogen += (mushroom * 0.001)
	Global.glucose -= (mushroom * 0.001)
	if prev_mushroom != mushroom:
		mush_num_change()

func mush_num_change():
	if mushroom > 0:
		$Node2D/Sprites/mush1.play('mushroom')
	else:
		$Node2D/Sprites/mush1.play('none')
	
	if mushroom > 0.1:
		$Node2D/Sprites/mush2.play('mushroom')
	else:
		$Node2D/Sprites/mush2.play('none')
	
	if mushroom > 0.2:
		$Node2D/Sprites/mush3.play('mushroom')
	else:
		$Node2D/Sprites/mush3.play('none')
	
	if mushroom > 0.3:
		$Node2D/Sprites/mush4.play('mushroom')
	else:
		$Node2D/Sprites/mush4.play('none')
	
	if mushroom > 0.4:
		$Node2D/Sprites/mush5.play('mushroom')
	else:
		$Node2D/Sprites/mush5.play('none')
	
	if mushroom > 0.5:
		$Node2D/Sprites/mush6.play('mushroom')
	else:
		$Node2D/Sprites/mush6.play('none')
	
	if mushroom > 0.6:
		$Node2D/Sprites/mush7.play('mushroom')
	else:
		$Node2D/Sprites/mush7.play('none')
	
	if mushroom > 0.7:
		$Node2D/Sprites/mush8.play('mushroom')
	else:
		$Node2D/Sprites/mush8.play('none')
	
	if mushroom > 0.8:
		$Node2D/Sprites/mush9.play('mushroom')
	else:
		$Node2D/Sprites/mush9.play('none')
	
	if mushroom == 1:
		$Node2D/Sprites/mush10.play('mushroom')
	else:
		$Node2D/Sprites/mush10.play('none')
	prev_mushroom = mushroom

func _on_drag_mouse_entered() -> void:
	indrag = true

func _on_drag_mouse_exited() -> void:
	indrag = false
