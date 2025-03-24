script Do_StarPower_StageFX 
	GetGlobalTags \{user_options}
	if (<black_background> = 1)
		return
	endif
	switch (<player_status>.character_id)
		case CASEY
		SpawnScriptLater Do_StarPower_ShotgunFX Id = <scriptID> Params = {<...>}
		case JOHNNY
		SpawnScriptLater Do_StarPower_FlameThrowerFX Id = <scriptID> Params = {<...>}
		case JUDY
		SpawnScriptLater Do_StarPower_HeartsFX Id = <scriptID> Params = {<...>}
		case LARS
		case RIPPER
		case SATAN
		SpawnScriptLater Do_StarPower_BatFX Id = <scriptID> Params = {<...>}
		case MIDORI
		SpawnScriptLater Do_StarPower_ButterfliesFX Id = <scriptID> Params = {<...>}
		case XAVIER
		SpawnScriptLater Do_StarPower_PeaceFX Id = <scriptID> Params = {<...>}
		default
		SpawnScriptLater Do_StarPower_TeslaFX Id = <scriptID> Params = {<...>}
	endswitch
endscript
script star_power_reset 
	Change StructureName = <player_status> star_power_amount = 0.0
	Change StructureName = <player_status> star_power_sequence = 0
	Change StructureName = <player_status> star_power_note_count = 0
	Change StructureName = <player_status> star_power_used = 0
	Change StructureName = <player_status> star_power_overlap = 0
	Change StructureName = <player_status> current_star_array_entry = 0
endscript
script proto_show_star_power_ready 
	if ($<player_status>.star_power_used = 1 ||
			$is_attract_mode = 1)
		return
	endif
	SoundEvent Event = Star_Power_Ready_SFX
	SpawnScriptNow rock_meter_star_power_on Params = {player_status = <player_status>}
	ExtendCRC star_power_ready_text ($<player_status>.Text) out = Id
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_coop) || ($game_mode = p2_career))
		if ($<player_status>.Player = 1)
			original_pos = (($hud_screen_elements [0].Pos) - (225.0, -70.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) + (225.0, 70.0))
		endif
		base_scale = 0.8
	else
		original_pos = ($hud_screen_elements [0].Pos)
		base_scale = 1.0
	endif
	DoScreenElementMorph {
		Id = <Id>
		Pos = <original_pos>
		Scale = 0
		Alpha = 1
	}
	DoScreenElementMorph Id = <Id> Scale = <base_scale> Time = 0.2
	Wait 0.2 Seconds
	rotation = 4
	begin
	<rotation> = (<rotation> * -1)
	DoScreenElementMorph {
		Id = <Id>
		Rot_Angle = <rotation>
		Time = 0.1
	}
	Wait 0.13 Seconds
	repeat 8
	DoScreenElementMorph Id = <Id> Rot_Angle = 0
	DoScreenElementMorph {
		Id = <Id>
		Pos = (<original_pos> - (0.0, 400.0))
		Scale = (<base_scale> * 0.5)
		Time = 0.35000002
	}
