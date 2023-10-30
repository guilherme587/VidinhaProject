extends Node2D

export var Velocidade:float = 3000

var Body
var ContinuarCorrendo = false
var Direcao
var MuroMaisPerto = null


func _ready():
	pass


func _process(delta):
	if is_instance_valid(Body) and is_instance_valid(MuroMaisPerto):
		if Body != null and MuroMaisPerto != null:
			if abs(Body.global_position.x) > abs(MuroMaisPerto.global_position.x):
				get_parent().DentroDaMuralha = false
				Body.move_and_slide(Vector2(Velocidade * Direcao, 0) * delta)
			elif not ContinuarCorrendo:
				get_parent().DentroDaMuralha = true
				ContinuarCorrendo = true
				$Timer.start(rand_range(0.5, 2))
			if ContinuarCorrendo:
				Body.move_and_slide(Vector2(Velocidade * Direcao, 0) * delta)
		else:
			Body = get_parent()
			var menorDistancia = null
			for node in get_parent().get_parent().get_children():
				if node.is_in_group("Muro") and node.get_children()[5].Vida > 0:
					var distancia = abs(Body.global_position.x - node.global_position.x)
					if menorDistancia == null:
						menorDistancia = distancia
						MuroMaisPerto = node
					if menorDistancia > distancia:
						menorDistancia = distancia
						MuroMaisPerto = node
			Direcao = (MuroMaisPerto.global_position - Body.global_position).normalized().x


func _on_Timer_timeout():
	ContinuarCorrendo = false
	Direcao = 0
