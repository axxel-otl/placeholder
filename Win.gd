extends Node2D

func _ready() -> void:
	var Minutes = int(Global.TimeElapsed / 60.0)
	var Seconds = int(Global.TimeElapsed) % 60
	var Milliseconds = int(Global.TimeElapsed * 1000) % 1000
	$CanvasLayer/TimeDisplay.text = "%02d:%02d:%03d" % [ Minutes, Seconds, Milliseconds ]
