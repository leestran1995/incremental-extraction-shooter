extends Node

var size = 16
var items: Array[String] = []

signal player_inventory_updated

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func remove_item(index: int):
	items.remove_at(index)
	player_inventory_updated.emit()

func add_item(item: String) -> bool:
	if items.size() == size:
		NotificationHandler.notify("Couldn't add item, inventory is full!")
		return false
		
	items.append(item)
	
	player_inventory_updated.emit()
	return true

func has_items(item_name: String, quantity: int):
	var filtered = items.filter(func(i): return i == item_name)
	var q = filtered.size()
	return q >= quantity
	
