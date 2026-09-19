local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local gocmp = require "ecs.features.gameobject_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.AttachFigure)
    :include(gocmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        if evolved.has(entity, cmp.FigureView) then
            local ids = evolved.get(entity, cmp.FigureView)
            for i, id in ipairs(ids) do
                go.delete(id, true)
            end
        end

        local figure = evolved.get(entity, cmp.AttachFigure)
        local root_id = evolved.get(entity, gocmp.GameobjectId)

        local tiles = {}
        for _, pos in ipairs(figure.points) do
            local tile = factory.create(cfg.tile.factory, vmath.vector3(pos.x * cfg.tile.size.x, pos.y * cfg.tile.size.y, 0))
            go.set_parent(tile, root_id, false)
            table.insert(tiles, tile)
        end

        evolved.set(entity, cmp.FigureView, tiles)

        evolved.remove(entity, cmp.AttachFigure)
    end
end

return filter:execute(update):build()