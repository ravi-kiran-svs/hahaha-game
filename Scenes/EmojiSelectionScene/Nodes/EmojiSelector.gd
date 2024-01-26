extends Control
class_name EmojiSelector


signal emoji_picked(index)


func on_emoji_pressed(index : int):
	emit_signal("emoji_picked", index)
