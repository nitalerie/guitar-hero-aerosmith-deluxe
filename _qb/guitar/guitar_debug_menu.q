menu_pos = (675.0, 100.0)

script create_debug_backdrop 
	destroy_debug_backdrop
	CreateScreenElement \{type = SpriteElement
		parent = root_window
		id = debug_backdrop
		pos = (640.0, 0.0)
		dims = (640.0, 720.0)
		just = [
			left
			top
		]
		rgba = [
			0
			0
			0
			255
		]
		z_priority = 1}
endscript

script destroy_debug_backdrop 
	destroy_menu \{menu_id = debug_backdrop}
endscript

script create_debugging_menu 
	safe_create_gh3_pause_menu
	create_generic_backdrop
	CreateScreenElement \{type = vscrollingmenu
		parent = Pause_Menu
		id = debug_scrolling_menu
		just = [
			left
			top
		]
		dims = (400.0, 480.0)
		pos = $menu_pos}
	CreateScreenElement \{type = vmenu
		parent = debug_scrolling_menu
		id = debug_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				back_to_retail_ui_flow
			}
		]}
	disable_pause
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		id = toggle_botp1_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Bot P1'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_botp1
			}
		]}
	toggle_botp1_setprop
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		id = toggle_botp2_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Bot P2'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_botp2
			}
		]}
	toggle_botp2_setprop
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Advanced Bot Options'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_adv_bots_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		id = toggle_fsfx_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Full Screen FX'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_fsfx
			}
		]}
	toggle_fsfx_setprop
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		id = toggle_lightshow_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Light Show'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_lightshow
			}
		]}
	toggle_lightshow_setprop
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		id = toggle_half_animation_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle 30fps Animations'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_half_animation
			}
		]}
	toggle_half_animation_setprop
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Unlock All'
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		just = [
			left
			top
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				playday_unlockall
			}
		]}
	if NOT isNgc
		CreateScreenElement \{type = textelement
			parent = debug_vmenu
			id = Debug_Aspect_Toggle
			font = text_a1
			scale = 0.75
			rgba = [
				210
				210
				210
				250
			]
			just = [
				left
				top
			]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			z_priority = 100.0
			event_handlers = [
				{
					focus
					menu_focus
				}
				{
					unfocus
					menu_unfocus
				}
				{
					pad_choose
					toggle_aspect_ratio
				}
			]}
		GetGlobalTags \{user_options}
		if (<ps2_widescreen> = 0)
			SetScreenElementProps \{id = Debug_Aspect_Toggle
				text = 'Widescreen: Off'}
		else
			SetScreenElementProps \{id = Debug_Aspect_Toggle
				text = 'Widescreen: On'}
		endif
		CreateScreenElement \{type = textelement
			parent = debug_vmenu
			id = Debug_Progressive_Scan
			font = text_a1
			scale = 0.75
			rgba = [
				210
				210
				210
				250
			]
			just = [
				left
				top
			]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			z_priority = 100.0
			event_handlers = [
				{
					focus
					menu_focus
				}
				{
					unfocus
					menu_unfocus
				}
				{
					pad_choose
					toggle_progressive_scan
				}
			]}
		if ($PS2_ProgressiveScan = 0)
			SetScreenElementProps \{id = Debug_Progressive_Scan
				text = 'Progressive Scan: Off'}
		else
			SetScreenElementProps \{id = Debug_Progressive_Scan
				text = 'Progressive Scan: On'}
		endif
	endif
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Repeat Last Song'
		z_priority = 100.0
		just = [
			left
			top
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				select_start_song
				params = {
					uselaststarttime
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		id = toggle_playermode_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Play Song: 1p_quickplay'
		z_priority = 100.0
		just = [
			left
			top
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_left
				toggle_playermode_left
			}
			{
				pad_right
				toggle_playermode_right
			}
			{
				pad_choose
				select_playermode
			}
		]}
	toggle_playermode_setprop
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Settings'
		z_priority = 100.0
		just = [
			left
			top
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_settings_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		id = Debug_Toggle_Audible_HitNote
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		just = [
			left
			top
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_on_audible_hitnote
			}
		]}
	if ($Debug_Audible_HitNote = 1)
		SetScreenElementProps \{id = Debug_Toggle_Audible_HitNote
			text = 'Debug_Audible_HitNote: ON'}
	else
		SetScreenElementProps \{id = Debug_Toggle_Audible_HitNote
			text = 'Debug_Audible_HitNote: OFF'}
	endif
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Character Select'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_character_viewer_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Skip Into Song'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipintosong_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Save Replay Buffer'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				save_replay
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Load Replay'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_replay_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Play Credits'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				debug_playcredits
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Difficulty Analyzer'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				debug_difficulty_analyzer
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Changelist Number'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				debug_toggle_changelist
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'UI Physics Test'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_ui_physics_test
				params = {
					debug
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Battle mode menu'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_battle_debug_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Photobot Test'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_photobot_debug_menu
			}
		]}
	LaunchEvent \{type = focus
		target = debug_vmenu}
endscript

script destroy_debugging_menu 
	if ScreenElementExists \{id = debug_scrolling_menu}
		DestroyScreenElement \{id = debug_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script back_to_debug_menu 
	destroy_replay_menu
	destroy_songversion_menu
	destroy_settings_menu
	destroy_character_viewer_menu
	destroy_skipintosong_menu
	destroy_cameracut_menu
	destroy_difficulty_menu
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	destroy_song_menu
	destroy_battle_mode_debug_menu
	destroy_adv_bots_menu
	destroy_photobot_debug_menu
	create_debugging_menu
endscript

script destroy_all_debug_menus 
	destroy_replay_menu
	destroy_songversion_menu
	destroy_settings_menu
	destroy_character_viewer_menu
	destroy_skipintosong_menu
	destroy_cameracut_menu
	destroy_difficulty_menu
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	destroy_battle_mode_debug_menu
	destroy_photobot_debug_menu
	destroy_debugging_menu
endscript
debug_playcredits_active = 0

script debug_playcredits 
	Menu_Music_Off \{setflag = 1}
	kill_gem_scroller
	destroy_debugging_menu
	reset_score \{player_status = player1_status}
	change \{end_credits = 1}
	change \{current_difficulty = expert}
	change \{debug_playcredits_active = 1}
	Progression_EndCredits
endscript

script debug_difficulty_analyzer 
	ui_menu_select_sfx
	destroy_difficulty_menu
	destroy_debugging_menu
	create_debug_backdrop
	create_generic_backdrop
	x_pos = 500
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = song_scrolling_menu
		just = [left top]
		dims = (400.0, 500.0)
		pos = ($menu_pos - (520.0, 0.0) + (<x_pos> * (1.0, 0.0)))
	}
	CreateScreenElement \{type = vmenu
		parent = song_scrolling_menu
		id = song_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				difficulty_analyzer_back
			}
		]}
	array_entry = 0
	get_songlist_size
	begin
	get_songlist_checksum index = <array_entry>
	get_song_struct song = <song_checksum>
	get_song_title song = <song_checksum>
	CreateScreenElement {
		type = textelement
		parent = song_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = <song_title>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{focus wait_for_diff_analyzer params = {<...>}}
			{pad_choose KillSpawnedScript params = {name = wait_for_diff_analyzer_spawned}}
			{pad_choose create_difficulty_analyzer_difficulty_menu params = {difficulty = all song_name = <song_checksum>}}
		]
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	CreateScreenElement {
		type = textelement
		parent = song_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = 'OUTPUT ALL SCORE DATA'
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{focus wait_for_diff_analyzer params = {<...>}}
			{focus KillSpawnedScript params = {name = wait_for_diff_analyzer_spawned}}
			{pad_choose create_difficulty_analyzer_difficulty_menu params = {difficulty = all song_name = debug_output}}
		]
	}
	LaunchEvent \{type = focus
		target = song_vmenu}
endscript

script difficulty_analyzer_back 
	KillSpawnedScript \{name = wait_for_diff_analyzer_spawned}
	destroy_debug_backdrop
	destroy_difficulty_analyzer
	generic_menu_pad_back \{callback = back_to_debug_menu}
endscript

script destroy_difficulty_analyzer_menu 
	if ScreenElementExists \{id = song_scrolling_menu}
		DestroyScreenElement \{id = song_scrolling_menu}
	endif
	destroy_generic_backdrop
	destroy_debug_backdrop
endscript

script wait_for_diff_analyzer 
	KillSpawnedScript \{name = wait_for_diff_analyzer_spawned}
	spawnscriptnow wait_for_diff_analyzer_spawned params = {<...>}
endscript

script wait_for_diff_analyzer_spawned 
	wait \{0.5
		seconds}
	difficulty_analyzer_show difficulty = all song_name = <song_checksum>
endscript

script create_difficulty_analyzer_difficulty_menu 
	destroy_difficulty_analyzer_menu
	destroy_difficulty_menu
	create_debug_backdrop
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = difficulty_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = difficulty_menu
		id = difficulty_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = debug_difficulty_analyzer
				}
			}
		]}
	array_entry = 0
	GetArraySize \{$difficulty_list}
	begin
	difficulty_count = ($difficulty_list [<array_entry>])
	get_difficulty_text difficulty = <difficulty_count>
	<events> = [
		{focus menu_focus}
		{unfocus menu_unfocus}
		{focus difficulty_analyzer_show params = {difficulty = ($difficulty_list [<array_entry>]) song_name = <song_name>}}
	]
	if (<song_name> = debug_output)
		<events> = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose output_diff_scores params = {($difficulty_list [<array_entry>])}}
		]
	endif
	CreateScreenElement {
		type = textelement
		parent = difficulty_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = <difficulty_text>
		just = [left top]
		z_priority = 100.0
		event_handlers = <events>
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	if (<song_name> = debug_output)
		<events> = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose output_diff_scores params = {all}}
		]
		CreateScreenElement {
			type = textelement
			parent = difficulty_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = 'ALL'
			just = [left top]
			z_priority = 100.0
			event_handlers = <events>
		}
	endif
	LaunchEvent \{type = focus
		target = difficulty_vmenu}
endscript

script create_adv_bots_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = adv_bots_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = adv_bots_scrolling_menu
		id = adv_bots_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = adv_bots_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Options for Player 1'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_adv_bots_sub_menu
				params = {
					player_status = player1_status
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = adv_bots_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Options for Player 2'
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_adv_bots_sub_menu
				params = {
					player_status = player2_status
				}
			}
		]}
	LaunchEvent \{type = focus
		target = adv_bots_vmenu}
endscript
adv_bots_sub_lock_scroll = 0

