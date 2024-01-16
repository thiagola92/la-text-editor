## Provide a single point access to all [FileProxy] in use.
##
## 
class_name FileProxies
extends Node


var _file_proxies: Array[FileProxy] = []


func _process(_delta):
	_remove_inactive_proxies()


func get_file_proxy(filepath: String) -> FileProxy:
	for file_buffer in _file_proxies:
		if file_buffer.get_filepath() == filepath:
			return file_buffer
	
	var new_proxy = FileProxy.new(filepath)
	_file_proxies.append(new_proxy)
	return new_proxy


func _remove_inactive_proxies():
	for file_proxy in _file_proxies:
		printt(file_proxy.get_filepath(), file_proxy.get_reference_count())
		# If only this loop and array are referencing, remove it.
		if file_proxy.get_reference_count() <= 2:
			_file_proxies.erase(file_proxy)
