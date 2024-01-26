extends Control


func on_emoji_picked(index : int):
	get_tree().change_scene("res://Scenes/JigsawGameScene/Nodes/JigsawGame.tscn")
