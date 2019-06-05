-- 这里继续写计算器
--

-- 运算类
local operation = {}

function operation:new( o )
    -- body
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    
    return o
end

function operation:setNums( num1, num2 )
    self._num1 = num1
    self._num2 = num2
end

-- 运算的公共接口
-- 等待子类重写
function operation:getResult()
    -- body
end

-- 加法运算类
local operationAdd = operation:new()

function operationAdd:getResult()
    return self._num1 + self._num2
end

-- 减法运算类
local operationSub = operation:new()

function operationSub:getResult()
    return self._num1 - self._num2
end

-- 乘法运算类
local operationMul = operation:new()

function operationMul:getResult()
    return self._num1 * self._num2
end



-- 工厂的抽象
local factory = {}

function factory:new( o )
    -- body
    o = o or {}

    setmetatable(o, self)
    self.__index = self
    
    return o
end

-- 工厂的公共接口
-- sheng
function factory:createOperation()
    -- body
end

-- 具体的工厂 - 加法工厂
local factoryAdd = factory:new()

function factoryAdd:createOperation()
    return operationAdd:new() 
end


-- 具体的工厂 - 减法工厂
local factorySub = factory:new()

function factorySub:createOperation()
    return operationSub:new() 
end


-- 具体的工厂 - 乘法工厂
local factoryMul = factory:new()

function factoryMul:createOperation()
    return operationMul:new() 
end



local facAdd = factoryAdd:new()
local facSub = factorySub:new()

local opAdd = facAdd:createOperation()
local opSub = facSub:createOperation()


-- 这样具体用add 还是 sub。需要具体调用，或者说客户端来决定。
opAdd:setNums(1, 2)
print(opAdd:getResult())

opSub:setNums(1, 2)
print(opSub:getResult())


