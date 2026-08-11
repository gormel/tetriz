return {
    preprocess = {

    },
    process = {
        require("ecs.features.gameobject_feature.systems.create_gameobject_system")
    },
    postprocess = {
        require("ecs.features.gameobject_feature.systems.destroy_gameobject_system")
    }
}