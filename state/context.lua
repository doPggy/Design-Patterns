-- context类，维护一个具体的state实例，这个实例描述当前状态
local _M = {}
-- local stateWork = require "state_work"


function _M.new(self, opt)
    opt = opt or {}
    -- 当前时间
    opt.hour = opt.hour or 9

    self.__index = self
    setmetatable(opt, self)
    return opt
end

function _M:setState(state)
    self.state = state
end

-- 状态变化统一调用接口
function _M:request()
    self.state:date(self)
end

return _M
