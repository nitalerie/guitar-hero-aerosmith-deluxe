script update_score_fast 
	if ((IsPS2) || IsNGC)
		update_score_fast_PSWii <...>
		return
	endif
	GetGlobalTags \{user_options}
	UpdateScoreFastInit player_status = <player_status>
	begin
	GetSongTimeMS
	UpdateScoreFastPerFrame player_status = <player_status> Time = <Time>
	if (<track_muting> = 1)
		Change StructureName = <player_status> guitar_volume = 100
		UpdateGuitarVolume
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script update_score_fast_PSWii
	updatescorefastinit player_status = <player_status>
	begin
	wait_for_correct_frame player = ($<player_status>.player)
	waitonegameframe
	getsongtimems
	updatescorefastperframe player_status = <player_status> time = <time>
	if (<track_muting> = 1)
		Change StructureName = <player_status> guitar_volume = 100
		UpdateGuitarVolume
	endif
	repeat
endscript

script get_current_multiplier 
	multiplier = 4
	if ($<player_status>.current_run < 10)
		<multiplier> = 1
	elseif ($<player_status>.current_run < 20)
		<multiplier> = 2
	elseif ($<player_status>.current_run < 30)
		<multiplier> = 3
	endif
	if (($<player_status>.star_power_used = 1) || ($<player_status>.star_power_overlap = 1)))
		<multiplier> = (<multiplier> * 2)
	endif
	return <...>
endscript
