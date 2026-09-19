local evolved = require "lib.evolved"
local cmp = require "ecs.features.drag_feature.components"

local filter = evolved.builder()
    :include(cmp.DragComplete)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        evolved.remove(entity, cmp.DragComplete)
    end
end

return filter:execute(update):build()