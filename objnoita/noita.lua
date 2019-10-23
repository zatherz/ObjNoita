if noita then return end

noita = {}

--- GENERAL ---

function noita.print(text, important)
	if important then
		GamePrintImportant(text)
	else
		GamePrint(text)
	end
end

function noita.type(obj)
	local lua_type = type(obj)
	if lua_type == "table" then
		local meta = getmetatable(obj)
		if meta then
			if meta.__objnoita_type then return meta.__objnoita_type end
		end
	end

	return lua_type
end

function noita.add_persistent_flag(flag)
	AddFlagPersistent(flag)
end

function noita.disable_autosave()
	AutosaveDisable()
end

function noita.convert_everything_to_gold()
	ConvertEverythingToGold()
end

function noita.find_free_position_for_body(ideal_pos_x, ideal_pos_y, vel_x, vel_y, body_radius)
	return FindFreePositionForBody(ideal_pos_x, ideal_pos_y, vel_x, vel_y, body_radius)
end

function noita.add_run_flag(flag)
	AddFlagRun(flag)
end

function noita.create_particle(mat, x, y, count, vel_x, vel_y, visual, draw_as_long)
	--#optional draw_as_long
	GameCreateParticle(mat, x, y, count, vel_x, vel_y, visual, draw_as_long)
end

function noita.camera_pos()
	return GameGetCameraPos()
end

function noita.end_game_location()
	return GameGetEndGameLocation()
end

function noita.end_game_symbol_name()
	return GameGetEndGameSymbolName()
end

function noita.end_game_time()
	return GameGetEndGameTime()
end

function noita.frames()
	return GameGetFrameNum()
end

function noita.gamepad_connected()
	return GameIsGamepadConnected()
end

function noita.trailer_mode_enabled()
	return GameIsTrailerModeEnabled()
end

function noita.orb_collected_this_run(orb_id)
	return GameGetOrbCollectedThisRun(orb_id)
end

function noita.orb_collected(orb_id)
	return GameGetOrbCollectedAllTime(orb_id)
end

function noita.orb_count_this_run()
	return GameGetOrbCountThisRun()
end

function noita.orb_count()
	return GameGetOrbCountAllTime()
end

function noita.symbol_magic_name()
	return GameGetSymbolMagicName()
end

function noita.has_run_flag(flag)
	return GameHasFlagRun(flag)
end

function noita.daily_run()
	--#deprecated entity:is_daily_run()
	print("OBJNOITA: DEPRECATED FUNCTION: noita.daily_run, ALWAYS RETURNS FALSE")
	print("OBJNOITA: Please use entity:is_daily_run() (unknown whether it should be used on a player or on the world state entity)")
	return false
end

function noita.intro_playing()
	return GameIsIntroPlaying()
end

function noita.completed()
	return GameOnCompleted()
end

function noita.play_sound(bank, event, x, y)
	GamePlaySound(bank, event, x or 0, y or 0)
end

function noita.remove_run_flag(flag)
	GameRemoveFlagRun(flag)
end

function noita.shake_screen(strength, x, y)
	GameScreenshake(strength, x or 0, y or 0)
end

function noita.set_active_item()
	GameSetActiveItem()
end

function noita.set_camera_free(free)
	GameSetCameraFree(free)
end

function noita.move_camera(x, y)
	GameSetCameraPos(x, y)
end

function noita.localize(key, param0, param1, param2)
	return GameTextGet(key, param0, param1, param2)
end

function noita.has_localization(key)
	return GameTextGetTranslatedOrNot(key)
end

function noita.trigger_music_cue(name)
	GameTriggerMusicCue(name)
end

function noita.trigger_music_event(event, can_fade, x, y)
	GameTriggerMusicEvent(event, can_fade, x or 0, y or 0)
end

function noita.fade_out_and_dequeue_all_music(relative_fade_speed)
	--#optional relative_fade_speed
	GameTriggerMusicFadeOutAndDequeueAll(relative_fade_speed)
end

function noita.random_action_with_type(x, y, max_level, type, i)
	return GetRandomActionWithType(x, y, max_level, type, i)
end

function noita.spawn_location()
	return GetSpawnLocation()
end

function noita.spawn_location_near(x, y, must_be_dark)
	return GetSpawnLocationNear(x, y, must_be_dark or false)
