extends KinematicBody2D

onready var SpriteImagem:AnimatedSprite = $AnimatedSprite


export var Velocidade:float = 5000
export var JumpForce:float = 20000
export var Estamina:float = 10

var X = 1
var Y = 0


func _process(delta):
	Move(delta)


func Move(delta):
	if $RayCast2D.is_colliding():
		Y = 0
	if $Gravidade.NoChao and Input.is_action_just_pressed("ui_up"):
		Y += -JumpForce
	var direcao = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	move_and_slide(Vector2(X * direcao * Velocidade, Y) * delta)
