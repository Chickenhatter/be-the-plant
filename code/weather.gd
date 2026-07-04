extends Node2D
var weather = 'none'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_weather()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_weather():
	weather = randi_range(1,10)
	Global.soil -= 0.1
	if weather <= 4:
		weather = 'sunlight'
		Global.sunlight = 0.7
		Global.temperature = 5 + randi_range(10,20)
	elif weather == 5:
		weather = 'stronglight'
		Global.sunlight = 1
		Global.temperature = 10 + randi_range(10,20)
		Global.soil -= 0.1
	elif weather == 6:
		weather = 'lightrain'
		Global.sunlight = 0.4
		Global.temperature = 0 + randi_range(10,20)
		Global.soil = 1
	elif weather == 7:
		weather = 'cloudy'
		Global.sunlight = 0.4
		Global.temperature = 0 + randi_range(10,20)
		Global.soil += 0.1
	elif weather == 8:
		weather = 'stormy'
		Global.sunlight = 0.1
		Global.temperature = 0 + randi_range(10,20)
		Global.soil = 1.2
	print(weather)
	Global.weather = weather
	await get_tree().create_timer(60).timeout
	new_weather()