end

function noita.surface_normal(x, y, ray_length, ray_count)
	--#return 4
	return GetSurfaceNormal(x, y, ray_length, ray_count)
end

function noita.bool(key, default)
	return GetValueBool(key, default)
end

function noita.int(key, default)
	return GetValueInt(key, default)
end

function noita.number(key, default)
	return GetValueNumber(key, default)
end

function noita.set_global(key, value)
	GlobalsSetValue(key, value)
end

function noita.global(key, default)
	return GlobalsGetValue(key, default)
end

function noita.has_persistent_flag(flag)
	return HasFlagPersistent(flag)
end

function noita.load_pixel_scene(materials_file, colors_file, background_file, x, y, skip_biome_checks, skip_edge_textures, color_to_material_table)
	LoadPixelScene(materials_file, colors_file, x, y, background_file, skip_biome_checks, skip_edge_textures, color_to_material_table)
end

function noita.loose_chunk(image, x, y, max_durability)
	--#optional max_durability
	LooseChunk(x, y, image, max_durability)
end

function noita.magic_number(key)
	return MagicNumbersGetValue(key)
end

function noita.remove_joints(min_x, min_y, max_x, max_y)
	PhysicsRemoveJoints(min_x, min_y, max_x, max_y)
end

function noita.procedural_random(x, y, min, max)
	return ProceduralRandom(x, y, min, max)
end

function noita.random()
	return Random()
end

function noita.random_distribution(min, max, mean, sharpness, baseline)
	-- SKIPPED: RandomDistribution() - there's no need for the presumably int specific version
	return RandomDistributionf(min, max, mean, sharpness, baseline)
end

function noita.shoot_ray(x, y, target_x, target_y)
	return Raytrace(x, y, target_x, target_y)
end

function noita.register_spawn_function(color, func_name)
	RegsiterSpawnFunction(color, func_name)
end

function noita.remove_persistent_flag(flag)
	RemoveFlagPersistent(flag)
end

function noita.set_seed(x, y)
	SetRandomSeed(x, y)
end

function noita.set_timeout(time, file, func)
	SetTimeOut(time, file, func)
end

function noita.set_bool(key, value)
	SetValueBool(key, value)
end

function noita.set_int(key, value)
	SetValueInt(key, value)
end

function noita.set_number(key, value)
	SetValueNumber(key, value)
end

function noita.spawn_persistent_teleport(x, y, level)
	SpawnPersistentTeleport(x, y, level)
end

function noita.spawn_action_item(x, y, level)
	SpawnActionItem(x, y, level)
end

function noita.spawn_apparition(x, y, level)
	SpawnApparition(x, y, level)
end

function noita.spawn_stash(x, y, level, action_count)
	SpawnStash(x, y, level, action_count)
end

function noita.biome_stat(key)
	return StatsBiomeGetValue(key)
end

function noita.reset_biome_stats()
	StatsBiomeReset()
end

function noita.stat(key)
	return StatsGetValue(key)
end

function noita.log_player_kill()
	--#removed
	print("OBJNOITA: DEPRECATED FUNCTION: noita.log_player_kill, DOES NOTHING")
	print("OBJNOITA: This function was removed from the game.")
-- 	StatsLogPlayerKill()
end

function noita.unlock_item(action_id)
	UnlockItem(action_id)
end

function noita.time_since_started()
	return GameGetRealWorldTimeSinceStarted()
end

function noita.do_secret_ending()
	GameDoEnding2()
end

function noita.baab_instruction(entity_file)
	BaabInstruction(entity_file)
end

function noita.register_gun_actions()
	RegisterGunActions()
end

function noita.register_gun_shot_effects()
	RegisterGunShotEffects()
end

function noita.set_projectile_configs()
	SetProjectileConfigs()
end

function noita.register_projectile(entity_file)
	RegisterProjectile(entity_file)
end

function noita.begin_projectile(entity_file)
	BeginProjectile(entity_file)
end

function noita.end_projectile()
	EndProjectile()	
end

function noita.projectile(entity_file, func)
	BeginProjectile(entity_file)
	func()
	EndProjectile()
end

function noita.begin_trigger_timer(timeout_frames)
	BeginTriggerTimer(timeout_frames)
end

function noita.begin_trigger_death()
	BeginTriggerDeath()
