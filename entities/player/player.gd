extends Node2D

var bulletScene = preload("res://entities/bullet/bullet.tscn")
var playerDirection:float  =  0
var playerSpeed:float = 300
var player_halfwidth = 20
var bulletCooldown := 1.0
var bulletCounter = 0
@onready var shoot_sfx = get_tree().current_scene.get_node("SfxControl")

func _process(delta: float) -> void:
	bulletCounter += delta
	if(Input.is_action_pressed("shoot") and bulletCounter > bulletCooldown):
		bulletCounter = 0
		var bulletInstance = bulletScene.instantiate()
		bulletInstance.position.x = position.x
		bulletInstance.position.y = position.y - 20
		get_parent().get_node("Bullets").add_child(bulletInstance)
		shoot_sfx.play_shoot()
		
	if(Input.is_action_pressed("moveLeft")):
		playerDirection = -1
	elif(Input.is_action_pressed("moveRight")):
		playerDirection = 1
	else:
		playerDirection = 0
		
	position.x = clamp(position.x + playerDirection * playerSpeed * delta, player_halfwidth, 400-player_halfwidth)
	
