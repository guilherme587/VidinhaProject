extends Node2D


var Body
var XAnterior
var AnimatorPlayer = null

func _ready():
	Body = get_parent()
	AnimatorPlayer = get_parent().get_child(0)
	XAnterior = Body.global_position.x


func _process(delta):
	if XAnterior != Body.global_position.x and abs(XAnterior - Body.global_position.x) > .3:
		AnimatorPlayer.flip_h = false if Body.global_position.x - XAnterior > 0 else true
		AnimatorPlayer.play("andando")
	else:
		AnimatorPlayer.play("parado")
	XAnterior = Body.global_position.x
