local evolved = require("lib.evolved")

return {
    InDrag = evolved.id(),
    Draggable = evolved.id(),
    DragOffset = evolved.id(), --{x, y}
    BeginDrag = evolved.id(),
}