local evolved = require "lib.evolved"
local icmp = require "ecs.features.input_feature.components"
local gocmp = require "ecs.features.gameobject_feature.components"
local ccmp = require "ecs.features.core_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(icmp.InputPress)
    :include(cmp.FigureCfg)
    :include(gocmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        evolved.set(entity, ccmp.Destroy, true)
        pprint("++++destroy", entity)
    end
end

return filter:execute(update):build()