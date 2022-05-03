extends HBoxContainer

@onready var Barr = $Bar

var skew_val: float
@export var x_max: int

func set_skew_val(new_val:float):
	skew_val = new_val
	

func update_bar():
	var bar_pos = int(round(x_max * (skew_val + 5)/10))
	Bar.update_pos(bar_pos, skew_val)
