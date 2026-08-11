local evolved = require "lib.evolved"
return {
    GameobjectCreate = evolved.id(), --url(factory)
    GameobjectId = evolved.id(), --hash(inst)
}