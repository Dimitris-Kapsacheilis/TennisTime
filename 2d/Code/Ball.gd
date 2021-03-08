extends KinematicBody2D

onready var pointA = get_node("/root/2d Tennis/Court/HitPoints/A")
onready var pointA2 = get_node("/root/2d Tennis/Court/HitPoints/A2")
onready var pointB = get_node("/root/2d Tennis/Court/HitPoints/B")
onready var pointB2 = get_node("/root/2d Tennis/Court/HitPoints/B2")
onready var pointC = get_node("/root/2d Tennis/Court/HitPoints/C")
onready var pointD = get_node("/root/2d Tennis/Court/HitPoints/D")
onready var swipe = get_node("/root/2d Tennis/Swipe")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var SPEED = 450
var direction = ""
var distance = Vector2(0,0)
var rng = RandomNumberGenerator.new()
var target = ""

func _physics_process(delta):
	if swipe:
		if swipe.direction == "left":
			if swipe.depth == "back":
				if pointA:
					target = "A"
					direction = global_position.direction_to(pointA.global_position)
					distance = position - pointA.global_position
			if swipe.depth == "front":
				if pointA2:
					target = "A2"
					direction = global_position.direction_to(pointA2.global_position)
					distance = position - pointA2.global_position
		if swipe.direction == "right":
			if swipe.depth == "back":
				if pointB:
					target = "B"
					direction = global_position.direction_to(pointB.global_position)
					distance = position - pointB.global_position
			if swipe.depth == "front":
				if pointB2:
					target = "B2"
					direction = global_position.direction_to(pointB2.global_position)
					distance = position - pointB2.global_position
	if abs(distance[0]) <= 5 && abs(distance[1]) <= 5: #already there so dont jitter
		return
	move_and_collide(direction * SPEED * delta)
	#print(distance)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HitPoint_body_entered(body):
	pass
#	if abs(distance[0]) <=35 && abs(distance[1]) <= 85:
#		#print("reached point")
#		#print(direction)
#		rng.randomize()
#		var randPoint = rng.randi_range(0,1)
#		if randPoint:
#			if pointC:
#				swipe.direction = ""
#				direction = global_position.direction_to(pointC.global_position)
#				distance = pointC.global_position - position
#		elif !randPoint:
#			if pointD:
#				swipe.direction = ""
#				direction = global_position.direction_to(pointD.global_position)
#				distance =  pointD.global_position - position
#





func _on_HitZone_body_entered(body):
	#if abs(distance[0]) <=35 && abs(distance[1]) <= 85:

		#print("reached point")
		#print(direction)
	rng.randomize()
	var randPoint = rng.randi_range(0,1)
	if randPoint:
		if pointC:
			swipe.direction = ""
			direction = global_position.direction_to(pointC.global_position)
			distance = pointC.global_position - position
	elif !randPoint:
		if pointD:
			swipe.direction = ""
			direction = global_position.direction_to(pointD.global_position)
			distance =  pointD.global_position - position


