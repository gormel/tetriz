local evolved = require "lib.evolved"
local cmp = require "ecs.features.gameobject_feature.components"

local filter = evolved
    .builder()
    :include(cmp.GameobjectCreate)

local function update(chunk, ety_list, ety_c, dt)
    for i = 1, ety_c do
        local ety = ety_list[i]
        local create = evolved.get(ety, cmp.GameobjectCreate)
        evolved.remove(ety, cmp.GameobjectCreate)

        local id = factory.create(create)
        evolved.set(ety, cmp.GameobjectId, id)
        go.set(msg.url(nil, id, "click"), "entity", ety)
    end
end

return filter:execute(update):build()