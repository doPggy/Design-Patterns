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


-- function _M:setHp(hp)
--     self.hp = hp
-- end

-- function _M:setMp(mp)
-- end

-- function _M:setExp(exp)
-- end
--

-- 默认生命，魔法各100，经验为0
local r = role:new()


-- 备份操作,生成一个新实例
local t = role:new()
-- 这里就当做是get接口将r的数据通过set接口传给了t
t.hp = r.hp
t.mp = r.mp
t.exp = r.exp
print("fight before")
r:show()

r:fight()
print("fight done")
r:show()


-- 回档操作
r.hp = t.hp
r.mp = t.mp
r.exp = t.exp
print("recover")
r:show()


