local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local gocmp = require "ecs.features.gameobject_feature.components"
local icmp = require "ecs.features.input_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(gocmp.GameobjectId)
    :include(cmp.FieldTile)
    :exclude(cmp.Disabled)
    :exclude(icmp.InputOver)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        local id = evolved.get(entity, gocmp.GameobjectId)

        local url = msg.url(nil, id, nil)
        local z = go.get(url, "position.z")

        evolved.set(entity, cmp.Disabled, z)
        go.set(url, "position.z", -2)
    end
end

return filter:execute(update):build()