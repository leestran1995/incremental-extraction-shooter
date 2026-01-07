extends PanelContainer

@onready var notification_label: Label = %NotificationLabel
@onready var notification_widget_timer: Timer = %NotificationWidgetTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	NotificationHandler.notification_label = notification_label
	NotificationHandler.notification_widget_timer = notification_widget_timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
