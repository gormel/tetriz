local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local gocmp = require("ecs.features.gameobject_feature.components")
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.CreateField)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        local id = evolved.get(entity, cmp.CreateField)

        evolved.set(entity, gocmp.GameobjectLink, id)
        evolved.set(entity, cmp.InitializeField, true)

        evolved.remove(entity, cmp.CreateField)
    end
end

return filter:execute(update):build()