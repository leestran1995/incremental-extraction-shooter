extends Node
var notification_label: Label
var notification_widget_timer: Timer:
	set(new_value):
		notification_widget_timer = new_value
		notification_widget_timer.timeout.connect(clear_text)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func notify(text: String):
	notification_label.text = text 
	notification_widget_timer.start()

func clear_text():
	notification_label.text = ""
