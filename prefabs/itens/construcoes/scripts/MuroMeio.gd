extends StaticBody2D


onready var AnimationPlayerSelf:AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	AnimationPlayerSelf.play("padrao")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
