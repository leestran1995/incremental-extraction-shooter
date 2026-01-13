extends Control
@onready var grid_container: GridContainer = $GridContainer
const INVENTORY_ENTRY = preload("uid://ddsn42ctjj33v")

var should_redraw: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerInventory.player_inventory_updated.connect(set_redraw)
	pass # Replace with function body.

func set_redraw():
	should_redraw = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not should_redraw:
		return
	
	for n in grid_container.get_children():
		n.queue_free()

	var items = PlayerInventory.items
	var index = 0
	
	for i in items:
		var new_entry = INVENTORY_ENTRY.instantiate()
		grid_container.add_child(new_entry)

		var image_path = ItemHandler.get_image_for_item(i)
		new_entry.image_path = image_path
		new_entry.item_name = i
		new_entry.invy_index = index
		index += 1
		
	should_redraw = false

func _on_mouse_entered() -> void:
	pass # Replace with function body.
