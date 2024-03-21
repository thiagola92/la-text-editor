extends Control


const WINDOW_EDITOR: PackedScene = preload("res://src/components/window_editor/window_editor.tscn")


func _ready() -> void:
	get_tree().root.mouse_passthrough = true
	_process_arguments()
	_create_window()


# Process arguments passed when using CLI.
func _process_arguments() -> void:
	var args: Dictionary = ArgsUtility.get_args()
	
	for arg in args:
		match arg:
			"--dir" when args[arg]:
				printt("dir", args[arg][0])
			"--file" when args[arg]:
				printt("file", args[arg])


func _create_window() -> void:
	var window: WindowEditor = WINDOW_EDITOR.instantiate() as WindowEditor
	window.new_window_requested.connect(_create_window)
	add_child(window)


func _on_child_order_changed() -> void:
	if get_child_count() == 0:
		get_tree().quit()
