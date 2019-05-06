-------------giveGift----------------
local giveGift = {} -- 送礼物，追女生的公共方法

function giveGift:new(o)
    o = o or {}
    -- o.girl = o.girl or ""

    setmetatable(o, self)
    self.__index = self

    return o
end

-- 以下为公共接口, 供子类重写
-- 被追的是谁
function giveGift:setGirl( girl )
    self.girl = girl
end

-- 送花
function giveGift:giveFlower()
    -- print("give you flower " .. self.girl)
end

-- 送吃得
function giveGift:giveFood()
    -- print("give you food " .. self.girl)
end
-------------giveGift end----------------

-------------pursuit----------------
local pursuit = giveGift:new() -- 追求者，realSubject

function pursuit:giveFlower()
    print("give you flower " .. self.girl)
end

function pursuit:giveFood()
    print("give you food " .. self.girl)
end

-------------pursuit end----------------



-------------proxy----------------
local proxy = giveGift:new() 


function proxy:setGirl(girl)
    self.realPursuit = pursuit:new()
    self.realPursuit:setGirl(girl)
end

-- 实际是 pursuit 调用方法
function proxy:giveFlower()
    if self.realPursuit then
        print(self.realPursuit:giveFlower())
    end
end

function proxy:giveFood()
    if self.realPursuit then
        print(self.realPursuit:giveFood())
    end
end


-------------proxy end----------------

local p = proxy:new()
p:setGirl("jinse")
p:giveFlower()



