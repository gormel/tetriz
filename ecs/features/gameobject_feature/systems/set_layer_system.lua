local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local dbg = require "dbg.dbg"
local utils = require "cfg.utils"
local cmp = require "ecs.features.gameobject_feature.components"

local filter = evolved.builder()
    :include(cmp.SetLayer)
    :include(cmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        local layer = evolved.get(entity, cmp.SetLayer)
        local id = evolved.get(entity, cmp.GameobjectId)
        if go.exists(id) then
            local url = msg.url(nil, id, nil)
            pcall(go.set, url, "position.z", layer)
        end

        evolved.remove(entity, cmp.SetLayer)
    end
end

return {
    name = "set_layer_system",
    filter = filter:execute(update):build(),
}