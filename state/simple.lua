
local _M = {}

function _M.new(self, opt)
    opt = opt or {}
    opt.hour = opt.hour or 9

    self.__index = self
    setmetatable(opt, self)
    return opt
end

function _M.date(self)
    if self.hour > 9 and self.hour < 12 then
        print("上班")
    elseif self.hour < 14 then
        print("吃饭, 睡觉")
    elseif self.hour < 18 then
        print("学习")
    end
end

--------------------------------------------

local o = _M:new({hour = 9})
o.hour = 10
o:date()
o.hour = 11
o:date()
o.hour = 12
o:date()
o.hour = 16
o:date()