script create_adv_bots_sub_menu \{player_status = player1_status
		lock = 0
		lock_id = 0}
	ui_menu_select_sfx
	<strum_scroll> = 5
	<opp_strum_scroll> = -5
	<button_scroll> = 1
	<opp_button_scroll> = -1
	destroy_adv_bots_menu
	menu_type = vscrollingmenu
	if (($adv_bots_sub_lock_scroll) = 1)
		<menu_type> = vmenu
	endif
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = adv_bots_sub_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (300.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = adv_bots_sub_scrolling_menu
		id = adv_bots_sub_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_adv_bots_menu
				}
			}
		]}
	mode = 'Basic'
	if ($<player_status>.debug_bot_mode = 1)
		mode = 'Accuracy'
	elseif ($<player_status>.debug_bot_mode = 2)
		mode = 'Ping-Pong'
	endif
	FormatText textname = mode_text 'Player %p Mode: %m' p = ($<player_status>.player) m = <mode>
	CreateScreenElement {
		type = textelement
		parent = adv_bots_sub_vmenu
		font = text_a1
		id = adv_bots_mode_item
		scale = 0.75
		rgba = [210 210 210 250]
		text = <mode_text>
		just = [left top]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose adv_bots_toggle_mode params = {player_status = <player_status>}}
		]
	}
	CreateScreenElement {
		type = textelement
		parent = adv_bots_sub_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = 'Toggle Bot: '
		id = adv_bots_on_item
		just = [left top]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose adv_bots_toggle_on params = {player_status = <player_status>}}
		]
	}
	adv_bots_on_setprop player_status = <player_status>
	if (($<player_status>.debug_bot_mode) > 0)
		CreateScreenElement {
			type = textelement
			parent = adv_bots_sub_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = 'Prevent Bot Death:'
			id = adv_bots_prevent_death_item
			just = [left top]
			z_priority = 100.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose adv_bots_toggle_death params = {player_status = <player_status>}}
			]
		}
		adv_bots_death_setprop player_status = <player_status>
		if ($<player_status>.debug_bot_mode = 1)
			<label> = 'Accuracy Percentage: '
			<id> = adv_bots_sub_acc_item
			<var> = debug_bot_accuracy
			<scrollParams> = {player_status = <player_status> text = <label> variable = <var> id = <id>}
			CreateScreenElement {
				type = textelement
				parent = adv_bots_sub_vmenu
				font = text_a1
				scale = 0.75
				id = <id>
				rgba = [210 210 210 250]
				text = <label>
				just = [left top]
				z_priority = 100.0
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose adv_bots_spec_choose params = {player_status = <player_status> id = <id>}}
					{pad_back adv_bots_spec_back params = {player_status = <player_status> id = <id>}}
					{pad_up adv_bots_spec_scroll params = (<scrollParams> + {amt = <strum_scroll> need_lock = 1})}
					{pad_down adv_bots_spec_scroll params = (<scrollParams> + {amt = <opp_strum_scroll> need_lock = 1})}
					{pad_right adv_bots_spec_scroll params = (<scrollParams> + {amt = <button_scroll>})}
					{pad_left adv_bots_spec_scroll params = (<scrollParams> + {amt = <opp_button_scroll>})}
				]
			}
			adv_bots_spec_scroll player_status = <player_status> text = <label> variable = <var> id = <id> amt = 0
		endif
		if ($<player_status>.debug_bot_mode = 2)
			<label> = 'Min Health Percentage: '
			<id> = adv_bots_sub_min_item
			<var> = debug_bot_ping_pong_min
			<scrollParams> = {player_status = <player_status> text = <label> variable = <var> id = <id>}
			CreateScreenElement {
				type = textelement
				parent = adv_bots_sub_vmenu
				font = text_a1
				scale = 0.75
				id = <id>
				rgba = [210 210 210 250]
				text = <label>
				just = [left top]
				z_priority = 100.0
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose adv_bots_spec_choose params = {player_status = <player_status> id = <id>}}
					{pad_back adv_bots_spec_back params = {player_status = <player_status> id = <id>}}
					{pad_up adv_bots_spec_scroll params = (<scrollParams> + {amt = <strum_scroll> need_lock = 1})}
					{pad_down adv_bots_spec_scroll params = (<scrollParams> + {amt = <opp_strum_scroll> need_lock = 1})}
					{pad_right adv_bots_spec_scroll params = (<scrollParams> + {amt = <button_scroll>})}
					{pad_left adv_bots_spec_scroll params = (<scrollParams> + {amt = <opp_button_scroll>})}
				]
			}
			adv_bots_spec_scroll player_status = <player_status> text = <label> variable = <var> id = <id> amt = 0
			<label> = 'Max Health Percentage: '
			<id> = adv_bots_sub_max_item
			<var> = debug_bot_ping_pong_max
			<scrollParams> = {player_status = <player_status> text = <label> variable = <var> id = <id>}
			CreateScreenElement {
				type = textelement
				parent = adv_bots_sub_vmenu
				font = text_a1
				scale = 0.75
				id = <id>
				rgba = [210 210 210 250]
				text = <label>
				just = [left top]
				z_priority = 100.0
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose adv_bots_spec_choose params = {player_status = <player_status> id = <id>}}
					{pad_back adv_bots_spec_back params = {player_status = <player_status> id = <id>}}
					{pad_up adv_bots_spec_scroll params = (<scrollParams> + {amt = <strum_scroll> need_lock = 1})}
					{pad_down adv_bots_spec_scroll params = (<scrollParams> + {amt = <opp_strum_scroll> need_lock = 1})}
					{pad_right adv_bots_spec_scroll params = (<scrollParams> + {amt = <button_scroll>})}
					{pad_left adv_bots_spec_scroll params = (<scrollParams> + {amt = <opp_button_scroll>})}
				]
			}
			adv_bots_spec_scroll player_status = <player_status> text = <label> variable = <var> id = <id> amt = 0
		endif
		CreateScreenElement {
			type = textelement
			parent = adv_bots_sub_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = 'meep'
			id = adv_bots_use_sp_item
			just = [left top]
			z_priority = 100.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose adv_bots_toggle_use_sp params = {player_status = <player_status>}}
			]
		}
		adv_bots_use_sp_setprop player_status = <player_status>
		<label> = 'Star Power Threshhold: '
		<id> = adv_bots_sub_spt_item
		<var> = debug_bot_do_s_p_thresh
		<scrollParams> = {player_status = <player_status> text = <label> variable = <var> id = <id> min = 50}
		CreateScreenElement {
			type = textelement
			parent = adv_bots_sub_vmenu
			font = text_a1
			scale = 0.75
			id = <id>
			rgba = [210 210 210 250]
			text = <label>
			just = [left top]
			z_priority = 100.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose adv_bots_spec_choose params = {player_status = <player_status> id = <id>}}
				{pad_back adv_bots_spec_back params = {player_status = <player_status> id = <id>}}
				{pad_up adv_bots_spec_scroll params = (<scrollParams> + {amt = <strum_scroll> need_lock = 1})}
				{pad_down adv_bots_spec_scroll params = (<scrollParams> + {amt = <opp_strum_scroll> need_lock = 1})}
				{pad_right adv_bots_spec_scroll params = (<scrollParams> + {amt = <button_scroll>})}
				{pad_left adv_bots_spec_scroll params = (<scrollParams> + {amt = <opp_button_scroll>})}
			]
		}
		adv_bots_spec_scroll <scrollParams>
		<label> = 'Fire Attacks Threshhold: '
		<id> = adv_bots_sub_fat_item
		<var> = debug_bot_use_attack_quota
		<scrollParams> = {player_status = <player_status> text = <label> variable = <var> id = <id> min = 1 max = 3}
		CreateScreenElement {
			type = textelement
			parent = adv_bots_sub_vmenu
			font = text_a1
			scale = 0.75
			id = <id>
			rgba = [210 210 210 250]
			text = <label>
			just = [left top]
			z_priority = 100.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose adv_bots_spec_choose params = {player_status = <player_status> id = <id>}}
				{pad_back adv_bots_spec_back params = {player_status = <player_status> id = <id>}}
				{pad_up adv_bots_spec_scroll params = (<scrollParams> + {amt = 1 need_lock = 1})}
				{pad_down adv_bots_spec_scroll params = (<scrollParams> + {amt = -1 need_lock = 1})}
				{pad_right adv_bots_spec_scroll params = (<scrollParams> + {amt = 1})}
				{pad_left adv_bots_spec_scroll params = (<scrollParams> + {amt = -1})}
			]
		}
		adv_bots_spec_scroll <scrollParams>
		<label> = 'Whammy speed: '
		<id> = adv_bots_sub_whs_item
		<var> = debug_bot_whammy_speed
		<scrollParams> = {player_status = <player_status> text = <label> variable = <var> id = <id> max = 180}
		CreateScreenElement {
			type = textelement
			parent = adv_bots_sub_vmenu
			font = text_a1
			scale = 0.75
			id = <id>
			rgba = [210 210 210 250]
			text = <label>
			just = [left top]
			z_priority = 100.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose adv_bots_spec_choose params = {player_status = <player_status> id = <id>}}
				{pad_back adv_bots_spec_back params = {player_status = <player_status> id = <id>}}
				{pad_up adv_bots_spec_scroll params = (<scrollParams> + {amt = <strum_scroll> need_lock = 1})}
				{pad_down adv_bots_spec_scroll params = (<scrollParams> + {amt = <opp_strum_scroll> need_lock = 1})}
				{pad_right adv_bots_spec_scroll params = (<scrollParams> + {amt = <button_scroll>})}
				{pad_left adv_bots_spec_scroll params = (<scrollParams> + {amt = <opp_button_scroll>})}
			]
		}
		adv_bots_spec_scroll <scrollParams>
		fast_strum_scroll = (10 * (<strum_scroll>))
		fast_opp_strum_scroll = (10 * (<opp_strum_scroll>))
		fast_button_scroll = (10 * (<button_scroll>))
		fast_opp_button_scroll = (10 * (<opp_button_scroll>))
		<label> = 'Whammy Attack Recovery Delay (ms): '
		<id> = adv_bots_sub_war_item
		<var> = debug_bot_whammy_attack_delay
		<scrollParams> = {player_status = <player_status> text = <label> variable = <var> id = <id> max = 2000}
		CreateScreenElement {
			type = textelement
			parent = adv_bots_sub_vmenu
			font = text_a1
			scale = 0.75
			id = <id>
			rgba = [210 210 210 250]
			text = <label>
			just = [left top]
			z_priority = 100.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose adv_bots_spec_choose params = {player_status = <player_status> id = <id>}}
				{pad_back adv_bots_spec_back params = {player_status = <player_status> id = <id>}}
				{pad_up adv_bots_spec_scroll params = (<scrollParams> + {amt = <fast_strum_scroll> need_lock = 1})}
				{pad_down adv_bots_spec_scroll params = (<scrollParams> + {amt = <fast_opp_strum_scroll> need_lock = 1})}
				{pad_right adv_bots_spec_scroll params = (<scrollParams> + {amt = <fast_button_scroll>})}
				{pad_left adv_bots_spec_scroll params = (<scrollParams> + {amt = <fast_opp_button_scroll>})}
			]
		}
		adv_bots_spec_scroll <scrollParams>
		<label> = 'Broken String Recovery Delay (ms): '
		<id> = adv_bots_sub_bsr_item
		<var> = debug_bot_broken_string_delay
		<scrollParams> = {player_status = <player_status> text = <label> variable = <var> id = <id> max = 2000}
		CreateScreenElement {
			type = textelement
			parent = adv_bots_sub_vmenu
			font = text_a1
			scale = 0.75
			id = <id>
			rgba = [210 210 210 250]
			text = <label>
			just = [left top]
			z_priority = 100.0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose adv_bots_spec_choose params = {player_status = <player_status> id = <id>}}
				{pad_back adv_bots_spec_back params = {player_status = <player_status> id = <id>}}
				{pad_up adv_bots_spec_scroll params = (<scrollParams> + {amt = <fast_strum_scroll> need_lock = 1})}
				{pad_down adv_bots_spec_scroll params = (<scrollParams> + {amt = <fast_opp_strum_scroll> need_lock = 1})}
				{pad_right adv_bots_spec_scroll params = (<scrollParams> + {amt = <fast_button_scroll>})}
				{pad_left adv_bots_spec_scroll params = (<scrollParams> + {amt = <fast_opp_button_scroll>})}
			]
		}
		adv_bots_spec_scroll <scrollParams>
	endif
	if ((GotParam focus_id) && (($adv_bots_sub_lock_scroll) = 1))
		LaunchEvent type = focus target = <focus_id>
	else
		LaunchEvent \{type = focus
			target = adv_bots_sub_vmenu}
	endif
endscript

script adv_bots_sub_up_down 
	if (($adv_bots_sub_lock_scroll) = 0)
		generic_menu_up_or_down_sound <...>
	endif
endscript

script adv_bots_sub_back 
	if (($adv_bots_sub_lock_scroll) = 0)
		generic_menu_pad_back <...>
	endif
endscript

script adv_bots_spec_choose 
	destroy_adv_bots_sub_menu
	change adv_bots_sub_lock_scroll = (1 - ($adv_bots_sub_lock_scroll))
	if (($adv_bots_sub_lock_scroll) = 1)
		create_adv_bots_sub_menu player_status = <player_status> focus_id = <id>
	else
		create_adv_bots_sub_menu player_status = <player_status> focus_id = <id>
	endif
endscript

script adv_bots_spec_back 
	if (($adv_bots_sub_lock_scroll) = 1)
		change \{adv_bots_sub_lock_scroll = 0}
		destroy_adv_bots_sub_menu
		create_adv_bots_sub_menu player_status = <player_status> focus_id = <id>
	endif
endscript

script adv_bots_spec_scroll \{text = ''
		amt = 0
		need_lock = 0
		min = 0
		max = 100}
	if ((GotParam player_status) && (GotParam variable) && (GotParam id))

		if ((<need_lock> = 0) || (($adv_bots_sub_lock_scroll) = 1))
			new_value = (($<player_status>.<variable>) + (<amt>))
			if (<new_value> > <max>)
				<new_value> = <max>
			elseif (<new_value> < <min>)
				<new_value> = <min>
			endif
			switch <variable>
				case debug_bot_accuracy
				change structurename = <player_status> debug_bot_accuracy = <new_value>
				case debug_bot_ping_pong_min
				change structurename = <player_status> debug_bot_ping_pong_min = <new_value>
				if (<new_value> > $<player_status>.debug_bot_ping_pong_max)
					change structurename = <player_status> debug_bot_ping_pong_max = <new_value>
					adv_bots_spec_scroll player_status = <player_status> text = 'Max Health Percentage: ' variable = debug_bot_ping_pong_max id = adv_bots_sub_max_item amt = 0
				endif
				case debug_bot_ping_pong_max
				change structurename = <player_status> debug_bot_ping_pong_max = <new_value>
				if (<new_value> < $<player_status>.debug_bot_ping_pong_min)
					change structurename = <player_status> debug_bot_ping_pong_min = <new_value>
					adv_bots_spec_scroll player_status = <player_status> text = 'Min Health Percentage: ' variable = debug_bot_ping_pong_min id = adv_bots_sub_min_item amt = 0
				endif
				case debug_bot_bad_strum_amt
				change structurename = <player_status> debug_bot_bad_strum_amt = <new_value>
				case debug_bot_do_s_p_thresh
				change structurename = <player_status> debug_bot_do_s_p_thresh = <new_value>
				case debug_bot_whammy_speed
				change structurename = <player_status> debug_bot_whammy_speed = <new_value>
				change structurename = <player_status> debug_bot_whammy_theta = 90
				case debug_bot_whammy_attack_delay
				change structurename = <player_status> debug_bot_whammy_attack_delay = <new_value>
				case debug_bot_broken_string_delay
				change structurename = <player_status> debug_bot_broken_string_delay = <new_value>
				case debug_bot_use_attack_quota
				change structurename = <player_status> debug_bot_use_attack_quota = <new_value>
			endswitch
			FormatText textname = new_text '%t%v' t = <text> v = <new_value>
			<id> :setprops text = <new_text>
		endif
	endif
endscript

