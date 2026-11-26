local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.FigureSource)
    :include(cmp.RollFigure)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        evolved.remove(entity, cmp.RollFigure)

        local figure_idx = math.random(#cfg.figures)

        local roll_cfg = cfg.figures[figure_idx];
        evolved.set(entity, cmp.SourceFigureCfg, roll_cfg)
        evolved.set(entity, cmp.AttachFigure, { cfg = roll_cfg, factory = cfg.field.tile_factory })
    end
end

return {
    name = "roll_figure_system",
    filter = filter:execute(update):build(),
}