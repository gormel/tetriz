local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local gcmp = require "ecs.features.gameplay_feature.components"

local utils = {}

function utils.field_xy(idx)
    return (idx - 1) % cfg.field.sx + 1, math.floor((idx - 1) / cfg.field.sx) + 1
end

function utils.field_idx(x, y)
    return (x - 1) + (y - 1) * cfg.field.sx + 1
end

function utils.can_place_figure(figure_cfg, x, y, field)
    for _, dxdy in ipairs(figure_cfg.points) do
        local tx = x + dxdy.x
        local ty = y + dxdy.y
        if tx < 1 or tx > cfg.field.sx then
            return false
        end

        if ty < 1 or ty > cfg.field.sy then
            return false
        end

        local target_tile_ety = field[utils.field_idx(tx, ty)]
        if (evolved.has(target_tile_ety, gcmp.FieldTileBusy)) then
            return false
        end
    end

    return true
end

return utils