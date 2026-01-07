extends VBoxContainer
const map = preload("res://scenes/map.tscn")

const MAP_DATA_FILES = [
	preload("res://data/maps/customs_data.json"),
	preload("res://data/maps/woods_data.json"),
	preload("res://data/maps/streets_data.json"),
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for f in MAP_DATA_FILES:
		var new_map := map.instantiate()
		add_child(new_map)
		new_map.setup(f)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
