## Provides a single point access to a file (proxy pattern).
## 
## Any read/write to a specific file should pass through the proxy responsible for the file.
## This way multiple [CodeEditor]s may open the same file and be notified when each other change the content.
## [br][br]
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


## Signal that file text has changed.[br]
## Note that it doesn't pass the changed text as argument because it could be big.
signal text_changed

## Signal that the path for the file changed.[br]
signal path_changed


## Holds to path to the file each will be read and wrote to.
var filepath: String = "":
	set(fp):
		filepath = fp
		path_changed.emit()

## Holds the current/future content of the file.[br]
## If multiple editors change the same file, it should update everybody about the change,
## but this doesn't mean that is already saved in the file (it will wait for save request).
var text: String = "":
	set(t):
		text = t
		text_changed.emit()


func _init(path: String):
	filepath = path
	_read()


## Read the content from file and save it in [member text].[br]
## We don't deal with big files, this could crash the editor.
func _read() -> void:
	if not filepath:
		text = ""
	else:
		text = FileAccess.open(filepath, FileAccess.READ).get_as_text()


## Write content to the file.[br]
## Think of this as saving the file.
func write() -> void:
	if not filepath:
		return
	FileAccess.open(filepath, FileAccess.WRITE).store_string(text)
