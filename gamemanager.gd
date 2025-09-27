extends Node2D

var max_time = 30
var time_left = max_time

@onready var timer_label = $CanvasLayer/TimerLabel

func _process(delta):
	time_left -= delta
	timer_label.text = str(time_left)
	if time_left <= 0:
		game_over()

func game_over():
	print("Waktu habis! Game Over")
	
	# di GameManager.gd
