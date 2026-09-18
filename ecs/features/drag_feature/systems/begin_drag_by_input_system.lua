local evolved = require "lib.evolved"
local icmp = require("ecs.features.input_feature.components")
local gcmp = require("ecs.features.gameobject_feature.components")
local cmp = require "ecs.features.drag_feature.components"

local filter = evolved.builder()
    :include(cmp.Draggable)
    :include(icmp.InputPress)
    :include(icmp.InputPosition)
    :include(gcmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for _, ety in ipairs(ety_list) do
        evolved.remove(ety, icmp.InputPress)

        local id = evolved.get(ety, gcmp.GameobjectId)
        local ipos = evolved.get(ety, icmp.InputPosition)
        local pos = go.get_position(id)
        local dx = pos.x - ipos.x
        local dy = pos.y - ipos.y

        evolved.set(ety, cmp.BeginDrag, { dx = dx, dy = dy, dz = pos.z })
    end
end

return filter:execute(update):build()