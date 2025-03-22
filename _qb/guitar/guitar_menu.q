dx_menu_autosave_fs = {
	Create = dx_memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = main_menu_fs
			transition_left
		}
		{
			action = memcard_sequence_save_failed
			flow_state = main_menu_fs
			transition_left
		}
	]
}

main_menu_fs = {
	Create = create_main_menu
	Destroy = destroy_main_menu
	actions = [
		{
			action = select_career
			flow_state_func = main_menu_career_flow_state_func
			transition_right
		}
		{
			action = select_coop_career
			flow_state = coop_career_select_controllers_fs
			transition_right
		}
		{
			action = select_quickplay
			flow_state = quickplay_select_difficulty_fs
			transition_right
		}
		{
			action = select_multiplayer
			flow_state = mp_select_controller_fs
			transition_right
		}
		{
			action = select_xbox_live
			flow_state = online_signin_fs
		}
		{
			action = select_winport_online
			flow_state = online_winport_start_connection_fs
		}
		{
			action = select_options
			flow_state = options_select_option_fs
			transition_right
		}
		{
			action = select_training
			flow_state = practice_select_mode_fs
			transition_right
		}
		{
			action = select_debug_menu
			flow_state = debug_menu_fs
		}
		{
			action = select_custom_menu
			flow_state = custom_menu_fs
			transition_right
		}
		{
			action = online_enabled
			flow_state_func = 0xf6ee2c5e
		}
		{
			action = 0x653f903a
			flow_state = enter_profile_name_fs
		}
		{
			action = enter_attract_mode
			flow_state = main_menu_attract_mode_fs
		}
		{
			action = select_winport_exit
			flow_state = winport_confirm_exit_fs
			transition_left
		}
	]
}

main_menu_tip_pos_initial = (975.0, 50.0)
main_menu_tip_pos_new = (975.0, 30.0)
main_menu_tip_angle_initial = 10
main_menu_tip_angle_new = 5
main_menu_tip_scale_initial = 0.50
main_menu_tip_scale_new = 0.4
main_menu_tip_animate_time = 1
main_menu_tip_rgba = [190 225 255 250]
main_menu_text_update_speed = 10
main_menu_deluxe_text_dims = (500.0, 200.0)
main_menu_deluxe_text_pos = (870.0, 240.0)
main_menu_deluxe_text_shadow_rgba = [0 0 0 255]

menu_tips = [
	"New and improved!"
	"NeverHax welcomes you!"
	"Also try Green Day Rock Band Redux!"
	"Now With Blast Processing!"
	"Arby's, we have The Meats!"
	"THIS IS GUITAR HERO AEROSMITH!"
	"Nobody cares about modding Guitar Hero 3!"
	"Up Up Down Down Left Right Left Right B A Start!"
	"I'm not even supposed to BE here!"
	"DELXUE!"
	"AM I A GUITAR? YOU ARE A GUITAR!"
	"Not your momma's Rock Band!"
	"PS3 has no games!"
	"Brought to you by the NeverHax weirdos!"
	"Don't eat the gems. Seriously."
	"Trans rights are human rights!"
	"0BOY0BOY"
	"if u dont fuck with the gays dont play our game"
	"No! I'm with the science team!"
	"One of the games of all time!"
	"Go Play A Real Instrument Already!"
	"you're telling me a guitar hero aerosmith'd this deluxe?"
	"It's like GH3DX, plus Aerosmith!"
	"removing guitar..."
	"neverhax bad!"
	"No More 40MB SecuROM Soon(TM)!"
	"Nylon! Maybe"
	"\\b4 \\b5 \\b6 \\b7 \\b8"
	"Yet Another Deluxe Mod"
	"If it ain't broke, don't fix it... this was kind of broke..."
	"If you eat a gem he will find you..."
	"Is the strikeline... speakers?! WHAT ARE THEY?!"
	"I got 99 problems and GHADX ain't one!"
	"insert GHAPC is bad joke here"
	"Tommy Tallarico is a fraudster!"
	"Hold down a fret, wait 3-5 business days... wait I missed?"
	"Look, we made a guitar game from a skate game!"
	"Powered by Tony Hawk!"
	"aerosmith"
	"LESS GOOOOOOOO"
	"Open source!"
	"Fat free!"
	"We love SecuROM!"
	"Now With Denuvo Anti-Cheat!"
	"Infinite frontend never existed. You're all insane."
	"Hatsune Miku Isn't In This One."
	"Oops, all Joe Perry"
	"thats cool but have you tried playing real guitar"
	"patches.q - Do Not Use!"
	"lysix.q - Do Not Use!"
	"Random splash!"
	"PLACEHOLDER"
	"Charlotte was here!"
	"Lysix was here!"
	"Luna was here!"
	"Metric was here!"
	"Evelyn was here!"
]

platform_specific_text = "None"

