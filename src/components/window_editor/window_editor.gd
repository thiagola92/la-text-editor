class_name WindowEditor
extends Window


signal new_window_requested

const CODE_EDITOR := preload("res://src/components/code_editor/code_editor.tscn")

@export var window_info: WindowInfo

@export var tab_editor: TabEditor

@export var file_opener: FileDialog

@export var project_opener: FileDialog


func _shortcut_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_window_new"):
		new_window_requested.emit()
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_project_open"):
		project_opener.popup_centered()
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_file_open"):
		file_opener.popup_centered()
		get_viewport().set_input_as_handled()


func _close_project() -> void:
	pass


func _on_close_requested() -> void:
	queue_free()


# Open file in the current window.
func _on_file_opener_file_selected(path: String) -> void:
	var code_editor: CodeEditor = CODE_EDITOR.instantiate() as CodeEditor
	var file_proxy: FileProxy = FilesProxies.get_file_proxy(path)
	
	code_editor.file_proxy = file_proxy
	tab_editor.add_child(code_editor)


# Open project in the current window (it will close current project).
func _on_project_opener_dir_selected(dir: String) -> void:
	_close_project()
