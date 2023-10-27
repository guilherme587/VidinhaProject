extends StaticBody2D

export var Vida:float = 10
export var Defesa:float = 1.1
export var MuroMeio:PackedScene
export var ConstruirMuro:bool = true


func _ready():
	if ConstruirMuro:
		yield(get_tree().create_timer(2), "timeout")
		for node in get_parent().get_children():
			if node.is_in_group("Muro") and node.name != self.name:
				var distancia = abs(self.position.x - node.position.x)/16
				var direcao = (node.position - self.position).normalized().x
				for i in range(distancia +1):
					var novoMuroMeio = MuroMeio.instance()
					novoMuroMeio.position = self.position + (Vector2(16, 0) * i * direcao)
					novoMuroMeio.set_z_index(-2)
					get_parent().add_child(novoMuroMeio)
					yield(get_tree().create_timer(0.3), "timeout")
				break


#func _process(delta):
#	pass


func Apanhar(dano):
	if Vida > 0:
		Vida -= dano
	else:
		$CollisionShape2D.disabled = true
		$Sprite.texture = "res://sprites/frames/wall_fountain_top_3.png"
		$Sprite2.texture = null
