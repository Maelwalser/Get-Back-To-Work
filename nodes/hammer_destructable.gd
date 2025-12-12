extends Node3D

@export var max_health : int = 30 # Set to 30 so: 30 / 10 damage = 3 hits
@onready var current_health : int = max_health

var is_dying : bool = false

func take_damage(amount: int):
	# Prevent taking damage if we are already in the process of disappearing
	if is_dying: return
	
	current_health -= amount
	print("Couch Hit! Health remaining: ", current_health)
	
	if current_health > 0:
		# Optional: Add a small "wobble" here to show it was hit
		_play_hit_reaction()
	else:
		destroy()

func _play_hit_reaction():
	# A tiny shake to indicate the hit registered
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector3(1.1, 0.9, 1.1), 0.05)
	tween.tween_property(self, "scale", Vector3.ONE, 0.05)

func destroy():
	is_dying = true
	
	# Disable collision immediately so the hammer doesn't hit it again while it shrinks
	if has_node("CollisionShape3D"):
		$CollisionShape3D.set_deferred("disabled", true)
	
	# VISUAL POLISH: Rapidly shrink to 0 instead of vanishing instantly
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector3.ZERO, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	
	# Delete the object only after the shrink animation finishes
	tween.finished.connect(queue_free)
