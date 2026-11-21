local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local dcmp = require "ecs.features.drag_feature.components"
local gcmp = require "ecs.features.gameobject_feature.components"
local icmp = require "ecs.features.input_feature.components"
local gocmp = require "ecs.features.gameobject_feature.components"
local cmp = require "ecs.features.gameplay_feature.components"


local filter = evolved.builder()
    :include(cmp.Source)
    :include(cmp.SourceFigureCfg)
    :include(gcmp.GameobjectId)
    :include(icmp.InputPress)
    :include(icmp.InputPosition)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        evolved.remove(entity, icmp.InputPress)
        local url = evolved.get(entity, cmp.Source)
        local figure_cfg = evolved.get(entity, cmp.SourceFigureCfg)

        local id = evolved.get(entity, gcmp.GameobjectId)
        local pos = go.get_position(id)
        local ipos = evolved.get(entity, icmp.InputPosition)
        local dx = pos.x - ipos.x
        local dy = pos.y - ipos.y

        local in_drag = evolved.id()
        evolved.set(in_drag, gcmp.GameobjectCreate, { url = url, position = pos })
        evolved.set(in_drag, dcmp.BeginDrag, { dx = dx, dy = dy, dz = pos.z })
        evolved.set(in_drag, dcmp.Draggable, true)
        evolved.set(in_drag, cmp.AttachFigure, { cfg = figure_cfg, factory = cfg.field.tile_factory })
        evolved.set(in_drag, cmp.FigureSourceRef, entity)

        local placeholder = evolved.id()
        evolved.set(placeholder, gocmp.Disable)
        evolved.set(placeholder, cmp.FigurePlaceholder, true)
        evolved.set(placeholder, gcmp.GameobjectCreate, { url = url, position = pos })
        evolved.set(placeholder, cmp.AttachFigure, { cfg = figure_cfg, factory = cfg.field.tile_placeholder_factory })

        evolved.set(cmp.PlacingFigure, cmp.PlacingFigure, { figure = in_drag, placeholder = placeholder })
    end
end

return {
    name = "begin_place_system",
    filter = filter:execute(update):build(),
}