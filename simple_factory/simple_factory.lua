-- 简单工厂模式
-- 计算器示例
-- 工厂根据一个类型来生成不一样的类的实例，而这个实例需要有一个抽象的父类

-- 为什么要有这个模式，拿计算器来说，加减乘除其实只是运算符号不一，剩下的得出结果，需要的参数是统一的。如果为了这个而不断地使用判断语句，是浪费效率的
-- 把加减乘除抽出来一个运算类，而这些又是这个运算类的子类，方便加减乘除的额外操作修改,修改一个操作不影响其他操作，进行很好地分离
-- 不仅如此，这样拥有了更好的扩展性,维护性增加。

-- 运算类
local baseOp = { n = "base" }


-- 我操我知道了，我真的GG。
-- 首先，子类继承的时候也就是通过baseOp:new()的时候，子类addOp元表就是baseOp，分析一下self就可以得到这个结论
-- 那么addOp实例画的时候，等于是一个新的table，元表是addOp，执行一个函数的时候，先去addOp找，没有，就通过addOp元表找，也就是baseOp
-- 困扰我很久的一点也就来了，难道不会一值递归查找吗,因为baseOp.__index是自己
-- 但是我忘记了，baseOp没有setmetatable，所以到baseOp就不会继续执行__index元方法了。
function baseOp:new(o)
    o = o or {}

    setmetatable(o, self)
    self.__index = self

    return o
end

function baseOp:setParam(num1, num2)
    self.num1 = num1
    self.num2 = num2
end

-- 抽象方法
function baseOp:operate()
end

-- 加法运算类
-- 继承自baseOp
-- baseOp实例，通过元表可访问baseOp function
-- 但是addOp:new() 通过元表调用了new(), self 是addOp
local addOp = baseOp:new()
-- addOp:setParam(1, 3)

function addOp:operate()
    return self.num1 + self.num2
end


-- 减法运算类
-- 继承自baseOp
local subOp = baseOp:new()

function subOp:operate()
    return self.num1 - self.num2
end



-- 简单工厂类
local simpleFactory = {}

function simpleFactory:createOp(t)
    if t == "+" then
        return addOp:new()
    elseif t == "-" then
        return subOp:new()
    end
end

function simpleFactory:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    return o
end

local f = simpleFactory:new()
local op = f:createOp("+")
op:setParam(1, 2)
local r = op:operate()
print(r)
