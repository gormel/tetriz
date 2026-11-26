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
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        local id = evolved.get(entity, gcmp.GameobjectId)
        
        if go.exists(id) then
            local ipos = evolved.get(entity, icmp.InputPosition)
            local dxy = evolved.get(entity, cmp.DragOffset)

            local new_pos = vmath.vector3(ipos.x + dxy.x, ipos.y + dxy.y, dxy.z)
            go.set_position(new_pos, id)
        end

        evolved.remove(entity, icmp.InputPosition)
    end
end

return {
    name = "process_drag_system",
    filter = filter:execute(update):build(),
}