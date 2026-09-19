local evolved = require "lib.evolved"
local cmp = require "ecs.features.gameobject_feature.components"
local ccmp = require("ecs.features.core_feature.components")

local filter = evolved
    .builder()
    :include(ccmp.Destroy)
    :include(cmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for i = 1, ety_c do
        local ety = ety_list[i]
        local id = evolved.get(ety, cmp.GameobjectId)
        pcall(go.delete, id, true)
    end
end

return filter:execute(update):build()