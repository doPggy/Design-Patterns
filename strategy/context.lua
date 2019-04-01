-- context，保留父类策略的引用，利用多态来执行具体的策略
-- 但是lua的多态不能像java那样(否则需要自己设计一个class)
local _M = {}

function _M:new(o)
    o = o or {}
    o.strategy = o.strategy or {} -- class

    setmetatable(o, self)
    self.__index = self
    -- self._strategy = {} -- class

    return o
end

function _M:interface(input)
    -- 这个就是最后相同的公共结果
    return self.strategy:algoInterface(input)
end

return _M
