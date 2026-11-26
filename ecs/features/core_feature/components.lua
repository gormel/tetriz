local evolved = require("lib.evolved")
local dbg = require "dbg.dbg"
local components = {
    Destroy = evolved.id()
}
dbg.reg_components(components)
return components