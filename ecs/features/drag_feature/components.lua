local evolved = require("lib.evolved")
local dbg = require "dbg.dbg"

local components = {
    InDrag = evolved.id(),
    Draggable = evolved.id(),
    DragOffset = evolved.id(), --{x, y}
    BeginDrag = evolved.id(),
    DragComplete = evolved.id(),
}
dbg.reg_components(components)
return components