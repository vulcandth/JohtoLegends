	db 0 ; species ID placeholder

	db 100, 100, 100, 100, 100, 100
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 45 ; catch rate
	db 64 ; base exp
	db NO_ITEM, LUM_BERRY ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/mew/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, DRAGON_CLAW, CURSE, HEX, ROAR, TOXIC, HAIL, BULK_UP, WILD_CHARGE, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, ICE_BEAM, BLIZZARD, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, BULLDOZE, SOLARBEAM, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, ACROBATICS, FLAMETHROWER, SLUDGE_BOMB, SANDSTORM, FIRE_BLAST, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, ATTRACT, THIEF, STEEL_WING, FLY, SURF, ROOST, FOCUS_BLAST, ENERGY_BALL, WATERFALL, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, POWERUPPUNCH, STONE_EDGE, X_SCISSOR, ICY_WIND, DRAGON_DANCE, DARK_PULSE, DRAGON_PULSE, IRON_HEAD, SWORDS_DANCE, WILL_O_WISP, POISON_JAB, VENOSHOCK, GIGA_IMPACT, FIRE_FANG, THUNDER_FANG, ICE_FANG, DRACO_FANG, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, DRAIN_PUNCH, STEEL_SLICE, STRENGTH_SAP, GYRO_BALL, ICICLE_CRASH, MOONBLAST, HYPNOSIS, GRASS_KNOT
	; end