end

function noita.begin_trigger_hit_world()
	BeginTriggerHitWorld()
end

function noita.end_trigger()
	EndTrigger()
end

function noita.trigger_timer(timeout_frames, func)
	BeginTriggerTimer(timeout_frames)
	EndTrigger()
end

function noita.trigger_death(func)
	BeginTriggerDeath()
	EndTrigger()
end

function noita.trigger_hit_world(func)
	BeginTriggerHitWorld()
	EndTrigger()
end

function noita.log_action(action_name)
	LogAction(action_name)
end

function noita.start_reload(reload_time)
	StartReload(reload_time)
end

function noita.action_used(action_id)
	ActionUsedd(action_id) -- sic
end

function noita.action_uses_remaining_changed(inventoryitem_id, uses_remaining)
	ActionUsesRemainingChanged(inventoryitem_id, uses_remaining)
end

function noita.action_played(action_id)
	OnActionPlayed(action_id)
end

function noita.not_enough_mana_for_action(action_id)
	OnNotEnoughManaForAction(action_id)
end

function noita.complete_game()
	-- note: triggers steam achievement!
	GameOnComplete()
end

--- DEBUG ---

function noita.debug_mark(text, x, y, r, g, b)
	DEBUG_MARK(x, y, text, r or 1, g or 0, b or 0)
end

function noita.debug_mouse_world_position()
	return DEBUG_GetMouseWorld()
end

function noita.debug_enable_trailer_mode()
	DebugEnableTrailerMode()
end

function noita.debug_save_test_player()
	Debug_SaveTestPlayer()
end

function noita.debug_is_dev_build()
	return DebugGetIsDevBuild()
end

--- MOD ---

noita.MOD_FUNCS = {
	append_lua = function(self, source, target)
		ModLuaFileAppend(target, source)
	end,

	add_magic_numbers = function(self, file)
		ModMagicNumbersFileAdd(file)
	end,

	add_materials = function(self, file)
		ModMaterialsFileAdd(file)
	end,

	register_audio_event_mappings = function(self, file)
		ModRegisterAudioEventMappings(file)
	end
}

noita.MOD_META = {
	__objnoita_type = "mod",
	__index = noita.MOD_FUNCS
}

noita.mod = setmetatable({}, noita.MOD_META)

--- ENTITIES & COMPONENTS ---

