local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local cmp = require "ecs.features.gameobject_feature.components"

local filter = evolved.builder()
    :include(cmp.GameobjectClone)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        local clone = evolved.get(entity, cmp.GameobjectClone)
        local source_ety = clone.source
        if evolved.has(source_ety, cmp.GameobjectSource) and evolved.has(source_ety, cmp.GameobjectId) then
            local source_id = evolved.get(source_ety, cmp.GameobjectId)
            if go.exists(source_id) then
                local source_factory = evolved.get(source_ety, cmp.GameobjectSource)
                evolved.set(entity, cmp.GameobjectCreate, {
                    url = source_factory,
                    position = clone.position or go.get_position(source_id),
                    scale = go.get_scale(source_id),
                    parent_id = go.get_parent(source_id),
                })
            end
        end
        evolved.remove(entity, cmp.GameobjectClone)
    end
end

return {
    name = "clone_gameobject_system",
    filter = filter:execute(update):build(),
}