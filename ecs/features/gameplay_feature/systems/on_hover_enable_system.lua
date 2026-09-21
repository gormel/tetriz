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

        evolved.remove(entity, cmp.Disabled)
        --msg.post(msg.url(nil, id, cfg.field.sprite_fragment), "enable")
        go.set(msg.url(nil, id, nil), "position.z", 0)
    end
end

return filter:execute(update):build()