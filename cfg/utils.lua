local cfg = require "cfg.cfg"

local utils = {}

function utils.field_xy(idx)
    return (idx - 1) % cfg.field.sx + 1, math.floor((idx - 1) / cfg.field.sx) + 1
end


function utils.field_idx(x, y)
    return (x - 1) + (y - 1) * cfg.field.sx + 1
end

return utils