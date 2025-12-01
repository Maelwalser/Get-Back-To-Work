extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DestructionManager.destruction_count_changed.connect(_on_count_changed)
	text = "Destroyed: 0"


func _on_count_changed(count: int):
	text = "Destroyed: " +str(count)
	
	scale = Vector(1.3, 1.3)
	var tween = create_between()
	tween.tween_property(self, "scale", Vector2.ONE, 0.2).set_ease(Tween.EASE_OUT)
