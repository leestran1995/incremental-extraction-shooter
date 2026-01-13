extends Control
const FURNITURE_CONTAINER = preload("uid://bpur66is21hpd")

const HIDEOUT_FILES = [
	preload("res://data/furniture/med_station.json")
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for f in HIDEOUT_FILES:
		var furniture = FURNITURE_CONTAINER.instantiate()
		add_child(furniture)
		furniture.setup(f)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
