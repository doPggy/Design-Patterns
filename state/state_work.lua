-- 上班状态
local state = require "state"
local stateSleep = require "state_sleep"

-- 继承自state
local _M = state:new()

function _M:date(context)
    if context.hour >= 9 and context.hour < 12 then
        print("上班")
    else
        -- 上班后去吃饭
        -- 将状态更改为中午睡觉的状态
        local s = stateSleep:new()
        context:setState(s)
        context:request() -- 需要再驱动一次，不然没有成功转变状态
    end
end


return _M
