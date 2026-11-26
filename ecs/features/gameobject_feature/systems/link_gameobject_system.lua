local evolved = require "lib.evolved"
local cmp = require "ecs.features.gameobject_feature.components"

local filter = evolved.builder()
    :include(cmp.GameobjectLink)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        local id = evolved.get(entity, cmp.GameobjectLink)
        
        if go.exists(id) then
            evolved.set(entity, cmp.GameobjectId, id)
            pcall(go.set, msg.url(nil, id, "input"), "entity", entity)
        end

        evolved.remove(entity, cmp.GameobjectLink)
    end
end

return {
    name = "link_gameobject_system",
    filter = filter:execute(update):build(),
}