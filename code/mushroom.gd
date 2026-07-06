extends Node2D
var mushroom = 0.1
var indrag = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#if indrag == true:
			#print('a')
			#var direction = global_position.direction_to((get_global_mouse_position()))
			#$drag/drag/drag.velocity = direction * 200
	#$drag/drag/drag.move_and_slide()
	
	if Input.is_action_just_pressed('ui_t'):
		if mushroom < 1:
			mushroom += 0.1
	if Input.is_action_just_pressed('ui_g'):
		if mushroom > 0.1:
			mushroom -= 0.1

func mush_num_change():
	if mushroom > 0:
		$Node2D/Sprites/mush1.play('mushroom')
	else:
		$Node2D/Sprites/mush1.play('none')
	
	if mushroom > 0.1:
		$Node2D/Sprites/mush1.play('mushroom')
	else:
		$Node2D/Sprites/mush1.play('none')
	
	if mushroom > 0.2:
		$Node2D/Sprites/mush1.play('mushroom')
	else:
		$Node2D/Sprites/mush1.play('none')
	

#
#func _on_drag_mouse_entered() -> void:
	#indrag = true
	#print('sda')
#
#
#func _on_drag_mouse_exited() -> void:
	#indrag = false
	#print('pba')
#
#
#func _on_drag_mouse_shape_entered(shape_idx: int) -> void:
	#indrag = true
	#print('sda')
#
#
#func _on_drag_mouse_shape_exited(shape_idx: int) -> void:
	#indrag = false
	#print('pba')
