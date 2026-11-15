extends Area2D

func _ready() -> void:
	$AnimatedSprite2D.sprite_frames.set_animation_loop("default", true)
	$AnimatedSprite2D.play("default")
