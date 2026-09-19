return {
    process = {
        require("ecs.features.drag_feature.systems.begin_drag_by_input_system"),
        require("ecs.features.drag_feature.systems.begin_drag_system"),
        require("ecs.features.drag_feature.systems.process_drag_system"),
        require("ecs.features.drag_feature.systems.clear_drag_complete_system"),
        require("ecs.features.drag_feature.systems.end_drag_system"),
    }
}