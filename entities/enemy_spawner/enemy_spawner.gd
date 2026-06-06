extends Node

var enemyScene = preload("res://entities/enemies/enemy.tscn")

func _ready() -> void:
	get_parent().get_node("Boundary").connect("area_entered",_gameOver)
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.5
	timer.connect("timeout", _createEnemy)
	timer.start()
	
func _createEnemy():
	var enemyInstance = enemyScene.instantiate()
	get_parent().get_node("Enemies").add_child(enemyInstance)

func _gameOver(body: Node):
	if body is Enemy:
		get_tree().current_scene.game_over()
