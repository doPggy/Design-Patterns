--------------------memento-------------------
local memento = {}

function memento.new(self, opt)
    opt = opt or {}

    -- 生命值
    opt.hp = opt.hp or 100
    -- 魔法值
    opt.mp = opt.mp or 100
    -- 经验值
    opt.exp = opt.exp or 0

    self.__index = self
    setmetatable(opt, self)
    return opt
end

--------------------memento end-------------------


--------------------role-------------------
local role = {}

function role.new(self, opt)
    opt = opt or {}

    -- 生命值
    opt.hp = opt.hp or 100
    -- 魔法值
    opt.mp = opt.mp or 100
    -- 经验值
    opt.exp = opt.exp or 0

    self.__index = self
    setmetatable(opt, self)
    return opt
end

-- 用于信息回档
-- menento 备忘录对象
function role:recover(memento)
    self.hp = memento.hp
    self.mp = memento.mp
    self.exp = memento.exp
end

-- 生成一个备忘录用于部分数据备份
function role:createMemento()
    return memento:new({ hp = self.hp, mp = self.mp, exp = self.exp})
end

function role.fight(self)
    self.hp = 0
    self.mp = 0
    self.exp = 0
end

function role:show()
    print(self.hp)
    print(self.mp)
    print(self.exp)
end

--------------------role end-------------------

--------------------caretaker-------------------
local taker = {}
function taker:new(opt)
    opt = opt or {}
    self.__index = self
    return setmetatable(opt, self)
end

function taker:take(memento)
    self.menento = menento
end

function taker:getMemento()
    return self.menento
end




--------------------caretaker end-------------------



-- 实际调用

-- 默认生命，魔法各100，经验为0
local r = role:new()
-- 备份当前状态
-- 并且对调用者屏蔽了实现细节
local m = role:createMemento()
local c = taker:new()
c:take(m)

print("fight before")
r:show()

r:fight()
print("fight done")
r:show()


-- 回档操作
r:recover(c:getMemento())
print("recover")
r:show()



