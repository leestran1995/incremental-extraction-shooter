extends Control
@onready var inventory_entry_texture_rect: TextureRect = %InventoryEntryTextureRect
@onready var inventory_entry_color_rect: ColorRect = %InventoryEntryColorRect

var mouse_hovering: bool = false

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

var invy_index: int

var right_click_down: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	Tooltip.show_tooltip(item_name)
	if not mouse_hovering:
		mouse_hovering = true

func _on_mouse_exited() -> void:
	Tooltip.clear_tooltip()
	right_click_down = false
	if mouse_hovering:
		mouse_hovering = false
