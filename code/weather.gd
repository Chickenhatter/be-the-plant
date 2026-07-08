extends Node2D
var weather = 'none'
var time = 0
var yellow = false
var night = false
var day = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_weather()
	new_day()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if abs(((sin((time*2*PI)/(40)))/(0.309016994375))) > 1:
		if (sin((time*2*PI)/(40)))/(0.309016994375) > 0:
			day = true
			night = false
			yellow = false
		else:
			night = true
			day = false
			yellow = false
	else:
		yellow = true
		night = false
		day = false
	$Node2D2/sm.rotation_degrees += (360*delta/40)
	
	if yellow == true and $Node2D2/daylight/yellow.self_modulate.a < 0.3:
		$Node2D2/daylight/yellow.self_modulate.a += delta/5
	elif $Node2D2/daylight/yellow.self_modulate.a > 0 and yellow == false:
		$Node2D2/daylight/yellow.self_modulate.a -= delta/5
	
	if day == true and $Node2D2/daylight/day.self_modulate.a < 0.3:
		$Node2D2/daylight/day.self_modulate.a += delta/5
	elif $Node2D2/daylight/day.self_modulate.a > 0 and day == false:
		$Node2D2/daylight/day.self_modulate.a -= delta/5
	
	if night == true and $Node2D2/daylight/night.self_modulate.a < 0.3:
		$Node2D2/daylight/night.self_modulate.a += delta/5
	elif $Node2D2/daylight/night.self_modulate.a > 0 and night == false:
		$Node2D2/daylight/night.self_modulate.a -= delta/5

func new_weather():
	weather = randi_range(1,10)
	Global.soil -= 0.1
	if weather <= 4:
		weather = 'sunlight'
		Global.sunlight = 0.7
		Global.temperature = 5 + randi_range(10,20)
	elif weather == 5 or weather == 9:
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
	elif weather == 8 or weather == 10:
		weather = 'stormy'
		Global.sunlight = 0.1
		Global.temperature = 0 + randi_range(10,20)
		Global.soil = 1.2
	print(weather)
	Global.temp_bonus = ((float(Global.temperature) / 30))
	Global.weather = weather
	if Global.soil < 0:
		Global.soil = 0
	await get_tree().create_timer(30).timeout
	new_weather()

func new_day():
	Global.day = true
	await get_tree().create_timer(20).timeout
	Global.day = false
	await get_tree().create_timer(20).timeout
	new_day()
