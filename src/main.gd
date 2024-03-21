extends MarginContainer


const CODE_EDITOR := preload("res://src/components/group_editor/tab_editor/code_editor/code_editor.tscn")

@export var tab_editor: TabEditor

@export var file_opener: FileDialog

@export var project_opener: FileDialog


func _ready() -> void:
	var args: Dictionary = ArgsUtility.get_args()
	
	for arg in args:
		match arg:
			"--dir" when args[arg]:
				printt("dir", args[arg][0])
			"--file" when args[arg]:
				pass


func _shortcut_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_project_open"):
		project_opener.popup_centered()
		get_viewport().set_input_as_handled()
	elif Input.is_action_just_pressed("ui_file_open"):
		file_opener.popup_centered()
		get_viewport().set_input_as_handled()


func _on_file_opener_file_selected(path: String) -> void:
	var code_editor: CodeEditor = CODE_EDITOR.instantiate()
	var file_proxy: FileProxy = FilesProxies.get_file_proxy(path)
	
	code_editor.file_proxy = file_proxy
	tab_editor.add_child(code_editor)


func _on_project_opener_dir_selected(dir: String) -> void:
	var pid = OS.create_instance(["--", "--dir", dir])
