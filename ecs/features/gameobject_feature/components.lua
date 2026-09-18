local evolved = require "lib.evolved"
return {
    GameobjectCreate = evolved.id(), --{ url, position }
    GameobjectId = evolved.id(), --hash(inst)
}