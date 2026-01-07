extends Control
@onready var entry_name_popup_label: Label = %EntryNamePopupLabel
@onready var entry_name_popup: PanelContainer = %EntryNamePopup


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var diff = Vector2(-15, -75)
	entry_name_popup.position = get_global_mouse_position() + diff
