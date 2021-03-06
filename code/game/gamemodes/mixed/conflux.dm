/datum/game_mode/conflux
	name = "Wizard & Cult"
	round_description = "A space wizard and a cult have invaded the station!"
	extended_round_description = "Cultists and wizards spawn during this round."
	config_tag = "conflux"
	required_players = 15
	required_enemies = 5
	end_on_antag_death = 1
	antag_tags = list(ROLE_WIZARD, ROLE_CULTIST)
	require_all_templates = 1
	votable = 0