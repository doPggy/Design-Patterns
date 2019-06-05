----------iterator----------
--
local iterator = {} --迭代器抽象类


function iterator:new(opt)
    opt = opt or {}

    --指针，指向遍历到的当前节点
    opt.count = opt.count or 0

    self.__index = self
    setmetatable(opt, self)
    return opt
end

-- 迭代器返回元素第一个
function iterator:first()
end

-- 迭代器返回下一个元素
function iterator:nextItem()
end

function iterator:isDone()
end
----------iterator end----------


-----------aggregate---------
local aggregate = {} -- 聚集对象抽象类
function aggregate.new(self, opt)
    opt = opt or {}

    self.__index = self
    setmetatable(opt, self)
    return opt
end

-- 返回一个迭代器
function aggregate:createIterator()
end

-----------aggregate end---------



---------乘务员----------
local ticker = iterator:new()

function ticker:new(opt)
    opt = opt or {}

    --指针，指向遍历到的当前节点
    opt.count = opt.count or 0

    -- 将某时刻的bus聚集对象保存
    opt.bus = opt.bus or {}

    self.__index = self
    setmetatable(opt, self)
    return opt
end

-- 迭代器返回元素第一个
function ticker:first()
    return self.bus.items[1]
end

-- 迭代器返回下一个元素
function ticker:nextItem()
    if not self:isDone() then
        self.count = self.count + 1

        -- 这里可以就返回一个对象。或者对象的数据域
        -- 为了不暴露太多，就在内部将数据域返回
        return self.bus.items[self.count]["name"]
    end
end

function ticker:isDone()
    if self.count >= #self.bus.items then
        return true
    else
        return false
    end
end
---------乘务员 end----------

---------bus----------
-- 公交车聚集对象
local bus = aggregate:new()

function bus:new(opt)
    opt = opt or {}

    -- 乘客
    opt.items = opt.items or {}

    self.__index = self
    setmetatable(opt, self)
    return opt
end

function bus:createIterator()
    return ticker:new({ bus = self })
end
---------bus end----------

-------main-------
local items = {
    [1] = { name = "zyt" },
    [2] = { name = "zjt" },
    [3] = { name = "zt" },
}

local b = bus:new( { items = items } )
local tic = b:createIterator()
print(b.items[2].name)
print(#b.items)

print(tic:nextItem() .. "买票吧!")
print(tic:nextItem() .. "买票吧!")
print(tic:nextItem() .. "买票吧!")

