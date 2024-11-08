extends Area2D

signal player_died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", body_entered)
	# Area2D.body_entered.connect(kill_player)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func body_entered(body: Node2D):
	print("ENTERED")
	if(body.is_in_group("Player")):
		print("PLAYER")
		body._on_player_died()
		get_tree().get_first_node_in_group("GameOver")._on_character_body_2d_player_died()
	pass

func kill_player() -> void:
	player_died.emit()
