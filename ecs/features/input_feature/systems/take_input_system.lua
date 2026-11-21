local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local cmp = require "ecs.features.input_feature.components"

local filter = evolved.builder()
    :include(cmp.InputAction)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        evolved.remove(entity, cmp.InputAction)
        evolved.remove(entity, cmp.InputPosition)
        evolved.remove(entity, cmp.InputOver)
        evolved.remove(entity, cmp.InputRelease)
        evolved.remove(entity, cmp.InputPress)
    end
end

return {
    name = "take_input_system",
    filter = filter:execute(update):build(),
}