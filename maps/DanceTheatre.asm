	object_const_def ; object_event constants
	const DANCETHEATRE_KIMONO_GIRL1
	const DANCETHEATRE_GENTLEMAN
	const DANCETHEATRE_RHYDON
	const DANCETHEATRE_GRANNY
	const DANCETHEATRE_TWIN1
	const DANCETHEATRE_TWIN2
	const DANCETHEATRE_TWIN3
	const DANCETHEATRE_TWIN4
	const DANCETHEATRE_TWIN5
	const DANCETHEATRE_CYNTHIA

DanceTheatre_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerKimonoGirlRui:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	checkevent EVENT_BEAT_KIMONO_GIRL_RUI
	iftrue .GiveEevee
	writetext TrainerKimonoGirlRuiText
	waitbutton
	closetext
	winlosstext TrainerKimonoGirlRuiBeatenText, 0
	loadtrainer KIMONO_GIRL, RUI
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIMONO_GIRL_RUI
	opentext
.GiveEevee:
	writetext GiveEeveeText
	buttonsound
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext GotEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 15
	setevent EVENT_GOT_EEVEE
.GotEevee:
	writetext TrainerKimonoGirlRuiAfterBattleText
	waitbutton
	closetext
	end

.NoRoom:
	writetext NoRoomText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KIMONO_GIRL_RUI
	iftrue .WildCharge
	writetext SurfGuyNeverLeftAScratchText
	waitbutton
	closetext
	end

.WildCharge:
	checkevent EVENT_GOT_TM09_WILD_CHARGE
	iftrue .WildChargeExplanation
	writetext SurfGuyLikeADanceText
	buttonsound
	verbosegiveitem TM_WILD_CHARGE
	setevent EVENT_GOT_TM09_WILD_CHARGE
	writetext SurfGuyWildChargeExplanationText
	waitbutton
	closetext
	end

.WildChargeExplanation:
	writetext SurfGuyWildChargeExplanationText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	refreshscreen
	pokepic RHYDON
	cry RHYDON
	waitbutton
	closepokepic
	opentext
	writetext RhydonText
	waitbutton
	closetext
	end

DanceTheatreGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GiveStones
	writetext DanceTheatreGrannyText
	waitbutton
	closetext
	end

.GiveStones:
	checkevent EVENT_GOT_STONE_FROM_THEATRE
	iftrue .NoStones
	writetext YouGotAnEeveeText
	waitbutton
	loadmenu DanceTheatreStonesMenu
	verticalmenu
	closewindow
	ifequal 1, .WaterStone
	ifequal 2, .ThunderStone
	ifequal 3, .FireStone
	ifequal 4, .SunStone
	ifequal 5, .NewMenu
	sjump .MaybeLater

.NewMenu:
	loadmenu DanceTheatreStonesMenu2
	verticalmenu
	closewindow
	ifequal 1, .MoonStone
	ifequal 2, .LeafStone
	ifequal 3, .IceStone
	ifequal 4, .ShinyStone
	ifequal 5, .MaybeLater
	sjump .MaybeLater

.NoStones:
	writetext HowIsYourEeveeText
	waitbutton
	closetext
	end

.WaterStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem WATER_STONE
	writetext VaporeonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.ThunderStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem THUNDERSTONE
	writetext JolteonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.FireStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem FIRE_STONE
	writetext FlareonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.SunStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem SUN_STONE
	writetext EspeonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.MoonStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem MOON_STONE
	writetext UmbreonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.LeafStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem LEAF_STONE
	writetext LeafeonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.IceStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem ICE_STONE
	writetext GlaceonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.ShinyStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem SHINY_STONE
	writetext SylveonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.MaybeLater:
	writetext OKMaybeNextTimeText
	waitbutton
	closetext
	end

DanceTheatreStonesMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y - 0
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "Water Stone@"
	db "Thunderstone@"
	db "Fire Stone@"
	db "Sun Stone@"
	db "Next Page@"

DanceTheatreStonesMenu2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y - 0
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 5 ; items	
	db "Moon Stone@"
	db "Leaf Stone@"
	db "Ice Stone@"
	db "Shiny Stone@"
	db "Cancel@"

