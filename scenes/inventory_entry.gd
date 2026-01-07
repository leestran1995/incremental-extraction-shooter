extends Control
@onready var inventory_entry_texture_rect: TextureRect = %InventoryEntryTextureRect
@onready var inventory_entry_color_rect: ColorRect = %InventoryEntryColorRect
@onready var panel_container: PanelContainer = $PanelContainer
@onready var entry_name_popup_label: Label = %EntryNamePopupLabel
@onready var entry_name_popup: PanelContainer = %EntryNamePopup

var mouse_hovering: bool = false:
	set(new_value):
		mouse_hovering = new_value
		if mouse_hovering:
			entry_name_popup.show()
		else:
			entry_name_popup.hide()

var image_path: String:
	set(new_value):
		if new_value == null:
			return
		image_path = new_value
		var loaded = load(image_path)
		inventory_entry_texture_rect.texture = loaded
		
var item_name: String:
	set(new_value):
		item_name = new_value
		entry_name_popup_label.text = item_name

var invy_index: int

var right_click_down: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	entry_name_popup.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if mouse_hovering:
		if event is InputEventMouseButton:
			if not right_click_down:
				right_click_down = true
				return
				
			if event.button_index == 2:
				PlayerInventory.remove_item(invy_index)
		
func _on_mouse_entered() -> void:
	if not mouse_hovering:
		mouse_hovering = true

func _on_mouse_exited() -> void:
	right_click_down = false
	if mouse_hovering:
		mouse_hovering = false
