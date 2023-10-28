extends KinematicBody2D

export var Valor:float = 1
export var TimeOut:float = 3
export var PodeSerColetado:bool = false

onready var Cronometro:Timer = $Timer


func _ready():
	Cronometro.start(TimeOut)


func _process(delta):
	move_and_slide(Vector2(0, 5000) * delta, Vector2.UP)


func _on_Area2D_body_entered(body):
	if PodeSerColetado and body.is_in_group("Player"):
		print(self.position)
		PodeSerColetado = false
		Cronometro.start(TimeOut)
		self.position = Vector2(240, 16)


func _on_Timer_timeout():
	PodeSerColetado = true
