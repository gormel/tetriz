return {
    tile = {
        factory = "/root#tile_factory",
        size = { x = 30, y = 30 },
    },
    spawners = {
        { url = "/logo_spawner" },
        { url = "/logo_spawner1" },
        { url = "/logo_spawner2" },
    },
    field = {
        url = "/field",
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