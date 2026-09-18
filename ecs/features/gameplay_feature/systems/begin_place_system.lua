local evolved = require "lib.evolved"
local dcmp = require("ecs.features.drag_feature.components")
local gcmp = require("ecs.features.gameobject_feature.components")
local icmp = require("ecs.features.input_feature.components")
local cmp = require "ecs.features.gameplay_feature.components"


local filter = evolved.builder()
    :include(cmp.Source)
    :include(gcmp.GameobjectId)
    :include(icmp.InputPress)
    :include(icmp.InputPosition)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        evolved.remove(entity, icmp.InputPress)
        local url = evolved.get(entity, cmp.Source)

        local id = evolved.get(entity, gcmp.GameobjectId)
        local pos = go.get_position(id)
        local ipos = evolved.get(entity, icmp.InputPosition)
        local dx = pos.x - ipos.x
        local dy = pos.y - ipos.y

        local in_drag = evolved.id()
        evolved.set(in_drag, gcmp.GameobjectCreate, { url = url, position = pos })
        evolved.set(in_drag, cmp.PlaceInProgress, true)
        evolved.set(in_drag, dcmp.BeginDrag, { dx = dx, dy = dy, dz = pos.z })
        evolved.set(in_drag, dcmp.Draggable, true)
    end
end

return filter:execute(update):build()