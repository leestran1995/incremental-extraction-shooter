extends Control
@onready var grid_container: GridContainer = $GridContainer
const INVENTORY_ENTRY = preload("uid://ddsn42ctjj33v")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for n in grid_container.get_children():
		n.queue_free()

	var items = PlayerInventory.items
	
	for i in items:
		var new_entry = INVENTORY_ENTRY.instantiate()
		var control_node = new_entry.get_child(0)
		grid_container.add_child(new_entry)

		var image_path = ItemHandler.get_image_for_item(i)
		new_entry.image_path = image_path

func _on_mouse_entered() -> void:
	print("mouse entered inventory scene")
	pass # Replace with function body.
