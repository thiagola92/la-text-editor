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
			file_proxy.text_changed.connect(_reload_text)
			_load_text()

## Used to temporarily backup carets before loading text changes in [FileProxy].
var _carets_backup: Array[Array]


func _shortcut_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_file_save"):
		_save_text()
		get_viewport().set_input_as_handled()


## Get the file name.
func filename() -> String:
	if not file_proxy:
		return UNNAMED
	
	return file_proxy.filepath.get_file()


## Load the [FileProxy.text] into [member CodeEdit.text].[br]
## [b]Note[/b]: Use [method _reload_text] if you need to preserve information (like carets positions).
func _load_text() -> void:
	if not file_proxy:
		return
	
	text = file_proxy.text


## Reload the [FileProxy.text] into [member CodeEdit.text].[br]
## This will try to preserve informations from previous text (like carets positions).
func _reload_text() -> void:
	if not file_proxy:
		return
	
	_carets_backup = CaretUtility.get_carets(self)
	text = file_proxy.text
	CaretUtility.set_carets(self, _carets_backup)


func _save_text() -> void:
	if not file_proxy:
		# TODO: Ask user where to save file and to name it.
		return
	
	file_proxy.write()


## Update the [member FileProxy.text] with this [member CodeEdit.text].[br]
## This is called every typo change, this way others [CodeEditor]s using
## the same [FileProxy] can change at the same time. In others words,
## this will trigger [method _load_text] after.[br]
func _on_text_changed() -> void:
	if not file_proxy:
		return
	
	file_proxy.text = text
