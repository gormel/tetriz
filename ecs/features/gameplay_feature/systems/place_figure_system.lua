local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local icmp = require "ecs.features.input_feature.components"
local gocmp = require "ecs.features.gameobject_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.FieldTileBody)
    :include(icmp.InputRelease)
    :include(icmp.InputOver)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        evolved.remove(entity, icmp.InputRelease)
        if evolved.has(cmp.PlacingFigure, cmp.PlacingFigure) then
            local figure = evolved.get(cmp.PlacingFigure, cmp.PlacingFigure)
            local figure_cfg = evolved.get(figure.figure, cmp.FigureCfg)
            local tile_ety = evolved.get(entity, cmp.FieldTileBody)
            local tile = evolved.get(tile_ety, cmp.FieldTile)
            local field = evolved.get(tile.field, cmp.Field)
            local x, y = utils.field_xy(tile.idx)

            if utils.can_place_figure(figure_cfg, x, y, field) then
                for _, dxdy in ipairs(figure_cfg.points) do
                    local idx = utils.field_idx(x + dxdy.x, y + dxdy.y)
                    local target_tile_ety = field[idx]
                    local target_tile = evolved.get(target_tile_ety, cmp.FieldTile)
                    evolved.set(target_tile.body, gocmp.Enable)
                    evolved.set(target_tile_ety, cmp.FieldTileBusy, true)
                end

                if evolved.has(figure.figure, cmp.FigureSourceRef) then
                    local source_ety = evolved.get(figure.figure, cmp.FigureSourceRef)
                    evolved.set(source_ety, cmp.RollFigure, true)
                end

            end
        end
    end
end

return {
    name = "place_figure_system",
    filter = filter:execute(update):build(),
}