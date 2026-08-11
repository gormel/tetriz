local evolved = require "lib.evolved"
local icmp = require("ecs.features.input_feature.components")
local gcmp = require("ecs.features.gameobject_feature.components")
local cmp = require "ecs.features.drag_feature.components"

local filter = evolved
    .builder()
    :include(cmp.InDrag)
    :include(cmp.DragOffset)
    :include(icmp.InputPosition)
    :include(gcmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        local id = evolved.get(entity, gcmp.GameobjectId)
        
        local ipos = evolved.get(entity, icmp.InputPosition)
        local dxy = evolved.get(entity, cmp.DragOffset)

        local new_pos = vmath.vector3(ipos.x + dxy.x, ipos.y + dxy.y, dxy.z)
        go.set_position(new_pos, id)

        evolved.remove(entity, icmp.InputPosition)
    end
end

return filter:execute(update):build()