script destroy_adv_bots_menu 
	if ScreenElementExists \{id = adv_bots_scrolling_menu}
		DestroyScreenElement \{id = adv_bots_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script destroy_adv_bots_sub_menu 
	if ScreenElementExists \{id = adv_bots_sub_scrolling_menu}
		DestroyScreenElement \{id = adv_bots_sub_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script back_to_adv_bots_menu 
	destroy_adv_bots_sub_menu
	create_adv_bots_menu
endscript

script adv_bots_toggle_mode \{player_status = player1_status}
	ui_menu_select_sfx
	kill_debug_elements
	new_mode = (($<player_status>.debug_bot_mode) + 1)
	if (<new_mode> > 2)
		<new_mode> = 0
	endif
	change structurename = <player_status> debug_bot_mode = <new_mode>
	destroy_adv_bots_sub_menu
	create_adv_bots_sub_menu player_status = <player_status>
endscript

script adv_bots_toggle_use_sp \{player_status = player1_status}
	change structurename = <player_status> debug_bot_do_star_power = (1 - ($<player_status>.debug_bot_do_star_power))
	adv_bots_use_sp_setprop player_status = <player_status>
endscript

script adv_bots_use_sp_setprop \{player_status = player1_status}
	toggle_text = 'ON'
	if (($<player_status>.debug_bot_do_star_power) = 0)
		<toggle_text> = 'OFF'
	endif
	FormatText textname = text 'Use Star Power/Attacks: %t' t = <toggle_text>
	adv_bots_use_sp_item :setprops text = <text>
endscript

script adv_bots_toggle_on \{player_status = player1_status}
	change structurename = <player_status> bot_play = (1 - ($<player_status>.bot_play))
	adv_bots_on_setprop player_status = <player_status>
endscript

script adv_bots_on_setprop \{player_status = player1_status}
	toggle_text = 'ON'
	if (($<player_status>.bot_play) = 0)
		<toggle_text> = 'OFF'
	endif
	FormatText textname = text 'Toggle Bot: %t' t = <toggle_text>
	adv_bots_on_item :setprops text = <text>
endscript

script adv_bots_toggle_death \{player_status = player1_status}
	change structurename = <player_status> debug_bot_prevent_death = (1 - ($<player_status>.debug_bot_prevent_death))
	adv_bots_death_setprop player_status = <player_status>
endscript

script adv_bots_death_setprop \{player_status = player1_status}
	toggle_text = 'ON'
	if (($<player_status>.debug_bot_prevent_death) = 0)
		<toggle_text> = 'OFF'
	endif
	FormatText textname = text 'Prevent Bot Death: %t' t = <toggle_text>
	adv_bots_prevent_death_item :setprops text = <text>
endscript

script create_battle_debug_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = battle_mode_debug_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = battle_mode_debug_menu
		id = battle_mode_debug_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	array_entry = 0
	GetArraySize \{$battlemode_powerups}
	CreateScreenElement \{type = textelement
		parent = battle_mode_debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		text = 'Skip to sudden death'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				debug_force_sudden_death
			}
		]}
	begin
	FormatText textname = opt_text 'Give Player 1 %t' t = ($battlemode_powerups [<array_entry>].name_text)
	CreateScreenElement {
		type = textelement
		parent = battle_mode_debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		text = <opt_text>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose battlemode_ready params = {battle_gem = <array_entry> player_status = player1_status battle_text = 0}}
		]
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	<array_entry> = 0
	begin
	FormatText textname = opt_text 'Give Player 2 %t' t = ($battlemode_powerups [<array_entry>].name_text)
	CreateScreenElement {
		type = textelement
		parent = battle_mode_debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		text = <opt_text>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose battlemode_ready params = {battle_gem = <array_entry> player_status = player2_status battle_text = 0}}
		]
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = battle_mode_debug_vmenu}
endscript

script debug_force_sudden_death 
	change \{force_sudden_death = 1}
endscript

script destroy_battle_mode_debug_menu 
	if ScreenElementExists \{id = battle_mode_debug_menu}
		DestroyScreenElement \{id = battle_mode_debug_menu}
	endif
	destroy_generic_backdrop
endscript

script back_to_online_menu 

	quit_network_game
	destroy_create_session_menu
	create_online_menu
endscript

script create_songversion_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = songversion_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (40.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = songversion_scrolling_menu
		id = songversion_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = songversion_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Play GH3_XP1 Song'
		z_priority = 100.0
		just = [
			left
			top
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_song_menu
				params = {
					version = gh3
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = songversion_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Play GH2 Song'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_song_menu
				params = {
					version = gh2
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = songversion_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Play GH1 Song'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_song_menu
				params = {
					version = gh1
				}
			}
		]}
	LaunchEvent \{type = focus
		target = songversion_vmenu}
endscript

script back_to_songversion_menu 
	destroy_song_menu
	create_songversion_menu
endscript

script destroy_songversion_menu 
	if ScreenElementExists \{id = songversion_scrolling_menu}
		DestroyScreenElement \{id = songversion_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_song_menu \{version = gh3}
	ui_menu_select_sfx
	destroy_songversion_menu
	create_generic_backdrop
	x_pos = 450
	if (<version> = gh1)
		<x_pos> = 455
	endif
	if (<version> = gh2)
		<x_pos> = 520
	endif
	if (<version> = gh3)
		<x_pos> = 500
	endif
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = song_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		pos = ($menu_pos - (520.0, 0.0) + (<x_pos> * (1.0, 0.0)))
	}
	CreateScreenElement \{type = vmenu
		parent = song_scrolling_menu
		id = song_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_songversion_menu
				}
			}
		]}
	array_entry = 0
	get_songlist_size
	begin
	get_songlist_checksum index = <array_entry>
	get_song_struct song = <song_checksum>
	if ((<song_struct>.version) = <version>)
		get_song_title song = <song_checksum>
		CreateScreenElement {
			type = textelement
			parent = song_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = <song_title>
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_difficulty_menu params = {song_name = <song_checksum> version = <version> player = 1}}
			]
		}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = song_vmenu}
endscript

script back_to_song_menu 
	destroy_difficulty_menu
	create_song_menu version = <version>
endscript

script destroy_song_menu 
	if ScreenElementExists \{id = song_scrolling_menu}
		DestroyScreenElement \{id = song_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_difficulty_menu 
	destroy_song_menu
	destroy_difficulty_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = difficulty_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement {
		type = vmenu
		parent = difficulty_menu
		id = difficulty_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = back_to_song_menu version = <version>}}
		]
	}
	array_entry = 0
	GetArraySize \{$difficulty_list}
	begin
	difficulty_count = ($difficulty_list [<array_entry>])
	get_difficulty_text difficulty = <difficulty_count>
	if (<player> = 2)
		CreateScreenElement {
			type = textelement
			parent = difficulty_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = <difficulty_text>
			z_priority = 100.0
			just = [left top]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_start_song params = {song_name = <song_name> difficulty2 = ($difficulty_list [<array_entry>]) difficulty = <difficulty>}}
			]
		}
	else
		if ($current_num_players = 2)
			CreateScreenElement {
				type = textelement
				parent = difficulty_vmenu
				font = text_a1
				scale = 0.75
				rgba = [210 210 210 250]
				text = <difficulty_text>
				just = [left top]
				z_priority = 100.0
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose create_difficulty_menu params = {song_name = <song_name> version = <version> difficulty = ($difficulty_list [<array_entry>]) player = 2}}
				]
			}
		else
			CreateScreenElement {
				type = textelement
				parent = difficulty_vmenu
				font = text_a1
				scale = 0.75
				rgba = [210 210 210 250]
				text = <difficulty_text>
				just = [left top]
				z_priority = 100.0
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose select_start_song params = {difficulty = ($difficulty_list [<array_entry>]) song_name = <song_name>}}
				]
			}
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = difficulty_vmenu}
endscript

script destroy_difficulty_menu 
	if ScreenElementExists \{id = difficulty_menu}
		DestroyScreenElement \{id = difficulty_menu}
	endif
	destroy_generic_backdrop
endscript

script create_settings_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = settings_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = settings_scrolling_menu
		id = settings_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Venue'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changevenue_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Guitar'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changeguitar_menu
				params = {
					type = guitar
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Bass'
		just = [
			left
			top
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changeguitar_menu
				params = {
					type = bass
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_visibility_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle visibility'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_togglevisibility_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = select_slomo_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Select Slomo : 1.0'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				select_slomo
			}
		]}
	select_slomo_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = Debug_BCSND_Audio_Stereo
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		just = [
			left
			top
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				debug_toggle_stereo_sound
			}
		]}
	toggle_stereo_sound_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_showmeasures_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Show Measures'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_showmeasures
			}
		]}
	toggle_showmeasures_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_showcameraname_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Show Camera Name'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_showcameraname
			}
		]}
	toggle_showcameraname_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_inputlog_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Show Input Log'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_inputlog
			}
		]}
	toggle_inputlog_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_botp1_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Bot P1'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_botp1
			}
		]}
	toggle_botp1_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_botp2_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Bot P2'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_botp2
			}
		]}
	toggle_botp2_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = edit_inputlog_lines_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Input Log Lines'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_left
				edit_inputlog_lines_left
			}
			{
				pad_right
				edit_inputlog_lines_right
			}
		]}
	edit_inputlog_lines_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_tilt_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Show Input Log'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_tilt
			}
		]}
	toggle_tilt_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_leftyflip_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Leftyflip'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_leftyflip
			}
		]}
	toggle_leftyflip_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = create_cameracut_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Select CameraCut'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_cameracut_group_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_ingame_cameracut_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Ingame CameraCut Menu: OFF'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_ingame_cameracut_menu
			}
		]}
	toggle_ingame_cameracut_menu_setprops
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle GPU Time'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_global
				params = {
					global_toggle = show_gpu_time
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle CPU Time'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_global
				params = {
					global_toggle = show_cpu_time
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_forcescore_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Force Score'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_forcescore
			}
		]}
	toggle_forcescore_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		id = toggle_animdebug_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Anim Debug'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_animdebug
			}
		]}
	toggle_animdebug_setprop
	CreateScreenElement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Effects'
		z_priority = 100.0
		just = [
			left
			top
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_bloom_menu
			}
		]}
	LaunchEvent \{type = focus
		target = settings_vmenu}
endscript

script toggle_aspect_ratio 
	GetGlobalTags \{user_options}
	if (<ps2_widescreen> = 1)
		SetScreenElementProps \{id = Debug_Aspect_Toggle
			text = 'Widescreen: Off'}
		SetGlobalTags \{user_options
			params = {
				ps2_widescreen = 0
			}}
		SetScreen \{widescreen = 0}
	else
		SetScreenElementProps \{id = Debug_Aspect_Toggle
			text = 'Widescreen: On'}
		SetGlobalTags \{user_options
			params = {
				ps2_widescreen = 1
			}}
		SetScreen \{widescreen = 1}
	endif
endscript

script toggle_progressive_scan 
	if ($PS2_ProgressiveScan = 1)
		SetScreenElementProps \{id = Debug_Progressive_Scan
			text = 'Progressive Scan: Off'}
		change \{PS2_ProgressiveScan = 0}
		SetProgressive \{on = 0}
	else
		SetScreenElementProps \{id = Debug_Progressive_Scan
			text = 'Progressive Scan: On'}
		change \{PS2_ProgressiveScan = 1}
		SetProgressive \{on = 1}
	endif
endscript

script toggle_on_audible_hitnote 
	if ($Debug_Audible_HitNote = 1)
		change \{Debug_Audible_HitNote = 0}
		SetScreenElementProps \{id = Debug_Toggle_Audible_HitNote
			text = 'Debug_Audible_HitNote Bot: OFF'}
	else
		change \{Debug_Audible_HitNote = 1}
		SetScreenElementProps \{id = Debug_Toggle_Audible_HitNote
			text = 'Debug_Audible_HitNote: ON'}
	endif
endscript

script debug_toggle_stereo_sound 
	GetGlobalTags \{user_options}
	if (<PS2_Stereo_Sound> = 1)
		SetGlobalTags \{user_options
			params = {
				PS2_Stereo_Sound = 0
			}}
		SetStereoSound \{0}
	else
		SetGlobalTags \{user_options
			params = {
				PS2_Stereo_Sound = 1
			}}
		SetStereoSound \{1}
	endif
	toggle_stereo_sound_setprop
endscript

script playday_unlockall 
	difficulties = [easy medium hard expert]
	stored_difficulty1 = ($current_difficulty)
	stored_difficulty2 = ($current_difficulty2)
	stored_band = ($current_band)
	stored_gamemode = ($game_mode)
	Menu_Music_Off \{setflag = 1}
	if ($progression_pop_count = 1)
		popped = 1
		progression_push_current
	else
		popped = 0
	endif
	diff_index = 0
	begin
	change current_difficulty = (<difficulties> [<diff_index>])
	change current_difficulty2 = (<difficulties> [<diff_index>])
	band_index = 1
	begin
	change current_band = <band_index>
	change \{game_mode = p1_career}
	progression_pop_current
	get_progression_globals \{game_mode = p1_career}
	GlobalTags_UnlockAll SongList = <tier_global>
	progression_push_current
	band_index = (<band_index> + 1)
	repeat 5
	GlobalTags_UnlockAll \{SongList = GH3_General_Songs}
	GlobalTags_UnlockAll \{SongList = GH3_Bonus_Songs}
	<diff_index> = (<diff_index> + 1)
	repeat 4
	GetArraySize ($GH3_Bonus_Songs.tier1.songs)
	i = 0
	begin
	SetGlobalTags ($GH3_Bonus_Songs.tier1.songs [<i>]) params = {unlocked = 1}
	<i> = (<i> + 1)
	repeat <array_size>
	i = 5
	GetArraySize ($bv_text_array)
	begin
	video_checksum = ($bv_text_array [<i>].id)
	SetGlobalTags <video_checksum> params = {unlocked = 1}
	<i> = (<i> + 1)
	repeat (<array_size> - 5)
	change \{structurename = player1_status
		new_cash = 0}
	change \{progression_play_completion_movie = 0}
	change \{progression_unlock_tier_last_song = 0}
	change current_difficulty = <stored_difficulty1>
	change current_difficulty2 = <stored_difficulty2>
	change current_band = <stored_band>
	change game_mode = <stored_gamemode>
	SetGlobalTags \{training
		params = {
			star_power_lesson = unlocked
			advanced_techniques_lesson = unlocked
			guitar_battle_lesson = unlocked
		}}
	if (<popped> = 1)
		progression_pop_current
	endif
	spawnscriptnow \{Menu_Music_On
		params = {
			setflag = 1
		}}
