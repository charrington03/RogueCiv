extends Node2D

var MainStruct: Node2D
var ResearchStruct: Node2D
var FaithStruct: Node2D
var OrderStruct: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	create_main()
	create_research()
	create_faith()
	create_order()
	
	
func create_main():
	MainStruct = load("res://scenes/structures/main_struct.tscn").instantiate()
	MainStruct.setup(
		"res://common/art/bigtent-96x96.png",
		"res://common/art/bigtent-outlined-96x96.png",
		func(): print("Main struct clicked"),
		Vector2(1024, 409)
	)
	self.add_child(MainStruct)
	
func create_research():
	ResearchStruct = load("res://scenes/structures/research_struct.tscn").instantiate()
	ResearchStruct.setup(
		"res://common/art/smalltent-64x64.png",
		"res://common/art/smalltent-outline-64x64.png",
		func(): print("Research struct clicked"),
		Vector2(1430, 536)
	)
	self.add_child(ResearchStruct)
	
func create_faith():
	FaithStruct = load("res://scenes/structures/faith_struct.tscn").instantiate()
	FaithStruct.setup(
		"res://common/art/smallprayer-64x64.png",
		"res://common/art/smallprayer-outlined-64x64.png",
		func(): print("Prayer struct clicked"),
		Vector2(615, 536)
	)
	self.add_child(FaithStruct)
	
func create_order():
	OrderStruct = load("res://scenes/structures/order_struct.tscn").instantiate()
	OrderStruct.setup(
		"res://common/art/smallguard-64x64.png",
		"res://common/art/smallguard-outlined-64x64.png",
		func(): print("Guard struct clicked"),
		Vector2(1279, 885)
	)
	self.add_child(OrderStruct)
	#normal_path: String, outlined_path: String, click_fn: Callable, pos: Vector2
