## Provides a single point access to a file (proxy pattern).
## 
## Any read/write to a specific file should pass through the proxy responsible for the file.
## This way multiple code editors may open the same file and be notified when each other change the content.[br]
## [br]
## [codeblock]
## var file_proxy = FileProxy.new("main.rs")
## var code_editor0 = CodeEditor.new()
## var code_editor1 = CodeEditor.new()
##
## code_editor0.file_proxy = file_proxy
## code_editor1.file_proxy = file_proxy
##
## # CodeEditors will be notified and will update the content.
## file_proxy.write("print('hello world!')")
## [/codeblock]
class_name FileProxy
extends RefCounted


signal text_changed(text: String)


var _filepath: String = ""


func _init(filepath: String):
	_filepath = filepath


func get_filepath() -> String:
	return _filepath