script get_platform_specific_text 
	GetPlatform
	switch (<Platform>)
		case NGC
			Change platform_specific_text = "Invalid write to 0x00000004, PC = 0x80412538"
		case XENON
			Change platform_specific_text = "Fatal crash intercepted!"
		case PS3 
			Change platform_specific_text = "Access violation reading unmapped memory!"
		case PS2 
			Change platform_specific_text = "Access violation reading unmapped memory!"
	endswitch
	if IsWinPort
		Change platform_specific_text = "Job 1, 'GH3.exe' terminated by signal SIGSEGV (Address boundary error)"
	elseif IsMacPort
		Change platform_specific_text = "Job 1, 'GH3.app' terminated by signal SIGSEGV (Address boundary error)"
	endif
	AddArrayElement Array = ($menu_tips) Element = ($platform_specific_text)
	Change menu_tips = <array>
endscript

script menu_text_hover 
	if NOT ScreenElementExists \{Id = main_menu_tip}
		return
	endif
	begin
	main_menu_tip :DoMorph \{Pos = $main_menu_tip_pos_initial
		Time = $main_menu_tip_animate_time
		Rot_Angle = $main_menu_tip_angle_initial
		Scale = $menu_tip_scale_initial
		Motion = ease_out}
	main_menu_tip :DoMorph \{Pos = $main_menu_tip_pos_new
		Time = $main_menu_tip_animate_time
		Rot_Angle = $main_menu_tip_angle_new
		Scale = $menu_tip_scale_new
		Motion = ease_in}
	main_menu_tip :DoMorph \{Pos = $main_menu_tip_pos_initial
		Time = $main_menu_tip_animate_time
		Rot_Angle = $main_menu_tip_angle_initial
		Scale = $main_menu_tip_scale_initial
		Motion = ease_out}
	main_menu_tip :DoMorph \{Pos = $main_menu_tip_pos_new
		Time = $main_menu_tip_animate_time
		Rot_Angle = $main_menu_tip_angle_new
		Scale = $main_menu_tip_scale_new
		Motion = ease_in}
	repeat
endscript

script menu_text_get_string 
	begin
	GetArraySize ($menu_tips)
	GetRandomValue Name = menu_rand_num A = 0 B = (<array_Size> - 1) Integer
	rand_menu_tip = ($menu_tips [<menu_rand_num>])
	main_menu_tip :SetProps Text = <rand_menu_tip>
	Wait \{$main_menu_text_update_speed
	seconds}
	repeat
endscript

script load_dx_settings
	GetGlobalTags \{user_options}
	Change GlobalName = Cheat_HyperSpeed NewValue = <Cheat_HyperSpeed>
	if (<black_highway> = 1)
		Change highway_normal = [0 0 0 255]
		Change highway_starpower = [0 0 0 255]
	endif
	if (<transparent_highway> > 0)
		set_transparent_highway
	endif
	if (<song_title> = 1)
		Change intro_sequence_props = $dx_intro_sequence_props
		Change fastintro_sequence_props = $dx_fastintro_sequence_props
		Change practice_sequence_props = $dx_practice_sequence_props
		Change immediate_sequence_props = $dx_immediate_sequence_props
	endif
	if (<nopostproc> = 1)
		dx_set_postproc {Action = Disable}
	endif
	if (<dx_large_gems> = 1)
		Change gem_start_scale1 = ($gem_start_scale1_normal * $dx_large_gem_scale)
		Change gem_end_scale1 = ($gem_end_scale1_normal * $dx_large_gem_scale)
		Change gem_start_scale2 = ($gem_start_scale2_normal * $dx_large_gem_scale)
		Change gem_end_scale2 = ($gem_end_scale2_normal * $dx_large_gem_scale)
		Change whammy_top_width1 = ($whammy_top_width1_normal * $dx_large_gem_scale)
		Change whammy_top_width2 = ($whammy_top_width2_normal * $dx_large_gem_scale)
	endif
	GetGlobalTags $0xaebf2394 noassert = 1
	if (<ondisp_dispfps_text> = 1)
		enable_dispfps
	endif
endscript

