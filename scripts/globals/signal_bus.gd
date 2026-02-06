extends Node

#############
# Signals go here
#############

# Fish Signals
signal spawn_fish()
signal destroy_fish(fish)
signal sell_fish(fish)

# Game State Signals
signal day_timer_expired()
signal day_timer_start(length)
signal pause_start()
signal pause_stop()
