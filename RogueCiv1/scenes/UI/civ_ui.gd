extends Control

@onready var NameLabel = $UILeft/MarginContainer/VBoxContainer/NameLabel
@onready var PopLabel = $UILeft/MarginContainer/VBoxContainer/PopLabel
@onready var FoodLabel = $UILeft/MarginContainer/VBoxContainer/FoodLabel
@onready var ResearchLabel = $UILeft/MarginContainer/VBoxContainer/ResearchLabel
@onready var PrayerLabel = $UILeft/MarginContainer/VBoxContainer/FaithVBox/PrayersHBox/PrayerLabel
@onready var ActivePrayerLabel = $UILeft/MarginContainer/VBoxContainer/FaithVBox/MarginContainer/ActivePrayerLabel

func update_name(name:String):
	NameLabel.text = name

func update_population(pop:int):
	PopLabel.text = "Population: %s" % pop

func update_food(income:int, stock:int, needed:int):
	FoodLabel.text = "Food: +%s | %s/%s" % [income, stock, needed]

func update_research(income:int, stock:int, needed:int):
	ResearchLabel.text = "Research: +%s | %s/%s" % [income, stock, needed]

func update_prayer(income:int):
	if (income > -1):
		var percent_income = int(round(income*100))
		PrayerLabel.text = "Prayers: +%s%" % percent_income
	else:
		PrayerLabel.hide()

func update_active_prayer(name:String, chance:float):
	if (name != "" and chance > -1):
		var percent_chance = int(round(chance*100))
		ActivePrayerLabel.text = "%s: %s%" % [name, percent_chance]
	else:
		ActivePrayerLabel.hide()

func update_all(data:Dictionary):
	update_name(data.name)
	update_population(data.pop)
	update_food(data.food_in, data.food_stock, data.food_needed)
	update_research(data.research_in, data.research_stock, data.research_needed)
	update_prayer(data.prayers_in)
	### CHANGE ACTIVE_PRAYER TO NAME OF IT ###
	update_active_prayer(data.active_prayer, data.prayer_chance)
