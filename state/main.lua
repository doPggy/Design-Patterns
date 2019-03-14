local context = require "context"
local stateWork = require "state_work"

-- 生成一个context实例，成员有hour=9
local c = context:new()
local s = stateWork:new()
c:setState(s)

c.hour = 10
c:request()
c.hour = 9
c:request()

c.hour = 13
c:request()

c.hour = 16
c:request()
