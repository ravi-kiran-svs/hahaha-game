extends Control


onready var jigsaw_game : JigsawGame = $JigsawGame


func on_jigsaw_solved():
	get_tree().change_scene("res://Scenes/DialogScene/Scenes/Level2DialogScene.tscn")
