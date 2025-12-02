extends Control

@onready var label = $Label

func _ready() -> void:
	DestructionManager.destruction_count_changed.connect(_on_count_changed)
	label.text = "Destroyed: 0"


func _on_count_changed(count: int):
	label.text = "Destroyed: " +str(count)
	
	label.scale = Vector2(1.3, 1.3)
	var tween = create_tween()
	tween.tween_property(label, "scale", Vector2.ONE, 0.2).set_ease(Tween.EASE_OUT)
