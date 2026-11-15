extends Node2D

var collectedCoins = 0
var TimeElapsed: float = 0.0
var TimerRunning: bool = true

func _process(delta: float) -> void:
	if TimerRunning:
		TimeElapsed += delta

func StopTimer() -> void:
	TimerRunning = false

func ResetTimer() -> void:
	TimeElapsed = 0.0
	TimerRunning = true

func _onWin() -> void:
	StopTimer()
	# get_tree().change_scene_to_file("res://scenes/Win.tscn")