endscript

script back_to_settings_menu 
	destroy_changevenue_menu
	destroy_changehighway_menu
	destroy_changeguitar_menu
	destroy_togglevisibility_menu
	destroy_cameracut_group_menu
	destroy_bloom_menu
	create_settings_menu
endscript

script back_to_cameracut_group_menu 
	destroy_cameracut_menu
	create_cameracut_group_menu
endscript

script destroy_settings_menu 
	if ScreenElementExists \{id = settings_scrolling_menu}
		DestroyScreenElement \{id = settings_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script destroy_bloom_menu 
	if ScreenElementExists \{id = bloom_scrolling_menu}
		DestroyScreenElement \{id = bloom_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_bloom_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = bloom_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = bloom_scrolling_menu
		id = bloom_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_settings_menu
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_bloom1_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Primary Bloom'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_bloom1
			}
		]}
	toggle_bloom1_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_bloom2_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Secondary Bloom'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_bloom2
			}
		]}
	toggle_bloom2_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_bloom_strr_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Strength Red'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_bloom_strr
			}
		]}
	toggle_bloom_strr_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_bloom_strg_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Strength Green'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_bloom_strg
			}
		]}
	toggle_bloom_strg_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_bloom_strb_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Strength Blue'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_bloom_strb
			}
		]}
	toggle_bloom_strb_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_bloom_colr_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Color Red'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_bloom_colr
			}
		]}
	toggle_bloom_colr_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_bloom_colg_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Color Green'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_bloom_colg
			}
		]}
	toggle_bloom_colg_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_bloom_colb_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Color Blue'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_bloom_colb
			}
		]}
	toggle_bloom_colb_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_grain_alpha_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Film Grain Alpha'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_grain_alpha
			}
		]}
	toggle_grain_alpha_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_grain_colr_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Grain Color Red'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_grain_colr
			}
		]}
	toggle_grain_colr_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_grain_colg_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Grain Color Green'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_grain_colg
			}
		]}
	toggle_grain_colg_setprop
	CreateScreenElement \{type = textelement
		parent = bloom_vmenu
		id = toggle_grain_colb_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Grain Color Blue'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_grain_colb
			}
		]}
	toggle_grain_colb_setprop
	LaunchEvent \{type = focus
		target = bloom_vmenu}
endscript
debug_Bloom1 = 0.0
debug_Bloom2 = 0.0
debug_BloomStrengthR = 0
debug_BloomStrengthG = 0
debug_BloomStrengthB = 0
debug_BloomColorR = -5
debug_BloomColorG = -5
debug_BloomColorB = -5
debug_GrainAlpha = 0.0
debug_GrainColorR = 0
debug_GrainColorG = 0
debug_GrainColorB = 0

script toggle_grain_alpha 
	ui_menu_select_sfx
	change debug_GrainAlpha = ($debug_GrainAlpha + 0.05)
	if ($debug_GrainAlpha > 0.5)
		change \{debug_GrainAlpha = -0.5}
	endif
	toggle_grain_alpha_setprop
endscript

script toggle_bloom_strr 
	ui_menu_select_sfx
	change debug_BloomStrengthR = ($debug_BloomStrengthR + 8)
	if ($debug_BloomStrengthR >= 8)
		change \{debug_BloomStrengthR = -248}
	endif
	toggle_bloom_strr_setprop
endscript

script toggle_bloom_strg 
	ui_menu_select_sfx
	change debug_BloomStrengthG = ($debug_BloomStrengthG + 8)
	if ($debug_BloomStrengthG >= 8)
		change \{debug_BloomStrengthG = -248}
	endif
	toggle_bloom_strg_setprop
endscript

script toggle_bloom_strb 
	ui_menu_select_sfx
	change debug_BloomStrengthB = ($debug_BloomStrengthB + 8)
	if ($debug_BloomStrengthB >= 8)
		change \{debug_BloomStrengthB = -248}
	endif
	toggle_bloom_strb_setprop
endscript

script toggle_bloom_colr 
	ui_menu_select_sfx
	change debug_BloomColorR = ($debug_BloomColorR + 8)
	if ($debug_BloomColorR >= 195)
		change \{debug_BloomColorR = -61}
	endif
	toggle_bloom_colr_setprop
endscript

script toggle_bloom_colg 
	ui_menu_select_sfx
	change debug_BloomColorG = ($debug_BloomColorG + 8)
	if ($debug_BloomColorG >= 195)
		change \{debug_BloomColorG = -61}
	endif
	toggle_bloom_colg_setprop
endscript

script toggle_bloom_colb 
	ui_menu_select_sfx
	change debug_BloomColorB = ($debug_BloomColorB + 8)
	if ($debug_BloomColorB >= 195)
		change \{debug_BloomColorB = -61}
	endif
	toggle_bloom_colb_setprop
endscript

script toggle_grain_colr 
	ui_menu_select_sfx
	change debug_GrainColorR = ($debug_GrainColorR + 8)
	if ($debug_GrainColorR >= 127)
		change \{debug_GrainColorR = -121}
	endif
	toggle_grain_colr_setprop
endscript

script toggle_grain_colg 
	ui_menu_select_sfx
	change debug_GrainColorG = ($debug_GrainColorG + 8)
	if ($debug_GrainColorG >= 127)
		change \{debug_GrainColorG = -121}
	endif
	toggle_grain_colg_setprop
endscript

script toggle_grain_colb 
	ui_menu_select_sfx
	change debug_GrainColorB = ($debug_GrainColorB + 8)
	if ($debug_GrainColorB >= 127)
		change \{debug_GrainColorB = -121}
	endif
	toggle_grain_colb_setprop
endscript

script toggle_grain_alpha_setprop 
	FormatText textname = formatString 'Film Grain Alpha: %a' a = ($debug_GrainAlpha + 0.5)
	toggle_grain_alpha_menuitem :setprops text = <formatString>
endscript

script toggle_bloom_strr_setprop 
	FormatText textname = formatString 'Bloom Strength Red: %a' a = ($debug_BloomStrengthR + 255)
	toggle_bloom_strr_menuitem :setprops text = <formatString>
endscript

script toggle_bloom_strg_setprop 
	FormatText textname = formatString 'Bloom Strength Green: %a' a = ($debug_BloomStrengthG + 255)
	toggle_bloom_strg_menuitem :setprops text = <formatString>
endscript

script toggle_bloom_strb_setprop 
	FormatText textname = formatString 'Bloom Strength Blue: %a' a = ($debug_BloomStrengthB + 255)
	toggle_bloom_strb_menuitem :setprops text = <formatString>
endscript

script toggle_bloom_colr_setprop 
	FormatText textname = formatString 'Bloom Color Red: %a' a = ($debug_BloomColorR + 68)
	toggle_bloom_colr_menuitem :setprops text = <formatString>
endscript

script toggle_bloom_colg_setprop 
	FormatText textname = formatString 'Bloom Color Green: %a' a = ($debug_BloomColorG + 68)
	toggle_bloom_colg_menuitem :setprops text = <formatString>
endscript

script toggle_bloom_colb_setprop 
	FormatText textname = formatString 'Bloom Color Blue: %a' a = ($debug_BloomColorB + 68)
	toggle_bloom_colb_menuitem :setprops text = <formatString>
endscript

script toggle_grain_colr_setprop 
	FormatText textname = formatString 'Grain Color Red: %a' a = ($debug_GrainColorR + 128)
	toggle_grain_colr_menuitem :setprops text = <formatString>
endscript

script toggle_grain_colg_setprop 
	FormatText textname = formatString 'Grain Color Green: %a' a = ($debug_GrainColorG + 128)
	toggle_grain_colg_menuitem :setprops text = <formatString>
endscript

script toggle_grain_colb_setprop 
	FormatText textname = formatString 'Grain Color Blue: %a' a = ($debug_GrainColorB + 128)
	toggle_grain_colb_menuitem :setprops text = <formatString>
endscript

script toggle_bloom1 
	ui_menu_select_sfx
	change debug_Bloom1 = ($debug_Bloom1 + 0.05)
	if ($debug_Bloom1 >= 0.7)
		change \{debug_Bloom1 = -0.35000002}
	endif
	toggle_bloom1_setprop
endscript

script toggle_bloom1_setprop 
	FormatText textname = formatString 'Primary Bloom: %a' a = ($debug_Bloom1 + 0.35000002)
	toggle_bloom1_menuitem :setprops text = <formatString>
endscript

script toggle_bloom2 
	ui_menu_select_sfx
	change debug_Bloom2 = ($debug_Bloom2 + 0.05)
	if ($debug_Bloom2 >= 0.05)
		change \{debug_Bloom2 = -1.0}
	endif
	toggle_bloom2_setprop
endscript

script toggle_bloom2_setprop 
	FormatText textname = formatString 'Secondary Bloom: %a' a = ($debug_Bloom2 + 1.0)
	toggle_bloom2_menuitem :setprops text = <formatString>
endscript
CameraCutPrefixArray = [
	'cameras'
	'cameras_longshot'
	'cameras_mid'
	'cameras_stage'
	'cameras_guitarist'
	'cameras_guitar'
	'cameras_singer'
	'cameras_drummer'
	'cameras_bassist'
	'cameras_rhythm'
	'cameras_zoom'
	'cameras_pan'
	'cameras_dolly'
	'cameras_special'
	'cameras_mocap'
	'cameras_audience'
	'cameras_boss_battle'
	'cameras_stagediver'
	'cameras_2p'
	'cameras_longshot_2p'
	'cameras_mid_2p'
	'cameras_stage_2p'
	'cameras_guitarist_2p'
	'cameras_guitar_2p'
	'cameras_singer_2p'
	'cameras_drummer_2p'
	'cameras_bassist_2p'
	'cameras_rhythm_2p'
	'cameras_zoom_2p'
	'cameras_pan_2p'
	'cameras_dolly_2p'
	'cameras_special_2p'
	'cameras_mocap_2p'
	'cameras_audience_2p'
	'cameras_boss_battle_2p'
	'cameras_stagediver_2p'
]

script create_cameracut_group_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = selectcameracut_scrolling_group_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = selectcameracut_scrolling_group_menu
		id = selectcameracut_group_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_settings_menu
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = selectcameracut_group_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'off'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				select_cameracut
				params = {
					Camera_Array_pakname = none
					camera_array = none
					array_count = none
				}
			}
		]}
	GetPakManCurrentName \{map = zones}
	camera_count = 0
	GetArraySize \{$CameraCutPrefixArray}
	camera_array_size = <array_size>
	begin
	FormatText checksumname = camera_array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [<camera_count>])
	if GlobalExists name = <camera_array>
		GetArraySize $<camera_array>
		if (<array_size>)
			FormatText textname = Camera_Group '%p' p = ($CameraCutPrefixArray [<camera_count>])
			CreateScreenElement {
				type = textelement
				parent = selectcameracut_group_vmenu
				font = text_a1
				scale = 0.75
				rgba = [210 210 210 250]
				text = <Camera_Group>
				z_priority = 100.0
				just = [left top]
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose create_cameracut_menu params = {camera_count = <camera_count>}}
					{pad_square create_cameracut_menu params = {camera_count = <camera_count>}}
				]
			}
		endif
	endif
	camera_count = (<camera_count> + 1)
	repeat <camera_array_size>
	LaunchEvent \{type = focus
		target = selectcameracut_group_vmenu}
endscript

script create_cameracut_menu 
	if NOT GotParam \{camera_count}
		create_cameracut_group_menu
		return
	endif
	ui_menu_select_sfx
	destroy_cameracut_group_menu
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = selectcameracut_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = selectcameracut_scrolling_menu
		id = selectcameracut_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_cameracut_group_menu
				}
			}
		]}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = camera_array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [<camera_count>])
	if GlobalExists name = <camera_array>
		GetArraySize $<camera_array>
		array_count = 0
		begin
		cameracut_getname pakname = <pakname> prefixNumber = <camera_count> cameraNumber = <array_count>
		CreateScreenElement {
			type = textelement
			parent = selectcameracut_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = <Camera_Name>
			z_priority = 100.0
			just = [left top]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_cameracut params = {Camera_Array_pakname = <pakname> camera_array = ($CameraCutPrefixArray [<camera_count>]) array_count = <array_count>}}
				{pad_square select_cameracut params = {Camera_Array_pakname = <pakname> camera_array = ($CameraCutPrefixArray [<camera_count>]) array_count = <array_count> jumptoviewer}}
			]
		}
		<array_count> = (<array_count> + 1)
		repeat <array_size>
	endif
	LaunchEvent \{type = focus
		target = selectcameracut_vmenu}
endscript

