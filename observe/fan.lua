-- 观察者类
local observer = {}
function observer:new( o )
    o         = o or {}
    o.subject = o.subject or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

-- 当 subject 更新状态(notify) 执行的反应
function observer:update()
end

return observer