endscript
script nx_show_star_power_ready 
	if ($Cheat_PerformanceMode = 1)
		return
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		<player_status> = player1_status
	endif
	SoundEvent \{Event = Star_Power_Ready_SFX}
	SpawnScriptNow rock_meter_star_power_on Params = {player_status = <player_status>}
	FormatText ChecksumName = player_container 'HUD_Note_Streak_Combo%d' D = ($<player_status>.Player)
	begin
	if NOT ScreenElementExists Id = <player_container>
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	if ($<player_status>.Player = 1)
		if ($star_power_ready_on_p1 = 1)
			return
		else
			Change \{star_power_ready_on_p1 = 1}
		endif
	else
		if ($star_power_ready_on_p2 = 1)
			return
		else
			Change \{star_power_ready_on_p2 = 1}
		endif
	endif
	if ($<player_status>.star_power_used = 1)
		return
	endif
	ExtendCRC star_power_ready_text ($<player_status>.Text) out = Id
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		if ($<player_status>.Player = 1)
			original_pos = (($hud_screen_elements [0].Pos) - (225.0, 50.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) + (225.0, -50.0))
		endif
		base_scale = 0.8
		scale_big_mult = 1.2
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			original_pos = (($hud_screen_elements [0].Pos) - (0.0, 60.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) - (0.0, 20.0))
		endif
		base_scale = 1.2
		scale_big_mult = 1.5
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Scale = 4 rgba = [190 225 255 250] Alpha = 0 Rot_Angle = 3
	endif
	ExtendCRC hud_destroygroup_window ($<player_status>.Text) out = hud_destroygroup
	SpawnScriptNow hud_lightning_alert Params = {Player = ($<player_status>.Player) alert_id = <Id> player_container = <hud_destroygroup>}
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Scale = <base_scale> Alpha = 1 Time = 0.3 Rot_Angle = -3 Motion = ease_in
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Scale = (<base_scale> * <scale_big_mult>) Time = 0.3 Rot_Angle = 4 Motion = ease_out
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Scale = <base_scale> Time = 0.3 Rot_Angle = -5 rgba = [145 215 235 250] Motion = ease_in
	endif
	rotation = 10
	begin
	<rotation> = (<rotation> * -0.7)
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Rot_Angle = <rotation> Alpha = 1 Time = 0.08 Motion = ease_out
	endif
	repeat 12
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Rot_Angle = 0 Motion = ease_out
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = (<original_pos> - (0.0, 230.0)) Scale = (<base_scale> * 0.5) Alpha = 0 Time = 0.3 Motion = ease_in
	endif
	if ($<player_status>.Player = 1)
		Change \{star_power_ready_on_p1 = 0}
	else
		Change \{star_power_ready_on_p2 = 0}
	endif
endscript
script show_star_power_ready 
    if ($Cheat_PerformanceMode = 1)
        return
    endif
	if ($<player_status>.star_power_overlap = 1)
		return
	endif
    if ($game_mode = p2_career || $game_mode = p2_coop)
        player_status = player1_status
        player_status = player2_status
    else
        player_status = <player_status>
    endif
    GetGlobalTags \{user_options}
    if (<proto_sp> = 1)
        SpawnScriptNow proto_show_star_power_ready Params = {player_status = <player_status>}
        return
    endif
    SpawnScriptNow nx_show_star_power_ready Params = {player_status = <player_status>}
endscript

