-- 中午睡觉吃饭状态
local state = require "state"
local stateStudy = require "state_study"

-- 继承自state
local _M = state:new()

function _M:date(context)
    -- 由于变化是有前置步骤的，所以这里不用完整判断
    if context.hour <= 14 then
        print("吃饭，睡觉")
    else
        -- 睡觉完就学习
        -- 将状态更改为学习的状态
        local s = stateStudy:new()
        context:setState(s)
        context:request()
    end
end

return _M
