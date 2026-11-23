local evolved = require "lib.evolved"
return {
    GameobjectLink = evolved.id(), --hash(inst); links existing go to ety
    GameobjectCreate = evolved.id(), --{ url, position, scale?, parent_id? }
    GameobjectId = evolved.id(), --hash(inst)
    Disable = evolved.id(),
    Disabled = evolved.id(),
    Enable = evolved.id(),
    Enabled = evolved.id(),
}