script star_power_whammy 
	if ($<player_status>.star_power_used = 1)
		return
	endif
	last_x = 0
	last_y = 0
	dir_x = 1
	dir_y = 1
	first = 1
	whammy_on = 0
	whammy_star_on = 0
	whammy_star_off = 0
	ExtendCrc star_whammy_on <player_text> out = id
	broadcastevent Type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> Player = <Player> player_status = <player_status> player_text = <player_text>}
	<boss> = 0
	if ($boss_battle = 1)
		if (($<player_status>.Player) = 2)
			<boss> = 1
		endif
	endif
	<do_blue_whammys> = 1
	if ($game_mode = p2_battle || $boss_battle = 1)
		<do_blue_whammys> = 0
	endif
	if ((<Player> = 1) && ($is_network_game = 1) && ($game_mode = p2_coop))
		SpawnScriptLater \{net_stream_star_whammy}
	endif
	begin
	if (($<player_status>.whammy_on) = 0)
		ExtendCrc star_whammy_off <player_text> out = id
		broadcastevent Type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> Player = <Player> player_status = <player_status> player_text = <player_text> finished = 0}
		break
	endif
	if (<boss> = 0)
		if GuitarGetAnalogueInfo controller = ($<player_status>.controller)
			if IsGuitarController controller = ($<player_status>.controller)
				if (($<player_status>.bot_play) = 1)
					<px> = 0.0
					if (($<player_status>.debug_bot_mode) > 0)
						sin ($<player_status>.debug_bot_whammy_theta)
						<px> = ((<sin> + 1.0) / 2.0)
					endif
				else
					<px> = ((<rightx> - $<player_status>.resting_whammy_position) / (1.0 - $<player_status>.resting_whammy_position))
				endif
				if (<px> < 0)
					<px> = 0
				endif
				if (<first> = 1)
					<last_x> = <px>
					<first> = 0
				endif
				<xdiff> = (<px> - <last_x>)
				if (<xdiff> < 0)
					<xdiff> = (0.0 - <xdiff>)
				endif
				if (<xdiff> > 0.03)
					<whammy_on> = 5
				endif
			else
				<px> = 0
				<py> = 0
				if (<leftlength> > 0)
					<px> = <leftx>
					<py> = <lefty>
				else
					if (<rightlength> > 0)
						<px> = <rightx>
						<py> = <righty>
					endif
				endif
				if (<first> = 1)
					<last_x> = <px>
					<last_y> = <py>
					<first> = 0
				endif
				<xdiff> = (<px> - <last_x>)
				if (<xdiff> < 0)
					<xdiff> = (0.0 - <xdiff>)
				endif
				<ydiff> = (<py> - <last_y>)
				if (<ydiff> < 0)
					<ydiff> = (0.0 - <ydiff>)
				endif
				if (<xdiff> > 0.03)
					<whammy_on> = 5
				endif
				if (<ydiff> > 0.03)
					<whammy_on> = 5
				endif
			endif
			if (<whammy_on> > 0)
				<whammy_star_off> = 0
				<whammy_star_on> = (<whammy_star_on> + 1)
				beat_time = ($<player_status>.playline_song_beat_time / 1000.0)
				beat_ratio = ($current_deltatime / <beat_time>)
				if ($game_mode = p2_coop || $game_mode = p2_quickplay)
					increase_star_power amount = ($star_power_whammy_add_coop * <beat_ratio>) player_status = <player_status>
				else
					increase_star_power amount = ($star_power_whammy_add * <beat_ratio>) player_status = <player_status>
				endif
				whammy_on = (<whammy_on> - 1)
				if (<do_blue_whammys> = 1)
					if (<whammy_star_on> = 5)
						GetArraySize \{$gem_colors}
						gem_count = 0
						begin
						if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
							formatText checksumName = whammy_id '%c_%i_whammybar_p%p' c = ($gem_colors_text [<gem_count>]) i = <array_entry> p = ($<player_status>.Player) AddToStringLookup = true
							if ScreenElementExists id = <whammy_id>
								bar_name = (<whammy_id> + 1)
								MakeStarWhammy Name = <bar_name> Player = ($<player_status>.Player)
							endif
						endif
						gem_count = (<gem_count> + 1)
						repeat <array_Size>
					endif
				endif
			else
				<whammy_star_on> = 0
				<whammy_star_off> = (<whammy_star_off> + 1)
				if (<do_blue_whammys> = 1)
					if (<whammy_star_off> = 5)
						GetArraySize \{$gem_colors}
						gem_count = 0
						begin
						if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
							formatText checksumName = whammy_id '%c_%i_whammybar_p%p' c = ($gem_colors_text [<gem_count>]) i = <array_entry> p = ($<player_status>.Player) AddToStringLookup = true
							if ScreenElementExists id = <whammy_id>
								bar_name = (<whammy_id> + 1)
								MakeNormalWhammy Name = <bar_name> Player = ($<player_status>.Player)
							endif
						endif
						gem_count = (<gem_count> + 1)
						repeat <array_Size>
					endif
				endif
			endif
			<last_x> = <px>
			<last_y> = <py>
		endif
	endif
	<time> = (<time> - ($current_deltatime * 1000))
	if (<time> <= 0)
		ExtendCrc star_whammy_off <player_text> out = id
		broadcastevent Type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> Player = <Player> player_status = <player_status> player_text = <player_text> finished = 1}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ((<Player> = 1) && ($is_network_game = 1) && ($game_mode = p2_coop))
		KillSpawnedScript \{Name = net_stream_star_whammy}
	endif
endscript