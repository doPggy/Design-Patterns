-- 策略子类
-- 打折:
local strategy = require "strategy"
local _M = strategy:new()

function _M:new(o)
    o = o or {}
    o.off = o.off or 0

    setmetatable(o, self)
    self.__index = self

    return o
end

function _M:algoInterface(input)
    return input * (self.off)
end

return _M
