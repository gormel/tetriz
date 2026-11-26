local evolved = require "lib.evolved"
local cmp = require "ecs.features.core_feature.components"

local filter = evolved
    .builder()
    :include(cmp.Destroy)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        evolved.clear(ety_list[i])
        evolved.remove(ety_list[i])
    end
end

return {
    name = "destroy_system",
    filter = filter:execute(update):build(),
}