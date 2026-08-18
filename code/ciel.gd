extends Node2D
var weather = 'none'
var time = 0
var yellow = false
var night = false
var day = false


var rainup = false
var cloudup = false
var darkcloud = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_weather()
	new_day()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if abs(((sin((time*2*PI)/(40)))/(0.309016994375))) > 0.5:
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
	
	
	
	if rainup == true:
		rain_on()
	else:
		rain_off()
	
	if cloudup == true:
		cloud_on()
	else:
		cloud_off()
	
	
	if darkcloud == true:
		cloud_dark()
	else:
		cloud_light()



func new_weather():
	darkcloud = false
	cloudup = false
	soundset()
	reset()
	weather = randi_range(1,10)
	Global.soil -= 0.1
	if weather <= 4:
		weather = 'sunlight'
		Global.sunlight = 0.7
		Global.temperature = 5 + randi_range(10,20)
		cloudup = false
		rainup = false
	elif weather == 5 or weather == 9:
		weather = 'stronglight'
		Global.sunlight = 1
		Global.temperature = 10 + randi_range(10,20)
		Global.soil -= 0.1
		cloudup = false
		rainup = false
		bug()
	elif weather == 6:
		weather = 'lightrain'
		Global.sunlight = 0.4
		Global.temperature = 0 + randi_range(10,20)
		Global.soil = 1
		cloudup = true
		rainup = true
		rainlight()
	elif weather == 7:
		weather = 'cloudy'
		Global.sunlight = 0.4
		Global.temperature = 0 + randi_range(10,20)
		Global.soil += 0.1
		cloudup = true
		rainup = false
	elif weather == 8 or weather == 10:
		weather = 'stormy'
		Global.sunlight = 0.1
		Global.temperature = 0 + randi_range(10,20)
		Global.soil = 1.2
		cloudup = false
		darkcloud = true
		rainup = true
		rainloud()
	print(weather)
	Global.temp_bonus = ((float(Global.temperature) / 30))
	Global.weather = weather
	if Global.soil < 0:
		Global.soil = 0
	await get_tree().create_timer(30).timeout
	new_weather()
	

func new_day():
	Global.day = true
	await get_tree().create_timer(22).timeout
	Global.day = false
	$sound/bugs.stop()
	await get_tree().create_timer(16).timeout
	Global.day = true
	await get_tree().create_timer(2).timeout
	new_day()

func cloud_on():
	$clouds/Node2D/cloud1.play('on')
	$clouds/Node2D/cloud2.play('on')
	$clouds/Node2D/cloud3.play('on')
	$clouds/Node2D/cloud4.play('on')
	$clouds/Node2D/cloud5.play('on')
	$clouds/Node2D/cloud1.self_modulate.a += 0.016
	$clouds/Node2D/cloud2.self_modulate.a += 0.016
	$clouds/Node2D/cloud3.self_modulate.a += 0.016
	$clouds/Node2D/cloud4.self_modulate.a += 0.016
	$clouds/Node2D/cloud5.self_modulate.a += 0.016
func cloud_off():
	$clouds/Node2D/cloud1.self_modulate.a -= 0.016
	$clouds/Node2D/cloud2.self_modulate.a -= 0.016
	$clouds/Node2D/cloud3.self_modulate.a -= 0.016
	$clouds/Node2D/cloud4.self_modulate.a -= 0.016
	$clouds/Node2D/cloud5.self_modulate.a -= 0.016

func rain_on():
	$clouds/rain/rain1.play('on')
	$clouds/rain/rain2.play('on')
	$clouds/rain/rain3.play('on')
	$clouds/rain/rain4.play('on')
	$clouds/rain/rain5.play('on')
	$clouds/rain/rain6.play('on')
	$clouds/rain/rain7.play('on')
	$clouds/rain/rain8.play('on')
	$clouds/rain/rain9.play('on')
	$clouds/rain/rain10.play('on')
	$clouds/rain/rain11.play('on')
	$clouds/rain/rain12.play('on')
	$clouds/rain/rain1.self_modulate.a += 0.016
	$clouds/rain/rain2.self_modulate.a += 0.016
	$clouds/rain/rain3.self_modulate.a += 0.016
	$clouds/rain/rain4.self_modulate.a += 0.016
	$clouds/rain/rain5.self_modulate.a += 0.016
	$clouds/rain/rain6.self_modulate.a += 0.016
	$clouds/rain/rain7.self_modulate.a += 0.016
	$clouds/rain/rain8.self_modulate.a += 0.016
	$clouds/rain/rain9.self_modulate.a += 0.016
	$clouds/rain/rain10.self_modulate.a += 0.016
	$clouds/rain/rain11.self_modulate.a += 0.016
	$clouds/rain/rain12.self_modulate.a += 0.016

