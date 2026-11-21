local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local cmp = require "ecs.features.gameobject_feature.components"

local filter = evolved.builder()
    :include(cmp.Disable)
    :include(cmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        evolved.remove(entity, cmp.Disable)
        if not evolved.has(entity, cmp.Disabled) then
            local id = evolved.get(entity, cmp.GameobjectId)

            local url = msg.url(nil, id, nil)
            local z = go.get(url, "position.z")
            go.set(url, "position.z", cfg.layers.DISABLED)

            evolved.set(entity, cmp.Disabled, z)

            if evolved.has(entity, cmp.Enabled) then
                evolved.remove(entity, cmp.Enabled)
            end
        end
    end
end

return {
    name = "disable_system",
    filter = filter:execute(update):build(),
}