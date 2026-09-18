local evolved = require "lib.evolved"
local icmp = require("ecs.features.input_feature.components")
local gcmp = require("ecs.features.gameobject_feature.components")
local cmp = require "ecs.features.drag_feature.components"

local filter = evolved
    .builder()
    :include(cmp.Draggable)
    :include(cmp.BeginDrag)
    :include(gcmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for _, ety in ipairs(ety_list) do
        local begin = evolved.get(ety, cmp.BeginDrag)
        evolved.remove(ety, cmp.BeginDrag)

        evolved.set(ety, cmp.InDrag, true)
        evolved.set(ety, cmp.DragOffset, { x = begin.dx, y = begin.dy, z = begin.dz })
    end
end

return filter:execute(update):build()