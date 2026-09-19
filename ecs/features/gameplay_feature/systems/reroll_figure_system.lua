local evolved = require "lib.evolved"
local dcmp = require "ecs.features.drag_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.FigureCfg)
    :include(cmp.FigureSourceRef)
    :include(dcmp.DragComplete)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        local ref = evolved.get(entity, cmp.FigureSourceRef)

        evolved.remove(entity, dcmp.Draggable)

        if evolved.alive(ref) then
            evolved.set(ref, cmp.RollFigure, true)
        end
    end
end

return filter:execute(update):build()