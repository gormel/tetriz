local evolved = require("lib.evolved")
local dbg = require "dbg.dbg"

local components = {
    InputAction = evolved.id(),
    InputPosition = evolved.id(), -- {x, y}
    InputPress = evolved.id(),
    InputRelease = evolved.id(),
    InputOver = evolved.id(),
}
dbg.reg_components(components)
return components