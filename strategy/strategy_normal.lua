-- 策略子类
-- 正常收费，无优惠
local strategy = require "strategy"
local _M = strategy:new()

-- function _M:new(o)
--     o = o or {}

--     setmetatable(o, self)
--     self.__index = self

--     return o
-- end

function _M:algoInterface(input)
    return input
end

return _M
