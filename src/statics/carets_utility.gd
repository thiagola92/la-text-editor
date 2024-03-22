class_name CaretUtility
extends Node


## Get carets position (line and column).[br]
## Each element of the Array returned is an Array of size 2 with the line and column.
static func get_carets(text_edit: TextEdit) -> Array[Array]:
	var carets: Array[Array] = []
	
	for i in text_edit.get_caret_count():
		carets.append([
			text_edit.get_caret_line(i),
			text_edit.get_caret_column(i)
		])
	
	return carets


## Set carets position.[br]
## Used to load carets generated by [method get_carets].
static func set_carets(text_edit: TextEdit, carets: Array[Array]) -> void:
	for i in carets.size():
		text_edit.set_caret_line(carets[i][0], true, true, 0, i)
		text_edit.set_caret_column(carets[i][1], true, i)
