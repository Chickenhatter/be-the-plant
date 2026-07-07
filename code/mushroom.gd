extends Node2D
var mushroom = 0.1
var indrag = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mushroom = 1.1-(($drag/drag/drag/Icon.global_position.y)-30)/129
	if mushroom < 0.1:
		mushroom = 0.1
	if mushroom > 1:
		mushroom = 1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if indrag == true:
			print('a')
			var direction = $drag/drag/drag/Icon.global_position.direction_to((get_global_mouse_position()))
			$drag/drag/drag.velocity = direction * 200
			if $drag/drag/drag/Icon.global_position.distance_to((get_global_mouse_position())) < 0:
				$drag/drag/drag.velocity = Vector2.ZERO
		else:
			$drag/drag/drag.velocity = Vector2.ZERO
	else:
		$drag/drag/drag.velocity = Vector2.ZERO
	$drag/drag/drag.move_and_slide()
	
	if Input.is_action_just_pressed('ui_t'):
		if mushroom < 1:
			mushroom += 0.1
	if Input.is_action_just_pressed('ui_g'):
		if mushroom > 0.1:
			mushroom -= 0.1
	
	print(mushroom)

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
	



func _on_drag_mouse_entered() -> void:
	indrag = true
	print('sda')

func _on_drag_mouse_exited() -> void:
	indrag = false
	print('pba')
