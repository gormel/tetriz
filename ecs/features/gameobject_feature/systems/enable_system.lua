local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local cmp = require "ecs.features.gameobject_feature.components"

local filter = evolved.builder()
    :include(cmp.Enable)
    :include(cmp.GameobjectId)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        evolved.remove(entity, cmp.Enable)
        if not evolved.has(entity, cmp.Enabled) then
            evolved.set(entity, cmp.Enabled)

            if evolved.has(entity, cmp.Disabled) then
                local zvalue = evolved.get(entity, cmp.Disabled)
                local id = evolved.get(entity, cmp.GameobjectId)

                local url = msg.url(nil, id, nil)
                go.set(url, "position.z", zvalue)
                
                evolved.remove(entity, cmp.Disabled)
            end
        end
    end
end

return {
    name = "enable_system",
    filter = filter:execute(update):build(),
}