func rain_off():
	$clouds/rain/rain1.self_modulate.a -= 0.016
	$clouds/rain/rain2.self_modulate.a -= 0.016
	$clouds/rain/rain3.self_modulate.a -= 0.016
	$clouds/rain/rain4.self_modulate.a -= 0.016
	$clouds/rain/rain5.self_modulate.a -= 0.016
	$clouds/rain/rain6.self_modulate.a -= 0.016
	$clouds/rain/rain7.self_modulate.a -= 0.016
	$clouds/rain/rain8.self_modulate.a -= 0.016
	$clouds/rain/rain9.self_modulate.a -= 0.016
	$clouds/rain/rain10.self_modulate.a -= 0.016
	$clouds/rain/rain11.self_modulate.a -= 0.016
	$clouds/rain/rain12.self_modulate.a -= 0.016

func cloud_dark():
	$clouds/Node2D/cloud1.self_modulate = Color(0.5, 0.5, 0.5, 1.0)
	$clouds/Node2D/cloud2.self_modulate = Color(0.5, 0.5, 0.5, 1.0)
	$clouds/Node2D/cloud3.self_modulate = Color(0.5, 0.5, 0.5, 1.0)
	$clouds/Node2D/cloud4.self_modulate = Color(0.5, 0.5, 0.5, 1.0)
	$clouds/Node2D/cloud5.self_modulate = Color(0.5, 0.5, 0.5, 1.0)

func cloud_light():
	$clouds/Node2D/cloud1.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
	$clouds/Node2D/cloud2.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
	$clouds/Node2D/cloud3.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
	$clouds/Node2D/cloud4.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
	$clouds/Node2D/cloud5.self_modulate = Color(1.0, 1.0, 1.0, 1.0)





func rainlight():
	$sound/rain.volume_db = linear_to_db(0.5)
	$sound/rain.play()

func rainloud():
	$sound/rain.volume_db = linear_to_db(1)
	$sound/rain.play()

func bug():
	$sound/bugs.volume_db = linear_to_db(1)
	$sound/bugs.play()

func soundset():
	$sound/rain.play(0.0) 
	$sound/rain.stop()
	$sound/bugs.play(0.0)
	$sound/bugs.stop()



func reset():
	if $clouds/rain/rain1.self_modulate.a > 1:
		$clouds/rain/rain1.self_modulate.a = 1
		$clouds/rain/rain2.self_modulate.a = 1
		$clouds/rain/rain3.self_modulate.a = 1
		$clouds/rain/rain4.self_modulate.a = 1
		$clouds/rain/rain5.self_modulate.a = 1
		$clouds/rain/rain6.self_modulate.a = 1
		$clouds/rain/rain7.self_modulate.a = 1
		$clouds/rain/rain8.self_modulate.a = 1
		$clouds/rain/rain9.self_modulate.a = 1
		$clouds/rain/rain10.self_modulate.a = 1
		$clouds/rain/rain11.self_modulate.a = 1
		$clouds/rain/rain12.self_modulate.a = 1
	else:
		$clouds/rain/rain1.self_modulate.a = 0
		$clouds/rain/rain2.self_modulate.a = 0
		$clouds/rain/rain3.self_modulate.a = 0
		$clouds/rain/rain4.self_modulate.a = 0
		$clouds/rain/rain5.self_modulate.a = 0
		$clouds/rain/rain6.self_modulate.a = 0
		$clouds/rain/rain7.self_modulate.a = 0
		$clouds/rain/rain8.self_modulate.a = 0
		$clouds/rain/rain9.self_modulate.a = 0
		$clouds/rain/rain10.self_modulate.a = 0
		$clouds/rain/rain11.self_modulate.a = 0
		$clouds/rain/rain12.self_modulate.a = 0
	
	
	if $clouds/Node2D/cloud1.self_modulate.a > 1:
		$clouds/Node2D/cloud1.self_modulate.a = 1
		$clouds/Node2D/cloud2.self_modulate.a = 1
		$clouds/Node2D/cloud3.self_modulate.a = 1
		$clouds/Node2D/cloud4.self_modulate.a = 1
		$clouds/Node2D/cloud5.self_modulate.a = 1
	else:
		$clouds/Node2D/cloud1.self_modulate.a = 0
		$clouds/Node2D/cloud2.self_modulate.a = 0
		$clouds/Node2D/cloud3.self_modulate.a = 0
		$clouds/Node2D/cloud4.self_modulate.a = 0
		$clouds/Node2D/cloud5.self_modulate.a = 0
