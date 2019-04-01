-- 定义算法家族
-- 父类
-- 并且需要符合依赖倒转原则
local _M = {}

function _M:new(o)
    o = o or {}

    setmetatable(o, self)
    self.__index = self

    return o
end

function _M:algoInterface(input)
end

return _M
