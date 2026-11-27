return {
    layers = {
        DISABLED = -2,
        BACKGROUND = -0.9,
        TILE_PLACEHOLDER = -0.5,
        FIELD_BG = -0.6,
        FIELD_TILE = 0,
        FIELD_GRID = 0.5,
        PLACING_TILE = 0.6,
    },
    scores = {
        tile = 100,
        combo = 1.5,
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
            id = "L1",
            weight = 1,
            points = {
                { x = 0, y = -1 },
                { x = 0, y = 0 },
                { x = 0, y = 1 },
                { x = 1, y = 1 },
            },
        },
        {
            id = "L2",
            weight = 1,
            points = {
                { x = -1, y = 0 },
                { x = 0, y = 0 },
                { x = 1, y = 0 },
                { x = 1, y = 1 },
            },
        },
        {
            id = "L3",
            weight = 1,
            points = {
                { x = -1, y = -1 },
                { x = 0, y = -1 },
                { x = 0, y = 0 },
                { x = 0, y = 1 },
            },
        },
        {
            id = "L4",
            weight = 1,
            points = {
                { x = -1, y = 0 },
                { x = 0, y = 0 },
                { x = 1, y = 0 },
                { x = 1, y = -1 },
            },
        },
        {
            id = "I1",
            weight = 1,
            points = {
                { x = -1, y = 0 },
                { x = 0, y = 0 },
                { x = 1, y = 0 },
                { x = 2, y = 0 },
            },
        },
        {
            id = "I2",
            weight = 1,
            points = {
                { x = 0, y = -1 },
                { x = 0, y = 0 },
                { x = 0, y = 1 },
                { x = 0, y = 2 },
            },
        },
        {
            id = "F1",
            weight = 1,
            points = {
                { x = 0, y = -1 },
                { x = 0, y = 0 },
                { x = 0, y = 1 },
                { x = -1, y = 1 },
            },
        },
        {
            id = "F2",
            weight = 1,
            points = {
                { x = -1, y = -1 },
                { x = -1, y = 0 },
                { x = 0, y = 0 },
                { x = 1, y = 0 },
            },
        },
        {
            id = "F3",
            weight = 1,
            points = {
                { x = 0, y = -1 },
                { x = 1, y = -1 },
                { x = 0, y = 0 },
                { x = 0, y = 1 },
            },
        },
        {
            id = "F4",
            weight = 1,
            points = {
                { x = -1, y = 0 },
                { x = 0, y = 0 },
                { x = 1, y = 0 },
                { x = 1, y = 1 },
            },
        },
        {
            id = "Z1",
            weight = 1,
            points = {
                { x = -1, y = 0 },
                { x = 0, y = 0 },
                { x = 0, y = 1 },
                { x = 1, y = 1 },
            },
        },
        {
            id = "Z2",
            weight = 1,
            points = {
                { x = 0, y = -1 },
                { x = 0, y = 0 },
                { x = -1, y = 0 },
                { x = -1, y = -1 },
            },
        },
        {
            id = "S1",
            weight = 1,
            points = {
                { x = 0, y = 0 },
                { x = 1, y = 0 },
                { x = -1, y = 1 },
                { x = 0, y = 1 },
            },
        },
        {
            id = "S2",
            weight = 1,
            points = {
                { x = -1, y = -1 },
                { x = -1, y = 0 },
                { x = 0, y = 0 },
                { x = 0, y = 1 },
            },
        },
        {
            id = "/1",
            weight = 1,
            points = {
                { x = 1, y = -1 },
                { x = 0, y = 0 },
                { x = -1, y = 1 },
                { x = -2, y = 2 },
            },
        },
        {
            id = "/2",
            weight = 1,
            points = {
                { x = -2, y = -2 },
                { x = -1, y = -1 },
                { x = 0, y = 0 },
                { x = 1, y = 1 },
            },
        },
        {
            id = "O",
            weight = 1,
            points = {
                { x = 0, y = 0 },
                { x = 1, y = 0 },
                { x = 0, y = 1 },
                { x = 1, y = 1 },
            },
        },
        {
            id = "T1",
            weight = 1,
            points = {
                { x = -1, y = 0 },
                { x = 0, y = 0 },
                { x = 1, y = 0 },
                { x = 0, y = 1 },
            },
        },
        {
            id = "T2",
            weight = 1,
            points = {
                { x = 0, y = -1 },
                { x = -1, y = 0 },
                { x = 0, y = 0 },
                { x = 0, y = 1 },
            },
        },
        {
            id = "T3",
            weight = 1,
            points = {
                { x = 0, y = -1 },
                { x = -1, y = 0 },
                { x = 0, y = 0 },
                { x = 1, y = 0 },
            },
        },
        {
            id = "T4",
            weight = 1,
            points = {
                { x = 0, y = -1 },
                { x = 0, y = 0 },
                { x = 1, y = 0 },
                { x = 0, y = 1 },
            },
        },
    },
}