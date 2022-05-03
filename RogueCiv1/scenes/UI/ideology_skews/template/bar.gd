extends Sprite2D

@export var bad_texture: Texture2D
@export var mid_texture: Texture2D
@export var good_texture: Texture2D


func set_x_pos(x_pos: int, skew: float):
	self.position.x = x_pos
	# check color
	# bad: -5 to -2.1
	# mid: -2 to 2
	# good: 2.1 to 5
	if (skew <= -2.1):
		self.texture = bad_texture
	elif (skew <= 2):
		self.texture = mid_texture
	else:
		self.texture = good_texture
	
