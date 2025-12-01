extends Node



var objects_destroyed: int = 0
signal destruction_count_changed(new_count: int)

func add_destruction():
	objects_destroyed += 1
	destruction_count_changed.emit(objects_destroyed)
	
func reset_count():
	objects_destroyed = 0
	destruction_count_changed.emit(0)	
