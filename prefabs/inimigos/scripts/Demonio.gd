extends KinematicBody2D

#onready var Pe:RayCast2D = $RayCast2D
onready var SpriteImagem:AnimatedSprite = $ReferenciaParaAnimPlayer/AnimatedSprite
onready var PlayerAnimation:AnimationPlayer = $AnimationPlayer


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
	PlayerAnimation.play("nasceu")
	for node in get_parent().get_children():
		if node.is_in_group("Player"):
			Player = node
			break


func _process(delta):
	Move(delta)


func Move(delta):
	var direcao = (Player.position - self.position).normalized().x
	move_and_slide(Vector2(X * direcao * Velocidade, Y * Gravidade) * delta)
	
	return direcao
