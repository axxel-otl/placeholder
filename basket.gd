extends Area2D

func _ready() -> void:
	visible = false
	$CollisionShape2D.disabled = true

func _onEnoughCoins() -> void:
	visible = true
	$CollisionShape2D.set_deferred("disabled", false)
