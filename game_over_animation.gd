extends AnimationPlayer

signal restart_game
signal main_menu

@export var overlay = ColorRect
@export var dropshadow = TextureRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	overlay.visible = false
	dropshadow.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_character_body_2d_player_died() -> void:
	self.play("Game_Over_Fly_In")
	overlay.visible = true
	dropshadow.visible = true
	get_tree().paused = true 

func _on_try_again_button_pressed() -> void:
	restart_game.emit()
	pass # Replace with function body.

func _on_main_menu_pressed() -> void:
	main_menu.emit()
	pass # Replace with function body.
