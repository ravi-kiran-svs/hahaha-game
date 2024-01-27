extends Control


func on_picker_game_solved():
	get_tree().change_scene("res://Scenes/DialogScene/Scenes/GameOverDialogScene.tscn")
