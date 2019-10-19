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

function noita.mark(text, x, y, r, g, b)
	DEBUG_MARK(x, y, text, r or 1, g or 0, b or 0)
end

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

	components = function(self, type)
		return noita.array(EntityGetComponent(self.id, type), function(comp)
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
		local tags = self:tags()
		for i, tag in ipairs(tags) do
			if tag == search_tag then
				return true
			end
		end
		return false
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

	components = function(self)
		return noita.array(EntityGetAllComponents(self.id))
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

	get_vec2 = function(self, prop)
		return ComponentGetValueVector2(self.id, prop)
	end,

	get_object_value = function(self, prop, field)
		return ComponentObjectGetValue(self.id, prop, field)
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
	return noita.entity(EntityCreateNew(name or ""))
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

function noita.entities_with_tag(tag)
	return noita.array(EntityGetWithTag(tag), function(ent) return noita.entity(ent) end)
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

	done = function(self)
		GuiLayoutEnd(self.id)
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