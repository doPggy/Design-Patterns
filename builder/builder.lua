-- 产品
local hanbao = {}

function hanbao:new( o )
    o = o or {}
    o.order = o.order or {}

    setmetatable(o, self)
    self.__index = self
    return o
end

function hanbao:show()
    for _, v in ipairs(self.order) do
        print(v)
    end
end


-- 建造者基类
local builder = {}

function builder:new( o )
    o = o or {}

    -- 引用产品类
    o.product = o.product or hanbao:new()

    setmetatable(o, self)
    self.__index = self
    return o
end

-- 这里省略一些步骤
-- 加面包片
function builder:addBread()
end

-- 加肉
function builder:addMeat()
end

-- 加生菜
function builder:addVeg()
end

-- 汉堡产出
function builder:getResult()
    return self.product
end

-- 制作鸡肉汉堡
local chickenBuilder = builder:new()

-- 加面包片
function chickenBuilder:addBread()
    table.insert(self.product.order, "普通面包")
end

-- 加肉
function chickenBuilder:addMeat()
    table.insert(self.product.order, "鸡肉")
end

-- 加生菜
function chickenBuilder:addVeg()
    table.insert(self.product.order, "生菜")
end



-- 制作牛肉汉堡 
local beafBuilder = builder:new()

-- 加面包片
function beafBuilder:addBread()
    table.insert(self.product.order, "普通面包")
end

-- 加肉
function beafBuilder:addMeat()
    table.insert(self.product.order, "牛肉")
end

-- 加生菜
function beafBuilder:addVeg()
    table.insert(self.product.order, "生菜")
end


-- director
local director = {}

function director:new( o )
    o = o or {}

    setmetatable(o, self)
    self.__index = self
    return o
end

function director:setBuilder(builder)
    self.builder = builder
end

-- 确定了汉堡制作过程
function director:construct()
    self.builder:addBread()
    self.builder:addVeg()
    self.builder:addMeat()
    self.builder:addVeg()
    self.builder:addBread()
end



-- 实际调用
local d = director:new()
local cb = chickenBuilder:new()
local bb = beafBuilder:new()

d:setBuilder(cb)
d:construct()
cb:getResult():show()

print("------")

d:setBuilder(bb)
d:construct()
bb:getResult():show()


