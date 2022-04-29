extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Civ Data:
#	Name
#	Population (pop)
#	Food:
#		Food in (food_in)
#		Stock (food_stock)
#		Needed for growth (food_needed)
#	Research:
#		Research level (research_lvl)
#		Research in (research_in)
#		Research_stock (research_stock)
#		Needed for next (research_needed)

var data = init_data("Civ Name", 1)
var tech_list = []
var step = 0
var TechUtils = preload("res://scenes/tech/techutils.gd").new(data)

@onready var DataUI = $DataVBox
@onready var TechUI = $TechVBox

# Called when the node enters the scene tree for the first time.
func _ready():
	update_data_ui()
	# Run testing function:
	test()


func init_data(name="", pop=1) -> Dictionary:
	var data = {}
	data.name = name
	data.pop = pop
	
	# Food
	data.food_in = 1
	data.food_stock = 0
	data.food_needed = food_growth_func(data.pop)
	
	# Research
	data.research_lvl = 0
	data.research_in = 3
	data.research_stock = 0
	data.research_needed = research_growth_func(data.research_lvl)
	
	return data

# Growth functions
func food_growth_func(x):
	# 0.5x^{2} - 0.5x + 5
	return int(round(0.5*pow(x, 2) - 0.5*x + 5))
	
func research_growth_func(x):
	# 1.5x^{2}+0.8x+10
	return int(round(1.5*pow(x, 2) + 0.8*x + 10))

func do_step():
	# Food stuff
	data.food_stock += data.food_in
	check_food()
	
	# Research Stuff
	data.research_stock += data.research_in
	check_research()
	
	update_data_ui()
	
	
func check_food():
	if data.food_stock >= data.food_needed:
		data.pop += 1
		data.food_stock = 0
		data.food_needed = food_growth_func(data.pop)


func check_research():
	if data.research_stock >= data.research_needed:
		discover_tech()
		data.research_lvl += 1
		data.research_stock = 0
		data.research_needed = research_growth_func(data.research_lvl)


func discover_tech() -> void:
	# Filler for now, eventually replace with a tech object
	var new_tech = await TechUtils.discover_tech(self)
	TechUI.add_tech(new_tech.name, new_tech.text)
	
	print("about to apply a tech")
	# apply tech's effect
	match new_tech.type:
		"yield":
			print("applying yield type tech")
			new_tech.effect.call(data)
			update_data_ui()

func update_data_ui():
	DataUI.update_data(data)


func test():
	# testing tech discovery
	#discover_tech()
	pass


func _on_step_button_pressed():
	do_step() # Replace with function body.
