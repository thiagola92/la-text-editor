class_name CodeEditor
extends CodeEdit


const UNNAMED: StringName = "          "

var file_proxy: FileProxy


func filename() -> String:
	if not file_proxy:
		return UNNAMED
	return file_proxy.get_filepath().get_file()
