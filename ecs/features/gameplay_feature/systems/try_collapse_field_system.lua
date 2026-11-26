local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local gocmp = require "ecs.features.gameobject_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.Field)
    :include(cmp.TryCollapseField)
    
local sq_size = 3

local function is_busy(field, x, y)
    local idx = utils.field_idx(x, y)
    return evolved.has(field[idx], cmp.FieldTileBusy)
end

local function check_line(field, y)
    for x = 1, cfg.field.sx do
        if not is_busy(field, x, y) then
            return false
        end
    end

    return true
end

local function collect_line(field, y, tiles)
    for x = 1, cfg.field.sx do
        local idx = utils.field_idx(x, y)
        table.insert(tiles, field[idx])
    end
end

local function check_column(field, x)
    for y = 1, cfg.field.sy do
        if not is_busy(field, x, y) then
            return false
        end
    end

    return true
end

local function collect_column(field, x, tiles)
    for y = 1, cfg.field.sy do
        local idx = utils.field_idx(x, y)
        table.insert(tiles, field[idx])
    end
end

local function square_coords(_x, _y)
    local mx = (_x - 1) * cfg.field.sx / sq_size + 1
    local my = (_y - 1) * cfg.field.sy / sq_size + 1

    return mx, my
end

local function check_square(field, _x, _y)
    local mx, my = square_coords(_x, _y)
    
    for x = mx, mx + sq_size - 1 do
        for y = my, my + sq_size - 1 do
            if not is_busy(field, x, y) then
                return false
            end
        end
    end

    return true
end

local function collect_square(field, _x, _y, tiles)
    local mx, my = square_coords(_x, _y)

    for x = mx, mx + sq_size - 1 do
        for y = my, my + sq_size - 1 do
            local idx = utils.field_idx(x, y)
            table.insert(tiles, field[idx])
        end
    end
end

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        evolved.remove(entity, cmp.TryCollapseField)
        local field = evolved.get(entity, cmp.Field)

        local cleanup_tiles = {}

        local combo = 0
        for y = 1, cfg.field.sy do
            if check_line(field, y) then
                collect_line(field, y, cleanup_tiles)
                combo = combo + 1
            end
        end

        for x = 1, cfg.field.sx do
            if check_column(field, x) then
                collect_column(field, x, cleanup_tiles)
                combo = combo + 1
            end
        end

        for x = 1, math.floor(cfg.field.sx / sq_size) do
            for y = 1, math.floor(cfg.field.sy / sq_size) do
                if check_square(field, x, y) then
                    collect_square(field, x, y, cleanup_tiles)
                    combo = combo + 1
                end
            end
        end

        local score = 0
        for _, tile_ety in ipairs(cleanup_tiles) do
            if evolved.has(tile_ety, cmp.FieldTileBusy) then
                evolved.remove(tile_ety, cmp.FieldTileBusy)
                local tile = evolved.get(tile_ety, cmp.FieldTile)
                evolved.set(tile.body, gocmp.SetLayer, cfg.layers.DISABLED)
                score = score + cfg.scores.tile
                
                local clone_ety = evolved.id()
                evolved.set(clone_ety, gocmp.GameobjectClone, { source = tile.body })
                evolved.set(clone_ety, gocmp.SetLayer, cfg.layers.FIELD_TILE)
                evolved.set(clone_ety, cmp.AnimateTileDestroy, true)
            end
        end

        if combo > 1 then
            score = score * cfg.scores.combo * (combo - 1)
        end

        if score > 0 then
            evolved.set(cmp.Score, cmp.AddScore, score)
        end
    end
end

return {
    name = "try_collapse_field_system",
    filter = filter:execute(update):build(),
}