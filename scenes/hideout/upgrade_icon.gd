extends TextureRect
@onready var texture_rect: TextureRect = $"."
@onready var quantity: Label = $Quantity

var item_name: String
var mouse_hovering: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setup(i: Dictionary):
	item_name = i.get("item")
	var image = ItemHandler.get_image_for_item(i.get("item"))
	var loaded = load(image)
	texture = loaded
	quantity.text = str(i.get("quantity"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	Tooltip.show_tooltip(item_name)
	if not mouse_hovering:
		mouse_hovering = true

func _on_mouse_exited() -> void:
	Tooltip.clear_tooltip()
	if mouse_hovering:
		mouse_hovering = false
