extends PanelContainer
@onready var furniture_label: Label = %FurnitureLabel
@onready var upgrade_items_container: HBoxContainer = $MarginContainer/VBoxContainer/UpgradeItemsContainer
@onready var upgrade_button: Button = %UpgradeButton
const UPGRADE_ICON = preload("uid://c840qabchryhq")

var upgrade_items: Array[Dictionary]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func setup(furniture_file: Resource):
	var as_data = furniture_file.data
	var name = as_data.get("name")
	furniture_label.text = name
	
	for i in as_data.get("upgrade_items"):
		var child = UPGRADE_ICON.instantiate()
		upgrade_items_container.add_child(child)
		child.setup(i)
		upgrade_items.append(i)
		
	upgrade_button.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var can_upgrade = true
	for i in upgrade_items:
		var has_enough = PlayerInventory.has_items(i.get("item"), i.get("quantity"))
		if not has_enough:
			can_upgrade = false
			upgrade_button.disabled = true
	if can_upgrade:
		upgrade_button.disabled = false
