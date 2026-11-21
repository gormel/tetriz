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
            local pass = true
            for _, dxdy in ipairs(figure_cfg.points) do
                local tx = x + dxdy.x
                local ty = y + dxdy.y
                if tx < 1 or tx > cfg.field.sx then
                    pass = false
                    break
                end

                if ty < 1 or ty > cfg.field.sy then
                    pass = false
                    break
                end

                local target_tile_ety = field[utils.field_idx(tx, ty)]
                if (evolved.has(target_tile_ety, cmp.FieldTileBusy)) then
                    pass = false
                    break
                end
            end

            if pass then
                for _, dxdy in ipairs(figure_cfg.points) do
                    local idx = utils.field_idx(x + dxdy.x, y + dxdy.y)
                    local target_tile_ety = field[idx]
                    local target_tile = evolved.get(target_tile_ety, cmp.FieldTile)
                    evolved.set(target_tile.body, gocmp.Enable)
                    evolved.set(target_tile_ety, cmp.FieldTileBusy, true)

                end
            end
        end
    end
end

return {
    name = "place_figure_system",
    filter = filter:execute(update):build(),
}