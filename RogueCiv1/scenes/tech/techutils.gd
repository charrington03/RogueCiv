extends Object

class_name TechUtils

var tech_list = [
	Tech.new(0, "Better Farming I", "Increase food output by +1", "yield", (func(data): data.food_in += 1)),
	Tech.new(1, "Better Farming II", "Increase food output by +2", "yield", (func(data): data.food_in += 2)),
	Tech.new(2, "Better Farming III", "Increase food output by +3", "yield", (func(data): data.food_in += 3)),
	Tech.new(3, "Better Labs I", "Increase research output by +1", "yield", (func(data): data.research_in += 1)),
	Tech.new(4, "Better Labs II", "Increase research output by +2", "yield", (func(data): data.research_in += 2)),
	Tech.new(5, "Better Labs III", "Increase research output by +3", "yield", (func(data): data.research_in += 3)),
]

var unobtained_techs: Array[Tech]
var civ_data: Dictionary

func _init(_data):
	civ_data = _data
	
	for tech in tech_list:
		if not tech.obtained:
			unobtained_techs.append(tech)

func discover_tech(main_node: Node) -> Tech:

	var choices = get_tech_choices()
	
	var TechChoice = load("res://scenes/tech/techchoice.tscn").instantiate()
	main_node.add_child(TechChoice)
	
	var choice_index = await TechChoice.get_choice(choices)
	obtain_tech(choice_index)
	
	# remove TechChoice scene from tree
	TechChoice.queue_free()
	
	return choices[choice_index]
	

func get_tech_choices() -> Array:
	unobtained_techs.shuffle()
	return [unobtained_techs[0], unobtained_techs[1], unobtained_techs[2]]


func obtain_tech(choice_index: int) -> void:
	unobtained_techs[choice_index].obtained = true
	unobtained_techs.pop_at(choice_index)
