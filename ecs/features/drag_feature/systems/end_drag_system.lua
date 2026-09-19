local evolved = require "lib.evolved"
local icmp = require("ecs.features.input_feature.components")
local cmp = require "ecs.features.drag_feature.components"

local filter = evolved
    .builder()
    :include(cmp.Draggable)
    :include(icmp.InputRelease)

local function update(chunk, ety_list, ety_c, dt)
    for i = 1, ety_c do
        local entity = ety_list[i]
        evolved.remove(entity, icmp.InputRelease)

        evolved.remove(entity, cmp.InDrag)
        evolved.remove(entity, cmp.DragOffset)
        evolved.set(entity, cmp.DragComplete, true)
    end
end

return filter:execute(update):build()