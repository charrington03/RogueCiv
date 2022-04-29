extends VBoxContainer

@onready var NameLabel = $NameLabel
@onready var PopLabel = $PopHBox/PopNumberLabel
@onready var FoodIncomeLabel = $FoodHBox/FoodIncomeLabel
@onready var FoodStockLabel = $FoodHBox/FoodStockLabel

@onready var ResearchIncomeLabel = $ResearchHBox/ResearchIncomeLabel
@onready var ResearchStockLabel = $ResearchHBox/ResearchStockLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_data(data):
	NameLabel.text = data.name
	PopLabel.text = str(data.pop)
	
	# Update food
	FoodIncomeLabel.text = "+%s |" % str(data.food_in)
	FoodStockLabel.text = "%s/%s" % [str(data.food_stock), str(data.food_needed)]

	# Update research
	ResearchIncomeLabel.text = "+%s |" % str(data.research_in)
	ResearchStockLabel.text = "%s/%s" %[str(data.research_stock), str(data.research_needed)]	