script create_main_menu
	load_dx_settings
	set_home_button_allowed

	resetscoreupdateready
	GetGlobalTags \{user_options}
	menu_audio_settings_update_guitar_volume vol = <guitar_volume>
	menu_audio_settings_update_band_volume vol = <band_volume>
	menu_audio_settings_update_sfx_volume vol = <sfx_volume>
	setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)}}
	if ($main_menu_movie_first_time = 0)
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = 900}
	endif
	create_main_menu_backdrop
	if ($main_menu_movie_first_time = 0 && $invite_controller = -1)
		Change \{main_menu_movie_first_time = 1}
		fadetoblack \{OFF
			time = 0}
	endif
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	kill_start_key_binding
	UnPauseGame
	Change \{current_num_players = 1}
	Change structurename = player1_status controller = ($primary_controller)
	Change \{player_controls_valid = 0}
	disable_pause
	SpawnScriptNow \{menu_music_on}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	DeRegisterAtoms
	RegisterAtoms \{Name = achievement
		$Achievement_Atoms}
	Change \{setlist_previous_tier = 1}
	Change \{setlist_previous_song = 0}
	Change \{setlist_previous_tab = tab_setlist}
	Change \{current_song = beyondbeautiful}
	Change \{end_credits = 0}
	Change \{battle_sudden_death = 0}
	Change \{structurename = player1_status
		character_id = Axel}
	Change \{structurename = player2_status
		character_id = Axel}
	safe_create_gh3_pause_menu
	new_menu {
		scrollid = main_menu_scrolling_menu
		vmenuid = vmenu_main_menu
		use_backdrop = 0
		menu_pos = ($g_mm_base_menu_pos)
		focus_color = dk_violet_red
		unfocus_color = md_violet_grey
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	Change \{rich_presence_context = presence_main_menu}
	<text_x_scale> = 0.8
	<text_y_scale> = 1.0
	text_params = {
		Type = TextElement
		font = text_a5
		Scale = ((<text_x_scale> * (1.0, 0.0)) + (<text_y_scale> * (0.0, 1.0)))
		rgba = (($g_menu_colors).md_violet_grey)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).Block)
		z_priority = 60
	}
	<menu_offset> = (0.0, 45.0)
	<hlbar_dims> = (240.0, 45.0)
	<be_dims> = (32.0, 46.0)
	<bel_pos> = ((((<hlbar_dims>.(-1.0, 0.0)) / 2) * (1.0, 0.0)) + (-16.0, 0.0))
	<ber_pos> = ((((<hlbar_dims>.(1.0, 0.0)) / 2) * (1.0, 0.0)) + (16.0, 0.0))
	mm_hilite_color = (($g_menu_colors).lt_plum)
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_career
		parent = vmenu_main_menu
		event_handlers = [
			{
				focus
				main_menu_highlight
				params = {
					option = 'career'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				params = {
					option = 'career'
				}
			}
			{
				pad_choose
				main_menu_select_career
			}
		]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_career
		id = main_menu_career_text
		text = "CAREER"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_career_hl
		Pos = (0.0, -8.0)
		parent = main_menu_career
		alpha = 0}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_career_hlbar
		parent = main_menu_career_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_career_bel
		parent = main_menu_career_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_career_ber
		parent = main_menu_career_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_career_hl
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_quickplay
		parent = vmenu_main_menu
		event_handlers = [
			{
				focus
				main_menu_highlight
				params = {
					option = 'quickplay'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				params = {
					option = 'quickplay'
				}
			}
			{
				pad_choose
				main_menu_select_quickplay
			}
		]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_quickplay
		id = main_menu_quickplay_text
		Pos = (<menu_offset>)
		text = "QUICKPLAY"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_quickplay_hl
		parent = main_menu_career
		Pos = (<menu_offset> + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_quickplay_hlbar
		parent = main_menu_quickplay_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_quickplay_bel
		parent = main_menu_quickplay_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_quickplay_ber
		parent = main_menu_quickplay_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_quickplay_hl
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_multiplayer
		parent = vmenu_main_menu
		event_handlers = [
			{
				focus
				main_menu_highlight
				params = {
					option = 'multiplayer'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				params = {
					option = 'multiplayer'
				}
			}
			{
				pad_choose
				main_menu_select_multiplayer
			}
		]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_multiplayer
		id = main_menu_multiplayer_text
		Pos = (<menu_offset> * 2)
		text = "MULTIPLAYER"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_multiplayer_hl
		parent = main_menu_career
		Pos = ((<menu_offset> * 2) + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_multiplayer_hlbar
		parent = main_menu_multiplayer_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_multiplayer_bel
		parent = main_menu_multiplayer_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_multiplayer_ber
		parent = main_menu_multiplayer_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_multiplayer_hl
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_training
		parent = vmenu_main_menu
		event_handlers = [
			{focus main_menu_highlight params = {option = 'training'}}
			{unfocus main_menu_unhighlight params = {option = 'training'}}
			{pad_choose main_menu_select_training}
		]
		<demo_mode_disable>
	}
	CreateScreenElement {
		<text_params>
		parent = main_menu_training
		id = main_menu_training_text
		Pos = (<menu_offset> * 3)
		text = "TRAINING"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_training_hl
		parent = main_menu_career
		Pos = ((<menu_offset> * 3) + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_training_hlbar
		parent = main_menu_training_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_training_bel
		parent = main_menu_training_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_training_ber
		parent = main_menu_training_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_training_hl
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_leaderboards
		parent = vmenu_main_menu
		event_handlers = [
			{focus main_menu_highlight params = {option = 'leaderboards'}}
			{unfocus main_menu_unhighlight params = {option = 'leaderboards'}}
			{pad_choose main_menu_select_xbox_live}
		]
		<demo_mode_disable>
	}
	if isXenon
		CreateScreenElement {
			<text_params>
			parent = main_menu_leaderboards
			id = main_menu_leaderboards_text
			Pos = (<menu_offset> * 4)
			text = "Xbox LIVE"
		}
	else
		CreateScreenElement {
			<text_params>
			parent = main_menu_leaderboards
			id = main_menu_leaderboards_text
			Pos = (<menu_offset> * 4)
			text = "ONLINE"
		}
	endif
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_leaderboards_hl
		parent = main_menu_career
		Pos = ((<menu_offset> * 4) + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_leaderboards_hlbar
		parent = main_menu_leaderboards_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_leaderboards_bel
		parent = main_menu_leaderboards_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_leaderboards_ber
		parent = main_menu_leaderboards_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_leaderboards_hl
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_options
		parent = vmenu_main_menu
		event_handlers = [
			{
				focus
				main_menu_highlight
				params = {
					option = 'options'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				params = {
					option = 'options'
				}
			}
			{
				pad_choose
				main_menu_select_options
			}
		]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_options
		id = main_menu_options_text
		Pos = (<menu_offset> * 5)
		text = "OPTIONS"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_options_hl
		parent = main_menu_career
		Pos = ((<menu_offset> * 5) + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_options_hlbar
		parent = main_menu_options_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_options_bel
		parent = main_menu_options_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_options_ber
		parent = main_menu_options_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_options_hl
		Scale = (1.0, 0.01)
		relative_scale}

	CreateScreenElement \{Type = ContainerElement
		id = main_menu_deluxe
		parent = vmenu_main_menu
		event_handlers = [
			{
				focus
				main_menu_highlight
				params = {
					option = 'deluxe'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				params = {
					option = 'deluxe'
				}
			}
			{
				pad_choose
				ui_flow_manager_respond_to_action
				params = {
					action = select_custom_menu
				}
			}
		]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_deluxe
		id = main_menu_deluxe_text
		Pos = (<menu_offset> * 6)
		text = "DELUXE SETTINGS"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_deluxe_hl
		parent = main_menu_career
		Pos = ((<menu_offset> * 6) + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_deluxe_hlbar
		parent = main_menu_deluxe_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_deluxe_bel
		parent = main_menu_deluxe_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_deluxe_ber
		parent = main_menu_deluxe_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_deluxe_hl
		Scale = (1.0, 0.01)
		relative_scale}

	if ($enable_button_cheats = 1)
		CreateScreenElement \{Type = ContainerElement
			id = main_menu_debug_menu
			parent = vmenu_main_menu
			event_handlers = [
				{
					focus
					main_menu_highlight
					params = {
						option = 'debug_menu'
					}
				}
				{
					unfocus
					main_menu_unhighlight
					params = {
						option = 'debug_menu'
					}
				}
				{
					pad_choose
					ui_flow_manager_respond_to_action
					params = {
						action = select_debug_menu
					}
				}
			]}
		CreateScreenElement {
			<text_params>
			Scale = (0.5, 0.5)
			parent = main_menu_debug_menu
			id = main_menu_debug_menu_text
			Pos = (<menu_offset> * 7)
			text = "DEBUG MENU"
		}
	endif
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	if NOT ($invite_controller = -1)
		Change \{invite_controller = -1}
		ui_flow_manager_respond_to_action \{action = select_xbox_live}
		fadetoblack \{OFF
			time = 0}
	else
		LaunchEvent \{Type = focus
			target = vmenu_main_menu}
	endif
endscript

script create_pause_menu \{Player = 1
		for_options = 0
		for_practice = 0}
	player_device = ($last_start_pressed_device)
	if ($player1_device = <player_device>)
		<Player> = 1
	else
		<Player> = 2
	endif
	if (<for_options> = 0)
		if ($view_mode)
			return
		endif
		enable_pause
		safe_create_gh3_pause_menu
	else
		kill_start_key_binding
		flame_handlers = [
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
			{pad_up generic_menu_up_or_down_sound Params = {UP}}
			{pad_down generic_menu_up_or_down_sound Params = {UP}}
		]
	endif
	Change \{bunny_flame_index = 1}
	pause_z = 10000
	Spacing = -65
	if (<for_options> = 0)
		Menu_pos = (730.0, 220.0)
		if (<for_practice> = 1)
			<Menu_pos> = (640.0, 190.0)
		endif
		<Spacing> = -65
	else
		<Spacing> = -55
		if IsGuitarController controller = <player_device>
			Menu_pos = (640.0, 225.0)
		else
			Menu_pos = (640.0, 250.0)
		endif
	endif
	new_menu {
		scrollid = scrolling_pause
		vmenuid = vmenu_pause
		Menu_pos = <Menu_pos>
		Rot_Angle = 2
		event_handlers = <flame_handlers>
		Spacing = <Spacing>
		use_backdrop = (0)
		exclusive_device = <player_device>
	}
	create_pause_menu_frame Z = (<pause_z> - 10)
	if ($is_network_game = 0)
		CreateScreenElement {
			Type = SpriteElement
			PARENT = pause_menu_frame_container
			texture = menu_pause_frame_banner
			Pos = (640.0, 540.0)
			just = [Center Center]
			z_priority = (<pause_z> + 100)
		}
		if GotParam \{banner_text}
			pause_player_text = <banner_text>
			if GotParam \{banner_scale}
				pause_player_scale = <banner_scale>
			else
				pause_player_scale = (1.0, 1.0)
			endif
		else
			if (<for_options> = 0)
				if (<for_practice> = 1)
					<pause_player_text> = 'PAUSED'
				else
					if NOT IsSinglePlayerGame
						FormatText TextName = pause_player_text 'P%d PAUSED' D = <Player>
					else
						<pause_player_text> = 'PAUSED'
					endif
				endif
				pause_player_scale = (0.75, 0.75)
			else
				pause_player_text = 'OPTIONS'
				pause_player_scale = (0.75, 0.75)
			endif
		endif
	endif

	pause_player_pos = (125.0, 47.0)
	if ((IsXenon) || (IsPS3))
		pause_player_pos = (125.0, 52.0)
	endif

	CreateScreenElement {
		Type = TextElement
		PARENT = <Id>
		Text = <pause_player_text>
		font = text_a6
		Pos = <pause_player_pos>
		Scale = <pause_player_scale>
		rgba = (($g_menu_colors).black)
		Scale = 0.8
	}
	text_scale = (0.9, 0.9)
	if (<for_options> = 0 && <for_practice> = 0 && $is_network_game = 0)
		CreateScreenElement {
			Type = ContainerElement
			PARENT = pause_menu_frame_container
			Id = bunny_container
			Pos = (380.0, 170.0)
			just = [LEFT Top]
			z_priority = <pause_z>
		}
		I = 1
		begin
		FormatText ChecksumName = bunny_id 'pause_bunny_flame_%d' D = <I>
		FormatText ChecksumName = bunny_tex 'GH3_Pause_Bunny_Flame%d' D = <I>
		CreateScreenElement {
			Type = SpriteElement
			Id = <bunny_id>
			PARENT = bunny_container
			Pos = (160.0, 170.0)
			texture = <bunny_tex>
			rgba = [255 255 255 255]
			Dims = (300.0, 300.0)
			just = [RIGHT Bottom]
			z_priority = (<pause_z> + 3)
			Rot_Angle = 5
		}
		if (<I> > 1)
			DoScreenElementMorph Id = <bunny_id> Alpha = 0
		endif
		<I> = (<I> + 1)
		repeat 7
		CreateScreenElement {
			Type = SpriteElement
			Id = pause_bunny_shadow
			PARENT = bunny_container
			texture = GH3_Pause_Bunny
			rgba = [0 0 0 128]
			Pos = (20.0, -110.0)
			Dims = (550.0, 550.0)
			just = [Center Top]
			z_priority = (<pause_z> + 4)
		}
		CreateScreenElement {
			Type = SpriteElement
			Id = pause_bunny
			PARENT = bunny_container
			texture = GH3_Pause_Bunny
			rgba = [255 255 255 255]
			Pos = (0.0, -130.0)
			Dims = (550.0, 550.0)
			just = [Center Top]
			z_priority = (<pause_z> + 5)
		}
		RunScriptOnScreenElement \{Id = bunny_container
			bunny_hover
			Params = {
				hover_origin = (380.0, 170.0)
			}}
	endif
	container_params = {Type = ContainerElement PARENT = vmenu_pause Dims = (0.0, 100.0)}
	if (<for_options> = 0)
		if (<for_practice> = 1)
			if English
			else
				text_scale = (0.71999997, 0.71999997)
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_resume}}
					{unfocus retail_menu_unfocus Params = {Id = pause_resume}}
					{pad_choose gh3_start_pressed}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				Id = pause_resume
				Text = 'RESUME'
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_restart}}
					{unfocus retail_menu_unfocus Params = {Id = pause_restart}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_restart}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'RESTART'
				Id = pause_restart
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_options}}
					{unfocus retail_menu_unfocus Params = {Id = pause_options}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_options create_params = {player_device = <player_device>}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'OPTIONS'
				Id = pause_options
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_change_speed}}
					{unfocus retail_menu_unfocus Params = {Id = pause_change_speed}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_change_speed}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'CHANGE SPEED'
				Id = pause_change_speed
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_change_section}}
					{unfocus retail_menu_unfocus Params = {Id = pause_change_section}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_change_section}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'CHANGE SECTION'
				Id = pause_change_section
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($came_to_practice_from = main_menu)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{Focus retail_menu_focus Params = {Id = pause_new_song}}
						{unfocus retail_menu_unfocus Params = {Id = pause_new_song}}
						{pad_choose ui_flow_manager_respond_to_action Params = {action = select_new_song}}
					]
				}
				CreateScreenElement {
					Type = TextElement
					PARENT = <Id>
					font = fontgrid_title_gh3
					Scale = <text_scale>
					rgba = $menu_unfocus_color
					Text = 'NEW SONG'
					Id = pause_new_song
					just = [Center Top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
				GetScreenElementDims Id = <Id>
				fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_quit}}
					{unfocus retail_menu_unfocus Params = {Id = pause_quit}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_quit}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'QUIT'
				Id = pause_quit
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			add_user_control_helper \{Text = 'SELECT'
				button = Green
				Z = 100000}
			add_user_control_helper \{Text = 'UP/DOWN'
				button = Strumbar
				Z = 100000}
		else
			if English
			else
				container_params = {Type = ContainerElement PARENT = vmenu_pause Dims = (0.0, 105.0)}
				text_scale = (0.8, 0.8)
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_resume}}
					{unfocus retail_menu_unfocus Params = {Id = pause_resume}}
					{pad_choose gh3_start_pressed}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'RESUME'
				Id = pause_resume
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims Id = <Id>
			if ($is_network_game = 0)
				fit_text_in_rectangle Id = <Id> Dims = ((250.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			else
				fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			if ($is_network_game = 0)
				if NOT ($end_credits = 1)
					CreateScreenElement {
						<container_params>
						event_handlers = [
							{Focus retail_menu_focus Params = {Id = pause_restart}}
							{unfocus retail_menu_unfocus Params = {Id = pause_restart}}
							{pad_choose ui_flow_manager_respond_to_action Params = {action = select_restart}}
						]
					}
					CreateScreenElement {
						Type = TextElement
						PARENT = <Id>
						font = fontgrid_title_gh3
						Scale = <text_scale>
						rgba = $menu_unfocus_color
						Text = 'RESTART'
						Id = pause_restart
						just = [Center Top]
						Shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						z_priority = <pause_z>
						exclusive_device = <player_device>
					}
					GetScreenElementDims Id = <Id>
					fit_text_in_rectangle Id = <Id> Dims = ((250.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					if (($game_mode = p1_career && $boss_battle = 0) || ($game_mode = p1_quickplay))
						CreateScreenElement {
							<container_params>
							event_handlers = [
								{Focus retail_menu_focus Params = {Id = pause_practice}}
								{unfocus retail_menu_unfocus Params = {Id = pause_practice}}
								{pad_choose ui_flow_manager_respond_to_action Params = {action = select_practice}}
							]
						}
						CreateScreenElement {
							Type = TextElement
							PARENT = <Id>
							font = fontgrid_title_gh3
							Scale = <text_scale>
							rgba = $menu_unfocus_color
							Text = 'PRACTICE'
							Id = pause_practice
							just = [Center Top]
							Shadow
							shadow_offs = (3.0, 3.0)
							shadow_rgba [0 0 0 255]
							z_priority = <pause_z>
							exclusive_device = <player_device>
						}
						GetScreenElementDims Id = <Id>
						fit_text_in_rectangle Id = <Id> Dims = ((260.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					endif
					CreateScreenElement {
						<container_params>
						event_handlers = [
							{Focus retail_menu_focus Params = {Id = pause_options}}
							{unfocus retail_menu_unfocus Params = {Id = pause_options}}
							{pad_choose ui_flow_manager_respond_to_action Params = {action = select_options create_params = {player_device = <player_device>}}}
						]
					}
					CreateScreenElement {
						Type = TextElement
						PARENT = <Id>
						font = fontgrid_title_gh3
						Scale = <text_scale>
						rgba = $menu_unfocus_color
						Text = 'OPTIONS'
						Id = pause_options
						just = [Center Top]
						Shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						z_priority = <pause_z>
						exclusive_device = <player_device>
					}
					GetScreenElementDims Id = <Id>
					fit_text_in_rectangle Id = <Id> Dims = ((260.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
				endif
			endif
			quit_script = ui_flow_manager_respond_to_action
			quit_script_params = {action = select_quit create_params = {Player = <Player>}}
			if ($is_network_game)
				quit_script = create_leaving_lobby_dialog
				quit_script_params = {
					create_pause_menu
					pad_back_script = return_to_pause_menu_from_net_warning
					pad_choose_script = pause_menu_really_quit_net_game
					Z = 300
				}
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_quit}}
					{unfocus retail_menu_unfocus Params = {Id = pause_quit}}
					{pad_choose <quit_script> Params = <quit_script_params>}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'QUIT'
				Id = pause_quit
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims Id = <Id>
			if ($is_network_game = 0)
				fit_text_in_rectangle Id = <Id> Dims = ((270.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			else
				fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			if ($enable_button_cheats = 1)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{Focus retail_menu_focus Params = {Id = pause_debug_menu}}
						{unfocus retail_menu_unfocus Params = {Id = pause_debug_menu}}
						{pad_choose ui_flow_manager_respond_to_action Params = {action = select_debug_menu}}
					]
				}
				CreateScreenElement {
					Type = TextElement
					PARENT = <Id>
					font = fontgrid_title_gh3
					Scale = <text_scale>
					rgba = $menu_unfocus_color
					Text = 'DEBUG MENU'
					Id = pause_debug_menu
					just = [Center Top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
			endif
			add_user_control_helper \{Text = 'SELECT'
				button = Green
				Z = 100000}
			add_user_control_helper \{Text = 'UP/DOWN'
				button = Strumbar
				Z = 100000}
		endif
	else
		<fit_dims> = (500.0, 0.0)
		CreateScreenElement {
			Type = ContainerElement
			PARENT = vmenu_pause
			Dims = (0.0, 100.0)
			event_handlers = [
				{Focus retail_menu_focus Params = {Id = options_audio}}
				{Focus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus Params = {Id = options_audio}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_audio_settings create_params = {Player = <Player>}}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = <Id>
			font = fontgrid_title_gh3
			Scale = <text_scale>
			rgba = $menu_unfocus_color
			Text = 'SET AUDIO'
			Id = options_audio
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		if ((IsWinPort) || (IsMacPort))
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				Type = ContainerElement
				PARENT = vmenu_pause
				Dims = (0.0, 100.0)
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = options_calibrate_lag}}
					{Focus generic_menu_up_or_down_sound}
					{unfocus retail_menu_unfocus Params = {Id = options_calibrate_lag}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_calibrate_lag create_params = {Player = <Player>}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'CALIBRATE VIDEO LAG'
				Id = options_calibrate_lag
				just = [Center Center]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				Type = ContainerElement
				PARENT = vmenu_pause
				Dims = (0.0, 100.0)
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = 0x06c938f2}}
					{Focus generic_menu_up_or_down_sound}
					{unfocus retail_menu_unfocus Params = {Id = 0x06c938f2}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = 0xb1f15fbe create_params = {Player = <Player>}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'CALIBRATE AUDIO LAG'
				Id = 0x06c938f2
				just = [Center Center]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
		else
		GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				Type = ContainerElement
				PARENT = vmenu_pause
				Dims = (0.0, 100.0)
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = options_calibrate_lag}}
					{Focus generic_menu_up_or_down_sound}
					{unfocus retail_menu_unfocus Params = {Id = options_calibrate_lag}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_calibrate_lag create_params = {Player = <Player>}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'CALIBRATE LAG'
				Id = options_calibrate_lag
				just = [Center Center]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
		endif
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		if IsGuitarController controller = <player_device>
			CreateScreenElement {
				Type = ContainerElement
				PARENT = vmenu_pause
				Dims = (0.0, 100.0)
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = options_calibrate_whammy}}
					{Focus generic_menu_up_or_down_sound}
					{unfocus retail_menu_unfocus Params = {Id = options_calibrate_whammy}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_calibrate_whammy_bar create_params = {Player = <Player> Popup = 1}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = $menu_unfocus_color
				Text = 'CALIBRATE WHAMMY'
				Id = options_calibrate_whammy
				just = [Center Center]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		endif
		if IsSinglePlayerGame
			lefty_flip_text = 'LEFTY FLIP:'
		else
			if (<Player> = 1)
				lefty_flip_text = 'P1 LEFTY FLIP:'
			else
				lefty_flip_text = 'P2 LEFTY FLIP:'
			endif
		endif
		CreateScreenElement {
			Type = ContainerElement
			PARENT = vmenu_pause
			Dims = (0.0, 100.0)
			event_handlers = [
				{Focus retail_menu_focus Params = {Id = pause_options_lefty}}
				{Focus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus Params = {Id = pause_options_lefty}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_lefty_flip create_params = {Player = <Player>}}}
			]
		}
		<lefty_container> = <Id>
		CreateScreenElement {
			Type = TextElement
			PARENT = <lefty_container>
			Id = pause_options_lefty
			font = fontgrid_title_gh3
			Scale = <text_scale>
			rgba = $menu_unfocus_color
			Text = <lefty_flip_text>
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		CreateScreenElement {
			Type = ContainerElement
			PARENT = vmenu_pause
			Dims = (0.0, 100.0)
			event_handlers = [
				{Focus retail_menu_focus Params = {Id = options_deluxe}}
				{Focus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus Params = {Id = options_deluxe}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_deluxe_settings create_params = {Player = <Player>}}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = <Id>
			font = fontgrid_title_gh3
			Scale = <text_scale>
			rgba = $menu_unfocus_color
			Text = 'DELUXE SETTINGS'
			Id = options_deluxe
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		GetGlobalTags \{user_options}
		if (<Player> = 1)
			if (<lefty_flip_p1> = 1)
				lefty_tex = Options_Controller_Check
			else
				lefty_tex = Options_Controller_X
			endif
		else
			if (<lefty_flip_p2> = 1)
				lefty_tex = Options_Controller_Check
			else
				lefty_tex = Options_Controller_X
			endif
		endif
		displaySprite {
			PARENT = <lefty_container>
			tex = <lefty_tex>
			just = [Center Center]
			Z = (<pause_z> + 10)
		}
		GetScreenElementDims \{Id = pause_options_lefty}
		<Id> :SetProps Pos = (<width> * (0.5, 0.0) + (22.0, 0.0))
		add_user_control_helper \{Text = 'SELECT'
			button = Green
			Z = 100000}
		add_user_control_helper \{Text = 'BACK'
			button = RED
			Z = 100000}
		add_user_control_helper \{Text = 'UP/DOWN'
			button = Strumbar
			Z = 100000}
	endif
	if ($is_network_game = 0)
		if NOT IsSinglePlayerGame
			if (<for_practice> = 0)
				FormatText TextName = player_paused_text 'PLAYER %d PAUSED. ONLY PLAYER %d OPTIONS ARE AVAILABLE.' D = <Player>
				displaySprite {
					PARENT = pause_menu_frame_container
					Id = pause_helper_text_bg
					tex = Control_pill_body
					Pos = (640.0, 600.0)
					just = [Center Center]
					rgba = [96 0 0 255]
					Z = (<pause_z> + 10)
				}
				displayText {
					PARENT = pause_menu_frame_container
					Pos = (640.0, 600.0)
					just = [Center Center]
					Text = <player_paused_text>
					rgba = [186 105 0 255]
					Scale = (0.55, 0.65000004)
					Z = (<pause_z> + 11)
					font = text_a6
				}
				GetScreenElementDims Id = <Id>
				bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
				pause_helper_text_bg :SetProps Dims = <bg_dims>
				displaySprite {
					PARENT = pause_menu_frame_container
					tex = Control_pill_end
					Pos = ((640.0, 600.0) - <width> * (0.5, 0.0))
					rgba = [96 0 0 255]
					just = [RIGHT Center]
					flip_v
					Z = (<pause_z> + 10)
				}
				displaySprite {
					PARENT = pause_menu_frame_container
					tex = Control_pill_end
					Pos = ((640.0, 601.0) + <width> * (0.5, 0.0))
					rgba = [96 0 0 255]
					just = [LEFT Center]
					Z = (<pause_z> + 10)
				}
			endif
		endif
	endif
	Change \{menu_choose_practice_destroy_previous_menu = 1}
	if (<for_options> = 0 && <for_practice> = 0 && $is_network_game = 0)
		SpawnScriptNow \{animate_bunny_flame}
	endif
endscript

script issingleplayergame 
	if ($game_mode = p1_career || $game_mode = p1_quickplay || $game_mode = training)
		return \{true}
	else
		return \{false}
	endif
endscript

script create_main_menu_backdrop
shut_down_character_hub
	create_menu_backdrop \{texture = GH3_Main_Menu_BG}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_text_container
		parent = root_window
		Pos = ($g_mm_base_menu_pos)
		just = [left top]
		z_priority = 3
	}
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_bg_container
		parent = root_window
		Pos = (0.0, 0.0)
		z_priority = 3}
	CreateScreenElement \{Type = SpriteElement
		id = main_menu_godrays1
		parent = main_menu_bg_container
		texture = Main_Menu_BG2
		Pos = (400.0, 330.0)
		dims = (1280.0, 1280.0)
		just = [
			center
			center
		]
		z_priority = 1
		alpha = 0
		blend = add}
	RunScriptOnScreenElement id = <id> rotate_menu_element params = {time = 30 id = <id>}
	CreateScreenElement \{Type = SpriteElement
		id = main_menu_godrays2
		parent = main_menu_bg_container
		texture = Main_Menu_BG2
		Pos = (400.0, 330.0)
		dims = (1280.0, 1280.0)
		just = [
			center
			center
		]
		z_priority = 1
		alpha = 0
		blend = add
		flip_v}
	RunScriptOnScreenElement id = <id> rotate_menu_element params = {time = 60 id = <id>}
	CreateScreenElement \{Type = SpriteElement
		parent = main_menu_bg_container
		texture = Main_Menu_illustrations
		Pos = (55.0, 0.0)
		dims = (720.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 2
		alpha = 0.9}
	CreateScreenElement \{Type = SpriteElement
		parent = main_menu_bg_container
		texture = main_menu_logo
		Pos = (870.0, 50.0)
		Scale = 1
		just = [
			center
			top
		]
		z_priority = 2}

	main_menu_font = fontgrid_title_gh3

	CreateScreenElement {
		Type = TextBlockElement
		Id = main_menu_tip
		PARENT = main_menu_bg_container
		font = text_a6
		Text = ""
		Dims = (600.0, 200.0)
		Pos = $main_menu_tip_pos_initial
		just = [Center Top]
		rgba = $main_menu_tip_rgba
		Scale = $main_menu_tip_scale_initial
		Shadow
        shadow_offs = (1.5, 1.5)
        shadow_rgba = [0 0 0 255]
		z_priority = 62
	}

	RunScriptOnScreenElement \{Id = main_menu_tip
		menu_text_hover
	}
	RunScriptOnScreenElement \{Id = main_menu_tip
		menu_text_get_string
	}

	CreateScreenElement {
		Type = TextBlockElement
		PARENT = main_menu_bg_container
		font = text_a6
		Text = "DELUXE"
		Dims = $main_menu_deluxe_text_dims
		Pos = $main_menu_deluxe_text_pos
		just = [Center Top]
		rgba = (($g_menu_colors).md_violet_grey)
		Scale = 0.75
		Shadow
        shadow_offs = (3.0, 3.0)
        shadow_rgba = $main_menu_deluxe_text_shadow_rgba
		z_priority = 61
	}

	
	
endscript
