extends Sprite2D

var normal_texture = preload("res://bigtent-96x96.png")
var outlined_texture = preload("res://bigtent-outlined-96x96.png")

func outline():
	self.texture = outlined_texture
	
func normal():
	self.texture = normal_texture
