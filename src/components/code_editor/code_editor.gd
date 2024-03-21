## A text editor for coding.
##
## This is used by the user to interact with [b]one[/b] file from the system.[br][br]
##
## The file will be updated/created when the user save it,
## until there it should store modifications in the text editor (or
## in a temporary file if they are too big).[br]
class_name CodeEditor
extends CodeEdit


## The name used when the files name has not being setted.[br]
## It's not a valid name in Linux, so it protects the editor
## from creating without naming it first.
const UNNAMED: StringName = "          "

## Set the [FileProxy] to write & read from a file.[br]
## This should be set only [b]once[/b] (when initializing).
var file_proxy: FileProxy:
	set(fp):
		file_proxy = fp
		
		if fp:
			file_proxy.text_changed.connect(reload_text)
			reload_text()


func _shortcut_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_file_save"):
		save_text()
		get_viewport().set_input_as_handled()


## Get the file name.
func filename() -> String:
	if not file_proxy:
		return UNNAMED
	return file_proxy.filepath.get_file()


## Load the [FileProxy.text] into [member CodeEdit.text].
func reload_text() -> void:
	if not file_proxy:
		return
	text = file_proxy.text


## Update the [member FileProxy.text] with this [member CodeEdit.text].[br]
## This is called every typo changem, this way others [CodeEditor]s using
## the same [FileProxy] can change at the same time. In others words,
## this will trigger [method reload_text] after.[br]
func update_text() -> void:
	file_proxy.text = text


func save_text() -> void:
	# Backup carets positions
	var lines: Array[int] = []
	var columns: Array[int] = []
	
	for i in get_caret_count():
		lines.append(get_caret_line(i))
		columns.append(get_caret_column(i))
	
	file_proxy.write()
	
	assert(lines.size() == columns.size())
	
	for i in lines.size():
		set_caret_line(lines[i], true, true, 0, i)
		set_caret_column(columns[i], true, i)
