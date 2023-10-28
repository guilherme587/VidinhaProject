extends Node2D

export var Velocidade:float = 3000

var Body
var ContinuarCorrendo = false
var Direcao


func _ready():
	pass


func _process(delta):
	if Body != null:
		if abs(Body.global_position.x) > abs(rand_range(50, 400)):
			Body.move_and_slide(Vector2(Velocidade * Direcao, 0) * delta)
		elif not ContinuarCorrendo:
			ContinuarCorrendo = true
			$Timer.start(rand_range(0.5, 6))
		if ContinuarCorrendo:
			Body.move_and_slide(Vector2(Velocidade * Direcao, 0) * delta)
	else:
		Body = get_parent()
		Direcao = Vector2(round(rand_range(-100, 100)), 0).normalized().x


func _on_Timer_timeout():
	ContinuarCorrendo = false
	Direcao = 0
	yield(get_tree().create_timer(rand_range(6, 8)), "timeout")
	Direcao = round(rand_range(-1, 1))
