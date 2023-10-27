extends KinematicBody2D

onready var Pe:RayCast2D = $RayCast2D
onready var SpriteImagem:AnimatedSprite = $AnimatedSprite


export var Velocidade:float = 2000
export var JumpForce:float = 25
export var Vida:float = 1
export var Estamina:float = 10
export var Gravidade:float = 9.8 * 1000
export var Dano:float = 1

var Player = null
var X = 1
var Y = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	for node in get_parent().get_children():
		if node.is_in_group("Player"):
			Player = node
			break


func _process(delta):
	Animacao(Move(delta))


func Move(delta):
	if(Pe.is_colliding()):
		Y = 0
#		if Input.is_action_just_released("ui_up"):
#			Y = -JumpForce
	else:
		Y = 1
	var direcao = (Player.position - self.position).normalized().x
	move_and_slide(Vector2(X * direcao * Velocidade, Y * Gravidade) * delta)
	
	return direcao


func Animacao(direcao):
	if direcao != 0:
		SpriteImagem.flip_h = false if direcao > 0 else true
	if direcao != 0:
		SpriteImagem.play("andando")
	else:
		SpriteImagem.play("parado")
