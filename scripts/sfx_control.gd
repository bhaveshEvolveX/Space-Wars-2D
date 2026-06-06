extends Node

@onready var shoot_sound: AudioStreamPlayer2D = $ShootSound
@onready var explosion_sound: AudioStreamPlayer2D = $ExplosionSound

func play_shoot():
	shoot_sound.play()

func play_explosion():
	explosion_sound.play()
