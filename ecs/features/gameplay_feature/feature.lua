return {
    process = {
        require("ecs.features.gameplay_feature.systems.roll_figure_system"),
        require("ecs.features.gameplay_feature.systems.attach_figure_system"),
        require("ecs.features.gameplay_feature.systems.begin_place_system"),
        require("ecs.features.gameplay_feature.systems.create_field_system"),
        require("ecs.features.gameplay_feature.systems.init_field_system"),
        require("ecs.features.gameplay_feature.systems.place_figure_system"),
        require("ecs.features.gameplay_feature.systems.remove_figure_system"),
        require("ecs.features.gameplay_feature.systems.target_tile_reset_system"),
        require("ecs.features.gameplay_feature.systems.target_tile_system"),
        require("ecs.features.gameplay_feature.systems.place_placeholder_system"),
        require("ecs.features.gameplay_feature.systems.try_collapse_field_system"),
        require("ecs.features.gameplay_feature.systems.add_score_system"),
        require("ecs.features.gameplay_feature.systems.animate_tile_destroy_system"),
    }
}