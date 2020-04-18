extends Node

# Declare member variables here
var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file
var save_data = {
	"highscore": 0,
	"total_score": 0
	} #variable to store data

# Called when the node enters the scene tree for the first time.
func create_save():
	savegame.open(save_path, File.WRITE)
	savegame.store_var(save_data)
	savegame.close()

func _ready():
	if not savegame.file_exists(save_path):
		create_save()

func save(high_score, total_collected):    
	save_data["highscore"] = high_score #data to save
	save_data["total_score"] = total_collected
	savegame.open(save_path, File.WRITE) #open file to write
	savegame.store_var(save_data) #store the data
	savegame.close() # close the file

func read_saved_highscore():
	savegame.open(save_path, File.READ) #open the file
	save_data = savegame.get_var() #get the value
	savegame.close() #close the file
	return save_data["highscore"] #return the value

func read_saved_total_score():
	savegame.open(save_path, File.READ) #open the file
	save_data = savegame.get_var() #get the value
	savegame.close() #close the file
	return save_data["total_score"] #return the value
