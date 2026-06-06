class_name Enemy
extends Area2D

var enemySpeed: float = 77 
@onready var explosion_sfx = get_tree().current_scene.get_node("SfxControl")

func _ready() -> void:
	randomize()
	position = Vector2(randf_range(0,400),0)

func _process(delta: float) -> void:
	position.y += enemySpeed * delta
	
func _on_area_entered(area: Area2D) -> void:
	if area.name == "bulletArea":
		
		var game_manager = get_tree().current_scene
		game_manager.add_score(1)
		explosion_sfx.play_explosion()
		
		area.get_parent().queue_free()
		call_deferred("queue_free")
