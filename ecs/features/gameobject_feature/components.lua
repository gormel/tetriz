local evolved = require "lib.evolved"
local dbg = require "dbg.dbg"
local components = {
    GameobjectLink = evolved.id(), --hash(inst); links existing go to ety
    GameobjectCreate = evolved.id(), --{ url(factory), position?, scale?, parent_id? }
    GameobjectSource = evolved.id(), --url(factory)
    GameobjectId = evolved.id(), --hash(inst)
    GameobjectClone = evolved.id(), --{ source: ety, position? }
    SetLayer = evolved.id(), --layer: num
}
dbg.reg_components(components)
return components