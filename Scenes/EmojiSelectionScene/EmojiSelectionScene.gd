extends Control


export(String, FILE, "*.tscn") var next_scene : String = ""


func on_emoji_picked(index : int):
	get_tree().change_scene(next_scene)
