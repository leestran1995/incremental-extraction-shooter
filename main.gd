extends Control
@onready var scav_raid_scene_container: HBoxContainer = $MarginContainer/VBoxContainer/ScavRaidSceneContainer
@onready var inventory_button: Button = $MarginContainer/VBoxContainer/NavButtonContainer/InventoryButton
@onready var inventory_scene_container: HBoxContainer = $MarginContainer/VBoxContainer/InventorySceneContainer
@onready var active_scene_label: Label = $MarginContainer/VBoxContainer/ActiveSceneLabel
@onready var hideout_scene_container: HBoxContainer = $MarginContainer/VBoxContainer/HideoutSceneContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_other_button_pressed() -> void:
	Engine.time_scale = 10.0

func hide_all():
	hideout_scene_container.hide()
	inventory_scene_container.hide()
	scav_raid_scene_container.hide()

func _on_scav_management_button_pressed() -> void:
	active_scene_label.text = "Scav Management"
	hide_all()
	scav_raid_scene_container.show()


func _on_inventory_button_pressed() -> void:
	active_scene_label.text = "Inventory"
	hide_all()
	inventory_scene_container.show()


func _on_hideout_pressed() -> void:
	hide_all()
	hideout_scene_container.show()