--https://stackoverflow.com/a/7615129
local function str_split (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

noita.ENTITY_FUNCS = {
	set_enabled_components_field = function(self, tag, value)
		EntitySetComponentsWithTagEnabled(self.id, tag, value)
	end,

	children = function(self)
		return EntityGetAllChildren(self.id)
	end,

	child = function(self, predicate)
		local children = self:children()
		for i, child in ipairs(children) do
			local obj_child = noita.entity(child)
			if predicate(obj_child) then return obj_child end
		end
	end,

	child_with_name = function(self, name)
		return self:child(function(ent) return ent:name() == name end)
	end,

	add_child = function(self, child)
		EntityAddChild(noita.entity_id(child))
	end,

	set_transform = function(self, x, y)
		EntitySetTransform(self.id, x, y)
	end,

	is_being_updated = function(self)
		return GetUpdatedEntityID() == self.id
	end,

	component = function(self, type, tag)
		--#optional tag
		return noita.entity(EntityGetFirstComponent(self.id, type, tag))
	end,

	components = function(self, type)
		return noita.array(EntityGetComponent(self.id, type) or {}, function(comp)
			return noita.component(self.id, comp)
		end)
	end,

	add_component = function(self, type, values)
		return noita.component(self.id, EntityAddComponent(self.id, type, values))
	end,

	play_sound = function(self, sound)
		GameEntityPlaySound(self.id, sound)
	end,

	save = function(self, file)
		EntitySave(self.id, file)
	end,

	transform = function(self)
		--#return 2
		return EntityGetTransform(self.id)
	end,

	convert_to_material = function(self, mat)
		EntityConvertToMaterial(self.id, mat)
	end,

	add_tag = function(self, tag)
		EntityAddTag(self.id, tag)
	end,

	tags = function(self)
		return str_split(EntityGetTags(self.id), ",")
	end,

	has_tag = function(self, search_tag)
		return EntityHasTag(self.id, search_tag)

		-- workaround no longer necessary:
		--
		-- local tags = self:tags()
		-- for i, tag in ipairs(tags) do
		-- 	if tag == search_tag then
		-- 		return true
		-- 	end
		-- end
		-- return false
	end,

	set_name = function(self, name)
		EntitySetName(self.id, name)
	end,

	name = function(self)
		return EntityGetName(self.id)
	end,

	closest_entity_with_tag = function(self, tag)
		local x, y = self:transform()
		return noita.entity(EntityGetClosestWithTag(x, y, tag))
	end,

	parent = function(self)
		return noita.entity(EntityGetParent(self.id))
	end,

	all_components = function(self)
		return noita.array(EntityGetAllComponents(self.id), function(comp) return noita.component(self.id, comp) end)
	end,

	kill = function(self)
		EntityKill(self.id)
	end,

	alive = function(self)
		return EntityIsAlive(self.id)
	end,

	error_if_dead = function(self)
		if (not self:alive()) then
			error("Entity is dead!")
		end
	end,

	regen_container_item_actions = function(self)
		GameRegenItemActionsInContainer(self.id)
	end,

	regen_player_item_actions = function(self)
		GameRegenItemActionsInPlayer(self.id)
	end,

	regen_item_action = function(self)
		GameRegenItemAction(self.id)
	end,

	add_material = function(self, mat, count)
		AddMaterialInventoryMaterial(self.id, mat, count or 1)
	end,

	has_game_effect = function(self, effect)
		return GameGetGameEffect(self.id, effect)
	end,

	game_effect_count = function(self, effect)
		return GameGetGameEffectCount(self.id, effect)
	end,

	potion_color = function(self)
		return GameGetPotionColor(self.id)
	end,

	velocity = function(self)
		return GameGetVelocityCompVelocity(self.id)
	end,

	animate = function(self, name, priority, followup_name, followup_priority)
		GamePlayAnimation(self.id, name, priority, followup_name, followup_priority)
	end,

	shoot_projectile = function(self, x, y, target_x, target_y, projectile_entity, send_message)
		GameShootProjectile(self.id, x, y, target_x, target_y, projectile_entity, send_message)
	end,

	shoot_projectile_at = function(self, target, projectile_entity, send_message)
		local x, y = self:transform()
		local target_x, target_y = target:transform()
		GameShootProjectile(self.id, x, y, target_x, target_y, projectile_entity, send_message)
	end,

	set_herd_id = function(self, herd)
		GenomeSetHerdId(self.id, herd)
	end,

	load_game_effect = function(self, file)
		GetGameEffectLoadTo(self.id, file)
	end,

	is_player = function(self)
		return IsPlayer(self.id)
	end,

	add_body_create_box = function(self, mat, offs_x, offs_y, w, h, centered)
		PhysicsAddBodyCreateBox(self.id, mat, offs_x, offs_y, w, h, centered or false)
	end,

	add_body_image = function(self, image_file, material, offs_x, offs_y, centered, is_circle, material_image_file)
		PhysicsAddBodyImage(self.id, image_file, material, offs_x, offs_y, centered, is_circle, material_image_file)
	end,

	add_joint = function(self, body_id0, body_id1, joint_type, offs_x, offs_y)
		PhysicsAddJoint(self.id, body_id0, body_id1, offs_x, ofs_y, joint_type)
	end,

	apply_force = function(self, force_x, force_y)
		PhysicsApplyForce(self.id, force_x, force_y)
	end,

	set_static = function(self, val)
		PhysicsSetStatic(self.id, val)
	end,

	apply_torque = function(self, torque)
		PhysicsApplyTorque(self.id, torque)
	end,

	remove_tag = function(self, tag)
		EntityRemoveTag(self.id, tag)
	end,

	closest_entity = function(self)
		local x, y = self:transform()
		return noita.entity(EntityGetClosest(self.id, x, y))
	end,

	pickup_inventory_item = function(self, item)
		GamePickUpInventoryItem(self.id, noita.entity(item).id)
	end,

	kill_inventory_item = function(self, item)
		GameKillInventoryItem(self.id, noita.entity(item).id)
	end,

	is_daily_run = function(self)
		return GameIsDailyRun(self.id)
	end
}

noita.ENTITY_META = {
	__objnoita_type = "entity",
	__index = noita.ENTITY_FUNCS
}

noita.COMPONENT_FUNCS = {
	set_enabled = function(self, enabled)
		EntitySetComponentIsEnabled(self.entity_id, self.id, enabled)
	end,

	remove = function(self)
		EntityRemoveComponent(self.entity_id, self.id)
	end,

	set_int_range = function(self, prop, min, max)
		ComponentSetValueValueRangeInt(self.id, prop, min, max)
	end,

	vector = function(self, prop, type)
		return ComponentGetVector(self.id, prop, type)
	end,

	vector_size = function(self, prop, type)
		return ComponentGetVectorSize(self.id, prop, type)
	end,

	vector_value = function(self, prop, type, i)
		return ComponentGetVectorValue(self.id, prop, type, i)
	end,

	set_object_value = function(self, prop, field, value)
		ComponentObjectSetValue(self.id, prop, field, value)
	end,

	bool = function(self, prop)
		return ComponentGetValueBool(self.id, prop)
	end,

	set = function(self, prop, value)
		ComponentSetValue(self.id, prop, value)
	end,

	get = function(self, prop)
		return ComponentGetValue(self.id, prop)
	end,

	set_meta = function(self, prop, value)
		ComponentSetMetaCustom(self.id, prop, value)
	end,

	set_vec2 = function(self, prop, x, y)
		ComponentSetValueVector2(self.id, prop, x, y)
	end,

	float = function(self, prop)
		ComponentGetValueFloat(self.id, prop)
	end,

	vec2 = function(self, prop)
		return ComponentGetValueVector2(self.id, prop)
	end,

	get_object_value = function(self, prop, field)
		return ComponentObjectGetValue(self.id, prop, field)
	end,

	get_object_value_bool = function(self, prop, field)
		return ComponentObjectGetValueBool(self.id, prop, field)
	end,

	int = function(self, prop)
		return ComponentGetValueInt(self.id, prop)
	end,

	get_object_members = function(self, prop)
		return ComponentObjectGetMembers(self.id, prop)
	end,

	is_being_updated = function(self)
		return GetUpdatedComponentID() == self.id
	end,

	members = function(self)
		return ComponentGetMembers(self.id)
	end,

	apply_torque = function(self, torque)
		PhysicsApplyTorqueToComponent(self.entity_id, self.id, torque)
	end
}

noita.COMPONENT_META = {
	__objnoita_type = "component",
	__index = noita.COMPONENT_FUNCS
}

function noita.array(table, func)
	tab = {}

	for i, val in ipairs(table) do
		tab[i] = func(val)
	end

	return tab
end

function noita.component(entity_id, id)
	if not entity_id or not id then return nil end

	return setmetatable({
		entity_id = entity_id,
		id = id,
	}, noita.COMPONENT_META)
end


function noita.entity(id)
	if not id then return nil end

	local meta = getmetatable(id)
	if (meta and meta.__objnoita_type == "entity") then return id end

	return setmetatable({
		id = id,
	}, noita.ENTITY_META)
end

function noita.entity_id(ent)
	local meta = getmetatable(id)
	if (meta and meta.__objnoita_type == "entity") then return ent.id end

	return ent
end

function noita.create_entity(name)
	--#optional name
	return noita.entity(EntityCreateNew(name))
end

function noita.load_entity(file, x, y, camera_bound)
	local ent
	if camera_bound then
		ent = EntityLoadCameraBound(file, x or 0, y or 0)
	else
		ent = EntityLoad(file, x or 0, y or 0)
	end
	return noita.entity(ent)
end

function noita.load_entity_to_stash(file, stash_id)
	LoadEntityToStash(file, stash_id)
end

function noita.entities_with_tag(tag)
	return noita.array(EntityGetWithTag(tag) or {}, function(ent) return noita.entity(ent) end)
end

function noita.updated_entity()
	return noita.entity(GetUpdatedEntityID())
end

function noita.updated_component()
	return noita.component(GetUpdatedEntityID(), GetUpdatedComponentID())
end

function noita.world_state_entity()
	return noita.entity(GameGetWorldStateEntity())
end

function noita.create_item_action(action_id, x, y)
	--#optional x,y
	return noita.entity(CreateItemActionEntity(action_id, x, y))
end

function noita.player_stats()
	return noita.entity(GameGetPlayerStatsEntity())
end

function noita.closest_entity_with_tag(tag, x, y)
	return noita.entity(EntityGetClosestWithTag(x, y, tag))
end

function noita.closest_entity(x, y)
	return noita.entity(EntityGetClosest(x, y))
end

function noita.entity_with_name(name)
	return noita.entity(EntityGetWithName(name))
end

--- GUI ---
noita.GUI_FUNCS = {
	destroy = function(self)
		GuiDestroy(self.id)
	end,

	start_frame = function(self)
		GuiStartFrame(self.id)
	end,

	text = function(self, text, x, y, centered)
		if centered then
			GuiTextCentered(self.id, x or 0, y or 0, text)
		else
			GuiText(self.id, x or 0, y or 0, text)
		end
	end,

	button = function(self, text, id, x, y)
		GuiButton(self.id, x or 0, y or 0, text, id)
	end,

	begin_layout_horizontal = function(self, x, y)
		GuiLayoutBeginHorizontal(self.id, x or 0, y or 0)
	end,

	begin_layout_vertical = function(self, x, y)
		GuiLayoutBeginVertical(self.id, x or 0, y or 0)
	end,

	add_horizontal_spacing = function(self)
		GuiLayoutAddHorizontalSpacing(self.id)
	end,

	add_vertical_spacing = function(self)
		GuiLayoutAddVerticalSpacing(self.id)
	end,

	end_layout = function(self)
		GuiLayoutEnd(self.id)
	end,

	frame = function(self, func)
		self:start_frame()
		func(self)
	end
}

noita.GUI_META = {
	__objnoita_type = "gui",
	__index = noita.GUI_FUNCS
}

function noita.gui()
	local id = GuiCreate()

	return setmetatable({
		id = id,
		btn_id = 0
	}, noita.GUI_META)
end

--- BIOME MAP ---

--[[
Note:
For singletons, I treat the object as if the methods took ID/self params for consistency
E.g. noita.biome_map:size() instead of noita.biome_map.size()
]]

noita.BIOME_MAP_FUNCS = {
	index = function(self)
		return BiomeMapGetIndex()
	end,
	name = function(self, x, y)
		--#optional x,y
		return BiomeMapGetName(x, y)
	end,
	pixel = function(self, x, y)
		return BiomeMapGetPixel(x, y)
	end,
	size = function(self)
		--#return 2
		return BiomeMapGetSize()
	end,
	vertical_position_inside_biome = function(self, x, y)
		return BiomeMapGetVerticalPositionInsideBiome(x, y)
	end,
	load_image = function(self, path, x, y)
		BiomeMapLoadImage(x, y, path)
	end,
	load_image_cropped = function(self, path, x, y, crop_x, crop_y, crop_w, crop_h)
		BiomeMapLoadImageCropped(x, y, path, crop_x, crop_y, crop_w, crop_h)
	end,
	set_pixel = function(self, color, x, y)
		BiomeMapSetPixel(x, y, color)
	end,
	set_size = function(self, w, h)
		BiomeMapSetSize(w, h)
	end
}

noita.BIOME_MAP_META = {
	__objnoita_type = "biome_map",
	__index = noita.BIOME_MAP_FUNCS
}

noita.biome_map = setmetatable({}, noita.BIOME_MAP_META)

--- CELL FACTORY ---

noita.CELL_FACTORY_FUNCS = {
	fires = function(self, include_statics)
		return CellFactory_GetAllFires(include_statics or true)
	end,
	gases = function(self, include_statics)
		return CellFactory_GetAllGases(include_statics or true)
	end,
	liquids = function(self, include_statics)
		return CellFactory_GetAllLiquids(include_statics or true)
	end,
	sands = function(self, include_statics)
		return CellFactory_GetAllSands(include_statics or true)
	end,
	solids = function(self, include_statics)
		return CellFactory_GetAllSolids(include_statics or true)
	end,
	name = function(mat_id)
		return CellFactory_GetName(mat_id)
	end,
	type = function(mat_name)
		return CellFactory_GetType(mat_name)
	end
}

noita.CELL_FACTORY_META = {
	__objnoita_type = "cell_factory",
	__index = noita.CELL_FACTORY_FUNCS
}

noita.cell_factory = setmetatable({}, noita.CELL_FACTORY_FUNCS)
