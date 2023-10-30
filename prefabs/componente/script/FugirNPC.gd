extends Node2D

export var DistanciaParaCorrer:float = 30
export var Grupo = "NCP"
export var MinTempoFulga:float = 2
export var MaxTempoFulga:float = 8
export var NPC:bool = false
export var Velocidade:float = 7000

var Adrenalina:bool = false
var Fugir:bool = false
var MaisPerto
var TempoFulga
var Inimigo = null


func _process(delta):
	if Inimigo == null:
		for node in get_parent().get_parent().get_children():
			if node.is_in_group(Grupo):
				var distancia = abs(node.global_position.x - get_parent().global_position.x)
				if distancia <= DistanciaParaCorrer:
					$AnimationPlayer.play("padrao")
					$NewPiskel.visible = true
					Inimigo = node
					Fugir = true
					Adrenalina = true
					$Timer.start(rand_range(MinTempoFulga, MaxTempoFulga))
					$Timer2.start(rand_range(MinTempoFulga, MaxTempoFulga/2))
					break
	elif NPC and not get_parent().DentroDaMuralha and Fugir or Adrenalina:
		var direcao = 1 if get_parent().global_position.x > Inimigo.global_position.x else -1
		get_parent().move_and_slide(Vector2(direcao * Velocidade, 0) * delta)
	elif Fugir or Adrenalina:
		var direcao = 1 if get_parent().global_position.x > Inimigo.global_position.x else -1
		get_parent().move_and_slide(Vector2(direcao * Velocidade, 0) * delta)


func _on_Timer_timeout():
	$NewPiskel.visible = false
	Fugir = false
	Adrenalina = false


func _on_Timer2_timeout():
	Adrenalina = false
	Inimigo = null
