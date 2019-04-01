-- 使用简单工厂模式将判断逻辑转移至内部
local strategyReturn = require "strategy_return"
local strategyOff = require "strategy_off"

local _M = {}


function _M:new(o)
    o = o or {}

    if o.t == 1 then
        o.strategy = strategyReturn:new({ l = 200, off = 20 })
    elseif o.t == 2 then
        o.strategy = strategyOff:new({ off = 0.3 })
    end

    setmetatable(o, self)
    self.__index = self

    return o
end

function _M:interface(input)
    -- 这个就是最后相同的公共结果
    return self.strategy:algoInterface(input)
end

return _M
