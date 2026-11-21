local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.TargetTile)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        evolved.remove(cmp.TargetTile, cmp.TargetTile)
    end
end

return {
    name = "target_tile_reset_system",
    filter = filter:execute(update):build(),
}