-- 状态
-- 定义一个接口以封装与context的一个特定状态相关的行为
local _M = {}

function _M.new(self, opt)
    opt = opt or {}

    self.__index = self
    setmetatable(opt, self)
    return opt
end

function _M.setContext(self, context)
    self.context = context -- context对象
end

-- 安排,也就是统一接口
-- context 维护state类的上下文
function _M.date(self, context)
end

return _M

