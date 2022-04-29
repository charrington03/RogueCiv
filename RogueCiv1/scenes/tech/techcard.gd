extends Control

@onready var NameLabel = $PanelContainer/MarginContainer/VBoxContainer/NameLabel
@onready var DescLabel = $PanelContainer/MarginContainer/VBoxContainer/DescLabel
@onready var ChooseButton = $ChooseButton

var choice_index: int

signal chosen
#
#func _ready():
#	NameLabel.text = ""
#	DescLabel.text = ""

func update_text(name:String, desc:String) -> void:
	$PanelContainer/MarginContainer/VBoxContainer/NameLabel.text = name
	$PanelContainer/MarginContainer/VBoxContainer/DescLabel.text = desc

func set_choice_index(_choice_index: int) -> void:
	choice_index = _choice_index

func _on_choose_button_pressed() -> void:
	emit_signal("chosen")
