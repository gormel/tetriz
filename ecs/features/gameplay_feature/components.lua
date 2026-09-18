local evolved = require("lib.evolved")

return {
    Source = evolved.id(), --url
    PlaceInProgress = evolved.id(),
    Fugure = evolved.id(), --cfg
    RollFigure = evolved.id(),
    SourceFigure = evolved.id(), --cfg
    AttachFigure = evolved.id(),
    FigureView = evolved.id(), --go_id[]
}