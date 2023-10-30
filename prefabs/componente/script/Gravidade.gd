extends RayCast2D

export var Gravidade:float = 9.8

var Body
var NoChao = false
var Y = 1


func _ready():
	Body = get_parent()
	Gravidade *= 0.1


func _process(delta):
	if self.is_colliding():
		NoChao = true
		Y = Gravidade
		Body.move_and_slide(Vector2(0, 0) * delta)
	else:
		NoChao = false
		Y += Gravidade
		Body.move_and_slide(Vector2(0, Y * 1000) * delta)
