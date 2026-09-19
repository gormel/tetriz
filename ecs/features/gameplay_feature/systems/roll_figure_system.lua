local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.Source)
    :include(cmp.RollFigure)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        evolved.remove(entity, cmp.RollFigure)

        local figure_idx = math.random(#cfg.figures)

        local roll_cfg = cfg.figures[figure_idx];
        evolved.set(entity, cmp.SourceFigureCfg, roll_cfg)
        evolved.set(entity, cmp.AttachFigure, roll_cfg)
    end
end

return filter:execute(update):build()