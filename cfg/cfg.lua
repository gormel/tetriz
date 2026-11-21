return {
    layers = {
        DISABLED = -2,
        BACKGROUND = -0.9,
        TILE_PLACEHOLDER = -0.5,
        FIELD_TILE = 0,
        PLACING_TILE = 0.5,
    },
    tile = {
        size = { x = 30, y = 30 },
    },
    spawners = {
        { url = "/logo_spawner" },
        { url = "/logo_spawner1" },
        { url = "/logo_spawner2" },
    },
    field = {
        url = "/field",
        tile_factory = "/root#field_tile_fcatory",
        tile_placeholder_factory = "/root#field_tile_placeholder_fcatory",
        sprite_fragment = "sprite",
        sx = 9,
        sy = 9,
    },
    figures = {
        {
            weight = 1,
            points = {
                { x = 0, y = 0 },
                { x = 1, y = 0 },
                { x = 0, y = 1 },
            },
            factory = "/root#figure_factory",
        },
        {
            weight = 1,
            points = {
                { x = 0, y = 0 },
                { x = 1, y = 0 },
                { x = -1, y = 0 },
            },
            factory = "/root#figure_factory",
        },
    }
}