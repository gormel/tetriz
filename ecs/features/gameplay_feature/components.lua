local evolved = require("lib.evolved")

return {
    Source = evolved.id(), --url
    FigureCfg = evolved.id(), --cfg
    RollFigure = evolved.id(),
    SourceFigureCfg = evolved.id(), --cfg
    AttachFigure = evolved.id(), --{ cfg: cfg, factory: url }
    FigureView = evolved.id(), --go_id[]
    FigurePlaceholder = evolved.id(),
    FigureSourceRef = evolved.id(), --ety (figure)
    CreateField = evolved.id(),
    InitializeField = evolved.id(),
    Field = evolved.id(), --tile_ety[]
    FieldTile = evolved.id(), --{ field: ety, body: ety, idx: int }
    FieldTileBusy = evolved.id(),
    FieldTileBody = evolved.id(), --ety (tile)
    PlacingFigure = evolved.id(), --{ figure: ety, placeholder: ety }; singletone
    TargetTile = evolved.id(), --ety; singletone
    TryCollapseField = evolved.id(),
    Score = evolved.id(), --value
    AddScore = evolved.id(), --value
}