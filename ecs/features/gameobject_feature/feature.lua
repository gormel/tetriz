return {
    preprocess = {

    },
    process = {
        require("ecs.features.gameobject_feature.systems.clone_gameobject_system"),
        require("ecs.features.gameobject_feature.systems.create_gameobject_system"),
        require("ecs.features.gameobject_feature.systems.link_gameobject_system"),
        require("ecs.features.gameobject_feature.systems.set_layer_system"),
    },
    postprocess = {
        require("ecs.features.gameobject_feature.systems.destroy_gameobject_system"),
    }
}