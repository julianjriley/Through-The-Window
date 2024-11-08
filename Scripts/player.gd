extends CharacterBody2D


const SPEED = 300.0
@export var jump_velocity = -300.0
var jump_cancel_velocity = 100.0
signal player_died

var playerDied = false




func _physics_process(delta: float) -> void:
	# Add the gravity.
	if playerDied:
		return
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_floor():
		$AnimatedSprite.play("Running")
	
	# Handle jump.
	if Input.is_action_just_pressed("JumpAction") and is_on_floor():
		velocity.y = jump_velocity
		$AudioStreamPlayer2D.play()
		$AnimatedSprite.play("Jump")
	if Input.is_action_just_released("JumpAction") and not is_on_floor() and velocity.y < 0:
		velocity.y = jump_cancel_velocity
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#insert death code here
	$AnimatedSprite.play("Death")
	player_died.emit()
	pass # Replace with function body.


func _on_player_died() -> void:
	playerDied = true
	print("WHY")
	$AnimatedSprite.play("Death")
	pass # Replace with function body.
