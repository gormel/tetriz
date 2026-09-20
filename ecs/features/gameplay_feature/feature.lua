return {
    process = {
        require("ecs.features.gameplay_feature.systems.reroll_figure_system"),
        require("ecs.features.gameplay_feature.systems.roll_figure_system"),
        require("ecs.features.gameplay_feature.systems.attach_figure_system"),
        require("ecs.features.gameplay_feature.systems.begin_place_system"),
        require("ecs.features.gameplay_feature.systems.remove_figure_system"),
        require("ecs.features.gameplay_feature.systems.create_field_system"),
        require("ecs.features.gameplay_feature.systems.init_field_system"),
    }
}