local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local gocmp = require("ecs.features.gameobject_feature.components")
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.CreateField)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        local id = evolved.get(entity, cmp.CreateField)

        evolved.set(entity, gocmp.GameobjectLink, id)
        evolved.set(entity, cmp.InitializeField, true)
        evolved.set(entity, gocmp.SetLayer, cfg.layers.FIELD_BG)

        evolved.remove(entity, cmp.CreateField)
    end
end

return {
    name = "create_field_system",
    filter = filter:execute(update):build(),
}