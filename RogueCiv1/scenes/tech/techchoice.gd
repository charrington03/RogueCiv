extends CenterContainer

signal tech_chosen

var final_choice_index: int

var CardNode = preload("res://scenes/tech/techcard.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_choice(choices:Array) -> int:
	init_choices(choices)
	await tech_chosen
	return final_choice_index

func init_choices(choices:Array) -> void:
	# 1. Init cards
	var choice_index = 0
	for tech in choices:
		add_card(tech, choice_index)
		choice_index += 1


func add_card(tech: Tech, choice_index: int) -> void:
	var Card = CardNode.instantiate()
	Card.update_text(tech.name, tech.text)
	Card.set_choice_index(choice_index)
	
	Card.chosen.connect(self.choose_card.bind(choice_index))
	$CardsContainer.add_child(Card)

func choose_card(choice_index: int):
	final_choice_index = choice_index
	emit_signal("tech_chosen")



