local evolved = require "lib.evolved"

local dbg = {}
dbg.components = {}

function dbg.reg_components(components)
    for name, id in pairs(components) do
        dbg.components[id] = name
    end
end

function dbg.get_components(entity)
    local components = {}
    for id, name in pairs(dbg.components) do
        if evolved.has(entity, id) then
            local value = evolved.get(entity, id)
            components[name] = value
        end
    end

    return components
end

return dbg