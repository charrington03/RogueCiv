extends Object

class_name Tech

# GDScript notes: all these are instance varables
# var tech1 = Tech.new() will instantiate a new tech object
var id: int
var name:String
var text: String
var type: String
var effect_func: Callable
var obtained: bool

func _init(_id: int, _name="Tech Name", _text="", _type="", _effect_func=null, _obtained=false):
	id = _id
	name = _name
	text = _text
	type = _type
	effect_func = _effect_func
	obtained = _obtained
	

func effect(data) -> void:
	if not effect_func.is_null():
		effect_func.call(data)
