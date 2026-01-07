extends Control
@onready var scav_raid_result_label: Label = $MarginContainer/HBoxContainer/ScavRaidResultLabel
@onready var scav_raid_result_icon: TextureRect = %ScavRaidResultIcon

var item_name: String:
	set(new_value):
		item_name = new_value
		scav_raid_result_label.text = item_name
		var image_link = ItemHandler.get_image_for_item(new_value)
		var as_image = load(image_link)
		scav_raid_result_icon.texture = as_image

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_keep_scav_raid_button_pressed() -> void:
	if PlayerInventory.add_item(item_name):
		queue_free()

func _on_toss_scav_raid_button_pressed() -> void:
	queue_free()
