local evolved = require "lib.evolved"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local messages = require "cfg.messages"
local broadcast = require "ludobits.m.broadcast"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.Score)
    :include(cmp.AddScore)

local function update(chunk, ety_list, ety_c, dt)
    for _, entity in ipairs(ety_list) do
        local add_value = evolved.get(entity, cmp.AddScore)
        local value = evolved.get(entity, cmp.Score)
        evolved.set(entity, cmp.Score, value + add_value)
        evolved.remove(entity, cmp.AddScore)

        broadcast.send(messages.SET_SCORE, { value = value + add_value, add_value = add_value })
    end
end

return {
    name = "add_score_system",
    filter = filter:execute(update):build(),
}