DanceTheaterCynthiaScript:
	playmusic MUSIC_CYNTHIA_ENCOUNTER
	faceplayer
	opentext
	writetext CynthiaIntroductionText
	waitbutton
	closetext
	winlosstext CynthiaBeatenText, CynthiaDanceTheaterLastPkmnText
	loadtrainer TOURIST, CYNTHIA1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_CYNTHIA_ENCOUNTER
	opentext
	writetext HeadingToWildAreText
	waitbutton
	closetext
	setevent EVENT_DANCE_THEATER_CYNTHIA
	clearevent EVENT_WILD_AREA_CYNTHIA
	readvar VAR_FACING
	ifequal LEFT, .CynthiaLeavesOther
	applymovement DANCETHEATRE_CYNTHIA, CynthiaLeavesDanceTheaterMovement1
	disappear DANCETHEATRE_CYNTHIA
	playsound SFX_EXIT_BUILDING
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.CynthiaLeavesOther
	applymovement DANCETHEATRE_CYNTHIA, CynthiaLeavesDanceTheaterMovement2
	disappear DANCETHEATRE_CYNTHIA
	playsound SFX_EXIT_BUILDING
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

CynthiaLeavesDanceTheaterMovement1:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end

CynthiaLeavesDanceTheaterMovement2:
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end

DanceTheatreFancyPanel:
	jumptext DanceTheatreFancyPanelText

QuintupletNaokoScript:
	jumptextfaceplayer QuintupletNaokoText

QuintupletSayoScript:
	jumptextfaceplayer QuintupletSayoText

QuintupletZukiScript:
	jumptextfaceplayer QuintupletZukiText

QuintupletKuniScript:
	jumptextfaceplayer QuintupletKuniText

QuintupletMikiScript:
	jumptextfaceplayer QuintupletMikiText

TrainerKimonoGirlRuiText:
	text "Oh, hello there."

	para "Welcome to the"
	line "Dance House. My"
	cont "name is Rui."

	para "I learned to dance"
	line "from a young age."

	para "It is something I"
	line "truly enjoy."

	para "#mon battles"
	line "are also something"
	cont "I enjoy."

	para "Would you care to"
	line "join me in a"
	cont "dance?"
	done

TrainerKimonoGirlRuiBeatenText:
	text "Truly an elegant"
	line "dance."
	done

GiveEeveeText:
	text "That was an"
	line "inspired dance."

	para "Here, I want you"
	line "to have this."

	para "It's an Eevee."

	para "It's a wonderful"
	line "little #mon."

	para "It will evolve in-"
	line "to one of eight"
	cont "different forms."

	para "Please take good"
	line "care of it."
	done

GotEeveeText:
	text "<PLAYER> received"
	line "Eevee!"
	done

TrainerKimonoGirlRuiAfterBattleText:
	text "If you see my son,"
	line "Bill, in Goldenrod"
	cont "City, please visit"
	cont "him."

	para "He's a good boy,"
	line "and he's quite a"
	cont "wiz with tech-"
	cont "nology."
	done

NoRoomText:
	text "Oh dear, you have"
	line "no room in your"
	cont "party for this."
	done

QuintupletNaokoText:
	text "Naoko: Rui's"
	line "Flareon is so"
	cont "pretty!"

	para "I want one when"
	line "I'm older!"
	done

QuintupletSayoText:
	text "Sayo: I'm going"
	line "to train to be a"
	cont "Kimono Girl just"
	cont "like Rui!"
	done

QuintupletZukiText:
	text "Zuki: I want a"
	line "barrette like Rui!"

	para "It's so shiny!"
	done

QuintupletKuniText:
	text "Kuni: Vaporeon is"
	line "so elegant!"

	para "It's the coolest!"
	done

QuintupletMikiText:
	text "Miki: My favorite"
	line "is Jolteon! It's"
	cont "so pointy!"
	done

SurfGuyNeverLeftAScratchText:
	text "Not only is Rui a"
	line "great dancer, but"

	para "she is also really"
	line "skilled at"
	cont "#mon."

	para "I always challenge"
	line "her, but I've"

	para "never even left a"
	line "scratch…"
	done

SurfGuyLikeADanceText:
	text "The way you bat-"
	line "tled, it was like"
	cont "watching a dance."

	para "It was a rare"
	line "treat to see!"

	para "I want you to have"
	line "this. Don't worry"
	cont "--take it!"
	done

SurfGuyWildChargeExplanationText:
	text "That's Wild"
	line "Charge."

	para "It's a move that"
	line "lets a #mon"
	cont "rush the opponent"

	para "recklessly while"
	line "charged with"
	cont "electricity."

	para "It's not the most"
	line "elegant move."

	para "That's probably"
	line "why I always lose"
	cont "to Rui."
	done

RhydonText:
	text "Rhydon: Gugooh"
	line "gugogooh!"
	done