script back_to_cameracut_menu 
	create_cameracut_menu
endscript

script destroy_cameracut_menu 
	if ScreenElementExists \{id = selectcameracut_scrolling_menu}
		DestroyScreenElement \{id = selectcameracut_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script destroy_cameracut_group_menu 
	if ScreenElementExists \{id = selectcameracut_scrolling_group_menu}
		DestroyScreenElement \{id = selectcameracut_scrolling_group_menu}
	endif
	destroy_generic_backdrop
endscript
debug_camera_array = none
debug_camera_array_pakname = none
debug_camera_array_count = 0

script select_cameracut 
	ui_menu_select_sfx
	change debug_camera_array = <camera_array>
	change debug_camera_array_pakname = <Camera_Array_pakname>
	change debug_camera_array_count = <array_count>
	destroy_cameracuts
	wait \{3
		gameframes}
	create_cameracuts
	if GotParam \{jumptoviewer}
		destroy_all_debug_menus
		unpausegh3
		enable_pause
		change \{viewer_buttons_enabled = 1}
		ToggleViewMode
	endif
endscript
cameracut_ingame_menu_on = 0
cameracut_ingame_menu_depth = 0
cameracut_ingame_menu_group = 0
cameracut_ingame_menu_index = 0

script toggle_ingame_cameracut_menu 
	change cameracut_ingame_menu_on = (1 - ($cameracut_ingame_menu_on))
	toggle_ingame_cameracut_menu_setprops
endscript

script toggle_ingame_cameracut_menu_setprops 
	if ($cameracut_ingame_menu_on = 1)
		toggle_ingame_cameracut_menuitem :setprops \{text = 'Ingame CameraCut Menu: ON'}
	else
		toggle_ingame_cameracut_menuitem :setprops \{text = 'Ingame CameraCut Menu: OFF'}
	endif
endscript

script create_cameracut_ingame_menu 
	destroy_cameracut_ingame_menu
	CreateScreenElement {
		type = vmenu
		parent = root_window
		id = cameracut_ingame_vmenu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
		event_handlers = [
			{pad_back cameracut_ingame_menu_press_button params = {type = back dir = -1}}
			{pad_choose cameracut_ingame_menu_press_button params = {type = choose dir = 1}}
			{pad_left cameracut_ingame_menu_press_button params = {type = hori dir = -1}}
			{pad_right cameracut_ingame_menu_press_button params = {type = hori dir = 1}}
			{pad_up cameracut_ingame_menu_press_button params = {type = vert dir = -1}}
			{pad_down cameracut_ingame_menu_press_button params = {type = vert dir = 1}}
		]
	}
	CreateScreenElement \{type = textelement
		id = cameracut_ingame_down_1
		parent = cameracut_ingame_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'V'
		just = [
			center
			top
		]
		z_priority = 100.0}
	CreateScreenElement \{type = textelement
		parent = cameracut_ingame_vmenu
		id = cameracut_ingame_group_item
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = ''
		z_priority = 100.0
		just = [
			center
			top
		]}
	CreateScreenElement \{type = textelement
		parent = cameracut_ingame_vmenu
		id = cameracut_ingame_down_2
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = ''
		just = [
			center
			top
		]
		z_priority = 100.0}
	CreateScreenElement \{type = textelement
		parent = cameracut_ingame_vmenu
		id = cameracut_ingame_camera_item
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = ''
		z_priority = 100.0
		just = [
			left
			top
		]}
	cameracut_ingame_menu_setprops
	LaunchEvent \{type = focus
		target = cameracut_ingame_vmenu}
endscript
cameracut_ingame_menu_Camera_Array_pakname = 0
cameracut_ingame_menu_Camera_Array = 0
cameracut_ingame_menu_array_count = 0

script cameracut_getname 
	if NOT GotParam \{pakname}
		GetPakManCurrentName \{map = zones}
	endif
	FormatText checksumname = cameraArray '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [<prefixNumber>])
	FormatText textname = Camera_Name '%s_%p_%i' s = <pakname> p = ($CameraCutPrefixArray [<prefixNumber>]) i = <cameraNumber>
	if StructureContains structure = ($<cameraArray> [<cameraNumber>]) name
		if StructureContains structure = ($CameraCutNameStructure) ($<cameraArray> [<cameraNumber>].name)
			FormatText textname = Camera_Name '%s' s = ($CameraCutNameStructure.($<cameraArray> [<cameraNumber>].name)) dontassertforchecksums
		else
			FormatText textname = Camera_Name '%s' s = ($<cameraArray> [<cameraNumber>].name) dontassertforchecksums
		endif
	elseif StructureContains structure = ($<cameraArray> [<cameraNumber>]) params
		if StructureContains structure = ($<cameraArray> [<cameraNumber>].params) name
			if StructureContains structure = ($CameraCutNameStructure) (($<cameraArray> [<cameraNumber>].params).name)
				FormatText textname = Camera_Name '%s' s = ($CameraCutNameStructure.(($<cameraArray> [<cameraNumber>].params).name)) dontassertforchecksums
			else
				FormatText textname = Camera_Name '%s' s = ($<cameraArray> [<cameraNumber>].params.name) dontassertforchecksums
			endif
		endif
	endif
	return Camera_Name = <Camera_Name>
endscript

script cameracut_ingame_menu_setprops 
	depth = ($cameracut_ingame_menu_depth)
	index = ($cameracut_ingame_menu_index)
	cameracut_ingame_group_item :setprops \{text = ''}
	cameracut_ingame_down_2 :setprops \{text = ''}
	cameracut_ingame_camera_item :setprops \{text = ''}
	if ((<depth>) > 0)
		FormatText textname = Camera_Group '%p' p = ($CameraCutPrefixArray [$cameracut_ingame_menu_group])
		cameracut_ingame_group_item :setprops text = <Camera_Group>
		cameracut_ingame_down_2 :setprops \{text = 'V'}
	endif
	if ((<depth>) > 1)
		GetPakManCurrentName \{map = zones}
		cameracut_getname pakname = <pakname> prefixNumber = ($cameracut_ingame_menu_group) cameraNumber = ($cameracut_ingame_menu_index)
		FormatText checksumname = cameraArray '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
		GetArraySize ($<cameraArray>)
		FormatText textname = CamName '%s (%i/%m)' s = <Camera_Name> i = (($cameracut_ingame_menu_index) + 1) m = <array_size> dontassertforchecksums
		cameracut_ingame_camera_item :setprops text = <CamName>
	endif
endscript

script cameracut_ingame_menu_press_button \{type = vert
		dir = 1}
	if ((<type> = choose) && (($cameracut_ingame_menu_depth) = 2))
		select_cameracut_ingame
	elseif ((<type> = vert) || (<type> = choose) || (<type> = back))
		cameracut_ingame_menu_change_depth dir = <dir>
	elseif ((<type> = hori))
		if (($cameracut_ingame_menu_depth) = 1)
			cameracut_ingame_menu_change_group dir = <dir>
		elseif (($cameracut_ingame_menu_depth) = 2)
			cameracut_ingame_menu_change_camera dir = <dir>
		endif
	endif
endscript

script cameracut_ingame_menu_change_depth \{dir = 1}
	change cameracut_ingame_menu_depth = (($cameracut_ingame_menu_depth) + <dir>)
	if (($cameracut_ingame_menu_depth) < 0)
		change \{cameracut_ingame_menu_depth = 0}
		return
	endif
	if (($cameracut_ingame_menu_depth) > 2)
		change \{cameracut_ingame_menu_depth = 2}
		return
	endif
	cameracut_ingame_menu_setprops
endscript

script cameracut_ingame_menu_change_group \{dir = 1}
	change cameracut_ingame_menu_group = (($cameracut_ingame_menu_group) + <dir>)
	GetArraySize \{$CameraCutPrefixArray}
	max_value = (<array_size> -1)
	if (($cameracut_ingame_menu_group) < 0)
		change cameracut_ingame_menu_group = <max_value>
	endif
	if (($cameracut_ingame_menu_group) > (<max_value>))
		change \{cameracut_ingame_menu_group = 0}
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = camera_array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
	if GlobalExists name = <camera_array>
		GetArraySize $<camera_array>
		if (<array_size>)
			change \{cameracut_ingame_menu_index = 0}
			cameracut_ingame_menu_setprops
			return
		endif
	endif
	cameracut_ingame_menu_change_group dir = <dir>
endscript

script cameracut_ingame_menu_change_camera \{dir = 1}
	change cameracut_ingame_menu_index = (($cameracut_ingame_menu_index) + <dir>)
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = camera_array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
	GetArraySize $<camera_array>
	max_value = (<array_size> -1)
	if (($cameracut_ingame_menu_index) < 0)
		change cameracut_ingame_menu_index = <max_value>
	endif
	if (($cameracut_ingame_menu_index) > (<max_value>))
		change \{cameracut_ingame_menu_index = 0}
	endif
	cameracut_ingame_menu_setprops
endscript

script select_cameracut_ingame 
	ui_menu_select_sfx
	GetPakManCurrentName \{map = zones}
	change debug_camera_array = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
	change debug_camera_array_pakname = <pakname>
	change debug_camera_array_count = ($cameracut_ingame_menu_index)
	destroy_cameracuts
	wait \{3
		gameframes}
	create_cameracuts
endscript

script destroy_cameracut_ingame_menu 
	if ScreenElementExists \{id = cameracut_ingame_vmenu}
		DestroyScreenElement \{id = cameracut_ingame_vmenu}
	endif
endscript

script create_character_viewer_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = character_viewer_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = character_viewer_scrolling_menu
		id = character_viewer_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = character_viewer_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Guitarist'
		z_priority = 100.0
		just = [
			left
			top
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changeguitarist_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = character_viewer_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Bassist'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changebassist_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = character_viewer_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Vocalist'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changevocalist_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = character_viewer_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Drummer'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changedrummer_menu
			}
		]}
	LaunchEvent \{type = focus
		target = character_viewer_vmenu}
endscript

script back_to_character_viewer_menu 
	destroy_changeguitarist_menu
	destroy_changebassist_menu
	destroy_changevocalist_menu
	destroy_changedrummer_menu
	create_character_viewer_menu
endscript

script destroy_character_viewer_menu 
	if ScreenElementExists \{id = character_viewer_scrolling_menu}
		DestroyScreenElement \{id = character_viewer_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changeguitarist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = changeguitarist_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = changeguitarist_scrolling_menu
		id = changeguitarist_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_character_viewer_menu
				}
			}
		]}
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	type = (<profile_struct>.type)
	if ((<type> = Guitarist) || (<type> = any))
		CreateScreenElement {
			type = textelement
			parent = changeguitarist_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.fullname)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose debug_menu_choose_guitarist params = {index = <index>}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = changeguitarist_vmenu}
endscript

script destroy_changeguitarist_menu 
	if ScreenElementExists \{id = changeguitarist_scrolling_menu}
		DestroyScreenElement \{id = changeguitarist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script debug_menu_choose_guitarist 
	kill_gem_scroller
	get_musician_profile_struct index = <index>
	FormatText checksumname = guitarist_id '%s' s = (<profile_struct>.name)
	change structurename = player1_status character_id = <guitarist_id>
	if NOT create_guitarist \{UseOldPos}
		DownloadContentLost
	endif
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($current_starttime) device_num = <device_num>
endscript

script create_changebassist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = changebassist_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = changebassist_scrolling_menu
		id = changebassist_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_character_viewer_menu
				}
			}
		]}
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	type = (<profile_struct>.type)
	if ((<type> = bassist) || (<type> = any))
		CreateScreenElement {
			type = textelement
			parent = changebassist_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.fullname)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_bassist params = {profile_name = (<profile_struct>.name) UseOldPos}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = changebassist_vmenu}
endscript

script destroy_changebassist_menu 
	if ScreenElementExists \{id = changebassist_scrolling_menu}
		DestroyScreenElement \{id = changebassist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changevocalist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = changevocalist_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = changevocalist_scrolling_menu
		id = changevocalist_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_character_viewer_menu
				}
			}
		]}
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	type = (<profile_struct>.type)
	if ((<type> = vocalist) || (<type> = any))
		CreateScreenElement {
			type = textelement
			parent = changevocalist_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.name)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_vocalist params = {profile_name = (<info_struct>.name) UseOldPos}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = changevocalist_vmenu}
endscript

script destroy_changevocalist_menu 
	if ScreenElementExists \{id = changevocalist_scrolling_menu}
		DestroyScreenElement \{id = changevocalist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changedrummer_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = changedrummer_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = changedrummer_scrolling_menu
		id = changedrummer_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_character_viewer_menu
				}
			}
		]}
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	type = (<profile_struct>.type)
	if ((<type> = drummer) || (<type> = any))
		CreateScreenElement {
			type = textelement
			parent = changedrummer_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.name)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_drummer params = {profile_name = (<info_struct>.name) UseOldPos}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = changedrummer_vmenu}
endscript

