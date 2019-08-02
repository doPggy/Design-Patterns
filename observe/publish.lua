-- 主题类
local subject = {}
function subject:new( o )
    o = o or {}
    o.observer = o.observer or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

-- 通知状态接口
function subject:notify()
    for _, observer in ipairs(self.observer) do
        observer:update()
    end
end

-- 增加一个被通知的观察者
function subject:attach(observer)
    table.insert(self.observer, observer)
end

-- 剔除一个被通知的观察者
function subject:detach(observerToBeDetach)
    for index, observer in ipairs(self.observer) do
        -- 会自动调用 _eq 元方法, 但是两者一样的话就不会调用，
        -- 直接是相等，或者可以使用 rawequal
        if observer == observerToBeDetach then
            table.remove(self.observer, index)
        end
    end
end

return subject