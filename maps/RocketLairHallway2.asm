	object_const_def
	const ROCKETLAIRHALLWAY2_GRUNTM
	const ROCKETLAIRHALLWAY2_GRUNTF
	const ROCKETLAIRHALLWAY2_ARIANA
	const ROCKETLAIRHALLWAY2_ARCHER
	const ROCKETLAIRHALLWAY2_SUICUNE
	const ROCKETLAIRHALLWAY2_ENTEI

RocketLairHallway2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callback

RocketLairHallway2GruntF:
	end

RocketLairHallway2GruntM:
	end

LairArianaLastMonText:
	text "Not again…"

	para "Not this time…"
	done

TrainerLairAriana:
	trainer ARIANA, ARIANA_5, EVENT_BEAT_LAIR_ARIANA, LairArianaSeenText, LairArianaBeatenText, LairArianaLastMonText, .Script

.Script:
	opentext
	writetext LairArianaBeatenAgainText
	waitbutton
	closetext
	pause 15
	readvar VAR_FACING
	ifequal LEFT, .SuicuneEscapesDown
	playsound SFX_BALL_POOF
	appear ROCKETLAIRHALLWAY2_SUICUNE
	showemote EMOTE_SHOCK, ROCKETLAIRHALLWAY2_ARIANA, 15
	turnobject ROCKETLAIRHALLWAY2_ARIANA, LEFT
	sjump .SuicuneEscapesFinish

.SuicuneEscapesDown:
	moveobject ROCKETLAIRHALLWAY2_SUICUNE, 13, 15
	appear ROCKETLAIRHALLWAY2_SUICUNE
	showemote EMOTE_SHOCK, ROCKETLAIRHALLWAY2_ARIANA, 15
	turnobject ROCKETLAIRHALLWAY2_ARIANA, DOWN
.SuicuneEscapesFinish:
	pause 10
	cry SUICUNE
	pause 10
	playsound SFX_WARP_FROM
	applymovement ROCKETLAIRHALLWAY2_SUICUNE, SuicuneLeavesMovement
	disappear ROCKETLAIRHALLWAY2_SUICUNE
	faceplayer
	opentext
	writetext ArianaFinalText
	waitbutton
	closetext
	pause 10
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROCKETLAIRHALLWAY2_ARIANA
	pause 15
	special FadeInQuickly
	clearevent EVENT_ROUTE_47_SUICUNE
	end

LairArcherLastMonText:
	text "Even now, I can't"
	line "win?"
	done

TrainerLairArcher:
	trainer ARCHER, ARCHER_5, EVENT_BEAT_LAIR_ARCHER, LairArcherSeenText, LairArcherBeatenText, LairArcherLastMonText, .Script

.Script:
	opentext
	writetext LairArcherBeatenAgainText
	waitbutton
	closetext
	pause 15
	readvar VAR_FACING
	ifequal UP, .EnteiEscapesRight
	playsound SFX_BALL_POOF
	appear ROCKETLAIRHALLWAY2_ENTEI
	showemote EMOTE_SHOCK, ROCKETLAIRHALLWAY2_ARCHER, 15
	turnobject ROCKETLAIRHALLWAY2_ARIANA, DOWN
	sjump .EnteiEscapesFinish

.EnteiEscapesRight:
	moveobject ROCKETLAIRHALLWAY2_ENTEI, 16, 3
	appear ROCKETLAIRHALLWAY2_ENTEI
	showemote EMOTE_SHOCK, ROCKETLAIRHALLWAY2_ARCHER, 15
	turnobject ROCKETLAIRHALLWAY2_ARCHER, RIGHT
.EnteiEscapesFinish:
	pause 10
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement ROCKETLAIRHALLWAY2_ENTEI, EnteiLeavesMovement
	disappear ROCKETLAIRHALLWAY2_ENTEI
	faceplayer
	opentext
	writetext ArcherFinalText
	waitbutton
	closetext
	pause 10
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROCKETLAIRHALLWAY2_ARCHER
	pause 15
	special FadeInQuickly
	clearevent EVENT_BURNED_TOWER_B1F_ENTEI
	end

SuicuneLeavesMovement:
	set_sliding
	fast_jump_step LEFT
	fast_jump_step LEFT
	fast_jump_step LEFT
	remove_sliding
	step_end

EnteiLeavesMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	remove_sliding
	step_end

LairArianaSeenText:
	text "That's it!"

	para "I'm sick of you!"

	para "I have to defeat"
	line "you this time!"

	para "I let your friend"
	line "slip by, since"
	cont "the boss will"
	cont "them!"

	para "If I don't, I'll be"
	line "shipped off to the"
	cont "Sevii Islands!"

	para "I'd rather not be"
	line "a part of that"
	cont "project, so I'll"
	cont "use my new #mon"
	cont "to get rid of you!"
	done

LairArianaBeatenText:
	text "Even with Suicune…"
	done

LairArianaBeatenAgainText:
	text "…I guess this is"
	line "it for me…"

	para "I was so close to"
	line "a promotion before"
	cont "you came along…"

	para "Now I'll be demoted"
	line "to a overseeing a"
	cont "construction"
	cont "project on Five"
	cont "Island thanks to"
	cont "you…"
	done

ArianaFinalText:
	text "…Even Suicune has"
	line "abandoned me…"

	para "…Well, goodbye…"

	para "I really hope to"
	line "never see you as"
	cont "long as I live…"

	para "Five Island, here"
	line "I come…"

	para "…Woohoo…"
	done

LairArcherSeenText:
	text "That's far enough."

	para "Do you know how"
	line "difficult it has"
	cont "been to remain on"
	cont "the boss's good"
	cont "side?"

	para "After all the set-"
	line "backs I've had to"
	cont "suffer thanks to"
	cont "you, I'm close to"
	cont "getting shipped"
	cont "out to the Sevii"
	cont "Islands."

	para "I'd rather avoid"
	line "that embaressment,"
	cont "so let's end this."
	done

LairArcherBeatenText:
	text "…My career as an"
	line "Executive…"

	para "…Was it just a"
	line "pipe dream?"
	done

LairArcherBeatenAgainText:
	text "The power of Entei"
	line "did nothing…"

	para "…Perhaps I am not"
	line "worthy of it?"
	done

ArcherFinalText:
	text "So, the Rocket"
	line "Ball failed?"

	para "I knew Ein was no"
	line "good…"

	para "In order to save"
	line "face with the"
	cont "boss, I'm just"
	cont "going to head to"
	cont "Five Island now…"

	para "The warehouse will"
	line "need supervisors,"
	cont "after all…"

	para "The boss is"
	line "waiting."

	para "Don't disappoint"
	line "her…"
	done

RocketLairHallway2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, ROCKET_LAIR_HALLWAY_1, 5
	warp_event  3, 17, ROCKET_LAIR_HALLWAY_1, 5
;	warp_event 15,  0, ROCKET_LAIR_HALLWAY_3, 1
;	warp_event 16,  0, ROCKET_LAIR_HALLWAY_3, 2

	db 0 ; coord_events

	db 0 ; bg events

	db 6 ; object events
	object_event  6, 15, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAIR_GRUNTS
	object_event 16, 12, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAIR_GRUNTS
	object_event 13, 14, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerLairAriana, EVENT_LAIR_ARIANA
	object_event 15,  3, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerLairArcher, EVENT_LAIR_ARCHER
	object_event 12, 14, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_SUICUNE
	object_event 15,  4, SPRITE_ENTEI, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_ENTEI
