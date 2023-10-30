extends Node2D

var SpriteImg:Sprite


func _ready():
	for node in get_parent().get_children():
		if "Sprite" in node.name:
			SpriteImg = node


func _process(delta):
	SpriteImg.rotation = get_parent().linear_velocity.normalized().angle()
