local evolved = require "lib.evolved"
local cmp = require "ecs.features.drag_feature.components"

local filter = evolved.builder()
    :include(cmp.DragComplete)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        evolved.remove(entity, cmp.DragComplete)
    end
end

return {
    name = "clear_drag_complete_system",
    filter = filter:execute(update):build(),
}