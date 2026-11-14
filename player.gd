extends CharacterBody2D

var CollectedCoins = 0
var CoinInHand = false

func _ready() -> void:
	CollectedCoins = 0
	CoinInHand = false
	$CanvasLayer/CoinCountDisplay.text = "Coins: 0"

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()

func _on_pick_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("coin") and not CoinInHand:
		area.queue_free()
		$HoldCoin.visible = true
		CoinInHand = true
	if area.is_in_group("basket") and CoinInHand:
		$HoldCoin.visible = false
		CollectedCoins += 1
		CoinInHand = false
		$CanvasLayer/CoinCountDisplay.text = "Coins: " + str(CollectedCoins)
