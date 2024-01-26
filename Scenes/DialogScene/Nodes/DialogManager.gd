# This class manager multiple dialogues.
# Must add all dialogues as its children.
# Children must be only of type DialogBox

extends Control
class_name DialogManager


signal dialog_finish


# Which dialog is being displayed right now.
var current_dialog_index : int = -1


#func _ready():
#	play_dialog(0)


func play_next():
	if	current_dialog_index + 1 < get_child_count():
		play_dialog(current_dialog_index + 1)
	
	else:
		emit_signal("dialog_finish")


func play_dialog(index : int):
	var next_dialog : DialogBox = get_child(index)
	
	if	next_dialog == null or !next_dialog is DialogBox:
		return
	
	if	current_dialog_index != -1:
		get_child(current_dialog_index).disappear()
	
	next_dialog.appear()
	current_dialog_index = index
