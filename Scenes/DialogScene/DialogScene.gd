extends Control


onready var dialog_manager : DialogManager = $DialogManager
onready var next_button : Button = $NextButton
onready var play_button : Button = $PlayButton


func _ready():
	dialog_manager.play_dialog(0)


func on_Next_pressed():
	dialog_manager.play_next()


func on_dialog_finish():
	dialog_manager.visible = false
	next_button.visible = false
	play_button.visible = true


func on_Play_pressed():
	get_tree().change_scene("res://Scenes/EmojiSelectionScene/EmojiSelectionScene.tscn")


func _input(event):
	if	event.is_pressed():
		if	Input.is_action_just_pressed("ui_accept"):
			dialog_manager.play_next()
