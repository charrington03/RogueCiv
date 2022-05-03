extends Node2D

@onready var Sprite = $Sprite2D




func _on_area_2d_mouse_entered():
	print("mouse in")
	Sprite.outline()


func _on_area_2d_mouse_exited():
	print("mouse out")
	Sprite.normal()


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		print("it's been clicked")
