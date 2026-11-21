local evolved = require "lib.evolved"
local icmp = require "ecs.features.input_feature.components"
local gocmp = require "ecs.features.gameobject_feature.components"
local ccmp = require "ecs.features.core_feature.components"
local ddcmp = require "ecs.features.drag_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(ddcmp.DragComplete)
    :include(cmp.FigureCfg)
    :include(gocmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        if (evolved.has(cmp.PlacingFigure, cmp.PlacingFigure)) then
            local placing = evolved.get(cmp.PlacingFigure, cmp.PlacingFigure)
            evolved.set(placing.placeholder, ccmp.Destroy, true);
        end
        
        evolved.set(entity, ccmp.Destroy, true)

        evolved.remove(cmp.PlacingFigure, cmp.PlacingFigure)
    end
end

return {
    name = "remove_figure_system",
    filter = filter:execute(update):build(),
}