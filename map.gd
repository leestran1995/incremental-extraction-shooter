extends Control

const CUSTOMS_DATA: Resource = preload("res://data/maps/customs_data.json")
@onready var raid_progress_bar: ProgressBar = %RaidProgressBar
@onready var map_label: Label = %MapLabel
@onready var success_chance_label: Label = %SuccessChanceLabel
@onready var raid_button: Button = %RaidButton
@onready var map_raid_timer: Timer = %MapRaidTimer
@onready var progress_bar_label: Label = %ProgressBarLabel

var raid_time: float = 10:
	set(new_value):
		raid_time = new_value
		map_raid_timer.wait_time = raid_time
		
var map_name: String
var success_chance: float
var is_raiding: bool = false

func setup(data_file: Resource) -> void:
	var data = data_file.data
	map_label.text = data.get("name")
	raid_time = data.get("default_time")
	raid_progress_bar.max_value = raid_time
	map_name = data.get("name")
	success_chance = data.get("scav_success_chance")
	success_chance_label.text = str(success_chance * 100) + "% chance of success"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScavRaidHandler.no_scavs_left.connect(_on_no_scavs_left)
	ScavRaidHandler.scavs_available_signal.connect(_on_scavs_available)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	raid_progress_bar.value = map_raid_timer.time_left
	progress_bar_label.text = str("%0.2f" % map_raid_timer.time_left) + "s / " + str("%0.2f" % map_raid_timer.wait_time) + "s"

func _on_raid_button_pressed() -> void:
	ScavRaidHandler.raid_started(map_name)
	map_raid_timer.start()
	raid_button.disabled = true
	is_raiding = true

func _on_map_raid_timer_timeout() -> void:
	ScavRaidHandler.raid_finished(map_name)
	raid_button.disabled = false
	is_raiding = false
	
func _on_no_scavs_left():
	raid_button.disabled = true

func _on_scavs_available():
	if not is_raiding:
		raid_button.disabled = false
