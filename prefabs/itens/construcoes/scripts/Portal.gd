extends StaticBody2D


export(Array, PackedScene) var Inimigo:Array = []
export var Vida:float = 100
export var Quantidade:int = 3

onready var SpawPonit:Position2D = $PositionPortal/AnimatedSprite2/Spawner
onready var Player:AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(2), "timeout")
	self.position.y = 146
	Player.play("padrao")
	var inimigosCont = len(Inimigo)
	for i in range(Quantidade):
		var novoInimigo = Inimigo[rand_range(0, inimigosCont -1)].instance()
		novoInimigo.global_position = SpawPonit.global_position
		yield(get_tree().create_timer(1.2), "timeout")
		get_parent().add_child(novoInimigo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
