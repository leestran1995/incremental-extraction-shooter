extends Node

const MAP_DATA_FILES = [
	preload("res://data/maps/customs_data.json"),
	preload("res://data/maps/woods_data.json"),
	preload("res://data/maps/streets_data.json")
]

var map_data_dict = {}

signal item_found_scav_raid(item_id: String)
signal no_scavs_left
signal scavs_available_signal

var scavs_available = 2
var scavs_raiding = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for m in MAP_DATA_FILES:
		var as_data = m.data
		print("Loading: " + as_data.get("name"))
		map_data_dict.get_or_add(as_data.get("name"), as_data)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func raid_started(map_name: String) -> void:
	scavs_raiding += 1
	if scavs_raiding >= scavs_available:
		no_scavs_left.emit()
	print("Starting raid: " + map_name)

func raid_finished(map_name: String) -> void:
	print("Raid finished: " + map_name)
	var map_data = map_data_dict.get(map_name)
	
	scavs_raiding -= 1
	
	scavs_available_signal.emit()
	
	var scav_survived = randf()
	if scav_survived >= map_data.get("scav_success_chance"):
		print("Your scav died, no loot for you")
		return
	
	var loot_table = map_data.get("loot_table")
	print("Using loot table: " + str(loot_table))
	roll_for_loot(loot_table)

func roll_for_loot(loot_table):
	for e in loot_table:
		var result = randf()
		if result < e.get("chance"):
			print("Found item: " + e.get("id"))
			item_found_scav_raid.emit(e.get("id"))
	
func keep_item(item: String):
	print("Keeping item from scav raid")
