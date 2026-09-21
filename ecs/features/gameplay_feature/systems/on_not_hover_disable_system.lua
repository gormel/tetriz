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

        evolved.set(entity, cmp.Disabled)
        go.set(msg.url(nil, id, nil), "position.z", -2)
        --msg.post(msg.url(nil, id, cfg.field.sprite_fragment), "disable")
    end
end

return filter:execute(update):build()