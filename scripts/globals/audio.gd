extends Node

# create 2 audio players
var music_player 
var sfx_player 

# ready function - to make them exists (as ready)
func _ready() -> void:
	music_player = AudioStream.new()
	sfx_player = AudioStream.new()

# function to play music and check if already playing
func play_music(stream: AudioStream):
	if music_player.stream == stream and music_player.playing:
		return 
	music_player.stream = stream
	music_player.bus = "music"
	music_player.play() 

# function to play sound effects and check if already playing
func play_sfx(stream: AudioStream):
	if sfx_player.stream == stream and sfx_player.playing:
		return 
	sfx_player.stream = stream
	sfx_player.bus = "sfx"
	sfx_player.play() 
