extends KinematicBody2D

onready var Pe:RayCast2D = $RayCast2D
onready var SpriteImagem:AnimatedSprite = $AnimatedSprite


export var Velocidade:float = 5000
export var JumpForce:float = 25
export var Vida:float = 1
export var Estamina:float = 10
export var Gravidade:float = 9.8 * 1000

var X = 1
var Y = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	Animacao(Move(delta))


func Move(delta):
	if(Pe.is_colliding()):
		Y = 0
		if Input.is_action_just_released("ui_up"):
			Y = -JumpForce
	else:
		Y = 1
	var direcao = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	move_and_slide(Vector2(X * direcao * Velocidade, Y * Gravidade) * delta)
	
	return direcao


func Animacao(direcao):
	if direcao != 0:
		SpriteImagem.flip_h = false if direcao == 1 else true
	if direcao != 0:
		SpriteImagem.play("andando")
	else:
		SpriteImagem.play("parado")
