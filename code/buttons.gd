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
	$chloroplast/RichTextLabel.text = 'This is a slider which increases the leaf size and will cause glucose production when the button is on to increase'
	$chloroplast/RichTextLabel2.text = 'The leaf size should increase'

func _on_chloroplast_mouse_exited() -> void:
	$chloroplast/RichTextLabel.text = ''
	$chloroplast/RichTextLabel2.text = ''


func _on_ttube_mouse_entered() -> void:
	$ttube/RichTextLabel.text = 'amount of nitrogen'
	$ttube/RichTextLabel2.text = 'amount of carbon dioxide'
	$ttube/RichTextLabel3.text = 'amount of water'
	$ttube/RichTextLabel4.text = 'amount of glucose'
	$ttube/RichTextLabel5.text = 'These all tell how much of each type of resource is left, if you run out of glucose the game ends '


func _on_ttube_mouse_exited() -> void:
	$ttube/RichTextLabel.text = ''
	$ttube/RichTextLabel2.text = ''
	$ttube/RichTextLabel3.text = ''
	$ttube/RichTextLabel4.text = ''
	$ttube/RichTextLabel5.text = ''

func _on_weather_mouse_entered() -> void:
	$weather/RichTextLabel.text = 'Weather affects the water percent in the soil, this percentage will passivly increase the water bar/tube'
	$weather/RichTextLabel2.text = 'Weather can be seen by clouds rain or just a sunny sky like right now'
	$weather/RichTextLabel3.text = 'There is a day and night cycle during night photosynthesis dose not work and during day it dose work and produce glucose'

func _on_weather_mouse_exited() -> void:
	$weather/RichTextLabel.text = ''
	$weather/RichTextLabel2.text = ''
	$weather/RichTextLabel3.text = ''


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/playing.tscn')
