require("oo")

-----------person---------------
local person = class() -- 人，也就是 component

function person:ctor(name)
    self.name = name
end

-- 展示，也就是 component 的统一接口
function person:show()
    print("my name is " .. self.name)
end
-----------person end---------------


-----------decorator---------------
local decorator = class(person) -- 装饰抽象类，继承自 person，给人穿衣服，等于添加职责

function decorator:ctor()
    print("decorator")
    -- self.component = {} 
    -- self.component.show = function ( self )
    --     -- body
    --     print("decorator")
    -- end
end

-- 这个是关键的对象组合顺序逻辑
-- 通过这个然每个 decorator 子类能执行 component
function decorator:show()
    if self.component then
        self.component:show()
    end
end

-- component|person
function decorator:setDecorate( component )
    self.component = component
end



-----------decorator end---------------

-----------pant---------------
local pant = class(decorator) -- pant 裤子，继承自 decorator，具体的添加职责 -- 穿裤子 

function pant:ctor()
    print("pant")
end

function pant:show( ... )
    self:addPant()
    -- print(self.name)
    -- self.super:show()
    -- pant.super.show(self)
end


function pant:addPant()
    print("add a pant")
end
-----------pant end---------------

-----------shirt---------------
local shirt = class(decorator)

function shirt:ctor()
    -- body
    print("shirt")
end

function shirt:show( ... )
    -- body
    self:addShirt()
    -- print(self.name)

    -- 由于类的实现问题，不能实现
    -- shirt.super.show(self)
end

function shirt:addShirt( ... )
    -- body
    print("add a shirt")
end

-----------shirt end---------------

local zyt = person:new("zyt")
-- local de = decorator:new()
local s = shirt:new()
-- s:show()
-- zyt:show()
local p = pant:new()
-- p:show()
-- s:show()
s:setDecorate(zyt)
p:setDecorate(s)
p:show()

