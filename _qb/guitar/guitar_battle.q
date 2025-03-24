script battle_broken_string 
	if (($is_network_game = 1) && ($<other_player_status>.Player = 1))
		if NOT GotParam \{string_to_break}
			return
		endif
	endif
	repair_ammount = 5
	switch <difficulty>
		case easy
		<repair_ammount> = ($battlemode_powerups [5].easy_repair)
		case medium
		<repair_ammount> = ($battlemode_powerups [5].medium_repair)
		case hard
		<repair_ammount> = ($battlemode_powerups [5].hard_repair)
		case expert
		<repair_ammount> = ($battlemode_powerups [5].expert_repair)
	endswitch
	victim_is_local = 1
	if ($<other_player_status>.Player = 1)
		spawnscript GH_BattleMode_Player1_SFX_BrokenString_Start params = {holdtime = <drain_time>} id = battlemode
	else
		if ($is_network_game)
			<victim_is_local> = 0
		endif
		spawnscript GH_BattleMode_Player2_SFX_BrokenString_Start params = {holdtime = <drain_time>} id = battlemode
	endif
	if (<difficulty> = easy)
		highest_value = 3
	else
		if (<difficulty> = medium)
			highest_value = 4
		else
			highest_value = 5
		endif
	endif
	if (($is_network_game) && ($<other_player_status>.Player = 1))
		X = <string_to_break>
	else
		GetArraySize \{$gem_colors}
		gem_color = 0
		non_broken_index = 0
		non_broken_strings = [-1 -1 -1 -1 -1]
		begin
		switch <gem_color>
			case 0
			if ($<other_player_status>.broken_string_green = 0)
				SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 1
			if ($<other_player_status>.broken_string_red = 0)
				SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 2
			if ($<other_player_status>.broken_string_yellow = 0)
				SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 3
			if ($<other_player_status>.broken_string_blue = 0)
				SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 4
			if ($<other_player_status>.broken_string_orange = 0)
				SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
		endswitch
		<gem_color> = (<gem_color> + 1)
		repeat <highest_value>
		if (<non_broken_index> = 0)
			GetRandomValue Name = X a = 1 b = <highest_value> integer
		else
			GetRandomValue Name = random_index a = 0 b = (<non_broken_index> - 1) integer
			X = ((<non_broken_strings> [<random_index>]) + 1)
		endif
	endif
	num_hammers = <repair_ammount>
	switch <X>
		case 1
		Change structurename = <other_player_status> broken_string_green = ($<other_player_status>.broken_string_green + <num_hammers>)
		mask = 65536
		case 2
		Change structurename = <other_player_status> broken_string_red = ($<other_player_status>.broken_string_red + <num_hammers>)
		mask = 4096
		case 3
		Change structurename = <other_player_status> broken_string_yellow = ($<other_player_status>.broken_string_yellow + <num_hammers>)
		mask = 256
		case 4
		Change structurename = <other_player_status> broken_string_blue = ($<other_player_status>.broken_string_blue + <num_hammers>)
		mask = 16
		case 5
		Change structurename = <other_player_status> broken_string_orange = ($<other_player_status>.broken_string_orange + <num_hammers>)
		mask = 1
	endswitch
	printf "breaking string %s" s = <X>
	SpawnScriptNow break_string params = {id = (<X> - 1) other_player_status = <other_player_status>}
	SpawnScriptNow update_broken_button params = {id = (<X> - 1) other_player_status = <other_player_status>}
	update_broken_string_arrows id = (<X> - 1) other_player_status = <other_player_status>
	bail = 0
	if NOT ($<other_player_status>.broken_string_mask = 0)
		if ($<other_player_status>.whammy_attack < 1)
			<bail> = 1
		endif
	endif
	Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
	if (<bail>)
		return
	endif
	GetHeldPattern controller = ($<other_player_status>.controller) nobrokenstring
	total_broken_strings = 1
	GetArraySize \{$gem_colors}
	begin
	last_hold_pattern = <hold_pattern>
	GetHeldPattern controller = ($<other_player_status>.controller) nobrokenstring
	net_update_flags = 0
	if (($<other_player_status>.bot_play = 1) &&
			($<other_player_status>.debug_bot_mode > 0))
		if ($<other_player_status>.whammy_attack < 1)
			GetSongTimeMs
			delta_time = ((<time>) - ($<other_player_status>.debug_bot_last_broken_string_time))
			if (((<delta_time>) > $<other_player_status>.debug_bot_broken_string_delay) || ((<delta_time>) < 0))
				<last_hold_pattern> = 0
				<hold_pattern> = 69905
				change structurename = <other_player_status> debug_bot_last_broken_string_time = <time>
			else
				change \{boss_pattern = 0}
			endif
		endif
	endif
	if NOT (<last_hold_pattern> = <hold_pattern>)
		check_button = 65536
		array_count = 0
		begin
		broken_string_id = ($broken_strings [<array_count>])
		if NOT (<last_hold_pattern> && <check_button>)
			if (<hold_pattern> && <check_button>)
				if NOT ($<other_player_status>.<broken_string_id> = 0)
					switch <array_count>
						case 0
						Change structurename = <other_player_status> broken_string_green = ($<other_player_status>.broken_string_green - 1)
						mask = 4369
						<net_update_flags> = (<net_update_flags> || <check_button>)
						SoundEvent event = Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_green) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_green = 0)
							repair_string other_player_status = <other_player_status> id = <array_count>
						endif
						case 1
						Change structurename = <other_player_status> broken_string_red = ($<other_player_status>.broken_string_red - 1)
						mask = 65809
						<net_update_flags> = (<net_update_flags> || <check_button>)
						SoundEvent event = Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_red) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_red = 0)
							repair_string other_player_status = <other_player_status> id = <array_count>
						endif
						case 2
						Change structurename = <other_player_status> broken_string_yellow = ($<other_player_status>.broken_string_yellow - 1)
						mask = 69649
						<net_update_flags> = (<net_update_flags> || <check_button>)
						SoundEvent event = Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_yellow) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_yellow = 0)
							repair_string other_player_status = <other_player_status> id = <array_count>
						endif
						case 3
						Change structurename = <other_player_status> broken_string_blue = ($<other_player_status>.broken_string_blue - 1)
						mask = 69889
						<net_update_flags> = (<net_update_flags> || <check_button>)
						SoundEvent event = Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_blue) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_blue = 0)
							repair_string other_player_status = <other_player_status> id = <array_count>
						endif
						case 4
						Change structurename = <other_player_status> broken_string_orange = ($<other_player_status>.broken_string_orange - 1)
						mask = 69904
						<net_update_flags> = (<net_update_flags> || <check_button>)
						SoundEvent event = Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_orange) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_orange = 0)
							repair_string other_player_status = <other_player_status> id = <array_count>
						endif
					endswitch
					if ($<other_player_status>.<broken_string_id> = 0)
						if ($<other_player_status>.whammy_attack < 1)
							Wait \{1
								gameframe}
							Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
						endif
					endif
				endif
				total_broken_strings = ($<other_player_status>.broken_string_green +
					$<other_player_status>.broken_string_red +
					$<other_player_status>.broken_string_yellow +
					$<other_player_status>.broken_string_blue +
					$<other_player_status>.broken_string_orange)
			endif
		endif
		<check_button> = (<check_button> / 16)
		array_count = (<array_count> + 1)
		repeat <array_Size>
	endif
	if ($is_network_game)
		if NOT (<net_update_flags> = 0)
			if NOT ($<other_player_status>.highway_layout = solo_highway)
				SendNetMessage {
					Type = repair_string
					flags = <net_update_flags>
				}
			endif
		endif
	endif
	if (<total_broken_strings> = 0)
		break
	endif
	if ($boss_battle = 1 &&
			<other_player_status>.Player = 2)
		if ($<other_player_status>.whammy_attack < 1)
			GetSongTimeMs
			if (<time> - $boss_lastbrokenstringtime > $current_boss.BrokenStringSpeed.($current_difficulty))
				Change boss_pattern = ($<other_player_status>.broken_string_mask)
				Change boss_lastbrokenstringtime = <time>
			else
				Change \{boss_pattern = 0}
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if ($<other_player_status>.whammy_attack < 1)
		Change structurename = <other_player_status> broken_string_mask = 0
	endif
	GuitarEvent_BattleAttackFinished <...>
