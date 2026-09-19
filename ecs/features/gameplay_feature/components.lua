local evolved = require("lib.evolved")

return {
    Source = evolved.id(), --url
    PlaceInProgress = evolved.id(),
    FigureCfg = evolved.id(), --cfg
    RollFigure = evolved.id(),
    SourceFigureCfg = evolved.id(), --cfg
    AttachFigure = evolved.id(),
    FigureView = evolved.id(), --go_id[]
    FigureSourceRef = evolved.id(), --ety
}