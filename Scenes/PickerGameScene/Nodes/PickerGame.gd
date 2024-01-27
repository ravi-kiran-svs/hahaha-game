extends Control
class_name PickerGame


signal solved


export(int) var total_pieces : int = 5


var pieces_solved : int = 0


onready var picker_pieces : Node = $PickerPieces


func _ready():
	for	piece in picker_pieces.get_children():
		piece = piece as Button
		piece.connect("pressed", self, "on_picker_piece_pressed")


func on_picker_piece_pressed():
	pieces_solved += 1
	if	pieces_solved == total_pieces:
		emit_signal("solved")
