local evolved = require "lib.evolved"
return {
    GameobjectLink = evolved.id(), --hash(inst)
    GameobjectCreate = evolved.id(), --{ url, position, parent_id? }
    GameobjectId = evolved.id(), --hash(inst)
}