script destroy_changedrummer_menu 
	if ScreenElementExists \{id = changedrummer_scrolling_menu}
		DestroyScreenElement \{id = changedrummer_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_playermode 
	change player1_device = <device_num>
	translate_gamemode
	create_songversion_menu
endscript
debug_with_rhythm = 0
force_coop = 0

script translate_gamemode 
	switch $game_mode
		case p1_quickplay
		if ($debug_with_rhythm)
			change \{structurename = player1_status
				part = rhythm}
		else
			change \{structurename = player1_status
				part = guitar}
		endif
		change \{current_num_players = 1}
		case p1_career
		change \{structurename = player1_status
			part = guitar}
		change \{current_num_players = 1}
		case p1_improv
		change \{structurename = player1_status
			part = guitar}
		change \{current_num_players = 1}
		case p1_boss
		change \{structurename = player1_status
			part = guitar}
		change \{current_num_players = 1}
		case p2_quickplay
		change \{structurename = player1_status
			part = guitar}
		change \{structurename = player2_status
			part = rhythm}
		change \{current_num_players = 2}
		case p2_faceoff
		change \{structurename = player1_status
			part = guitar}
		change \{structurename = player2_status
			part = guitar}
		change \{current_num_players = 2}
		case p2_coop
		change \{structurename = player1_status
			part = guitar}
		change \{structurename = player2_status
			part = rhythm}
		change \{current_num_players = 2}
		case p2_battle
		change \{structurename = player1_status
			part = guitar}
		change \{structurename = player2_status
			part = guitar}
		change \{current_num_players = 2}
		case training
		change \{structurename = player1_status
			part = guitar}
		change \{current_num_players = 1}
	endswitch
endscript

script toggle_playermode_left 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				change \{debug_with_rhythm = 0}
			else
				change \{force_coop = 0}
				change \{debug_with_rhythm = 1}
			endif
		else
			if ($debug_with_rhythm)
				change \{debug_with_rhythm = 0}
			else
				change \{game_mode = training}
			endif
		endif
		case p2_quickplay
		change \{force_coop = 1}
		change \{debug_with_rhythm = 1}
		change \{game_mode = p1_quickplay}
		case p1_career
		change \{game_mode = p2_quickplay}
		case p1_improv
		change \{game_mode = p1_career}
		case p1_boss
		change \{game_mode = p1_improv}
		case p2_faceoff
		change \{game_mode = p1_boss}
		case p2_coop
		change \{game_mode = p2_faceoff}
		case p2_battle
		change \{game_mode = p2_coop}
		case training
		change \{game_mode = p2_battle}
	endswitch
	toggle_playermode_setprop
endscript

script toggle_playermode_right 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				change \{game_mode = p2_quickplay}
				change \{force_coop = 0}
			else
				change \{debug_with_rhythm = 1}
			endif
		else
			if ($debug_with_rhythm)
				change \{force_coop = 1}
				change \{debug_with_rhythm = 0}
			else
				change \{debug_with_rhythm = 1}
			endif
		endif
		case p2_quickplay
		change \{game_mode = p1_career}
		case p1_career
		change \{game_mode = p1_improv}
		case p1_improv
		change \{game_mode = p1_boss}
		case p1_boss
		change \{game_mode = p2_faceoff}
		case p2_faceoff
		change \{game_mode = p2_coop}
		case p2_coop
		change \{game_mode = p2_battle}
		case p2_battle
		change \{game_mode = training}
		case training
		change \{game_mode = p1_quickplay}
		change \{debug_with_rhythm = 0}
	endswitch
	toggle_playermode_setprop
endscript

script toggle_playermode_setprop 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				toggle_playermode_menuitem :setprops \{text = 'Play Song: p1_quickplay with rhythm coop'}
			else
				toggle_playermode_menuitem :setprops \{text = 'Play Song: p1_quickplay coop'}
			endif
		else
			if ($debug_with_rhythm)
				toggle_playermode_menuitem :setprops \{text = 'Play Song: p1_quickplay with rhythm'}
			else
				toggle_playermode_menuitem :setprops \{text = 'Play Song: p1_quickplay'}
			endif
		endif
		case p2_quickplay
		toggle_playermode_menuitem :setprops \{text = 'Play Song: p2_quickplay'}
		case p1_career
		toggle_playermode_menuitem :setprops \{text = 'Play Song: p1_career'}
		case p1_improv
		toggle_playermode_menuitem :setprops \{text = 'Play Song: p1_improv'}
		case p1_boss
		toggle_playermode_menuitem :setprops \{text = 'Play Song: p1_boss'}
		case p2_faceoff
		toggle_playermode_menuitem :setprops \{text = 'Play Song: p2_faceoff'}
		case p2_coop
		toggle_playermode_menuitem :setprops \{text = 'Play Song: p2_coop'}
		case p2_battle
		toggle_playermode_menuitem :setprops \{text = 'Play Song: p2_battle'}
		case training
		toggle_playermode_menuitem :setprops \{text = 'Play Song: training'}
	endswitch
endscript

script select_slomo 
	ui_menu_select_sfx
	speedfactor = ($current_speedfactor * 10.0)
	CasttoInteger \{speedfactor}
	speedfactor = (<speedfactor> + 1)
	if (<speedfactor> > 10)
		speedfactor = 1
	endif
	if (<speedfactor> < 1)
		speedfactor = 1
	endif
	change current_speedfactor = (<speedfactor> / 10.0)
	update_slomo
	select_slomo_setprop
endscript

script update_slomo 
	setslomo \{$current_speedfactor}
	setslomo_song \{slomo = $current_speedfactor}
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player>
	change structurename = <player_status> check_time_early = ($check_time_early * $current_speedfactor)
	change structurename = <player_status> check_time_late = ($check_time_late * $current_speedfactor)
	player = (<player> + 1)
	repeat $current_num_players
endscript

script select_slomo_setprop 
	FormatText \{textname = slomo_text
		'Select Slomo : %s'
		s = $current_speedfactor}
	select_slomo_menuitem :setprops text = <slomo_text>
endscript
debug_showmeasures = off

script toggle_showmeasures 
	ui_menu_select_sfx
	if ScreenElementExists \{id = debug_measures_text}
		DestroyScreenElement \{id = debug_measures_text}
	endif
	if ($debug_showmeasures = off)
		change \{debug_showmeasures = on}
		CreateScreenElement \{type = textelement
			parent = root_window
			id = debug_measures_text
			font = text_a1
			text = 'M: 0 : B: 00'
			scale = 1
			pos = (850.0, 400.0)
			rgba = [
				255
				187
				0
				255
			]
			just = [
				left
				top
			]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			hide}
		if ($playing_song = 1)
			debug_measures_text :setprops \{unhide}
		endif
	else
		change \{debug_showmeasures = off}
	endif
	toggle_showmeasures_setprop
endscript

script toggle_stereo_sound_setprop 
	GetGlobalTags \{user_options}
	if (<PS2_Stereo_Sound> = 1)
		SetScreenElementProps \{id = Debug_BCSND_Audio_Stereo
			text = 'Stereo Sound: ON'}
	else
		SetScreenElementProps \{id = Debug_BCSND_Audio_Stereo
			text = 'Stereo Sound: OFF'}
	endif
endscript

script toggle_showmeasures_setprop 
	if ($debug_showmeasures = off)
		toggle_showmeasures_menuitem :setprops \{text = 'Show Measures : off'}
	else
		toggle_showmeasures_menuitem :setprops \{text = 'Show Measures : on'}
	endif
endscript
debug_showcameraname = off

script toggle_showcameraname 
	ui_menu_select_sfx
	if ScreenElementExists \{id = debug_camera_name_text}
		DestroyScreenElement \{id = debug_camera_name_text}
	endif
	if ($debug_showcameraname = off)
		change \{debug_showcameraname = on}
		CreateScreenElement \{type = textelement
			parent = root_window
			id = debug_camera_name_text
			font = text_a1
			pos = (640.0, 32.0)
			just = [
				center
				top
			]
			scale = 1.0
			rgba = [
				210
				210
				210
				250
			]
			text = 'Camera Name'
			z_priority = 100.0
			z_priority = 1.0
			alpha = 1}
	else
		change \{debug_showcameraname = off}
	endif
	toggle_showcameraname_setprop
	CameraCuts_UpdateDebugCameraName
endscript

script toggle_inputlog 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_play_log = 0)
		change \{show_play_log = 1}
	else
		change \{show_play_log = 0}
	endif
	toggle_inputlog_setprop
	init_play_log
endscript

script toggle_botp1 
	ui_menu_select_sfx
	kill_debug_elements
	change structurename = player1_status bot_play = (1 - ($player1_status.bot_play))
	toggle_botp1_setprop
endscript

script toggle_botp2 
	ui_menu_select_sfx
	kill_debug_elements
	change structurename = player2_status bot_play = (1 - ($player2_status.bot_play))
	toggle_botp2_setprop
endscript

script edit_inputlog_lines_left 
	ui_menu_select_sfx
	kill_debug_elements
	change play_log_lines = ($play_log_lines -1)
	if ($play_log_lines < 1)
		change \{play_log_lines = 1}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script edit_inputlog_lines_right 
	ui_menu_select_sfx
	kill_debug_elements
	change play_log_lines = ($play_log_lines + 1)
	if ($play_log_lines > 10)
		change \{play_log_lines = 10}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script toggle_tilt 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_guitar_tilt = 0)
		change \{show_guitar_tilt = 1}
	else
		change \{show_guitar_tilt = 0}
	endif
	toggle_tilt_setprop
	init_play_log
endscript

script toggle_showcameraname_setprop 
	if ($debug_showcameraname = off)
		toggle_showcameraname_menuitem :setprops \{text = 'Show Camera Name : off'}
	else
		toggle_showcameraname_menuitem :setprops \{text = 'Show Camera Name : on'}
	endif
endscript

script toggle_inputlog_setprop 
	if ($show_play_log = 0)
		toggle_inputlog_menuitem :setprops \{text = 'Show Input Log : off'}
	else
		toggle_inputlog_menuitem :setprops \{text = 'Show Input Log : on'}
	endif
endscript

script toggle_botp1_setprop 
	if (($player1_status.bot_play) = 0)
		toggle_botp1_menuitem :setprops \{text = 'Toggle Bot P1: Off'}
	else
		toggle_botp1_menuitem :setprops \{text = 'Toggle Bot P1: On'}
	endif
endscript

script toggle_botp2_setprop 
	if (($player2_status.bot_play) = 0)
		toggle_botp2_menuitem :setprops \{text = 'Toggle Bot P2: Off'}
	else
		toggle_botp2_menuitem :setprops \{text = 'Toggle Bot P2: On'}
	endif
endscript

script edit_inputlog_lines_setprop 
	FormatText textname = text 'Input Log Lines: %l' l = ($play_log_lines) dontassertforchecksums
	edit_inputlog_lines_menuitem :setprops text = <text>
endscript

script toggle_tilt_setprop 
	if ($show_guitar_tilt = 0)
		toggle_tilt_menuitem :setprops \{text = 'Show Tilt : off'}
		KillSpawnedScript \{name = show_tilt_loop}
	else
		toggle_tilt_menuitem :setprops \{text = 'Show Tilt : on'}
		SpawnScriptLater \{show_tilt_loop}
	endif
endscript

script show_tilt_loop 
	if NOT ScreenElementExists \{id = show_tilt_test}
		CreateScreenElement \{type = textelement
			parent = root_window
			id = show_tilt_test
			pos = (320.0, 240.0)
			font = text_a1
			text = ''}
	endif
	begin
	GuitarGetAnalogueInfo
	rgba = [255 255 255 255]
	GetGlobalTags \{user_options}
	star_power_position = <star_power_position_device_0>
	if (<righty> <= <star_power_position>)
		rgba = [255 64 64 255]
	endif
	FormatText textname = text '%d' d = <righty>
	SetScreenElementProps {
		id = show_tilt_test
		text = <text>
		rgba = <rgba>
	}
	wait \{5
		frames}
	repeat
endscript

script toggle_leftyflip 
	ui_menu_select_sfx
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1> = 0)
		SetGlobalTags \{user_options
			params = {
				lefty_flip_p1 = 1
			}}
	else
		SetGlobalTags \{user_options
			params = {
				lefty_flip_p1 = 0
			}}
	endif
	GetGlobalTags \{user_options}
	change structurename = <player_status> lefthanded_gems = <lefty_flip_p1>
	change structurename = <player_status> lefthanded_button_ups = <lefty_flip_p1>
	toggle_leftyflip_setprop
endscript

script toggle_leftyflip_setprop 
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1> = 0)
		toggle_leftyflip_menuitem :setprops \{text = 'Lefty Flip : off'}
	else
		toggle_leftyflip_menuitem :setprops \{text = 'Lefty Flip : on'}
	endif
endscript
debug_forcescore = off

script toggle_forcescore 
	ui_menu_select_sfx
	switch $debug_forcescore
		case off
		change \{debug_forcescore = poor}
		case poor
		change \{debug_forcescore = medium}
		case medium
		change \{debug_forcescore = good}
		case good
		change \{debug_forcescore = off}
		default
		change \{debug_forcescore = off}
	endswitch
	CrowdIncrease \{player_status = player1_status}
	toggle_forcescore_setprop
endscript

script toggle_forcescore_setprop 
	switch $debug_forcescore
		case off
		toggle_forcescore_menuitem :setprops \{text = 'Force Score : off'}
		case poor
		toggle_forcescore_menuitem :setprops \{text = 'Force Score : poor'}
		case medium
		toggle_forcescore_menuitem :setprops \{text = 'Force Score : medium'}
		case good
		toggle_forcescore_menuitem :setprops \{text = 'Force Score : good'}
		default
		toggle_forcescore_menuitem :setprops \{text = 'Force Score : off'}
	endswitch
endscript
debug_animdebug = 'none'

