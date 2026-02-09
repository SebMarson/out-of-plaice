extends Node

#Intro text
const intro_text_to_game: String = "You wake up, again. Still here in this dreary place. Only 5 days left, now. \n Just a few more days of work, surely soon you’ll have enough money to get far from here. \n Far from the horrid sea. \n Anyway, it’s time for work, better get up and out. \n The fish won’t sort themselves."
const explanation_text_to_game: String = "The fishermen will give you their latest catch. \n You must sell the healthy fish, and trash the trained ones. \nYou'll need at least £30 to afford enough fuel to escape. \nYou must use the tools provided to inspect the fish. \nConsult the reference book to find what a healthy fish is like. \nBe careful to only sell healthy fish. Selling tainted fish will corrupt the locals who buy it. \nToo much corruption and you're liable to lose your job..."

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
const reference_book_page_welcome_title: String = "Welcome!"
const reference_book_page_welcome_text: String = "'We were all fish once' - Old Gregg \nIf you can't tell a Cheese from a Fog Nose, you don't belong in the waters. This book contains everything you need to know about fish. More importantly, this book describes how to identify the 'good' fish from the 'bad' fish. If something doesn't look right with you catch, dispose of it as soon as possible. If you're reading this AFTER eating a bad fish, run as far away from civilization as you can..... Enjoy!"

const fish_plaice_description: String = "The most harmless of all fish. \nCan do no wrong. \nA bit boring though."

const fish_cheese_description: String = "You’ll know it from the smell. \nPairs well with a nice wine. \nDon’t leave it at room temp if you value your nose."

const fish_fog_nose_description: String = "Easy to spot from the red glowing nose. Very delicate flesh. Thin as paper! \nThe nose is not edible, despite looking delicious."

const fish_bi_imp_description: String = "Two heads aren't always better than one. \nA lot of work to prepare. Worth it though. \nTwice the head. Twice the flavour."

const fish_lank_description: String = "Longer than you'd think. Much longer. \nCould eat you whole, if you didn't move for 3 days. \nOne ate my ring. Took me a week to find it. Don't recommend."

# Failure text coruption
const failure_text_coruption: String = "You have allowed too many 'bad' fish to be eaten. /n The local community has become too corrupted. /n You no longer have any business. /n Just the sound of the ocean. /n And the horrors within. /n "

#Pages for tools
const tools_description: String = "Knowing your good fish from your bad fish is as easy as knowing what tools to use:"

const scales_description: String = "No not fish scales. Scales for weighing. \nIf the weight of the fish doesn't match what's in the book. \nSomething's not right. Get rid of it!"

const mouth_description: String = "Alright this is less of a tool and more of an inspection. \nLook in the fish's mouth. Sometimes they have a parasite in there which most fish shouldn't have. \nSome fish are actually safer with one. Check the book to be sure."

const lens_description: String = "This might sound crazy but if you look at a fish using this lens, sometimes they glow! \nI dunno if it's radiation or something more sinister but whatever it is, make sure the fish is SUPPOSED to glow before you go serving it for dinner."

const aura_description: String = "Your gut is a tool. Trust it. \nTake a moment to read the aura of the fish. \nEvery fish has an aura and it's up to you to figure out if it's the right aura. \nIf the aura is off, chances are everything about the fish is off as well."
