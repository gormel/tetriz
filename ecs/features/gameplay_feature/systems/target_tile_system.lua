local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local icmp = require "ecs.features.input_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.FieldTileBody)
    :include(icmp.InputOver)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        if evolved.has(cmp.PlacingFigure, cmp.PlacingFigure) or true then
            local tile_ety = evolved.get(entity, cmp.FieldTileBody)
            evolved.set(cmp.TargetTile, cmp.TargetTile, tile_ety)
            break
        end
    end
end

return {
    name = "target_tile_system",
    filter = filter:execute(update):build(),
}