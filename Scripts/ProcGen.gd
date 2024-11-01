extends Node2D

@export var modules: Array[PackedScene]
@export var tileSize: int = 72
@export var moduleSize: int = 360
@export var moduleHolder: Node2D
@export var scrollSpeed: float = 1;
var moduleHolders: Array[Node2D]
var leftCoord = 0
var rightCoord = 0
var rng

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng = RandomNumberGenerator.new()
	var randInt;
	
	# start with 4 new modules
	for i in range(4):
		newModule()

	print("X",get_viewport_rect().size.x)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	moveGround();

	# once the left side is out of screen delete the module
	if(leftCoord < -(tileSize*moduleHolders[-1].get_child(0).tileWidth)-500): 
		deleteModule()

	# create a new module so it never exits the screen
	if(rightCoord < get_viewport_rect().size.x+moduleSize):
		newModule()



# create new module on the right
func newModule() -> void:
	# select a random module
	var randInt = rng.randf_range(0,modules.size())

	# add a parent node to hold the module
	moduleHolders.push_back(Node2D.new())
	moduleHolder.add_child(moduleHolders[-1])
	moduleHolders[-1].add_child(modules[randInt].instantiate())

	# set position of module
	moduleHolders[-1].position.x = rightCoord

	# increment right coord to be accurate
	rightCoord += tileSize * moduleHolders[-1].get_child(0).tileWidth
	print("R",rightCoord)
	

	
# delete leftmost module
func deleteModule() -> void:
	moduleHolder.remove_child(moduleHolders[0])
	moduleHolders.pop_front()
	leftCoord += tileSize * moduleHolders[-1].get_child(0).tileWidth;
	print("L",leftCoord)



# pan
func moveGround() -> void:
	for module in moduleHolders:
		module.position.x -= 1*scrollSpeed;

	leftCoord -= 1*scrollSpeed;
	rightCoord -= 1*scrollSpeed;
	pass