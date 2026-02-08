extends Node

# create 2 audio players
var music_player: AudioStreamPlayer
var sfx_player: AudioStreamPlayer
var sfx_stream: AudioStreamPolyphonic
var sfx_playback: AudioStreamPlaybackPolyphonic

# ready function - to make them exists (as ready)
func _ready() -> void:
	music_player = AudioStreamPlayer.new()
	music_player.bus = "music"
	music_player.volume_db = linear_to_db(0.6)
	add_child(music_player)
	sfx_player = AudioStreamPlayer.new()
	sfx_stream = AudioStreamPolyphonic.new()
	sfx_stream.polyphony = 10
	sfx_player.stream = sfx_stream
	sfx_player.bus = "sfx"
	sfx_player.volume_db = linear_to_db(0.4)
	add_child(sfx_player)

# function to play music and check if already playing
func play_music( path_music: String):
	music_player.stream = load(path_music)
	music_player.play() 
 
# function to play sound effects and check if already playing
func play_sfx(path_sfx: String):
	sfx_player.stream = load(path_sfx)
	sfx_player.play() 


func play_random_sfx(sfx_group: Array):
	play_sfx(sfx_group.pick_random())

func stop_sfx():
	sfx_player.stop()

func _loop_music_player():
	music_player.play()
