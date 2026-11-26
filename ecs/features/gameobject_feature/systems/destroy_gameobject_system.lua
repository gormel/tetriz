local evolved = require "lib.evolved"
local cmp = require "ecs.features.gameobject_feature.components"
local ccmp = require("ecs.features.core_feature.components")

local filter = evolved
    .builder()
    :include(ccmp.Destroy)
    :include(cmp.GameobjectId)
    :include(cmp.GameobjectSource)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local ety = ety_list[i]
        local id = evolved.get(ety, cmp.GameobjectId)
        if go.exists(id) then
            pcall(go.delete, id, true)
        end
        evolved.remove(ety, cmp.GameobjectId)
    end
end

return {
    name = "destroy_gameobject_system",
    filter = filter:execute(update):build(),
}