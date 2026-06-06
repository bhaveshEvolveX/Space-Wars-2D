extends Node2D

var bulletSpeed = 300

func _process(delta: float) -> void:
	position.y -= bulletSpeed * delta
	if position.y < 0:
		queue_free()
