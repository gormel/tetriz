local evolved = require "lib.evolved"
local cmp = require "ecs.features.gameobject_feature.components"

local filter = evolved.builder()
    :include(cmp.GameobjectLink)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        local id = evolved.get(entity, cmp.GameobjectLink)
        
        evolved.set(entity, cmp.GameobjectId, id)
        pcall(go.set, msg.url(nil, id, "input"), "entity", entity)

        evolved.remove(entity, cmp.GameobjectLink)
    end
end

return filter:execute(update):build()