extends Control
const SCAV_RAID_RESULT_ENTRY = preload("res://scenes/scav_raid_result/scav_raid_result_entry.tscn")

@onready var v_box_container: VBoxContainer = $MarginContainer/ScrollContainer/VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScavRaidHandler.item_found_scav_raid.connect(_on_scav_raid_item_found)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_scav_raid_item_found(item: String):
	var new_entry = SCAV_RAID_RESULT_ENTRY.instantiate()
	v_box_container.add_child(new_entry)
	new_entry.item_name = item
