

local flight = {}

function flight:new( o )
    o = o or {}

    setmetatable(o, self)
    self.__index = self

    return o
end

-- 很明显，降落和起飞点也可以成为一个属性
-- function flight:setFromAndTo( from, to )
--     self.from = from
--     self.to = to
-- end

-- 起飞 operation1
function flight:takeOff()
end

-- 降落 operation2
function flight:arrive()
end

-- 一次航班，也就是 templateMethod
-- 这里定义了逻辑步骤
function flight:oneFlight()
    self:takeOff()
    self:arrive()
end

-- 继承自 flight
local flight1 = flight:new() 

function flight1:takeOff()
    print("先买个鱼丸")
    print("从福州起飞")
end

function flight1:arrive()
    print("鱼丸汤扔了")
    print("在厦门降落")
end




-- 继承自 flight
local flight2 = flight:new() 

function flight2:takeOff()
    print("先买个米线糊")
    print("从厦门起飞")
end

function flight2:arrive()
    print("糊吃完了")
    print("在北京降落")
end

local f1 = flight1:new()
f1:oneFlight()

print('----------')
local f2 = flight2:new()
f2:oneFlight()

