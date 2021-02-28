extends KinematicBody2D


onready var pointA = get_node("/root/2d Tennis/Court/HitPoints/A")
onready var pointA2 = get_node("/root/2d Tennis/Court/HitPoints/A2")
onready var pointB = get_node("/root/2d Tennis/Court/HitPoints/B")
onready var pointB2 = get_node("/root/2d Tennis/Court/HitPoints/B2")
onready var pointC = get_node("/root/2d Tennis/Court/HitPoints/C")
onready var pointD = get_node("/root/2d Tennis/Court/HitPoints/D")
onready var swipe = get_node("/root/2d Tennis/Ball")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 500
var direction = Vector2(0,0)
var distance = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if swipe:
		if swipe.target == "A":
			direction = global_position.direction_to(pointA.global_position)
			distance = position - pointA.global_position
		elif swipe.target == "A2":
			direction = global_position.direction_to(pointA2.global_position)
			distance = position - pointA2.global_position
		elif swipe.target == "B":
			direction = global_position.direction_to(pointB.global_position)
			distance = position - pointB.global_position
		elif swipe.target == "B2":
			direction = global_position.direction_to(pointB2.global_position)
			distance = position - pointB2.global_position
	if abs(distance[0]) <= 5 && abs(distance[1]) <= 5:
		return
	move_and_collide(direction * speed * delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
