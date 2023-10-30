extends Node2D

export var Vida:float = 1
export var Escudo:float = 1

func Hitted(dano, forcaEmpurrao, direcao):
	Vida -= dano * Escudo/100
	if get_parent().has_method("move_and_slide"):
		get_parent().move_and_slide(Vector2(forcaEmpurrao * direcao, -forcaEmpurrao/3))
	if Vida <= 0:
		get_parent().queue_free()
