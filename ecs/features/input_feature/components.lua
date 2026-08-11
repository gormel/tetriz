local evolved = require("lib.evolved")

return {
    InputAction = evolved.id(),
    InputPosition = evolved.id(), -- {x, y}
    InputPress = evolved.id(),
    InputRelease = evolved.id(),
    InputOver = evolved.id(),
}