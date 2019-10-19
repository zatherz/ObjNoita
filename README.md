ObjNoita
===

Makes Noita's Lua API a little easier to work with.

Currently implemented:
* Entities
* Components

How to load
===

Put the `objnoita` folder in the `files` dir of your mod, then insert this at the top of your script:

```lua
dofile("mods/MY_MOD/files/objnoita/noita.lua")
```

Example
===

## ObjNoita

```lua
local ent = noita.updated_entity()
print("Updated entity name test: " .. ent:name())

for i, comp in ipairs(ent:components()) do
    comp:set_enabled(true)
end
```

## Raw Noita API
```lua
local ent = GetUpdatedEntityID()
print("Updated entity name test: " .. GetEntityName(ent))

for i, comp in ipairs(EntityGetAllComponents(ent)) do
    EntitySetComponentIsEnabled(ent, comp, true)
end
```

Functions
===
For a list of functions, check out the `noita.lua` script.