script toggle_animdebug 
	ui_menu_select_sfx
	switch $debug_animdebug
		case 'none'
		change \{debug_animdebug = 'drummer'}
		case 'drummer'
		change \{debug_animdebug = 'guitarist'}
		case 'guitarist'
		change \{debug_animdebug = 'bassist'}
		case 'bassist'
		change \{debug_animdebug = 'rhythm'}
		case 'rhythm'
		change \{debug_animdebug = 'vocalist'}
		case 'vocalist'
		change \{debug_animdebug = 'crowd'}
		case 'crowd'
		change \{debug_animdebug = 'none'}
		default
		change \{debug_animdebug = 'none'}
	endswitch
	y = 0
	begin
	PrintDebugText x = 0 y = <y> str = '                                                                                '
	<y> = (<y> + 1)
	repeat 6
	toggle_animdebug_setprop
endscript

script toggle_animdebug_setprop 
	switch $debug_animdebug
		case 'none'
		toggle_animdebug_menuitem :setprops \{text = 'Anim Debug : Off'}
		case 'drummer'
		toggle_animdebug_menuitem :setprops \{text = 'Anim Debug : Drummer'}
		case 'guitarist'
		toggle_animdebug_menuitem :setprops \{text = 'Anim Debug : Guitarist'}
		case 'bassist'
		toggle_animdebug_menuitem :setprops \{text = 'Anim Debug : Bassist'}
		case 'rhythm'
		toggle_animdebug_menuitem :setprops \{text = 'Anim Debug : Rhythm Bassist'}
		case 'vocalist'
		toggle_animdebug_menuitem :setprops \{text = 'Anim Debug : Vocalist'}
		case 'crowd'
		toggle_animdebug_menuitem :setprops \{text = 'Anim Debug : Crowd'}
		default
		toggle_animdebug_menuitem :setprops \{text = 'Anim Debug : Off'}
	endswitch
endscript

script create_changevenue_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = changevenue_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = changevenue_scrolling_menu
		id = changevenue_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_settings_menu
				}
			}
		]}
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	CreateScreenElement {
		type = textelement
		parent = changevenue_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = ($LevelZones.<level_checksum>.title)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose select_venue params = {level = <level_checksum> norestart}}
		]
	}
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = changevenue_vmenu}
endscript

script back_to_changevenue_menu 
	create_changevenue_menu
endscript

script destroy_changevenue_menu 
	if ScreenElementExists \{id = changevenue_scrolling_menu}
		DestroyScreenElement \{id = changevenue_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_venue 
	ui_menu_select_sfx
	kill_gem_scroller
	ResetWaypoints
	if GotParam \{level}
		change current_level = <level>
	endif
	SetPakManCurrentBlock \{map = zones
		pak = none
		block_scripts = 1}
	ChangeNodeFlag \{LS_3_5_PRE
		1}
	ChangeNodeFlag \{LS_3_5_POST
		0}
	ChangeNodeFlag \{LS_ENCORE_PRE
		1}
	ChangeNodeFlag \{LS_ENCORE_POST
		0}
	DestroyPakManMap \{map = zones}
	MemPushContext \{heap_zones}
	CreatePakManMap \{map = zones
		links = GH3Zones
		folder = 'zones/'
		uselinkslots}
	MemPopContext
	Load_Venue \{block_scripts = 1}
	setup_bg_viewport
	restore_dummy_bg_camera
	disable_bg_viewport_properties
	create_movie_viewport
	if ($current_level = load_z_testlevel_peds)
		spawnscriptnow \{testlevel_debug}
	else
		if NOT create_band
			DownloadContentLost
		endif
		create_crowd_models
		crowd_reset \{player_status = player1_status
			player = 1}
	endif
	enable_pause
	restore_start_key_binding
	if NOT GotParam \{norestart}
		gh3_start_pressed
		restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($current_starttime) device_num = <device_num>
	else
		ToggleViewMode \{viewerreload}
		ToggleViewMode \{viewerreload}
	endif
endscript

script testlevel_debug 
	begin
	if ControllerMake \{circle
			0}
		next_peds
	endif
	if ControllerMake \{circle
			1}
		next_peds
	endif
	WaitOneGameFrame
	repeat
endscript
debug_ped_row = 0

script next_peds 
	kill \{prefix = Z_TestLevel_Peds_Row0}
	kill \{prefix = Z_TestLevel_Peds_Row1}
	kill \{prefix = Z_TestLevel_Peds_Row2}
	kill \{prefix = Z_TestLevel_Peds_Row3}
	kill \{prefix = Z_TestLevel_Peds_Row4}
	kill \{prefix = Z_TestLevel_Peds_Row5}
	kill \{prefix = Z_TestLevel_Peds_Row6}
	kill \{prefix = Z_TestLevel_Peds_Row7}
	WaitOneGameFrame
	begin
	change debug_ped_row = ($debug_ped_row + 1)
	FormatText checksumname = row 'Z_TestLevel_Peds_row%r' r = ($debug_ped_row)
	create prefix = <row>
	if IsAlive prefix = <row>
		break
	else
		change \{debug_ped_row = -1}
	endif
	repeat
endscript

script back_to_changehighway_menu 
	create_changehighway_menu
endscript

script destroy_changehighway_menu 
	if ScreenElementExists \{id = changehighway_scrolling_menu}
		DestroyScreenElement \{id = changehighway_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changeguitar_menu \{type = guitar}
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = changeguitar_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = changeguitar_scrolling_menu
		id = changeguitar_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_settings_menu
				}
			}
		]}
	get_musician_instrument_size
	array_count = 0
	begin
	get_musician_instrument_struct index = <array_count>
	if (<type> = (<info_struct>.type))

		CreateScreenElement {
			type = textelement
			parent = changeguitar_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = (<info_struct>.name)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_guitar params = {guitar = <array_count> type = <type>}}
			]
		}
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = changeguitar_vmenu}
endscript

script back_to_changeguitar_menu 
	create_changeguitar_menu
endscript

script destroy_changeguitar_menu 
	if ScreenElementExists \{id = changeguitar_scrolling_menu}
		DestroyScreenElement \{id = changeguitar_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_guitar \{type = guitar}
	ui_menu_select_sfx
	kill_gem_scroller
	if (<type> = guitar)
		get_musician_instrument_struct index = <guitar>
		change structurename = player1_status instrument_id = (<info_struct>.desc_id)
	else
		get_musician_instrument_struct index = <guitar>
		change current_bass_model = (<info_struct>.desc_id)
	endif
	select_start_song
endscript
HideByType_List = [
	'real_crowd'
	'stage'
	'scene_ped'
]
HideByType_Visible = [
	on
	on
	on
]

script create_togglevisibility_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = togglevisibility_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = togglevisibility_scrolling_menu
		id = togglevisibility_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_settings_menu
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = togglevisibility_vmenu
		id = toggle_bandvisible_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle band'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_bandvisible
			}
		]}
	toggle_bandvisible_setprop
	GetArraySize \{$HideByType_List}
	array_count = 0
	begin
	FormatText checksumname = type_checksum '%s' s = ($HideByType_List [<array_count>])
	FormatText checksumname = menuitem_checksum 'toggle_hidebytype_menuitem_%s' s = ($HideByType_List [<array_count>])
	CreateScreenElement {
		type = textelement
		parent = togglevisibility_vmenu
		id = <menuitem_checksum>
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = ''
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose toggle_hidebytype params = {type = type_checksum array_count = <array_count>}}
		]
	}
	array_count = (<array_count> + 1)
	repeat <array_size>
	toggle_hidebytype_setprop
	CreateScreenElement \{type = textelement
		parent = togglevisibility_vmenu
		id = toggle_highway_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle highway'
		z_priority = 100.0
		just = [
			left
			top
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_highway
			}
		]}
	toggle_highway_setprop
	LaunchEvent \{type = focus
		target = togglevisibility_vmenu}
endscript

script back_to_togglevisibility_menu 
	create_togglevisibility_menu
endscript

script destroy_togglevisibility_menu 
	if ScreenElementExists \{id = togglevisibility_scrolling_menu}
		DestroyScreenElement \{id = togglevisibility_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript
highwayvisible = on

script toggle_highway 
	ui_menu_select_sfx
	if ($highwayvisible = off)
		if ScreenElementExists \{id = gem_containerp1}
			DoScreenElementMorph \{id = gem_containerp1
				alpha = 1}
		endif
		if ScreenElementExists \{id = gem_containerp2}
			DoScreenElementMorph \{id = gem_containerp2
				alpha = 1}
		endif
		enable_highway_prepass
		change \{highwayvisible = on}
	else
		if ScreenElementExists \{id = gem_containerp1}
			DoScreenElementMorph \{id = gem_containerp1
				alpha = 0}
		endif
		if ScreenElementExists \{id = gem_containerp2}
			DoScreenElementMorph \{id = gem_containerp2
				alpha = 0}
		endif
		disable_highway_prepass
		change \{highwayvisible = off}
	endif
	toggle_highway_setprop
endscript

script toggle_highway_setprop 
	if ($highwayvisible = off)
		toggle_highway_menuitem :setprops \{text = 'Toggle highway : off'}
	else
		toggle_highway_menuitem :setprops \{text = 'Toggle highway : on'}
	endif
endscript
bandvisible = on

script toggle_bandvisible 
	ui_menu_select_sfx
	if ($bandvisible = off)
		change \{bandvisible = on}
	else
		change \{bandvisible = off}
	endif
	set_bandvisible
	toggle_bandvisible_setprop
endscript

script set_bandvisible 
	if ($bandvisible = off)
		if CompositeObjectExists \{Guitarist}
			Guitarist :hide
		endif
		if CompositeObjectExists \{vocalist}
			vocalist :hide
		endif
		if CompositeObjectExists \{bassist}
			bassist :hide
		endif
		if CompositeObjectExists \{rhythm}
			rhythm :hide
		endif
		if CompositeObjectExists \{drummer}
			drummer :hide
		endif
	else
		if CompositeObjectExists \{Guitarist}
			Guitarist :unhide
		endif
		if CompositeObjectExists \{vocalist}
			vocalist :unhide
		endif
		if CompositeObjectExists \{bassist}
			bassist :unhide
		endif
		if CompositeObjectExists \{rhythm}
			rhythm :unhide
		endif
		if CompositeObjectExists \{drummer}
			drummer :unhide
		endif
	endif
endscript

script toggle_bandvisible_setprop 
	if ($bandvisible = off)
		toggle_bandvisible_menuitem :setprops \{text = 'Toggle band : off'}
	else
		toggle_bandvisible_menuitem :setprops \{text = 'Toggle band : on'}
	endif
endscript

script toggle_hidebytype 
	ui_menu_select_sfx
	if (($HideByType_Visible [<array_count>]) = off)
		SetArrayElement arrayname = HideByType_Visible globalarray index = <array_count> newvalue = on
	else
		SetArrayElement arrayname = HideByType_Visible globalarray index = <array_count> newvalue = off
	endif
	set_hidebytype
	toggle_hidebytype_setprop
endscript

script set_hidebytype 
	GetArraySize \{$HideByType_List}
	array_count = 0
	begin
	FormatText checksumname = type_checksum '%s' s = ($HideByType_List [<array_count>])
	if (($HideByType_Visible [<array_count>]) = off)
		HideObjectByType type = <type_checksum>
	else
		HideObjectByType type = <type_checksum> unhide
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script toggle_hidebytype_setprop 
	GetArraySize \{$HideByType_List}
	array_count = 0
	begin
	if (($HideByType_Visible [<array_count>]) = off)
		FormatText textname = menutext 'Toggle %s : off' s = ($HideByType_List [<array_count>])
	else
		FormatText textname = menutext 'Toggle %s : on' s = ($HideByType_List [<array_count>])
	endif
	FormatText checksumname = menuitem_checksum 'toggle_hidebytype_menuitem_%s' s = ($HideByType_List [<array_count>])
	<menuitem_checksum> :setprops text = <menutext>
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script create_skipintosong_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = skipintosong_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (20.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = skipintosong_scrolling_menu
		id = skipintosong_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = skipintosong_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Skip By Time'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbytime_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = skipintosong_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Skip By Marker'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbymarker_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = skipintosong_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Skip By Measure'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbymeasure_menu
			}
		]}
	CreateScreenElement \{type = textelement
		parent = skipintosong_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Set Loop Point'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_looppoint_menu
			}
		]}
	LaunchEvent \{type = focus
		target = skipintosong_vmenu}
endscript

script back_to_skipintosong_menu 
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	create_skipintosong_menu
endscript

script destroy_skipintosong_menu 
	if ScreenElementExists \{id = skipintosong_scrolling_menu}
		DestroyScreenElement \{id = skipintosong_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbytime_menu 
	ui_menu_select_sfx
	if GotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = skipbytime_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement {
		type = vmenu
		parent = skipbytime_scrolling_menu
		id = skipbytime_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if GotParam \{looppoint}
		menu_func = set_looppoint
		CreateScreenElement {
			type = textelement
			parent = skipbytime_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = 'No Loop Point'
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> params = {starttime = -1000000}}
			]
		}
	endif
	get_song_prefix song = ($current_song)
	FormatText checksumname = fretbar_array '%s_fretbars' s = <song_prefix> addtostringlookup
	GetArraySize $<fretbar_array>
	max_time = (($<fretbar_array> [(<array_size> - 1)]) / 1000)
	current_time = 0
	begin
	FormatText textname = menu_itemname 'Time %ss' s = <current_time>
	if (<current_time> < <max_time>)
		CreateScreenElement {
			type = textelement
			parent = skipbytime_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = <menu_itemname>
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> params = {song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = (<current_time> * 1000)}}
			]
		}
	else
		break
	endif
	current_time = (<current_time> + 5)
	repeat
	LaunchEvent \{type = focus
		target = skipbytime_vmenu}
