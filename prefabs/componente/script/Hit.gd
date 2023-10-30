extends Node2D

export var Dano:float = 1
export var ForcaEmpurrao = 1000
export var Grupo = "NPC"
export var TempoRecarrega:float = 1
export(Dictionary) var Mascara = {
	"Player": { "Mask Bit": 1, "habilitado": true },
	"Inimigo": { "Mask Bit": 2, "habilitado": true },
	"Muro": { "Mask Bit": 4, "habilitado": true },
	"NPC": { "Mask Bit": 5, "habilitado": true },
}
export var Y = 50

onready var RayCastHit:RayCast2D = $RayCast2D

var PosicaoAnterior
var PodeAtacar = true

func _ready():
	PosicaoAnterior = get_parent().global_position
	RayCastHit.set_cast_to(Vector2(0, Y))
	for mascara in Mascara.keys():
		if Mascara[mascara]["habilitado"]:
			RayCastHit.set_collision_mask_bit(Mascara[mascara]["Mask Bit"], true)


func _process(delta):
	if (get_parent().global_position.x - PosicaoAnterior.x) != 0:
		if (get_parent().global_position.x - PosicaoAnterior.x) > 0:
			RayCastHit.rotation_degrees = 0
		else:
			RayCastHit.rotation_degrees = 180
	if PodeAtacar and RayCastHit.is_colliding() :#and RayCastHit.get_collider().is_in_group(Grupo):
		PodeAtacar = false
		$Timer.start(TempoRecarrega)
		for node in RayCastHit.get_collider().get_children():
			if node.name == "HitBox":
				var direcao = 1 if (get_parent().global_position.x - PosicaoAnterior.x) > 0 else -1
				node.Hitted(Dano, ForcaEmpurrao, direcao)
	
	PosicaoAnterior = get_parent().global_position


func _on_Timer_timeout():
	PodeAtacar = true
