class_name CodeEditor
extends CodeEdit


const COPY_UNTIL_CHAR := preload("res://src/components/code_editor/shortcuts/copy_until_char.tres") as Shortcut

var _file_proxy: FileProxy


func _ready():
	ButtonShortcut.new(COPY_UNTIL_CHAR, self, func(): print("here"))
	
	gutters_draw_line_numbers = true
	auto_brace_completion_enabled = true
	auto_brace_completion_highlight_matching = true
	size_flags_vertical = Control.SIZE_EXPAND_FILL


func filename() -> String:
	if not _file_proxy:
		return "[unsaved]"
	return ""