endscript

script back_to_skipbytime_menu 
	create_skipbytime_menu
endscript

script destroy_skipbytime_menu 
	if ScreenElementExists \{id = skipbytime_scrolling_menu}
		DestroyScreenElement \{id = skipbytime_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbymarker_menu 
	ui_menu_select_sfx
	if GotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = skipbymarker_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		pos = ($menu_pos + (30.0, 0.0))
	}
	CreateScreenElement {
		type = vmenu
		parent = skipbymarker_scrolling_menu
		id = skipbymarker_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if GotParam \{looppoint}
		menu_func = set_looppoint
		CreateScreenElement {
			type = textelement
			parent = skipbymarker_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = 'No Loop Point'
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> params = {starttime = -1000000}}
			]
		}
	endif
	get_song_prefix song = ($current_song)
	FormatText checksumname = marker_array '%s_markers' s = <song_prefix>
	GetMarkerArraySize array = (<marker_array>)
	if (<array_size> = 0)
		CreateScreenElement {
			type = textelement
			parent = skipbymarker_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = 'start'
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> params = {song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = -1000000}}
			]
		}
	else
		marker_count = 0
		begin
		FormatText textname = menu_itemname '%m (%ss)' m = ($<marker_array> [<marker_count>].marker) s = (($<marker_array> [<marker_count>].time) / 1000)
		CreateScreenElement {
			type = textelement
			parent = skipbymarker_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = <menu_itemname>
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose restart_gem_scroller params = {song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($<marker_array> [<marker_count>].time) startmarker = <marker_count>}}
			]
		}
		marker_count = (<marker_count> + 1)
		repeat <array_size>
	endif
	LaunchEvent \{type = focus
		target = skipbymarker_vmenu}
endscript

script back_to_skipbymarker_menu 
	create_skipbymarker_menu
endscript

script destroy_skipbymarker_menu 
	if ScreenElementExists \{id = skipbymarker_scrolling_menu}
		DestroyScreenElement \{id = skipbymarker_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbymeasure_menu 
	ui_menu_select_sfx
	if GotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = skipbymeasure_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		pos = ($menu_pos + (-30.0, 0.0))
	}
	CreateScreenElement {
		type = vmenu
		parent = skipbymeasure_scrolling_menu
		id = skipbymeasure_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if GotParam \{looppoint}
		menu_func = set_looppoint
		CreateScreenElement {
			type = textelement
			parent = skipbymeasure_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = 'No Loop Point'
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> params = {starttime = -1000000}}
			]
		}
	endif
	get_song_prefix song = ($current_song)
	FormatText checksumname = fretbar_array '%s_fretbars' s = <song_prefix> addtostringlookup
	FormatText checksumname = timesig '%s_timesig' s = <song_prefix> addtostringlookup
	GetArraySize $<timesig>
	timesig_entry = 0
	timesig_size = <array_size>
	timesig_num = 0
	measure_count = 0
	GetArraySize $<fretbar_array>
	array_entry = 0
	fretbar_count = 0
	begin
	if (<timesig_entry> < <timesig_size>)
		if ($<timesig> [<timesig_entry>] [0] <= $<fretbar_array> [<array_entry>])
			<timesig_num> = ($<timesig> [<timesig_entry>] [1])
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	if (<measure_count> > 150)
		measures_per_menuitem = 2
	else
		measures_per_menuitem = 1
	endif
	timesig_entry = 0
	measure_count = 0
	array_entry = 0
	fretbar_count = 0
	measures_per_menuitem_count = 0
	begin
	if (<timesig_entry> < <timesig_size>)
		if ($<timesig> [<timesig_entry>] [0] <= $<fretbar_array> [<array_entry>])
			<timesig_num> = ($<timesig> [<timesig_entry>] [1])
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	if (<fretbar_count> = 0)
		measures_per_menuitem_count = (<measures_per_menuitem_count> + 1)
		if (<measures_per_menuitem_count> = <measures_per_menuitem>)
			time = ($<fretbar_array> [(<array_entry>)])
			FormatText textname = menu_itemname 'Measure %m (%ss)' s = (<time> / 1000.0) m = <measure_count>

			CreateScreenElement {
				type = textelement
				parent = skipbymeasure_vmenu
				font = text_a1
				scale = 0.75
				rgba = [210 210 210 250]
				text = <menu_itemname>
				just = [left top]
				z_priority = 100.0
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose <menu_func> params = {song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = <time>}}
				]
			}
			measures_per_menuitem_count = 0
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = skipbymeasure_vmenu}
endscript

script back_to_skipbymeasure_menu 
	create_skipbymeasure_menu
endscript

script destroy_skipbymeasure_menu 
	if ScreenElementExists \{id = skipbymeasure_scrolling_menu}
		DestroyScreenElement \{id = skipbymeasure_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_looppoint_menu 
	ui_menu_select_sfx
	destroy_skipintosong_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = looppoint_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (20.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = looppoint_scrolling_menu
		id = looppoint_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_skipintosong_menu
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = looppoint_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Loop By Time'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbytime_menu
				params = {
					looppoint
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = looppoint_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Loop By Marker'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbymarker_menu
				params = {
					looppoint
				}
			}
		]}
	CreateScreenElement \{type = textelement
		parent = looppoint_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Loop By Measure'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbymeasure_menu
				params = {
					looppoint
				}
			}
		]}
	LaunchEvent \{type = focus
		target = looppoint_vmenu}
endscript

script back_to_looppoint_menu 
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	create_looppoint_menu
endscript

script destroy_looppoint_menu 
	if ScreenElementExists \{id = looppoint_scrolling_menu}
		DestroyScreenElement \{id = looppoint_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script set_looppoint 
	ui_menu_select_sfx
	change current_looppoint = <starttime>
	gh3_start_pressed
endscript

script create_replay_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	x_pos = 450
	CreateScreenElement \{type = vscrollingmenu
		parent = Pause_Menu
		id = replay_scrolling_menu
		just = [
			left
			top
		]
		dims = (400.0, 250.0)
		pos = (450.0, 120.0)}
	CreateScreenElement \{type = vmenu
		parent = replay_scrolling_menu
		id = replay_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	StartWildcardSearch \{wildcard = 'buffers\\*.rep'}
	index = 0
	begin
	if NOT GetWildcardFile
		break
	endif
	CreateScreenElement {
		type = textelement
		parent = replay_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = <basename>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose restart_gem_scroller params = {replay = <filename> song_name = 'blah' difficulty = 'blah' difficulty2 = 'blah'}}
		]
	}
	<index> = (<index> + 1)
	repeat
	EndWildcardSearch
	LaunchEvent \{type = focus
		target = replay_vmenu}
endscript

script destroy_replay_menu 
	if ScreenElementExists \{id = replay_scrolling_menu}
		DestroyScreenElement \{id = replay_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_start_song 
	change \{current_transition = debugintro}
	SpawnScriptLater start_song params = <...>
	switch ($game_mode)
		case p1_career
		ui_flow_manager_respond_to_action \{action = set_p1_career}
		case p1_quickplay
		ui_flow_manager_respond_to_action \{action = set_p1_quickplay}
		case p2_quickplay
		ui_flow_manager_respond_to_action \{action = set_p2_quickplay}
		case p2_faceoff
		case p2_battle
		case p2_pro_faceoff
		ui_flow_manager_respond_to_action \{action = set_p2_general}
		case training
		ui_flow_manager_respond_to_action \{action = set_p1_training}
	endswitch
	destroy_all_debug_menus
endscript

script ui_menu_scroll_sfx 
	SoundEvent \{event = ui_sfx_scroll}
	SoundEvent \{event = ui_sfx_scroll_add}
endscript

script ui_menu_select_sfx 
	SoundEvent \{event = ui_sfx_select}
endscript

script menu_focus 
	gettags
	SetScreenElementProps id = <id> rgba = [210 130 0 250]
endscript

script menu_unfocus 
	gettags
	SetScreenElementProps id = <id> rgba = [210 210 210 250]
endscript
debug_menu_mode = 1

script switch_to_retail_menu 
	destroy_all_debug_menus
	change debug_menu_mode = (0)
	start_flow_manager
endscript

script switch_to_debug_menu 
	shut_down_flow_manager
	change debug_menu_mode = (1)
	destroy_all_debug_menus
	create_debugging_menu
endscript

script back_to_retail_ui_flow 
	destroy_debugging_menu
	ui_flow_manager_respond_to_action \{action = go_back}
	enable_pause
endscript

script toggle_global 
	if GotParam \{global_toggle}
		if ($<global_toggle> = 1)
			change globalname = <global_toggle> newvalue = 0
		else
			change globalname = <global_toggle> newvalue = 1
		endif
	endif
endscript
lightshow_enabled = 1

script toggle_lightshow 
	if ($lightshow_enabled = 0)
		change \{lightshow_enabled = 1}
		LightShow_SetActive \{active = true}
	else
		change \{lightshow_enabled = 0}
		LightShow_SetActive \{active = false}
	endif
	toggle_lightshow_setprop
endscript

script get_lightshow_state 
	return \{enabled = $lightshow_enabled}
endscript

script toggle_lightshow_setprop 
	if (($lightshow_enabled) = 0)
		toggle_lightshow_menuitem :setprops \{text = 'Toggle Lightshow: Off'}
	else
		toggle_lightshow_menuitem :setprops \{text = 'Toggle Lightshow: On'}
	endif
endscript
fsfx_enabled = 1

script toggle_fsfx 
	if ($fsfx_enabled = 0)
		change \{fsfx_enabled = 1}
	else
		change \{fsfx_enabled = 0}
	endif
	toggle_fsfx_setprop
endscript

script get_fsfx_state 
	return \{enabled = $fsfx_enabled}
endscript

script toggle_fsfx_setprop 
	if (($fsfx_enabled) = 0)
		toggle_fsfx_menuitem :setprops \{text = 'Toggle Full Screen FX: Off'}
	else
		toggle_fsfx_menuitem :setprops \{text = 'Toggle Full Screen FX: On'}
	endif
endscript

script toggle_half_animation 
	if ($half_animation_enabled = 0)
		change \{half_animation_enabled = 1}
		SetHalfAnimationState \{enabled = 1}
	else
		change \{half_animation_enabled = 0}
		SetHalfAnimationState \{enabled = 0}
	endif
	toggle_half_animation_setprop
endscript

script toggle_half_animation_setprop 
	if (($half_animation_enabled) = 0)
		toggle_half_animation_menuitem :setprops \{text = 'Toggle 30fps Animations: Off'}
	else
		toggle_half_animation_menuitem :setprops \{text = 'Toggle 30fps Animations: On'}
	endif
endscript

script enable_half_animations 
	change \{half_animation_enabled = 1}
	SetHalfAnimationState \{enabled = 1}
endscript

script disable_half_animations 
	change \{half_animation_enabled = 0}
	SetHalfAnimationState \{enabled = 0}
endscript

script check_front_end_animations 
	switch <flow_state>
		case career_select_character_fs
		case career_character_hub_fs
		case career_select_outfit_fs
		case career_select_guitar_fs
		case career_select_guitar_finish_fs
		case career_select_style_fs
		case coop_career_character_select_fs
		case coop_career_character_hub_fs
		case coop_career_split_off_flow_for_character_hub_fs
		case coop_career_split_off_flow_for_character_select_fs
		case coop_career_select_guitar
		case coop_career_select_guitar_finish_fs
		case coop_career_select_outfit_fs
		case coop_career_select_style_f
		case mp_faceoff_character_hub_fs
		case mp_faceoff_character_select_fs
		case mp_faceoff_select_guitar
		case mp_faceoff_select_bass_fs
		case mp_faceoff_select_guitar_finish_fs
		case mp_faceoff_select_guitar_fs
		case mp_faceoff_select_outfit_fs
		case mp_faceoff_select_style_fs
		case mp_faceoff_split_off_flow_for_character_hub_fs
		case mp_faceoff_split_off_flow_for_character_select_fs
		case online_character_hub_fs
		case online_character_select_fs
		case online_select_guitar_fs
		case online_select_bass_fs
		case online_select_guitar_finish_fs
		case online_select_outfit_fs
		case online_select_style_fs
		case store_characters_fs
		case store_outfits_fs
		case store_styles_fs
		case store_fs
		disable_half_animations
		default
		enable_half_animations
	endswitch
endscript

script create_photobot_debug_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		type = vscrollingmenu
		parent = Pause_Menu
		id = photobot_debug_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{type = vmenu
		parent = photobot_debug_menu
		id = photobot_debug_vmenu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	array_entry = 0
	array_size = 6
	begin
	get_LevelZoneArray_checksum index = <array_entry>
	FormatText textname = opt_text1 '1st Half at %v' v = ($LevelZones.<level_checksum>.title)
	FormatText textname = opt_text2 '2nd Half at %v' v = ($LevelZones.<level_checksum>.title)
	CreateScreenElement {
		type = textelement
		parent = photobot_debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		text = <opt_text1>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose photobot_startup params = {venue = <array_entry> section = 0}}
		]
	}
	CreateScreenElement {
		type = textelement
		parent = photobot_debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		text = <opt_text2>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose photobot_startup params = {venue = <array_entry> section = 1}}
		]
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	LaunchEvent \{type = focus
		target = photobot_debug_vmenu}
endscript

script destroy_photobot_debug_menu 
	if ScreenElementExists \{id = photobot_debug_menu}
		DestroyScreenElement \{id = photobot_debug_menu}
	endif
	destroy_generic_backdrop
endscript
