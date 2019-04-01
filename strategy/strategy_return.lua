-- 策略子类
-- 满减:
local strategy = require "strategy"
local _M = strategy:new()

function _M:new(o)
    o = o or {}
    o.l = o.l or 0
    o.off = o.off or 0

    setmetatable(o, self)
    self.__index = self

    return o
end

function _M:algoInterface(input)
    return input > self.l and (input - self.off) or input
end

return _M
