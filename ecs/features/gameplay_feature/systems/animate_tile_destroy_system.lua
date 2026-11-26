local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local gocmp = require "ecs.features.gameobject_feature.components"
local ccmp = require "ecs.features.core_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local ANIMATE_TIME = 0.4

local filter = evolved.builder()
    :include(cmp.AnimateTileDestroy)
    :include(gocmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        local id = evolved.get(entity, gocmp.GameobjectId)

        if go.exists(id) then
            local ety = entity
            go.animate(id, "scale", go.PLAYBACK_ONCE_FORWARD, vmath.vector3(0.1, 0.1, 0.1), go.EASING_INBACK, ANIMATE_TIME, 0, function ()
                evolved.set(ety, ccmp.Destroy, true)
            end)
        end

        evolved.remove(entity, cmp.AnimateTileDestroy)
    end
end

return {
    name = "animate_tile_destroy_system",
    filter = filter:execute(update):build(),
}