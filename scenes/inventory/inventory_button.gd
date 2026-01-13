extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var max_size = PlayerInventory.size
	var current_items = PlayerInventory.items.size()
	text = "Inventory (" + str(current_items) + "/" + str(max_size) + ")"
	pass
