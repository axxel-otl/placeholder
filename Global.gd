extends Node2D

var collectedCoins = 0
var TimeElapsed: float = 0.0
var TimerRunning: bool = true
signal BeeBop
signal UnPunto

func _ready() -> void:
	if bool(randi_range(0, 1)):
		BeeBop.emit()
	else:
		UnPunto.emit()

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
	get_tree().call_deferred("change_scene_to_file", "res://Win.tscn")
