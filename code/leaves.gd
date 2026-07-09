extends Node2D

var inbox = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if inbox == true:
			var direction = $drag/drag/drag/Icon.global_position.direction_to((get_global_mouse_position()))
			$drag/drag/drag.velocity = direction * 300
			if $drag/drag/drag/Icon.global_position.distance_to((get_global_mouse_position())) < 0:
				$drag/drag/drag.velocity = Vector2.ZERO
		else:
			$drag/drag/drag.velocity = Vector2.ZERO
	else:
		$drag/drag/drag.velocity = Vector2.ZERO
	$drag/drag/drag.move_and_slide()
	
	
	Global.leaf_scale = 1.1-(($drag/drag/drag/Icon.global_position.y)-($drag/drag/Node2D.global_position.y))/129
	leaf_change()
	
	
	if Global.leaf_scale > 1:
		Global.leaf_scale = 1
	elif Global.leaf_scale < 0.1:
		Global.leaf_scale = 0.1
	
	
	
	if Global.nitrogen > 0:
		Global.nitrogen -= (0.001*float(Global.leaf_scale))
	else:
		Global.leaf_scale = 0.1
		
	print(Global.leaf_scale)

func leaf_change():
	$sprites/leaves/leaf1.scale.y = Global.leaf_scale
	$sprites/leaves/leaf1.scale.x = Global.leaf_scale
	
	$sprites/leaves/leaf2.scale.y = Global.leaf_scale
	$sprites/leaves/leaf2.scale.x = Global.leaf_scale
	
	$sprites/leaves/leaf3.scale.y = Global.leaf_scale
	$sprites/leaves/leaf3.scale.x = Global.leaf_scale
	
	$sprites/leaves/leaf4.scale.y = Global.leaf_scale
	$sprites/leaves/leaf4.scale.x = Global.leaf_scale
	
	$sprites/leaves/leaf5.scale.y = Global.leaf_scale
	$sprites/leaves/leaf5.scale.x = Global.leaf_scale
	
	$sprites/leaves/leaf6.scale.y = Global.leaf_scale
	$sprites/leaves/leaf6.scale.x = Global.leaf_scale
	
	$sprites/leaves/leaf7.scale.y = Global.leaf_scale
	$sprites/leaves/leaf7.scale.x = Global.leaf_scale
	
	$sprites/leaves/leaf8.scale.y = Global.leaf_scale
	$sprites/leaves/leaf8.scale.x = Global.leaf_scale


func _on_drag_2_mouse_entered() -> void:
	inbox = true


func _on_drag_2_mouse_exited() -> void:
	inbox = false
