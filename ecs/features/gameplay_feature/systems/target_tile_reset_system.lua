local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.TargetTile)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        evolved.remove(cmp.TargetTile, cmp.TargetTile)
    end
end

return {
    name = "target_tile_reset_system",
    filter = filter:execute(update):build(),
}