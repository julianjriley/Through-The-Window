extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_over_animation_restart_game() -> void:
	get_tree().change_scene_to_file("res://Scenes/Hailey_ProcGen_2.tscn")
	pass # Replace with function body.


func _on_game_over_animation_main_menu() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	pass # Replace with function body.
