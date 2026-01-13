extends Node
const ITEMS_RESOURCE = preload("res://data/items.json")

var items

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	items = ITEMS_RESOURCE.data
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_image_for_item(item_name: String) -> String:
	return items.get(item_name).get("image")
