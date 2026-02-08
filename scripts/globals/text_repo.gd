extends Node

#Intro text
const intro_text_to_game: String = "You wake up, again. Still here in this dreary place. \n Another day at work, surely soon you’ll have enough money to get far from here. \n Far from the horrid sea. \n Anyway, it’s time for work, better get up and out. \n The fish won’t sort themselves."

#Game Over text - Player causes too much corruption
const gameover_text_corruption: String = "You have allowed too many bad fish to be eaten.
\nThe local community has become too corrupted.
\nYou no longer have any business. 
\nJust the sound of the ocean.
\nAnd the horrors within."

#Game Over text - Player doesn't make enough money
const gameover_text_bad_ending: String = "The day has finally come to pack your bags and get as far away as you possibly can from this accursed place. 
\nYou count the money you've earned from sorting those fish-adjacent nightmares all week.
\nThe dread catches up with you. 
\nYou don't have enough money to survive out there. You'll run out of fuel and starve well before you make it to any kind of civilisation.
\nYour hand trembles. The few coins you have fall, onto the floor, through the cracks and into the water below.
\nThe only thing left for you to do:"

#Game Over text - Player DOES make enough money
const gameover_text_good_ending: String = "The day has finally come to pack your bags and get as far away as you possibly can from this accursed place. 
\nYou count the money you've earned from sorting those fish-adjacent nightmares all week.
\nMore than enough!
\nYou take a deep breathe of the ocean spray, full of salt and sinister thoughts, and head straight for your vehicle.
\nYou pray to whatever will listen that you'll never have to see the ocean or another fish again. 
\nYou don't hesitate to get Out of this Plaice."

# Reference book text
const reference_book_page_zero_title: String = "Welcome!"
const reference_book_page_zero_text: String = "'We were all fish once' - Old Gregg \nIf you can't tell a Cheese from a Fog Nose, you don't belong in the waters. This book contains everything you need to know about fish. More importantly, this book describes how to identify the 'good' fish from the 'bad' fish. If something doesn't look right with you catch, dispose of it as soon as possible. If you're reading this AFTER eating a bad fish, run as far away from civilization as you can..... Enjoy!"

const reference_book_page_one_title: String = "Plaice"
const reference_book_page_one_fish_texture: String = "res://resources/images/fish/fish_plaice_normal.png"
const reference_book_page_one_desc: String = "The most harmless of all fish. \nCan do no wrong. \nA bit boring though."
const reference_book_page_one_weight: String = "350g - 450g"
const reference_book_page_one_parasites: String = "None"
const reference_book_page_one_aura: String = "fishy"
const reference_book_page_one_value: String = "Low"
const reference_book_page_one_rarity: String = "Common"
const reference_book_page_one_glow: String = "Should not glow"

const reference_book_page_two_title: String = "Cheese"
const reference_book_page_two_fish_texture: String = "res://resources/images/fish/fish_cheese_normal.png"
const reference_book_page_two_desc: String = "You’ll know it from the smell. \nPairs well with a nice wine. \nDon’t leave it at room temp if you value your nose."
const reference_book_page_two_weight: String = "20g"
const reference_book_page_two_parasites: String = "None"
const reference_book_page_two_aura: String = "Stinky"
const reference_book_page_two_value: String = "Low"
const reference_book_page_two_rarity: String = "Common"
const reference_book_page_two_glow: String = "Should not glow"

const reference_book_page_three_title: String = "Fog Nose"
const reference_book_page_three_fish_texture: String = "res://resources/images/fish/fish_fog_nose_normal.png"
const reference_book_page_three_desc: String = "Easy to spot from the red glowing nose. Very delicate flesh. Thin as paper! \nThe nose is not edible, despite looking delicious."
const reference_book_page_three_weight: String = "1g - 7g"
const reference_book_page_three_parasites: String = "None"
const reference_book_page_three_aura: String = "Hauntingly Cute"
const reference_book_page_three_value: String = "Medium"
const reference_book_page_three_rarity: String = "Rare"
const reference_book_page_three_glow: String = "Should glow"

const reference_book_page_four_title: String = "Bi-Imp"
const reference_book_page_four_fish_texture: String = "res://resources/images/fish/fish_bi_imp_normal.png"
const reference_book_page_four_desc: String = "Two heads aren't always better than one. \nA lot of work to prepare. Worth it though. \nTwice the head. Twice the flavour."
const reference_book_page_four_weight: String = "44g - 60g"
const reference_book_page_four_parasites: String = "None"
const reference_book_page_four_aura: String = "Indecisive"
const reference_book_page_four_value: String = "High"
const reference_book_page_four_rarity: String = "Medium"
const reference_book_page_four_glow: String = "Should not glow"

const reference_book_page_five_title: String = "Lank"
const reference_book_page_five_fish_texture: String = "res://resources/images/fish/fish_lank_normal.png"
const reference_book_page_five_desc: String = "Longer than you'd think. Much longer. \nCould eat you whole, if you didn't move for 3 days. \nOne ate my ring. Took me a week to find it. Don't recommend."
const reference_book_page_five_weight: String = "4kg - 30kg"
const reference_book_page_five_parasites: String = "Yes (Adds flavour)"
const reference_book_page_five_aura: String = "Intense"
const reference_book_page_five_value: String = "Medium"
const reference_book_page_five_rarity: String = "Common"
const reference_book_page_five_glow: String = "Should not glow"

<<<<<<< Updated upstream
# Failure text coruption
const failure_text_coruption: String = "You have allowed too many 'bad' fish to be eaten. /n The local community has become too corrupted. /n You no longer have any business. /n Just the sound of the ocean. /n And the horrors within. /n "
=======
#Pages for tools
const reference_book_page_six_title: String = "Tools"
const reference_book_page_six_text: String = "Knowing your good fish from your bad fish is as easy as knowing what tools to use:"

const reference_book_page_seven_title: String = "Scales"
const reference_book_page_seven_text: String = "No not fish scales. Scales for weighing. \nIf the weight of the fish doesn't match what's in the book. \nSomething's not right. Get rid of it!"

const reference_book_page_eight_title: String = "Check the mouth"
const reference_book_page_eight_text: String = "Alright this is less of a tool and more of an inspection. \nLook in the fish's mouth. Sometimes they have a parasite in there which most fish shouldn't have. \nSome fish are actually safer with one. Check the book to be sure."

const reference_book_page_nine_title: String = "Lens"
const reference_book_page_nine_text: String = "This might sound crazy but if you look at a fish using this lens, sometimes they glow! \nI dunno if it's radiation or something more sinister but whatever it is, make sure the fish is SUPPOSED to glow before you go serving it for dinner."

const reference_book_page_ten_title: String = "Aura"
const reference_book_page_ten_text: String = "Your gut is a tool. Trust it. \nTake a moment to read the aura of the fish. \nEvery fish has an aura and it's up to you to figure out if it's the right aura. \nIf the aura is off, chances are everything about the fish is off as well."

#Lick has been removed
#const reference_book_page_eleven_title: String = "Lick"
#const reference_book_page_elven_text: String = "Absolutely useless. Don't bother. Unless you like the taste of raw fish."
>>>>>>> Stashed changes
