extends Node2D

@onready var Sprite = $Sprite2D

var normal_texture
var outlined_texture
var on_click: Callable

var pos_x: float
var pos_y: float
	
func _ready():
	Sprite.texture = normal_texture
	
	self.position.x = pos_x
	self.position.y = pos_y
	
func setup(normal_path: String, outlined_path: String, click_fn: Callable, pos: Vector2):
	normal_texture = load(normal_path)
	outlined_texture = load(outlined_path)
	
	on_click = click_fn
	
	pos_x = pos.x
	pos_y = pos.y
	

func _on_area_2d_mouse_entered():
	Sprite.texture = outlined_texture


func _on_area_2d_mouse_exited():
	Sprite.texture = normal_texture


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		on_click.call()
