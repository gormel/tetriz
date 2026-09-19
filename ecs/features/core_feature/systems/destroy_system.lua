local evolved = require "lib.evolved"
local cmp = require "ecs.features.core_feature.components"

local filter = evolved
    .builder()
    :include(cmp.Destroy)

local function update(chunk, ety_list, ety_c, dt)
    for i = 1, ety_c do
        evolved.clear(ety_list[i])
        evolved.remove(ety_list[i])
    end
end

return filter:execute(update):build()