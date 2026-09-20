local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local gocmp = require "ecs.features.gameobject_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.InitializeField)
    :include(gocmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        local id = evolved.get(entity, gocmp.GameobjectId)

        local tiles = {}
        local halfx = math.ceil(cfg.field.sx / 2)
        local halfy = math.ceil(cfg.field.sy / 2)
        for y = 1, cfg.field.sy do
            for x = 1, cfg.field.sx do
                local posx = x - halfx
                local posy = y - halfy

                local tile = evolved.id()
                evolved.set(tile, gocmp.GameobjectCreate, {
                    url = cfg.field.tile_factory,
                    position = vmath.vector3(posx * cfg.tile.size.x, posy * cfg.tile.size.y, 0),
                    parent_id = id,
                })
                evolved.set(tile, cmp.FieldTile, entity)

                table.insert(tiles, tile)
            end
        end

        evolved.set(entity, cmp.Field, tiles)

        evolved.remove(entity, cmp.InitializeField)
    end
end

return filter:execute(update):build()