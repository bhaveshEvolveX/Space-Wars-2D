extends Node2D

var score = 0
var high_score = 0

@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var game_over_panel: Panel = $CanvasLayer/GameOverPanel
@onready var your_score_label: Label = $CanvasLayer/GameOverPanel/YourScoreLabel
@onready var high_score_label: Label = $CanvasLayer/GameOverPanel/HighScoreLabel

func _ready():
	score_label.text = "Score: 00"
	game_over_panel.hide()
	if FileAccess.file_exists("res://save.dat"):
		var file = FileAccess.open("res://save.dat", FileAccess.READ)
		high_score = file.get_var()
	
func add_score(points):
	score += points
	score_label.text = "Score: " + str(score)
	
func game_over():
	if score > high_score:
		high_score = score
		save_high_score()
		
	your_score_label.text = "Your Score: " + str(score)
	high_score_label.text = "Hi-Score: " + str(high_score)
	
	game_over_panel.show()
	get_tree().paused = true
	
func save_high_score():
	var file = FileAccess.open("res://save.dat", FileAccess.WRITE)
	file.store_var(high_score)
	
func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()