DanceTheatreCooltrainerMText:
	text "That man's always"
	line "with his Rhydon."

	para "Says he wants a"
	line "#mon that can"
	cont "Surf and dance."

	para "Is he trying to"
	line "make a synchro-"
	cont "nized swimming"
	cont "#mon?"
	done

DanceTheatreGrannyText:
	text "The Kimono Girl"
	line "Rui is so"
	cont "beautiful…"

	para "But she had to"
	line "go through rigor-"
	cont "ous training."

	para "And she had to"
	line "learn to follow"

	para "customs before ap-"
	line "pearing in public."

	para "But if you love"
	line "something, any-"
	cont "thing is possible."

	para "The little girls"
	line "there wish to be"
	cont "like her someday."

	para "Tell you what,"
	line "if you can beat"
	cont "her in a battle"
	cont "and get a reward"
	cont "from her,"

	para "then I'll give"
	line "something useful."
	done

DanceTheatreFancyPanelText:
	text "It's a fancy panel"
	line "that's decorated"
	cont "with flowers."
	done

YouGotAnEeveeText:
	text "Oh, I see you have"
	line "an Eevee."

	para "The most versatile"
	line "of #mon, Eevee"
	cont "can evolve into"
	cont "one of 8 forms."

	para "I can give you an"
	line "item to evolve it,"
	cont "but only one."

	para "Choose wisely."
	done

HereYouGoText:
	text "Here you go."
	done

VaporeonText:
	text "Vaporeon the Water"
	line "type. An excellent"
	cont "choice."
	done

JolteonText:
	text "Jolteon the Elect-"
	line "ric type. An exce-"
	cont "llent choice."
	done

FlareonText:
	text "Flareon the Fire"
	line "type. An excellent"
	cont "choice."
	done

EspeonText:
	text "Espeon the Psychic"
	line "type. An excellent"
	cont "choice."
	done

UmbreonText:
	text "Umbreon the Dark"
	line "type. An excellent"
	cont "choice."
	done

LeafeonText:
	text "Leafeon the Grass"
	line "type. An excellent"
	cont "choice."
	done

GlaceonText:
	text "Glaceon the Ice"
	line "type. An excellent"
	cont "choice."
	done

SylveonText:
	text "Sylveon the Fairy"
	line "type. An excellent"
	cont "choice."
	done

HowIsYourEeveeText:
	text "How's your Eevee?"

	para "Has it evolved"
	line "yet?"
	done

OKMaybeNextTimeText:
	text "OK. Perhaps later."
	done

CynthiaIntroductionText:
	text "Hello. My name is"
	line "Cynthia."

	para "I have travelled"
	line "from Sinnoh, and"
	cont "I just love myths"
	cont "and legends."

	para "I hoped to visit"
	line "the Bell Tower and"
	cont "Burned Tower to"
	cont "learn more about"
	cont "them, but I'm not"
	cont "allowed in."

	para "I can't get to the"
	line "Ruins of Alph"
	cont "right now, with"
	cont "the reports of the"
	cont "strange trees in"
	cont "the area."

	para "I decided to learn"
	line "from the dances"
	cont "performed here in"
	cont "the meantime."

	para "Would you like to"
	line "battle to pass the"
	cont "time?"
	done

CynthiaBeatenText:
	text "You're quite good!"
	done

HeadingToWildAreText:
	text "Nicely done."

	para "You're a better"
	line "trainer than you"
	cont "appear."

	para "Perhaps we shall"
	line "meet again."

	para "I am heading to"
	line "the Wild Area near"
	cont "Cianwood City."

	para "There's supposed to"
	line "be plenty of rare"
	cont "#mon there."

	para "See you around."
	done

CynthiaDanceTheaterLastPkmnText:
	text "Backed into a"
	line "corner, huh?"

DanceTheatre_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  6, BGEVENT_UP, DanceTheatreFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheatreFancyPanel

	db 10 ; object events
	object_event  5,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerKimonoGirlRui, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event  1,  8, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheatreGrannyScript, -1
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, QuintupletNaokoScript, -1
	object_event  8,  6, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, QuintupletSayoScript, -1
	object_event  9,  5, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, QuintupletZukiScript, -1
	object_event 10,  6, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, QuintupletKuniScript, -1
	object_event 11,  5, SPRITE_TWIN, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, QuintupletMikiScript, -1
	object_event  3, 10, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DanceTheaterCynthiaScript, EVENT_DANCE_THEATER_CYNTHIA
