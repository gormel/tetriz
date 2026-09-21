local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local gocmp = require "ecs.features.gameobject_feature.components"
local icmp = require "ecs.features.input_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(icmp.InputOver)
    :include(cmp.FieldTile)
    :include(gocmp.GameobjectId)
    :include(cmp.Disabled)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        local id = evolved.get(entity, gocmp.GameobjectId)

        local z = evolved.get(entity, cmp.Disabled)
        go.set(msg.url(nil, id, nil), "position.z", z or 0)
        evolved.remove(entity, cmp.Disabled)
    end
end

return filter:execute(update):build()