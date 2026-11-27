local evolved = require "lib.evolved"
local messages = require "cfg.messages"
local broadcast = require "ludobits.m.broadcast"
local cfg = require "cfg.cfg"
local utils = require "cfg.utils"
local cmp = require "ecs.features.gameplay_feature.components"

local filter = evolved.builder()
    :include(cmp.Score)
    :include(cmp.SetScore)

local function update(chunk, ety_list, ety_c, dt)
    for i = ety_c, 1, -1 do
        local entity = ety_list[i]
        local new_value = evolved.get(entity, cmp.SetScore)
        
        evolved.set(entity, cmp.Score, new_value)
        evolved.remove(entity, cmp.SetScore)

        broadcast.send(messages.SET_SCORE, { value = new_value, add_value = nil })
    end
end

return {
    name = "set_score_system",
    filter = filter:execute(update):build(),
}