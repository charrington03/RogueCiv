extends Node2D

@onready var Sprite = $Sprite2D

@export var normal_texture: Texture
@export var dark_texture: Texture
@export var light_texture: Texture
@export var do_dark_outline: bool
@export var on_click: Callable
	
func _ready():
	Sprite.texture = normal_texture

	
#func setup(
#	normal_path: String,
#	dark_path: String,
#	light_path: String,
#	click_fn: Callable,
#	is_outline_dark: bool
#):
#	normal_texture = load(normal_path)
#	dark_texture = load(dark_path)
#	light_texture = load(light_path)
#
#	do_dark_outline = is_outline_dark
#
#	on_click = click_fn
#

func _on_area_2d_mouse_entered():
	if (do_dark_outline):
		Sprite.texture = dark_texture
	else:
		Sprite.texture = light_texture


func _on_area_2d_mouse_exited():
	Sprite.texture = normal_texture


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		on_click.call()
