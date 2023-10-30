extends Node2D

var Alvo = Vector2(800, 100)
var AlturaMax = 0
var Gravidade = 9.8
var PosicaiInicial = Vector2(-54, 156)
var VelocidadeInicial = 0
var Tempo = 0


func _ready():
	PosicaiInicial = get_parent().global_position


func _physics_process(delta):
	var vy = VelocidadeInicial * sin(get_parent().rotation_degrees)
	Tempo = vy/9.8
	var vx = VelocidadeInicial * cos(get_parent().rotation_degrees)
	var alcance = vx * (2*Tempo)
	if alcance == Alvo.x:
		get_parent().apply_central_impulse(Vector2(vx, -vy*2.3))
		self.queue_free()
	if alcance < Alvo.x:
		VelocidadeInicial += 0.1
	if alcance > Alvo.x:
		VelocidadeInicial -= 0.1
