extends Control
@onready var inventory_entry_texture_rect: TextureRect = %InventoryEntryTextureRect
@onready var inventory_entry_color_rect: ColorRect = %InventoryEntryColorRect

var image_path: String:
	set(new_value):
		if new_value == null:
			return
		image_path = new_value
		var loaded = load(image_path)
		inventory_entry_texture_rect.texture = loaded

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print(event)
		

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print(event)


func _on_mouse_entered() -> void:
	print("mouse entered")
	pass # Replace with function body.
