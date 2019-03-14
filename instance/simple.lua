local win = {}

function win:new(opt)
    opt = opt or {}

    self.__index = self
    setmetatable(opt, self)
    return opt
end



---继承自win 多个子类
local win1 = win:new()
local win2 = win:new()
local win3 = win:new()
local win4 = win:new()
local win5 = win:new()




--- 记录实例化次数
local win1Num = 0 
local win2Num = 0 
local win3Num = 0 
local win4Num = 0 
local win5Num = 0 





---main
local w1
if win1Num == 0 then
    w1 = win1:new()
end

