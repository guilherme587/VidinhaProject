extends KinematicBody2D

onready var PlayerAnimation:AnimationPlayer = $AnimationPlayer


func _ready():
	PlayerAnimation.play("nasceu")
