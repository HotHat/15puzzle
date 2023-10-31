extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
@export var ps:Vector2 = Vector2()
@export var target:int = 0
@export var target_pos:Vector2 = Vector2()
@export var is_update:bool = false
@export var is_finish:bool = false

const FIRST = 2
const SECOND = 4
const RADIUS = 5

var _size = Vector2(0, 0)

var POSITION = Vector2(0, 0)
var cls = {
	2: Color("#eee4da"),
	4: Color("#ede0c8"),
	8: Color("#f2b179"),
	16: Color("#f59563"),
	32: Color("#f67c5f"),
	64: Color("#f65e3b"),
	128: Color("#edcf72"),
	256: Color("#edcc61"),
	512: Color("#edc850"),
	1024: Color("#edc53f")
}
var style = StyleBoxFlat.new()
var color = null
const SIZE = Vector2(142, 142)

# Called when the node enters the scene tree for the first time.
func _ready():
	style.set_corner_radius_all(RADIUS)
	#if randf() > 0.95:
	#	set_second()
	#else:
	#	set_first()
	#style.bg_color = Color(0, 1, 0.8, 1)
	#self.size = SIZE
	POSITION = Vector2(-(SIZE.x/2), -(SIZE.y/2))
	$Label.size = SIZE
	$Label.position = POSITION
	pass # Replace with function body.

func set_size(size):
	$Label.size = size
	self._size = size
	pass
	
func set_font_size(size):
	$Label.label_settings.set_font_size(size+10)
	#var dynamic_font = FontFile.new()
	#dynamic_font.font_data = load("res://assert/Lato-Bold.ttf")
	#dynamic_font.size = size
	#$"Label".set("label_settings/font/size", 32)
	#$Label.label_settings.font.size =  32
	pass

func set_first():
	set_text(str(FIRST))
	
func set_second():
	set_text(str(SECOND))

func get_num():
	return int($Label.text)

func set_text(txt):
	$Label.text = str(txt)
	style.bg_color = cls[4]
	#update()
	
func update_text():
	var x = int($Label.text)
	x += x
	set_text(x)
	
func get_rect():
	return Rect2(Vector2(position.x - _size.x/2, position.y-_size.y/2), _size)

func zoom():
	var from = Vector2(1, 1)
	var to = Vector2(1.05, 1.05)
	var tween = create_tween()
	tween.interpolate_property(self, "scale", from, to, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	tween.interpolate_property(self, "scale", to, from, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func _draw():
	draw_style_box(style, Rect2(POSITION, self._size))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

