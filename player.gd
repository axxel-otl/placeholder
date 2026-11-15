extends CharacterBody2D

signal Won
signal EnoughCoins
var enoughEmitted = false

func _ready() -> void:
	$CanvasLayer/CoinCountDisplay.text = "Coins: 0"
	$AnimatedSprite2D.sprite_frames.set_animation_loop("default", true)
	$AnimatedSprite2D.play("default")

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_direction * 400
	if input_direction < 0:
		$AnimatedSprite2D.flip_h = true
	elif input_direction > 0:
		$AnimatedSprite2D.flip_h = false
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -800
	if velocity.y > 0:
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.pause()
	elif velocity.y < 0:
		$AnimatedSprite2D.frame = 2
		$AnimatedSprite2D.pause()
	elif not $AnimatedSprite2D.is_playing():
		$AnimatedSprite2D.play("default")
	move_and_slide()

func _on_pick_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("coin"):
		area.queue_free()
		Global.collectedCoins += 1
		$CanvasLayer/CoinCountDisplay.text = "Coins: " + str(Global.collectedCoins)
		if Global.collectedCoins >= 10 and enoughEmitted == false:
			EnoughCoins.emit()
			enoughEmitted = true
	if area.is_in_group("basket") and Global.collectedCoins >= 10:
		Won.emit()
