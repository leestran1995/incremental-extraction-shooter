extends Control
@onready var tooltip_label: Label = $TooltipContainer/MarginContainer/TooltipLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var offset = Vector2(0, -size.y - 3)
	if visible:
		global_position = get_global_mouse_position() + offset
	pass
	
func show_tooltip(t: String):
	tooltip_label.text = t
	show()
	
func clear_tooltip():
	hide()
