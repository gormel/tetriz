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

        local id = factory.create(create.url, create.position)
        if create.parent_id then
            go.set_parent(id, create.parent_id, false)
        end
        evolved.set(ety, cmp.GameobjectLink, id)
    end
end

return filter:execute(update):build()