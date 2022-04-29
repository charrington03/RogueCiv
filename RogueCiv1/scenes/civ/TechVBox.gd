extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_tech(name:String, desc:String) -> void:
	var nameLabel = Label.new()
	nameLabel.text = '"%s"' % name
	var descLabel = Label.new()
	descLabel.text = desc

	var container = VBoxContainer.new()
	container.add_child(nameLabel)
	container.add_child(descLabel)
	
	add_child(container)
