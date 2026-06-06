extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var settings_panel: Panel = $SettingsPanel

func _ready() -> void:
	main_buttons.visible = true
	settings_panel.visible = false 

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_manager.tscn")

func _on_setting_button_pressed() -> void:
	main_buttons.visible = false
	settings_panel.visible = true 

func _on_back_button_pressed() -> void:
	_ready()

func _on_exit_button_pressed() -> void:
	get_tree().quit()
