extends Area2D

var speed = 100
var width
var height

var hit = false
var gameOver = false
var score = 0

var direction = Vector2()

func _ready():
	position = get_viewport_rect().size / 2 # Set view to (0, 0) position of x and y axis' intersection

	direction.x = rand_range(-1, 1)
	direction.y = rand_range(-1, 1)
	direction = direction.normalized()
	
	width = get_viewport_rect().size.x # Get the X (width) size of the view
	height = get_viewport_rect().size.y # Get the Y (height) size of the view
	
func _process(delta):
	position += speed * direction * delta # delta - the amount of time that passed since the last process' callback
	if position.x < 0 || position.x > width:
		direction.x = -direction.x # Change direction of the UFO's movement in X axis
	if position.y < 0 || position.y > height:
		direction.y = -direction.y # Change direction of the UFO's movement in Y axis
		
	

func _on_UFO_input_event(viewport, event, shape_idx):
	if gameOver:
		gameOver = !gameOver
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT && event.pressed:
		direction.x = rand_range(-1, 1)
		direction.y = rand_range(-1, 1)
		direction = direction.normalized()
		
		position.x = rand_range(1, width - 1)
		position.y = rand_range(1, height - 1)
		
		speed += 5
		score += 1
		hit = true
		$HitSound.play()