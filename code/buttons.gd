extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_glycolysis_mouse_entered() -> void:
	$glycolysis/RichTextLabel.text = 'This turns off and on, when turned on it turns water and carbon dioxide into glucose but the rate of this is affected by weather'

func _on_glycolysis_mouse_exited() -> void:
	$glycolysis/RichTextLabel.text = ''


func _on_stomata_mouse_entered() -> void:
	$glycolysis/RichTextLabel.text = 'This turns off and on, when turned on it turns water into carbon dioxide'


func _on_stomata_mouse_exited() -> void:
	$glycolysis/RichTextLabel.text = ''


func _on_mushroom_mouse_entered() -> void:
	$mushroom/RichTextLabel.text = 'This is able to be moved by your mouse when holding left click, it will decrease glucose but will increase nitrogen'
	$mushroom/RichTextLabel2.text = 'It spawns this stuff on the trees'


func _on_mushroom_mouse_exited() -> void:
	$mushroom/RichTextLabel.text = ''
	$mushroom/RichTextLabel2.text = ''


func _on_chloroplast_mouse_entered() -> void:
	pass # Replace with function body.


func _on_chloroplast_mouse_exited() -> void:
	pass # Replace with function body.


func _on_ttube_mouse_entered() -> void:
	pass # Replace with function body.


func _on_ttube_mouse_exited() -> void:
	pass # Replace with function body.
