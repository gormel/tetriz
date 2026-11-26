local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local gocmp = require "ecs.features.gameobject_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.AttachFigure)
    :include(gocmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        if evolved.has(entity, cmp.FigureView) then
            local ids = evolved.get(entity, cmp.FigureView)
            for _, id in ipairs(ids) do
                if go.exists(id) then
                    go.delete(id, true)
                end
            end
        end

        local figure = evolved.get(entity, cmp.AttachFigure)
        evolved.set(entity, cmp.FigureCfg, figure.cfg)
        local root_id = evolved.get(entity, gocmp.GameobjectId)

        if go.exists(root_id) then
            local tiles = {}
            for _, pos in ipairs(figure.cfg.points) do
                local tile = factory.create(figure.factory, vmath.vector3(pos.x * cfg.tile.size.x, pos.y * cfg.tile.size.y, 0))
                go.set_parent(tile, root_id, false)
                table.insert(tiles, tile)
            end

            evolved.set(entity, cmp.FigureView, tiles)
        end

        evolved.remove(entity, cmp.AttachFigure)
    end
end

return {
    name = "attach_figure_system",
    filter = filter:execute(update):build(),
}