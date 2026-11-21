local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local gocmp = require "ecs.features.gameobject_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.FigurePlaceholder)
    :include(cmp.FigureCfg)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        if evolved.has(cmp.TargetTile, cmp.TargetTile) and evolved.has(cmp.PlacingFigure, cmp.PlacingFigure) then
            local target_tile_ety = evolved.get(cmp.TargetTile, cmp.TargetTile)
            local tile = evolved.get(target_tile_ety, cmp.FieldTile)
            local placing_figure = evolved.get(cmp.PlacingFigure, cmp.PlacingFigure)
            if evolved.has(tile.body, gocmp.GameobjectId) and evolved.has(placing_figure.placeholder, gocmp.GameobjectId) then
                local x, y = utils.field_xy(tile.idx)
                local figure_cfg = evolved.get(entity, cmp.FigureCfg)
                local field = evolved.get(tile.field, cmp.Field)
                if utils.can_place_figure(figure_cfg, x, y, field) then
                    local placeholder_id = evolved.get(placing_figure.placeholder, gocmp.GameobjectId)
                    local body_id = evolved.get(tile.body, gocmp.GameobjectId)
                    local tile_pos = go.get_world_position(body_id)
                    local placeholder_pos = go.get_position(placeholder_id)
                    placeholder_pos.x = tile_pos.x
                    placeholder_pos.y = tile_pos.y
                    go.set_position(placeholder_pos, placeholder_id)

                    evolved.set(entity, gocmp.Enable)
                else
                    evolved.set(entity, gocmp.Disable)
                end
            else
                evolved.set(entity, gocmp.Disable)
            end
        else
            evolved.set(entity, gocmp.Disable)
        end
    end
end

return {
    name = "place_placeholder_system",
    filter = filter:execute(update):build(),
}