extends Node2D


export var Velocidade:float = 2000

var Player = null
var X = 1
var Y = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	for node in get_parent().get_parent().get_children():
		if node.is_in_group("Player"):
			Player = node
			break


func _process(delta):
	Move(delta)


func Move(delta):
	if is_instance_valid(Player):
		var direcao = (Player.position - get_parent().position).normalized().x
		get_parent().move_and_slide(Vector2(X * direcao * Velocidade, Y) * delta)