endscript

script battle_whammy_attack 
	repair_ammount = 5
	switch <difficulty>
		case easy
		<repair_ammount> = ($battlemode_powerups [6].easy_repair)
		case medium
		<repair_ammount> = ($battlemode_powerups [6].medium_repair)
		case hard
		<repair_ammount> = ($battlemode_powerups [6].hard_repair)
		case expert
		<repair_ammount> = ($battlemode_powerups [6].expert_repair)
	endswitch
	if ($<other_player_status>.Player = 1)
		spawnscript GH_BattleMode_Player1_SFX_Whammy_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript GH_BattleMode_Player2_SFX_Whammy_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	if ($<other_player_status>.whammy_attack < 1)
		Change structurename = <other_player_status> whammy_attack = <repair_ammount>
		whammy_on = 0
		shake_on = 0
		frame_count = 0
		shake_frequency = 1
		mask = 65536
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 4096
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 256
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 16
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 1
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		update_training_whammy_bar other_player_status = <other_player_status>
		if ($<other_player_status>.is_local_client)
			begin
			if ($<other_player_status>.whammy_attack = 0)
				break
			endif
			if GuitarGetAnalogueInfo controller = ($<other_player_status>.controller)
				if IsGuitarController controller = ($<other_player_status>.controller)
					<len> = ((<rightx> + 1.0) / 2.0)
				else
					if (<leftlength> > 0)
						<len> = <leftlength>
					else
						if (<rightlength> > 0)
							<len> = <rightlength>
						else
							<len> = 0
						endif
					endif
				endif
			else
				<len> = 0
			endif
			if ($boss_battle = 1 &&
					<other_player_status>.Player = 2)
				GetSongTimeMs
				if (<time> - $boss_lastwhammytime > $current_boss.WhammySpeed.($current_difficulty))
					len = 0.5
					Change boss_lastwhammytime = <time>
				else
					len = 0
				endif
			endif
			if (($<other_player_status>.bot_play = 1) &&
					($<other_player_status>.debug_bot_mode > 0))
				GetSongTimeMs
				delta_time = ((<time>) - ($<other_player_status>.debug_bot_last_whammy_attack_time))
				if (((<delta_time>) > $<other_player_status>.debug_bot_whammy_attack_delay) || ((<delta_time>) < 0))
					len = 0.5
					change structurename = <other_player_status> debug_bot_last_whammy_attack_time = <time>
				else
					len = 0
				endif
			endif
			if (<len> >= 0.5)
				if (<whammy_on> = 0)
					Change structurename = <other_player_status> whammy_attack = ($<other_player_status>.whammy_attack - 1)
					SoundEvent event = GH3_Battle_Play_Whammy_Pitch_Up_Sound <...>
					if ($<other_player_status>.whammy_attack <= 5)
						<shake_frequency> = (<shake_frequency> + 1)
					endif
					if (($is_network_game) && ($<other_player_status>.whammy_attack <= 5))
						SendNetMessage {Type = whammy_attack_update whammy_count = ($<other_player_status>.whammy_attack)}
					endif
					<whammy_on> = 1
				endif
			else
				if (<whammy_on> = 1)
					<whammy_on> = 0
				endif
			endif
			Wait \{1
				gameframe}
			repeat
		else
			net_whammy_attack player_text = <player_text> other_player_status = <other_player_status> difficulty = <difficulty>
		endif
		GetArraySize \{$gem_colors}
		array_count = 0
		begin
		broken_string_id = ($broken_strings [<array_count>])
		if ($<other_player_status>.<broken_string_id> = 0)
			switch <array_count>
				case 0
				mask = 4369
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 1
				mask = 65809
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 2
				mask = 69649
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 3
				mask = 69889
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 4
				mask = 69904
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
			endswitch
		endif
		array_count = (<array_count> + 1)
		repeat <array_Size>
		Change structurename = <other_player_status> whammy_attack = -1
		GuitarEvent_BattleAttackFinished <...>
	else
		if ($<other_player_status>.whammy_attack < 15)
			Change structurename = <other_player_status> whammy_attack = ($<other_player_status>.whammy_attack + <repair_ammount>)
		endif
	endif
endscript