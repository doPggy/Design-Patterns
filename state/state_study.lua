-- 学习状态
local state = require "state"
-- local stateStudy = require "state_study"

-- 继承自state
local _M = state:new()

function _M:date(context)
    -- 由于变化是有前置步骤的，所以这里不用完整判断
    if context.hour < 18 then
        print("学习")
    else
        -- self.context:setState(stateStudy:new())
    end
end

return _M
