local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local gocmp = require "ecs.features.gameobject_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.Field)
    :include(cmp.ClearField)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        
        local field = evolved.get(entity, cmp.Field)

        for _, tile_entity in ipairs(field) do
            local tile = evolved.get(tile_entity, cmp.FieldTile)
            evolved.set(tile.body, gocmp.SetLayer, cfg.layers.DISABLED)
            evolved.remove(tile_entity, cmp.FieldTileBusy)
        end
    end
end

return {
    name = "clear_field_system",
    filter = filter:execute(update):build(),
}